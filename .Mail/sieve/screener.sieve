# Screen incoming mail for presence on a safelist.

# TODO: I may want my patterns to be "From:*<address>" so I can include my own
# addresses. Or a specific rule to grab mine first.

require ["fileinto", "test-pipe"];

if pipe :header "grep -iFf /home/rjframe/.Mail/safelist" {
    stop;
} elsif pipe :header "grep -iFf /home/rjframe/.Mail/lowpriority" {
    fileinto "IN";
} elsif pipe :header "grep -iFf /home/rjframe/.Mail/mailinglists" {
    fileinto "Mailing_Lists";
} elsif pipe :header "grep -iFf /home/rjframe/.Mail/blocklist" {
    fileinto "Trash";
} else {
    fileinto "Screener";
}
