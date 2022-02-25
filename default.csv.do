EVENT_TYPE=$2
redo-ifchange $EVENT_TYPE.logs
ls EventLogFile/$EVENT_TYPE/*.want | parallel redo-ifchange {.}.EventLogFile.csv
redo-ifchange EventLogFile/$EVENT_TYPE/*.EventLogFile.csv
awk '(NR == 1) || (FNR > 1)' EventLogFile/$EVENT_TYPE/*.EventLogFile.csv > $3
