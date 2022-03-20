#!./venv/bin/python3
from detect_venv import VenvDetect
from cli import CreateCli

if __name__ == "__main__":
    cli = CreateCli()
    VenvDetect(__file__, cli.args.fix)

from proxy_checking import ProxyChecker
import fnmatch
import os
import re
import json
import psycopg2
from psycopg2 import Error
import psycopg2.extras
from pprintpp import pprint as pp

# TODO: MAKE NEW SERVER FILE FROM DB
# TODO: UPDATE CONFIG REPO UPDATE RAPI
# TODO: MAKE CRON ONCE A DAY
# TODO: MAKE A VIEW REMOVE WITH A EXPORT FUNCTION


class PSql():

    def __init__(self):
        self.db_config = "host='localhost' dbname='proxys' user='user' password='userpass'"
        self.con = False
        self.cursor = False
        self.db_connect()
        self.db_close()

    def db_connect(self):
        try:
            con = psycopg2.connect(self.db_config)
            self.cursor = con.cursor()
            return con
        except (Exception, Error) as error:
            print("Error while connecting to PostgreSQL", error)
            exit()

    def db_close(self):
        try:
            if self.con:
                self.cursor.close()
                self.con.close()
                print("PostgreSQL connection is closed")
        except (Exception, Error) as error:
            print("Error while connecting to PostgreSQL", error)
            exit()

    def get_all_servers(self):
        self.con = self.db_connect()
        self.cursor = self.con.cursor()
        self.cursor.execute(
            "SELECT * FROM public.PROXYS_LIST ORDER BY PROXY_TIMEOUT ASC")
        res = self.cursor.fetchall()
        self.con.commit()
        self.db_close()
        return res

    def get_all_alive_servers(self):
        self.con = self.db_connect()
        self.cursor = self.con.cursor()
        self.cursor.execute(
            "SELECT * FROM public.PROXYS_LIST WHERE PROXY_HEALTH=True ORDER BY PROXY_TIMEOUT ASC"
        )
        res = self.cursor.fetchall()
        self.con.commit()
        self.db_close()
        return res

    def get_servers_by_cc(self, cc):
        self.con = self.db_connect()
        self.cursor = self.con.cursor()
        self.cursor.execute(
            f"SELECT * FROM public.PROXYS_LIST WHERE PROXY_COUNTRY='{cc}' ORDER BY PROXY_TIMEOUT ASC"
        )
        res = self.cursor.fetchall()
        self.con.commit()
        self.db_close()
        return res

    def insert_check_result(self, data):
        self.con = self.db_connect()
        self.cursor = self.con.cursor()
        for value in data:
            self.cursor.execute(
                "INSERT INTO public.PROXYS_LIST (" + "PROXY_SERVER_IP," +
                "PROXY_SERVER_PORT," + "PROXY_DEAD_COUNT,FILE," +
                "PROXY_HEALTH," + "PROXY_COUNTRY," + "PROXY_PROTOCOL," +
                "proxy_timeout" + ")" + " VALUES (" +
                f"'{value['server_ip']}'," + f"'{value['server_port']}'," +
                f"{value['dead_count']}," + f"'{value['file']}'," +
                f"'{value['state']}'," + f"'{value['country_code']}'," +
                f"'{value['type']}'," + f"{value['time_response']}" + ")" +
                " ON CONFLICT (proxy_server) DO UPDATE SET " +
                f"proxy_health = '{value['state']}'," +
                f"proxy_protocol = '{value['type']}'," +
                f"proxy_country = '{value['country_code']}'," +
                f"file = '{value['file']}'," +
                f"proxy_timeout = {value['time_response']}," +
                f" proxy_dead_count = {value['dead_count']}")
        self.con.commit()
        self.db_close()

    def select_blacklist(self):
        self.con = self.db_connect()
        self.cursor = self.con.cursor()
        self.cursor.execute("SELECT proxy_server FROM public.PROXYS_BLACKLIST")
        res = self.cursor.fetchall()
        block = []
        self.con.commit()
        self.db_close()
        for server in res:
            block.append(server[0])
        return block


