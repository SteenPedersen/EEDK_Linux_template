# EEDK_Linux_template
Simple bash script template for EEDK deployment of a script and return value in Agent Custom Props

When EEDK package the is created - make sure to set the "Command to Run" as
bash ./<scriptname>.sh

CUSTOM_PROP='5'  # which custom prop to use for the results

  Track the execution in the local:
  LOG_FILE='/var/log/EEDK_Debug.log'

  
  
Place your script content in the function execute_script
    # Place your script and code to be executed here
    # Any return value to ePO (max 255 character) should placed in variable CUSTOM_PROP_VALUE=

    # Return any value back to ePO
    NOW=$(date --iso-8601=seconds)
    CUSTOM_PROP_VALUE='Result abc from script using EEDK - '${NOW}

