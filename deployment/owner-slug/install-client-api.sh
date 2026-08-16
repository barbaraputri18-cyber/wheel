#!/usr/bin/env bash

set -euo pipefail

app_dir=/home/undianspin.com/spinberkat_app
staging_dir=/tmp/wheel-api-deploy
site_user=undia6721
site_group=undia6721
php_bin=/usr/local/lsws/lsphp74/bin/php
secret_file=/root/.spinberkat-api.env
backup_dir=/root/spinberkat-api-backup-$(date +%Y%m%d-%H%M%S)

install -d -m 700 "$backup_dir"
cp -a "$app_dir/app/Http/Kernel.php" "$backup_dir/Kernel.php"
cp -a "$app_dir/routes/api.php" "$backup_dir/api.php"
cp -a "$app_dir/public/assets/wheel/js/script.js" "$backup_dir/script.js"

install -o "$site_user" -g "$site_group" -m 644 "$staging_dir/ClientApiController.php" "$app_dir/app/Http/Controllers/ClientApiController.php"
install -o "$site_user" -g "$site_group" -m 644 "$staging_dir/VerifyWheelClient.php" "$app_dir/app/Http/Middleware/VerifyWheelClient.php"
install -o "$site_user" -g "$site_group" -m 644 "$staging_dir/wheel.php" "$app_dir/config/wheel.php"
install -o "$site_user" -g "$site_group" -m 644 "$staging_dir/Kernel.php" "$app_dir/app/Http/Kernel.php"
install -o "$site_user" -g "$site_group" -m 644 "$staging_dir/api.php" "$app_dir/routes/api.php"
install -o "$site_user" -g "$site_group" -m 644 "$staging_dir/script.js" "$app_dir/public/assets/wheel/js/script.js"

if [[ ! -f "$secret_file" ]]; then
    umask 077
    {
        printf 'WHEEL_CLIENT_ID=spinberkat\n'
        printf 'WHEEL_CLIENT_SECRET=%s\n' "$(openssl rand -hex 32)"
    } > "$secret_file"
fi

# shellcheck disable=SC1090
source "$secret_file"
sed -i '/^WHEEL_CLIENT_ID=/d;/^WHEEL_CLIENT_SECRET=/d;/^WHEEL_CLIENT_ACTIVE=/d;/^WHEEL_SIGNATURE_TTL=/d' "$app_dir/.env"
{
    printf '\nWHEEL_CLIENT_ID=%s\n' "$WHEEL_CLIENT_ID"
    printf 'WHEEL_CLIENT_SECRET=%s\n' "$WHEEL_CLIENT_SECRET"
    printf 'WHEEL_CLIENT_ACTIVE=true\n'
    printf 'WHEEL_SIGNATURE_TTL=300\n'
} >> "$app_dir/.env"
chown "$site_user:$site_group" "$app_dir/.env"
chmod 600 "$app_dir/.env"

cd "$app_dir"
sudo -u "$site_user" "$php_bin" artisan optimize:clear
sudo -u "$site_user" "$php_bin" artisan route:list --path=api/client

echo "Spinberkat client API installed; backup: $backup_dir"
