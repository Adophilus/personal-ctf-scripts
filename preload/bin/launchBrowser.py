#!/usr/bin/env python3

import eel
import os
import sys

@eel.expose
def updateIp (ipAddress):
	os.system(f"../enumeration/update-etc-hosts.sh {ipAddress}")
	return "updated IP!"

@eel.expose
def getUrl ():
	return sys.argv[1]

eel.init("./scripts/py/browser")
eel.start(f"index.html?redirect={sys.argv[1]}")
