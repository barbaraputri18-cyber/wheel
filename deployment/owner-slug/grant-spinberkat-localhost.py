import os
import sys

sys.path.insert(0, "/usr/local/CyberCP")
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "CyberCP.settings")

import django

django.setup()

from plogical.mysqlUtilities import mysqlUtilities


def read_env_file(path):
    values = {}
    with open(path, "r", encoding="utf-8") as handle:
        for line in handle:
            key, separator, value = line.strip().partition("=")
            if separator:
                values[key] = value
    return values


credentials = read_env_file("/root/.spinberkat-db.env")
database = credentials["DB_DATABASE"]
username = credentials["DB_USERNAME"]
password = credentials["DB_PASSWORD"]

connection, cursor = mysqlUtilities.setupConnection()
if connection == 0:
    raise RuntimeError("CyberPanel could not open its administrative database connection")

cursor.execute(
    "CREATE USER IF NOT EXISTS %s@%s IDENTIFIED BY %s",
    (username, "localhost", password),
)
cursor.execute(
    "ALTER USER %s@%s IDENTIFIED BY %s",
    (username, "localhost", password),
)
cursor.execute(
    f"GRANT ALL PRIVILEGES ON `{database}`.* TO %s@%s",
    (username, "localhost"),
)
connection.commit()
connection.close()

print("Spinberkat localhost database grant created")

