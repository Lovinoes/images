#!/bin/bash
cd /home/container || exit 1

YELLOW='\033[0;33m'
RESET_COLOR='\033[0m'

java -version

INTERNAL_IP=$(ip route get 1 | awk '{print $(NF-2);exit}')
export INTERNAL_IP

# Replace Startup Variables
# shellcheck disable=SC2086
MODIFIED_STARTUP=$(eval echo "$(echo "${STARTUP}" | sed -e 's/{{/${/g' -e 's/}}/}/g')")
echo -e "${YELLOW}[Startup Command]: ${MODIFIED_STARTUP} ${RESET_COLOR}"

# shellcheck disable=SC2086
exec ${MODIFIED_STARTUP}
