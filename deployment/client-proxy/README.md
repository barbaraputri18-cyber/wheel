# Wheel client gateway

Temporary production gateway for `spinberkat.com` while the application is
being separated into a dedicated API and frontend.

The gateway keeps the Laravel source code, admin panel, and database on
`undianspin.com`. It forwards public wheel requests, rewrites origin URLs to
the client domain, and blocks admin/authentication paths on the client domain.

Deploy `index.php` and `.htaccess` to the client domain's `public_html`.
The upstream and public origins are constants at the top of `index.php` and
must be changed for another client.

This is an interim deployment. The long-term architecture should use a
purpose-built API with per-client authentication and a standalone frontend.

