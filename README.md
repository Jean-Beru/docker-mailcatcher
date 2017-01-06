Mailcatcher
===========

[Mailcatcher](http://mailcatcher.me) catches mail and serves it through a dream.

Run with : `docker run -d -p 1025:1025 -p 1080:1080 --name mailcatcher jeanberu/mailcatcher`

Deliver mails to smtp://127.0.0.1:1025 et check out [http://127.0.0.1:1080]() to see them.

Environment variables
---------------------
**SMTP_PORT** Change default SMTP port (default: 1025)

**HTTP_PORT** Change default HTTP port (default: 1080)

