#!/bin/bash

MY_IP=`curl https://checkip.amazonaws.com`
echo {\"my_ip\": \"$MY_IP\"}