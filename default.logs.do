redo-ifchange date
EVENT_TYPE=$2
force query "SELECT Id, CreatedDate FROM EventLogFile WHERE EventType = '$EVENT_TYPE' ORDER BY CreatedDate DESC" | \
	ifne grep -Po '0AT\w+' | \
	sed -E "s/(.*)/EventLogFile\/$EVENT_TYPE\/\1.want/" | \
	parallel --xargs redo-ifchange
