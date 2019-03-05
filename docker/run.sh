#!/bin/bash

set -eu

case "$CLIENT_ROLE" in
    "producer")
        kafka-producer-perf-test --topic ${TOPIC} --num-records ${NUM_RECORDS} --record-size ${RECORD_SIZE} --throughput ${THROUGHPUT} --producer-props acks=${PRODUCER_ACK} bootstrap.servers=${BROKER_LIST} buffer.memory=${BUFFER_MEMORY} batch.size=${BATCH_SIZE};;
    "consumer")
        kafka-consumer-perf-test --broker-list ${BROKER_LIST} --messages ${MESSAGES} --topic ${TOPIC} --threads ${THREADS};;
    *)
        echo "[ERROR] Unknown CLIENT_ROLE: $CLIENT_ROLE" 1>&2
        exit 1
esac

while true
do 
  sleep 30
done
