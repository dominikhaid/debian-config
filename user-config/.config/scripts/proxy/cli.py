#!/usr/bin/env python3
import argparse


class CreateCli():

    def __init__(self):
        self.args = ''
        self.set_args()

    def set_args(self):
        parser = argparse.ArgumentParser("Create Cli")
        parser.add_argument("--fix",
                            dest="fix",
                            default=False,
                            help="Fix or Create Venv",
                            type=bool)
        parser.add_argument("--list",
                            dest="list",
                            default='',
                            help="all / alive / at ",
                            type=str)
        parser.add_argument("--test",
                            dest="test",
                            default='',
                            help="xxx.xxx.xxx.xxx:xxxx",
                            type=str)
        self.args = parser.parse_args()

    def get_args(self):
        return self.args
