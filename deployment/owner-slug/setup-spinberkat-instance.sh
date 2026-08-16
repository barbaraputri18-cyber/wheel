#!/usr/bin/env bash

set -euo pipefail

app_dir=/home/undianspin.com/spinberkat_app
site_user=undia6721
site_group=undia6721
php_bin=/usr/local/lsws/lsphp74/bin/php
db_secret_file=/root/.spinberkat-db.env
admin_secret_file=/root/.spinberkat-admin.env

if [[ ! -d "$app_dir" || ! -f "$app_dir/artisan" ]]; then
    echo "Spinberkat application directory is missing" >&2
    exit 1
fi

if [[ ! -f "$db_secret_file" ]]; then
    echo "Spinberkat database credentials are missing" >&2
    exit 1
fi

# Normalize credentials created through CyberPanel's CLI wrapper when its
# remote shell preserved newline escapes as literal "n" characters.
if ! grep -q '^DB_USERNAME=' "$db_secret_file"; then
    db_secret_content=$(<"$db_secret_file")
    db_secret_content=${db_secret_content/nDB_USERNAME=/$'\n'DB_USERNAME=}
    db_secret_content=${db_secret_content/nDB_PASSWORD=/$'\n'DB_PASSWORD=}
    db_secret_content=${db_secret_content%n}
    umask 077
    printf '%s\n' "$db_secret_content" > "$db_secret_file"
    unset db_secret_content
fi

# shellcheck disable=SC1090
source "$db_secret_file"

cd "$app_dir"
cp .env.example .env

sed -i \
    -e 's|^APP_NAME=.*|APP_NAME="Spin Berkat"|' \
    -e 's|^APP_ENV=.*|APP_ENV=production|' \
    -e 's|^APP_DEBUG=.*|APP_DEBUG=false|' \
    -e 's|^APP_URL=.*|APP_URL=https://undianspin.com/spinberkat|' \
    -e "s|^DB_DATABASE=.*|DB_DATABASE=${DB_DATABASE}|" \
    -e "s|^DB_USERNAME=.*|DB_USERNAME=${DB_USERNAME}|" \
    -e "s|^DB_PASSWORD=.*|DB_PASSWORD=${DB_PASSWORD}|" \
    .env

printf '\nSESSION_COOKIE=spinberkat_session\n' >> .env

chown "$site_user:$site_group" .env
chmod 600 .env

sudo -u "$site_user" "$php_bin" artisan key:generate --force --no-interaction

export MYSQL_PWD="$DB_PASSWORD"
schema_exists=$(mysql --no-defaults -h 127.0.0.1 -u "$DB_USERNAME" -Nse \
    "SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = '${DB_DATABASE}' AND table_name = 'cms_users'" \
    "$DB_DATABASE")

if [[ "$schema_exists" == "0" ]]; then
    mysql --no-defaults -h 127.0.0.1 -u "$DB_USERNAME" "$DB_DATABASE" < database.sql
fi

admin_password=$(openssl rand -hex 10)
admin_hash=$("$php_bin" -r 'echo password_hash($argv[1], PASSWORD_BCRYPT);' "$admin_password")

mysql --no-defaults -h 127.0.0.1 -u "$DB_USERNAME" "$DB_DATABASE" <<SQL
CREATE TABLE IF NOT EXISTS log_access (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ipaddress VARCHAR(255) NULL,
    useragent TEXT NULL,
    url TEXT NULL,
    description VARCHAR(255) NULL,
    details TEXT NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET FOREIGN_KEY_CHECKS=0;
TRUNCATE TABLE cms_logs;
TRUNCATE TABLE code;
TRUNCATE TABLE draw;
TRUNCATE TABLE history_draw;
TRUNCATE TABLE log_access;
DELETE FROM cms_users WHERE id <> 1;
UPDATE cms_users
SET name = 'Spin Berkat Admin',
    email = 'admin@spinberkat.com',
    password = '${admin_hash}',
    id_cms_privileges = 1,
    status = 'Active'
WHERE id = 1;
UPDATE content
SET name = 'Spin Berkat',
    wheel = NULL,
    outwheel = NULL,
    logo = NULL,
    background = NULL,
    favicon = NULL,
    music = NULL,
    music_win = NULL,
    music_lose = NULL,
    music_spin = NULL
WHERE id = 1;
SET FOREIGN_KEY_CHECKS=1;
SQL

unset MYSQL_PWD DB_PASSWORD

umask 077
printf 'ADMIN_URL=https://undianspin.com/spinberkat/admin\nADMIN_EMAIL=admin@spinberkat.com\nADMIN_PASSWORD=%s\n' \
    "$admin_password" > "$admin_secret_file"

install -d -o "$site_user" -g "$site_group" -m 775 storage/framework/cache/data
install -d -o "$site_user" -g "$site_group" -m 775 storage/framework/sessions
install -d -o "$site_user" -g "$site_group" -m 775 storage/framework/views
install -d -o "$site_user" -g "$site_group" -m 775 storage/logs
install -d -o "$site_user" -g "$site_group" -m 775 bootstrap/cache
install -d -o "$site_user" -g "$site_group" -m 775 public/uploads
chown -R "$site_user:$site_group" storage bootstrap/cache public/uploads

sudo -u "$site_user" "$php_bin" artisan optimize:clear

echo "Spinberkat instance initialized"
