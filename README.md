# sshd_docker

## How to use this image

This image create a sshd container.  
Enables root login   
Save the rootpw to VOLUME /rootpass/rootpw   
set rootpw (min 5 charctar) from env or generates random 10 digit pw


- run with random ssh port and random rootpw
  ```
  docker run  -d -P sshd
  ```
- run with random ssh port and new root password
  ```
  docker run  -d -P -e ROOTPW=newpassword sshd
  ```
- run with ssh port and new root password
  ```
  docker run  -d -p 10022:22 -e ROOTPW=newpassword sshd
  ```
- run with ssh port, new root password and mound to all Volums from an other container
  ```
  docker run  -d -p 10022:22 --volumes-from=containernameOrID -e ROOTPW=newpassword sshd
  ```
 
# Look into the container
```
docker exec -i -t containerId /bin/bash #by ID  
```
or 
```
docker exec -i -t containerName /bin/bash #by Name
```
or 
```
docker run  -it -P --entrypoint="/bin/bash" sshd
```

# Build and run container
```
git clone https://github.com/ThomasSI/sshd_docker.git
docker build -t sshd:tag .
docker run  -d -P -e ROOTPW=newpassword sshd:tag
```