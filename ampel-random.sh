#!/bin/sh

while [ true ]; do
        sispmctl -t $(head -30 /dev/urandom | tr -dc "123" | head -c1)
	perl -e 'select(undef,undef,undef,.3)'
done
