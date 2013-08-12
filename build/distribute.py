"""
Packs QuickSaveMaps for distribution
"""
import os
import re
import configparser

BASE =  os.path.abspath(
            os.path.join(
                os.path.dirname(__file__),
                ".."
            )
        )
MXI = os.path.join(
        BASE,
        "QuickSaveMaps.mxi"
        )
UTILITIES = os.path.join(
        BASE,
        "quickSaveMaps",
        "quicksaveMapsUtilities.jsxinc"
        )
INI = os.path.join(
        os.path.dirname(__file__),
        "config.ini"
        )

class Tools:
    def __init__(self, xmngr, zip7):
        self.xmngr = xmngr
        self.zip7 = zip7

def parseIni():
    config = configparser.SafeConfigParser()
    config.read(INI)
    
    xmngr = config.get("Programs", "EXTENSION_MANAGER")
    zip7 = config.get("Programs", "ZIP7")

    return Tools(
            xmngr,
            zip7
            )

def getVersion():
    # Find version
    cmd = "git rev-list HEAD --count"
    pipe = os.popen(cmd)
    version = pipe.readline()
    pipe.close()
    return version

def adaptVersion(version):

    versionRegex = "([rev\s\.0-9]+)"
    versionString = "rev. %s" % version

    # Adapt version in MXI
    mxi = open(MXI, "r")
    lines = mxi.readlines()
    mxi.close()
    lines[0] = re.sub(
            r'version="%s"' % versionRegex,
            r'version="%s"' % versionString,
            lines[0]
            ).replace("\n", "") + "\n"
    mxi = open(MXI, "w")
    mxi.writelines(lines)
    mxi.close()

    # Adapt version in QuickSaveMapsUtilities
    utilities = open(UTILITIES, "r")
    lines = utilities.readlines()
    utilities.close()
    for i, line in enumerate(lines):
        lines[i] = re.sub(
                r"var VERSION = '%s'" % versionRegex,
                r"var VERSION = '%s'" % versionString,
                line
                ).replace("\n", "") + "\n"
    utilities = open(UTILITIES, "w") 
    utilities.writelines(lines)
    utilities.close()

def process():
    tools = parseIni()
    version = "5" # getVersion()
    adaptVersion(version)
    cmd = '_distribute.bat {version} "{xmngr}" "{zip7}"'.format(
                version=version,
                xmngr=tools.xmngr,
                zip7=tools.zip7
            ).replace("\n", "")
    os.system(cmd)

if __name__ == "__main__":
    process()
