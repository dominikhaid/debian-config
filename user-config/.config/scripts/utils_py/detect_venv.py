#!/usr/bin/env python3
import os


class VenvDetect(object):
    """Detect reuqirements.txt, install it and run script with venv"""

    def __init__(self, arg="", file=False):
        super(VenvDetect, self).__init__()
        self.cwd = os.getcwd()
        self.reqVenv, self.isVenv = self.getVenv()
        if arg == "fix":
            self.fixVenv(file)
        self.venv = self.setVenv()

    def fixVenv(self, file):

        if not file:
            print("Could not detect caller")
            exit()

        if not self.reqVenv:
            print(file)
            print("Removed venv, please re-run the script")
            exit()

        if self.reqVenv:
            print(file)
            os.system(f"python3 -m venv {self.cwd}/venv")
            os.system(
                f"{self.cwd}/venv/bin/pip3 install -r {self.cwd}/requirements.txt"
            )
            print("Fixed venv , please re-run the script")
            return True

    def getVenv(self):
        files = os.listdir(self.cwd)
        required = files.__contains__('requirements.txt')
        venv = files.__contains__('venv')
        return required, venv

    def setVenv(self):
        if self.reqVenv and not self.isVenv:
            os.system(f"python3 -m venv {self.cwd}/venv")
            os.system(
                f"{self.cwd}/venv/bin/pip3 install -r {self.cwd}/requirements.txt"
            )
            print("write shebang to __file__")


if __name__ == "__main__":
    VenvDetect()
