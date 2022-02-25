redo-ifchange .date
EVENT_TYPE=$2
force query "SELECT Id, CreatedDate FROM EventLogFile WHERE Interval = 'Hourly' AND EventType = '$EVENT_TYPE' ORDER BY CreatedDate DESC" |grep -Po '0AT\w+' | sed -E "s/(.*)/EventLogFile\/$EVENT_TYPE\/\1.want/" | parallel --xargs redo-ifchange
