Mailcatcher
===========

[Mailcatcher](http://mailcatcher.me) catches mail and serves it through a dream.

Run with : `docker run -d -p 1025:25 -p 1080:80 --name mailcatcher jeanberu/mailcatcher`

Deliver mails to smtp://127.0.0.1:1025 et check out [http://127.0.0.1:1080]() to see them.

When you are using it with `docker-compose` and a DNS resolver, out of the box you can deliver mails to
smtp://yourdns:25 et check out http://yourdns to see them.

Environment variables
---------------------
**SMTP_PORT** Change default SMTP port (default: 25)

**HTTP_PORT** Change default HTTP port (default: 80)

