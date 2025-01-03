#!/bin/bash
# Simulate network latency for worker 2
if [ "$WORKER_NAME" = "worker_2" ]; then
    tc qdisc add dev eth0 root netem delay 1ms
fi

# Start the ARQ worker
exec "$@"
