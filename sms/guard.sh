#!/bin/bash

function pid_guard() {
  declare pidfile="$1"

  if [ ! -f "${pidfile}" ]; then
        echo "exit"
    return 0
  fi

  local pid
  pid=$(head -1 "${pidfile}")

  if pid_is_running "${pid}"; then
    echo "api daemon running"
    exit 1
  else
    echo "api daemon not running, restart api daemon"
    rm ${pidfile}
    /app/run/ubuntu/monit-daemon/bin/kepri-api-start.sh
  fi
}

function pid_is_running() {
  declare pid="$1"
  ps -p "${pid}" >/dev/null 2>&1
}

pid_guard $1

