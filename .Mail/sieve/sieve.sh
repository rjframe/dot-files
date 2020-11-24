#!/bin/bash

# Called by systemd when mbsync runs.

/sbin/sieve "~/.Mail/sieve/screener.sieve"
