EVENT_TYPE=$2
redo-ifchange $EVENT_TYPE.logs
LOG_DIR="EventLogFile/$EVENT_TYPE"
mkdir -p $LOG_DIR
find $LOG_DIR -name \*.want | ifne parallel redo-ifchange {.}.EventLogFile.csv
find $LOG_DIR -name \*.EventLogFile.csv | xargs -r awk '((NR == 1) || (FNR > 1) && $0 != "")'
