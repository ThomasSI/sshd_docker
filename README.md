# sshd_docker


#Look into the container
docker run  -it -P --entrypoint="/bin/bash" sshd:1.0



# Build container
git clone ..

docker build -t sshd:1.0 .
docker run  -d -P  sshd:1.0




