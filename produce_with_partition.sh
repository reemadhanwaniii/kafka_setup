#!/bin/bash

# Configuration
BROKER="broker:29092"
TOPIC="practice-topic"

echo "Producing messages to topic: $TOPIC on broker: $BROKER"
echo "-----------------------------------------------------"
echo "Enter key:value pairs (e.g., user1:hello world). Press Ctrl+D when done."

# Launch producer with partition print enabled
kafka-console-producer \
  --bootstrap-server "$BROKER" \
  --topic "$TOPIC" \
  --property "parse.key=true" \
  --property "key.separator=:" \
  --property "print.partition=true"
