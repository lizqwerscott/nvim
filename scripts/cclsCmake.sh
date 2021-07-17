#!/bin/bash

cd $1

cmake -H. -BDebug -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=YES
if [ ! -f "./compile_commands.json" ]; then
    echo "file not"
    ln -s ./Debug/compile_commands.json .
fi

