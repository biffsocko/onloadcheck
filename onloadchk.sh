#!/bin/sh
###########################################################
# TR Murphy
# onloadcheck
#
#  add your own webhook here
###########################################################
LIST="/onload_list"
WEBHOOK="https://yourdomain.webhook.office.com/webhookb2/bigstringhere"

#    curl -H 'Content-Type: application/json' -d '{"text": "Failed to write database to WORM Drive for compliance - ERROR 1"}' ${WEBHOOK}

MESSAGE="<h2>onload check</h2><br><pre>`/pssh3/bin/pssh -h ${LIST} -t 3  \"onload --version\"`</pre>"
curl -H 'Content-Type: application/json' -d "{\"text\": \"${MESSAGE}\" }" ${WEBHOOK}

echo $MESSAGE

