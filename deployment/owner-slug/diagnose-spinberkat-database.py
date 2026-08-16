import json
import os
import sys

sys.path.insert(0, "/usr/local/CyberCP")
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "CyberCP.settings")

import django
import MySQLdb

django.setup()


def read_env_file(path):
    values = {}
    with open(path, "r", encoding="utf-8") as handle:
        for line in handle:
            key, separator, value = line.strip().partition("=")
            if separator:
                values[key] = value
    return values


try:
    with open("/etc/cyberpanel/mysqlPassword", "r", encoding="utf-8") as handle:
        cyberpanel_database = json.load(handle)
except json.JSONDecodeError:
    cyberpanel_database = {"mysqlhost": "localhost", "mysqlport": 3306}

credentials = read_env_file("/root/.spinberkat-db.env")

print(f"CYBERPANEL_DB_HOST={cyberpanel_database['mysqlhost']}")
print(f"CYBERPANEL_DB_PORT={cyberpanel_database['mysqlport']}")

for host in ("localhost", "127.0.0.1", cyberpanel_database["mysqlhost"]):
    try:
        connection = MySQLdb.connect(
            host=host,
            port=int(cyberpanel_database["mysqlport"]),
            user=credentials["DB_USERNAME"],
            passwd=credentials["DB_PASSWORD"],
            db=credentials["DB_DATABASE"],
        )
        connection.close()
        print(f"LOGIN_{host}=OK")
    except Exception as error:
        print(f"LOGIN_{host}=FAILED:{error.__class__.__name__}")
