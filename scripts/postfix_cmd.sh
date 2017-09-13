#!/bin/bash

postfix start
service rsyslog start
tail -f /var/log/mail.log
