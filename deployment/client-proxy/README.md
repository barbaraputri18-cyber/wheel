# Wheel client gateway

Production gateway for the public wheel at `spinberkat.com`.

The gateway keeps the Laravel source code, admin panel, and database on
the isolated `/spinberkat` instance on `undianspin.com`. It forwards public
wheel and admin requests while rewriting the instance URL to the client
domain.

The client admin is available at `https://spinberkat.com/admin`; its PHP
source and database remain on the owner VPS.

Deploy `index.php` and `.htaccess` to the client domain's `public_html`.
The upstream origin, instance base path, and public origin are constants at
the top of `index.php` and must be changed for another client.

This is an interim deployment. The long-term architecture should use a
purpose-built API with per-client authentication and a standalone frontend.
