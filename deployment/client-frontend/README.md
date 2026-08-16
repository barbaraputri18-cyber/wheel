# Spin Berkat client frontend

This directory contains the frontend-only deployment for the client VPS.
The browser loads `index.html`, `app.js`, and wheel assets locally. Requests
under `/api`, `/admin`, and uploaded media are passed through `gateway.php` to
the isolated Laravel instance on the owner VPS.

The gateway reads `CLIENT_ID` and `CLIENT_SECRET` from
`/home/spinberkat.com/.wheel-client.env`. Never commit that file.
