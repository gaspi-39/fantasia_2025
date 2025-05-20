#!/bin/bash
TOKEN="7514333549:AAHjooYJg1byWgR8ODgho0fJmNh47mmKeMg"
CHAT_ID="6586228691"
MENSAJE=$(cat mensaje.txt)

curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendMessage" \
  --data-urlencode "chat_id=$CHAT_ID" \
  --data-urlencode "text=$MENSAJE"
