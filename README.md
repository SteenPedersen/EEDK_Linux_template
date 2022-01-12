# EEDK_Linux_template
Simple bash script template for EEDK deployment of a script and return value in Agent Custom Props. 
EEDK = (ePO Endpoint Deployment Kit) 

When EEDK package the is created - make sure to set the "Command to Run" as
bash ./<scriptname>.sh

CUSTOM_PROP='5'  # which custom prop to use for the results

Track the execution in the local log file:
  LOG_FILE='/var/log/EEDK_Debug.log'

The EEDK package has to be created for either MacOS or Linux. The EEDK package cannot support both OS in one package. So you must create an ePO Package for Linux and a different for MacOS. Note: The McAfee Agent execute the script with root privileges.
  
Place your script content in the function execute_script and make this return any value back to ePO in the CUSTOM_PROP_VALUE='Result from script using EEDK - '

When testing the script before creating the EEDK package make sure to use command: sudo bash ./EEDK_linux_template.sh as there are commands which requires root privileges while running.

EEDK Getting Started Guide: https://community.mcafee.com/t5/ePolicy-Orchestrator-ePO/ePO-Endpoint-Deployment-Kit-EEDK-Getting-started-guide/td-p/524421
