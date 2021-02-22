import fcntl
import os
import struct
import sys

def showHelpMenu ():
	print(f"Usage: {sys.argv[0]} <file>")

if (len(sys.argv) == 1):
	sys.stderr.write("Invalid arguments!")
	showHelpMenu()
	exit()

# Taken from ext2fs/ext2_fs.h.
# Taken fromhttps://stackoverflow.com/questions/34176464/why-os-chflags-doesnt-work-under-linux
EXT2_IMMUTABLE_FL = 0x00000010
EXT2_IOC_SETFLAGS = 0x40086602

fd = os.open(sys.argv[1], os.O_RDWR)
f = struct.pack('i', EXT2_IMMUTABLE_FL)
fcntl.ioctl(fd, EXT2_IOC_SETFLAGS, f);
os.close(fd)