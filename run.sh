#!/usr/bin/env bash

working_tree_root="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Running init-tools.sh"
$working_tree_root/init-tools.sh

# Always copy over the Tools-Override
cp $working_tree_root/Tools-Override/* $working_tree_root/Tools > /dev/null

toolRuntime=$working_tree_root/Tools
dotnet=$toolRuntime/dotnetcli/dotnet

echo "Running: $dotnet $toolRuntime/run.exe $working_tree_root/config.json $*"
$dotnet $toolRuntime/run.exe $working_tree_root/config.json $*
if [ $? -ne 0 ]
then
    echo "ERROR: An error occured in $dotnet $toolRuntime/run $#. Check $# logs under $working_tree_root."
    exit 1
fi

echo "Command successfully completed."
exit 0
