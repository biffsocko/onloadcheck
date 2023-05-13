#!/bin/sh

###############################################
# OLD
###############################################
#list="ny4prodfh1
#      ny11prodmajor1
#      uat1"
#for next in $list

#do
#     echo "trying $next"
#     ssh -q -o ConnectTimeout=3  $next "onload --version" > /dev/null 2>&1
#     if [ $? -ne 0 ]
#     then
#         echo "$next failed"
#     fi
#done


###############################################
# NEW
###############################################
LIST="/onload_list"
MAILLIST="thomas.murphy@stonex.com,jason.alexander@stonex.com"
WEBHOOK="https://intlfcstone.webhook.office.com/webhookb2/a0ae8289-3917-441f-a9fe-356652fd619d@d1bdddc1-de7b-4a77-914e-213d203667f2/IncomingWebhook/cda8e7dc7c494adf8f173f814fdb5dcd/cf7cb2e8-d857-424f-9700-516f06c11637"

#    curl -H 'Content-Type: application/json' -d '{"text": "Failed to write database to WORM Drive for compliance - ERROR 1"}' ${WEBHOOK}

MESSAGE="<h2>onload check</h2><br><pre>`/pssh3/bin/pssh -h ${LIST} -t 3  \"onload --version\"`</pre>"
curl -H 'Content-Type: application/json' -d "{\"text\": \"${MESSAGE}\" }" ${WEBHOOK}

echo $MESSAGE

