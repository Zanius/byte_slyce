#!/bin/sh

sh ./entrypoint.sh

exec mix phx.server
