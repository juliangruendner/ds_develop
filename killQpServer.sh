#!/bin/bash

# this is a convenience function to kill your local queue and poll during development

kill `pgrep -f ds_poll.py`
kill `lsof -t -i:8001`
