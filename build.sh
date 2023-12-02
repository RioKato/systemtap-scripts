#!/bin/sh

DIR=$(dirname $0)
$DIR/ftrace.stp $1 -m stap_$1 -p4
