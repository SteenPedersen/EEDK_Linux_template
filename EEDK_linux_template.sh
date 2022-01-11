#!/bin/bash
# Simple concept check for writting local log on Linux or MacoOS and execute the Agent Commands
# When EEDK package is created - make sure to set the "Command to Run" as
# bash ./<scriptname>.sh

CUSTOM_PROP='5'  # which custom prop to use for the results

# defaults for agent location on Linux
MCAFEE_DIR='/opt/McAfee/agent/bin' # + [ '/maconfig -custom -prop8 "message" | '/cmdagent -p' ]
if [ -e ${MCAFEE_DIR} ]
then
    
    echo "Agent located in : "${MCAFEE_DIR} 
else
    # Use Agent location on MacOS
    MCAFEE_DIR='/Library/McAfee/Agent/bin' 
    echo "Agent located in : "${MCAFEE_DIR} 
fi

LOG_FILE='/var/log/EEDK_Debug.log'

# Write a time stamp to the log file
NOW=$(date '+%Y-%m-%d %H:%M:%S')
echo "${NOW} Script name: $0 ${@}">>${LOG_FILE} 2>&1
CUSTOM_PROP_VALUE=''


RED="\033[0;31m"; GREEN="\033[32m"; YELLOW="\033[1;33m"; ENDCOLOR="\033[0m"
# if you don't want colored output, set the variables to empty strings:
# RED=""; GREEN=""; YELLOW=""; ENDCOLOR=""

function warning() {
  printf "${RED}[WARNING] %s${ENDCOLOR}\n" "$1" >&2
}

function information() {
  printf "${YELLOW}[INFO] %s${ENDCOLOR}\n" "$1"
}

function ok() {
  printf "${GREEN}[INFO] %s${ENDCOLOR}\n" "$1"
}


function show_script_info() {
    echo
    information "This is a template script to execute any script and additional commands."
    information "All deployed from ePO based on an EEDK package."
    information "The script can return information and results back to ePO in Cusom Props."
    echo
}

function return_results_to_epo(){
    NOW=$(date '+%Y-%m-%d %H:%M:%S')
    echo "${NOW} Result value: ${CUSTOM_PROP_VALUE}">>${LOG_FILE} 2>&1
    ${MCAFEE_DIR}/maconfig -custom "-prop${CUSTOM_PROP}" "${CUSTOM_PROP_VALUE}" >>${LOG_FILE} 2>&1
    ${MCAFEE_DIR}/cmdagent -p >>${LOG_FILE} 2>&1
    echo
    information "Local log file: ${LOG_FILE}"
    information "Status returned: ${CUSTOM_PROP_VALUE}"

}


function execute_script(){
    #
    # Place your script and code to be executed here
    # Any return value to ePO (max 255 character) should placed in variable CUSTOM_PROP_VALUE=
    
    
    # Return any value back to ePO
    NOW=$(date '+%Y-%m-%d %H:%M:%S')
    CUSTOM_PROP_VALUE='Result from script using EEDK - '${NOW}


}


## main section

show_script_info

execute_script

return_results_to_epo



