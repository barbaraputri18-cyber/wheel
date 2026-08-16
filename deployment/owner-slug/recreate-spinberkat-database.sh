#!/usr/bin/env bash

set -euo pipefail

db_name=wheel_spinberkat
db_user=wheel_sb
db_secret_file=/root/.spinberkat-db.env
db_password=$(openssl rand -hex 16)

# The previous database is still empty: initialization intentionally stops on
# failed authentication before importing any schema or data.
cyberpanel deleteDatabase --dbName "$db_name"
cyberpanel createDatabase \
    --databaseWebsite undianspin.com \
    --dbName "$db_name" \
    --dbUsername "$db_user" \
    --dbPassword "$db_password"

umask 077
{
    printf 'DB_DATABASE=%s\n' "$db_name"
    printf 'DB_USERNAME=%s\n' "$db_user"
    printf 'DB_PASSWORD=%s\n' "$db_password"
} > "$db_secret_file"

export MYSQL_PWD="$db_password"
mysql --no-defaults -h 127.0.0.1 -u "$db_user" -Nse 'SELECT 1' "$db_name" >/dev/null
unset MYSQL_PWD db_password

echo "Spinberkat database credentials verified"
