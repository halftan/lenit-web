#!/bin/bash

kill -s INT `cat /var/www/backend/tmp/pids/unicorn.backend.pid`
