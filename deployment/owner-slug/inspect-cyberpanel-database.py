import os
import sys

sys.path.insert(0, "/usr/local/CyberCP")
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "CyberCP.settings")

import django

django.setup()

from databases.models import Databases

for database in Databases.objects.filter(dbName__icontains="spinberkat"):
    print(f"{database.dbName}\t{database.dbUser}")

