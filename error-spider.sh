#! /bin/sh

URL=$1
LOG=error-spider.log

# Check argument(s)
if [ -z "$URL" ]; then
    echo "Usage: $0 [BASE URL]"
    exit 1
fi

# Spider site with wget, saving results to log file for later analysis
wget --spider --recursive --page-requisites --output-file $LOG --execute robots=off --no-check-certificate $URL
EXIT_CODE=$?

# If wget had an error...
if [ $EXIT_CODE -ne 0 ]; then
	# Search log for 4xx and 5xx errors and output to stderr
	grep -B 2 'awaiting response\.\.\. [45][0-9][0-9] ' $LOG 1>&2

	# Output generic error message to stderr (this ensure at least something is output in error case)
	echo "Error(s) encountered spidering $URL see $LOG for more details." 1>&2
fi

# Use same exit code as wget command
exit $EXIT_CODE
