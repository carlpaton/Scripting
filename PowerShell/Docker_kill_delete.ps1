docker ps -aq

docker stop $(docker ps -aq)

docker rm $(docker ps -aq)

docker volume ls

docker volume prune -f