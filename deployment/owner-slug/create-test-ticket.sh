#!/usr/bin/env bash

set -euo pipefail

source /root/.spinberkat-db.env
export MYSQL_PWD="$DB_PASSWORD"

prize_id=$(mysql --no-defaults -h 127.0.0.1 -u "$DB_USERNAME" -Nse \
    "SELECT id FROM prize WHERE UPPER(label)=UPPER('IPHONE 12') LIMIT 1" "$DB_DATABASE")

if [[ -z "$prize_id" ]]; then
    echo "PRIZE_NOT_FOUND" >&2
    exit 1
fi

code="SB-TEST-$(openssl rand -hex 4 | tr '[:lower:]' '[:upper:]')"
mysql --no-defaults -h 127.0.0.1 -u "$DB_USERNAME" "$DB_DATABASE" -e \
    "INSERT INTO code (code,used,created_at,updated_at) VALUES ('$code',0,NOW(),NOW()); INSERT INTO draw (nama,code,sent,rotation,date,prize_id,retry_used,created_at,updated_at) VALUES ('TEST IPHONE 12','$code',0,NULL,CURDATE(),$prize_id,0,NOW(),NOW());"

unset MYSQL_PWD DB_PASSWORD
printf '%s\n' "$code"
