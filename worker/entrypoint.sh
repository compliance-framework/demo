# !/bin/sh

service ssh start

./concom agent -c config.yml -d
