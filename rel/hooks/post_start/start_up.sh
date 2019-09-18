#!/bin/sh

set +e
echo "Preparing to run startup tasks"
set -e

echo "Running startup tasks..." 
bin/myapp rpc "Elixir.Myapp.StartupTasks.init"
echo "Startup tasks ran successfully"