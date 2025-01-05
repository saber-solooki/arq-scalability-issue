**Description:** 

This repository is designed to demonstrate a scalability issue with Arq in specific scenarios. Consider a setup with two different data centers where Arq workers operate in both locations, but Redis is deployed in only one of them. Consequently, workers in the data center with lower network latency have a significant advantage over those with higher latency. As a result, workers with greater latency have a minimal likelihood (approximately 1%) of receiving and executing tasks.

**How to run the app:**

Simply run `docker-compose up` and run `enqueue_jobs.py` to enqueue jobs. You can notice from the logs, worker 2 has less chance than worker 1 to run jobs.
