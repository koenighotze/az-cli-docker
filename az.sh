#!/bin/bash
az configure -d output=table

cat /home/azscripts/banner.txt
if [ -z "$DEFAULT_ORGANISATION" ]; then
  echo
  echo "---"
  echo No default organisation set...will not configure devops
  echo "---"
  echo
else
  az devops configure --defaults organization=${DEFAULT_ORGANISATION} project=${DEFAULT_PROJECT}}
fi

export AZURE_CORE_COLLECT_TELEMETRY=false
export AZURE_LOGGING_ENABLE_LOG_FILE=true
export AZURE_LOGGING_LOG_DIR=/home/az/log

export PS1='\[\033]0;\u@\h:\w\007\]\[\e[1;33m\]\u\[\e[0m\]@\[\e[1;35m\]\h \[\e[0m\]in \[\e[0;32m\]\w (\[\e[32m\]☁ $DEFAULT_ORGANISATION/$DEFAULT_PROJECT)\n\[\e[0m\]\[\e[37m\]$ '
exec bash