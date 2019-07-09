#!/bin/bash
workdir=$(cd $(dirname $0); pwd)
echo "workdir is ${workdir}."
echo "begin stop jekyll server..."
pid=`ps -ef | grep -v 'grep' | grep jekyll | awk '{print $2}'`

if [ -n ${pid} ] ;then
    kill -9 ${pid} 
    echo "no jekyll server running."
fi

echo "begin start jekyll server"
nohup jekyll s > /dev/null 2>&1 &
if [ $? != 0 ] ;then
    echo "start jekyll server failed."
fi
echo "start jekyll server success."
