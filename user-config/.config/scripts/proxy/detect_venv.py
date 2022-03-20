#!/usr/bin/env python3
import os
import re


class VenvDetect:
    """
       Attributes
    ----------
    file : path
        Main script where the shebang will be set
    fix : bool
        Argument for conditional Method calls on init

    Methods
    -------
    fixVenv(path)
        Fix the venv
    setVenv
        Set the venv variables on init
    getVenv
        Get the venv requirements.txt and checks if a venv folder exists
    """

    def __init__(self, path=False, fix=False):
        """
        Parameters
        ----------
        file : path
            Main script where the shebang will be set
        fix : bool
            Argument for conditional Method calls on init
        """

        super(VenvDetect, self).__init__()
        self.cwd = os.getcwd()
        self.reqVenv, self.isVenv = self.getVenv()

        if not path:
            raise Exception(
                'Caller not omitet, please pass the __file__ as first argument'
            )
        if fix:
            self.fixVenv(path)
        if not fix:
            self.venv = self.setVenv(path)

    def fixVenv(self, path):
        if not path:
            print("Could not detect caller")
            exit()

        if not self.reqVenv:
            print("Removed venv, please re-run the script")
            self.set_shebang(path)
            exit()

        if self.reqVenv:
            os.system(f"python3 -m venv {self.cwd}/venv")
            os.system(
                f"{self.cwd}/venv/bin/pip3 install -r {self.cwd}/requirements.txt"
            )
            self.set_shebang(path)
            print("Fixed venv , please re-run the script")
            exit()

    def getVenv(self):
        files = os.listdir(self.cwd)
        required = files.__contains__('requirements.txt')
        venv = files.__contains__('venv')
        return required, venv

    def setVenv(self, path):
        if self.reqVenv and not self.isVenv:
            os.system(f"python3 -m venv {self.cwd}/venv")
            os.system(
                f"{self.cwd}/venv/bin/pip3 install -r {self.cwd}/requirements.txt"
            )
            print("write shebang to __file__")
            exit()

    def set_shebang(self, path):
        shebang = "#!/usr/bin/env python3\n"
        if self.reqVenv and self.isVenv:
            shebang = "#!./venv/bin/python3\n"
        with open(path, 'r+', encoding='utf-8', newline='\n') as f:
            f.readline()
            data = f.read()
            f.seek(0)
            f.write(shebang + data)
            f.truncate()
            f.close()


if __name__ == "__main__":
    VenvDetect()
