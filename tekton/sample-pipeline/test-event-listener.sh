#!/bin/sh
# need to port forward the event-listener service to port 8080 first
# kubectl port-forward service/el-hello-goodbye-listener 8080
curl -v -H 'content-Type: application/json' -d '{"helloUsername": "philip hello", "goodbyeUsername": "philip goodybye"}' http://localhost:8080