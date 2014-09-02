# Error Spider

Error Spider is a simple shell script to recursively spider a website, looking for HTTP 4xx and 5xx errors. It is used internally at [Toolhouse][toolhouse] as a first line defense for link rot, URL typos, etc in automated tests. It should not be considered a comprehensive test.

**Warning: Invoking Error Spider will result in a large number of HTTP requests to the web server in a short period of time and may result in higher then expected server loads. It is not intended to be used against production systems.**

## Usage 
Error Spider is invoked with a single argument, the URL from which to start:

    ./error-spider.sh [URL]

## Requirements
The following utilities must be installed in order to use Error Spider. These utilities are often pre-installed on Unix and Unix-like systems or can be easily acquired:

- [wget][wget]
- [grep][grep]


[toolhouse]: http://www.toolhouse.com/
[wget]: https://www.gnu.org/software/wget/
[grep]: https://en.wikipedia.org/wiki/Grep
