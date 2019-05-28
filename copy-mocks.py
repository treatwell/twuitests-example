#!/usr/bin/env python

import os
import sys

DEVICE_ID = sys.argv[1]
LIBRARY_DIR = sys.argv[2]
CACHES_DIR = LIBRARY_DIR + "/Developer/CoreSimulator/Devices/" + DEVICE_ID + "/data/Library/Caches/ApiStubs/"
CWD = os.getcwd()
SOURCE_DIR = CWD + "/API-Mocks/"

print 'Device id:', DEVICE_ID
print 'Library dir:', LIBRARY_DIR
print 'CACHES_DIR:', CACHES_DIR
print 'SOURCE_DIR:', SOURCE_DIR

DIRECTORY_EXISTS = os.path.isdir(CACHES_DIR)
if not DIRECTORY_EXISTS:
    try:  
        os.mkdir(CACHES_DIR)
    except OSError:  
        print("Creation of the directory %s failed" % CACHES_DIR)
    else:
        print("Successfully created the directory %s " % CACHES_DIR)
else:
    print("Directory exists at %s" % CACHES_DIR)
os.system("cp -R " + SOURCE_DIR + " " + CACHES_DIR)
print('Mock files copied successfully.')
