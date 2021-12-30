#!/bin/bash

# Check required configuration options
[[ -z "$DB_HOST" ]] && echo "Environment variable DB_HOST missing" && exit 1
[[ -z "$DB_NAME" ]] && echo "Environment variable DB_NAME missing" && exit 1
[[ -z "$DB_USER" ]] && echo "Environment variable DB_USER missing" && exit 1
[[ -z "$DB_PASS" ]] && echo "Environment variable DB_PASS missing" && exit 1

# [[ -z "$CONN" ]]    && echo "Environment variable CONN missing"    && exit 1

# # Set default options if ENV not provided
# [[ -z "$RECEIVE" ]]             && RECEIVE=1
# [[ -z "$SEND" ]]                && SEND=1
# [[ -z "$REPORT" ]]              && REPORT=no
# [[ -z "$DEBUG_LEVEL" ]]         && DEBUG_LEVEL=1
# [[ -z "$MAX_RETRIES" ]]         && MAX_RETRIES=3
# [[ -z "$RETRY_TIMEOUT" ]]       && RETRY_TIMEOUT=120
# [[ -z "$COMM_TIMEOUT" ]]        && COMM_TIMEOUT=10
# [[ -z "$STATUS_FREQUENCY" ]]    && STATUS_FREQUENCY=600
# [[ -z "$RESET_FREQUENCY" ]]     && RESET_FREQUENCY=3600
# [[ -z "$CHECK_SECURITY" ]]      && CHECK_SECURITY=0
# [[ -z "$CHECK_BATTERY" ]]       && CHECK_BATTERY=0
# [[ -z "$CHECK_SIGNAL" ]]        && CHECK_SIGNAL=0
# [[ -z "$CHECK_NETWORK" ]]       && CHECK_NETWORK=1

# Build gammu configuration file
# cat /etc/gammu-smsdrc-gammu.ini > /etc/gammu-smsdrc

# echo -e "\nConnection = $CONN\n" >> /etc/gammu-smsdrc

# cat /etc/gammu-smsdrc-smsd.ini >> /etc/gammu-smsdrc

# echo -e "\nDebugLevel = $DEBUG_LEVEL\n"     >> /etc/gammu-smsdrc
# echo "MaxRetries = $MAX_RETRIES"            >> /etc/gammu-smsdrc
# echo "RetryTimeout = $RETRY_TIMEOUT"        >> /etc/gammu-smsdrc
# echo "CommTimeout = $COMM_TIMEOUT"          >> /etc/gammu-smsdrc
# echo "StatusFrequency = $STATUS_FREQUENCY"  >> /etc/gammu-smsdrc
# echo "ResetFrequency = $RESET_FREQUENCY"    >> /etc/gammu-smsdrc
# echo "CheckSecurity = $CHECK_SECURITY"      >> /etc/gammu-smsdrc
# echo "CheckBattery = $CHECK_BATTERY"        >> /etc/gammu-smsdrc
# echo "CheckSignal = $CHECK_SIGNAL"          >> /etc/gammu-smsdrc
# echo "CheckNetwork = $CHECK_NETWORK"        >> /etc/gammu-smsdrc
# echo "Receive = $RECEIVE"                   >> /etc/gammu-smsdrc
# echo "Send = $SEND"                         >> /etc/gammu-smsdrc
# echo "DeliveryReport = $REPORT"             >> /etc/gammu-smsdrc

# Set variables only if ENV provided
# [[ -z "$PHONE_ID" ]]  || echo "PhoneID = $PHONE_ID"         >> /etc/gammu-smsdrc
# [[ -z "$SMSC" ]]      || echo "SMSC = $SMSC"                >> /etc/gammu-smsdrc
# [[ -z "$SKIP_SMSC" ]] || echo "SkipSMSCNumber = $SKIP_SMSC" >> /etc/gammu-smsdrc

# Load custom config
# if [[ -e /etc/gammu-smsdrc-custom.ini ]]; then
#     echo "" >> /etc/gammu-smsdrc
#     cat /etc/gammu-smsdrc-custom.ini >> /etc/gammu-smsdrc
# fi

echo -e "\nHost = $DB_HOST" >> /etc/gammu-smsdrc
echo "Database = $DB_NAME"  >> /etc/gammu-smsdrc
echo "User = $DB_USER"      >> /etc/gammu-smsdrc
echo "Password = $DB_PASS"  >> /etc/gammu-smsdrc

exec /usr/bin/gammu-smsd "$@"