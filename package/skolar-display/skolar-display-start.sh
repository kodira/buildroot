#!/bin/sh

BINARY=skolardisplay
# the return code that should terminate the execution of the display application
TERMINATE_EXIT_CODE=42
while true;
do
	${BINARY}
	RETURN=$?
	echo ${RETURN}
	if [ ${RETURN} -eq ${TERMINATE_EXIT_CODE} ];
	then
		break
	fi
done

