#!/bin/bash
kill -HUP $(cat /var/run/rsyslogd.pid)
