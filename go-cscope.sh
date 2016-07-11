#!/bin/bash
find $GOPATH/src -name "*.go" -print > cscope.files
find $GOPATH/src -name "*.c" -print >> cscope.files
find $GOPATH/src -name "*.h" -print >> cscope.files
if cscope -b -k; then
	echo "Done"
else
	echo "Failed"
fi
