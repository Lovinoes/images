#!/bin/bash
cd /home/container || exit 1

CYAN='\033[0;36m'
RESET_COLOR='\033[0m'

java -version

INTERNAL_IP=$(ip route get 1 | awk '{print $(NF-2);exit}')
export INTERNAL_IP

# Replace Startup Variables
# shellcheck disable=SC2086
MODIFIED_STARTUP=$(echo -e ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')
echo -e "${CYAN}STARTUP /home/container: ${MODIFIED_STARTUP} ${RESET_COLOR}"

# shellcheck disable=SC2086
eval ${MODIFIED_STARTUP}
