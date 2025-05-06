# Worker

This is a demo example of how an agent collects information from the real world. 

For the demo, we run 2 Docker containers as though they are real hosts, with the SSH service running. This allows us 
to collect SSH information and parse it through policies for evidence collection.

The configuration for each worker agent is stored in `worker-1.yml` and `worker-2.yml`.