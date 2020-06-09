#/bin/bash
INDICES="log"
DELETE_DATE="${INDICES}"$(date --date='3 month ago' '+%Y.%m.%d' )
echo curl -X DELETE 127.0.0.1:9200/${DELETE_DATE}
#curl -X DELETE 127.0.0.1:9200/${DELETE_DATE}
curl -X DELETE 127.0.0.1:9200/${DELETE_DATE}

