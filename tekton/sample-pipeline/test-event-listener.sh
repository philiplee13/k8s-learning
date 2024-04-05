#!/bin/sh
curl -v -H 'content-Type: application/json' -d '{"helloUsername": "philip hello", "goodbyeUsername": "philip goodybye}' 

# not recommened to use -k -> this doesn't verify the cert