class ProxyCheck:

    def __init__(self, db, args):
        super(ProxyCheck, self).__init__()
        self.db = db
        self.conf_files = []
        self.servers = set()
        self.servers_sorted = []
        self.servers_json = []
        self.file_pat = "*.SERV"
        self.home_folder = os.path.expanduser('~')
        self.dir_path = os.path.dirname(os.path.realpath(__file__))
        self.proxy_path = self.home_folder + "/.config/scripts/proxy/config/server"
        self.server_pat = r'^(\d\d?\d\.\d?\d?\d\.\d?\d?\d\.\d?\d?\d):(\d?\d?\d\d?\d)?\t?(.*)'
        self.server_regex = re.compile(self.server_pat)
        if args.test != '':
            result = self.check_proxy(args.test)
            pp(result)
            exit()
        self.get_cli_list(args.list)

    def get_cli_list(self, args):
        if args == 'alive':
            return self.get_all_alive_servers()
        if args == 'all':
            return self.get_all_servers()
        if not args == '':
            return self.get_servers_by_cc(args)

    def get_all_servers(self):
        servers = self.db.get_all_servers()
        for server in servers:
            self.print_server(server)
        return exit()

    def get_all_alive_servers(self):
        servers = self.db.get_all_alive_servers()
        for server in servers:
            self.print_server(server)
        return exit()

    def get_servers_by_cc(self, cc):
        servers = self.db.get_servers_by_cc(cc)
        for server in servers:
            self.print_server(server)
        return exit()

    def print_server(self, server):
        print(f"SERVER: {server[1]}" + f" TIMEOUT: {server[4]}" +
              f" COUNTRY: {server[5]}" + f" PROTOCOL: {server[6]}" +
              f" STATUS: {server[8]}")

    def read_conf_files(self):
        try:
            for file in os.listdir(self.proxy_path):
                if fnmatch.fnmatch(file.upper(), self.file_pat):
                    self.conf_files.append(file)
            for file in self.conf_files:
                for i, line in enumerate(open(self.proxy_path + "/" + file)):
                    for match in re.finditer(self.server_regex, line):
                        self.servers.add(
                            match.group(1) + ":" + match.group(2) + " " + file)
            self.servers_sorted = list(self.servers)
            self.servers_sorted.sort()
        except Exception as e:
            print(e)

    def check_servers(self):
        try:
            blacklist = self.db.select_blacklist()
            cnt = 0
            for server in self.servers_sorted:
                print(
                    str(cnt) + " of " + str(self.servers_sorted.__len__()) +
                    " " + server)
                serverStr = re.sub("\\s.*\\.serv$", "", server)
                if serverStr in blacklist:
                    continue
                state = self.check_proxy(serverStr)
                self.transform_result(state, server)
                cnt += 1
        except Exception as e:
            print(e)

    def write_result_to_json(self):
        try:
            for file in self.conf_files:
                self.write_json_to_file(
                    self.proxy_path.replace("server", "") + "test/" +
                    file.replace(".conf", ".json"), self.servers_json)
        except Exception as e:
            print(e)

    def write_json_to_file(self, path, dict):
        try:
            with open(path, 'w') as json_file:
                json.dump(dict, json_file)
            return True
        except Exception as e:
            print(e)
            return False

    def transform_result(self, state, server):
        serverStr = re.sub("\\s.*\\.serv$", "", server)
        serverFile = re.sub("^\\d.*?\\s", "", server)
        if state['status'] == 1:
            state['server_ip'] = re.sub(":.*$", "", serverStr)
            state['server_port'] = re.sub("^.*:", "", serverStr)
            state['dead_count'] = 0
            state['file'] = serverFile
            state['state'] = True
            if 'country_code' not in state:
                state['country_code'] = "-"
            if 'time_response' not in state:
                state['time_response'] = 9999
            if 'type' in state:
                state['type'] = ','.join(state['type'])
            if 'type' not in state:
                state['type'] = ''
            self.servers_json.append(state)
            print(server + " is alive")
        else:
            state = {
                'server_ip': re.sub(":.*$", "", serverStr),
                'server_port': re.sub("^.*:", "", serverStr),
                'state': False,
                'country_code': "-",
                'type': "-",
                'time_response': 9999,
                'dead_count': 1,
                'file': serverFile
            }
            self.servers_json.append(state)
            print(server + " is dead")

    def check_proxy(self, proxy):
        checker = ProxyChecker()
        return checker.check_proxy(proxy)

    def update_servers(self):
        try:
            self.db.insert_check_result(self.servers_json)
            return True
        except Exception as e:
            raise e


if __name__ == "__main__":
    db = PSql()
    check = ProxyCheck(db, cli.args)
    check.read_conf_files()
    check.check_servers()
    check.write_result_to_json()
    check.update_servers()
