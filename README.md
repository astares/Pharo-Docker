# Pharo-Docker
Access Docker from Pharo

## Screenshot

![](images/docker.png)

## Installation

### Installation of Docker
First install Docker on your local machine. It need to be accessible in the path so Pharo can find the **docker** command.
For Ubuntu use the following steps:

```
sudo apt-get install docker.io
```

Make sure you do not need to run 

```
sudo groupadd docker
sudo usermod -a -G docker $USER
```
Typically you have to logout and relogin (or restart your machine) for this to be in effect.

Try your first docker command to see it is working:

```
docker run hello-world

```
### Installation of Pharo

It is easy to get access to Pharo using the [Pharo ZeroConf](http://get.pharo.org/)

```
mkdir pharo
cd pharo
wget -O- get.pharo.org/64/70+vm | bash
./pharo-ui Pharo.image ../load.st
```

## Usage

### Retrieve informations

There are three important classes you will find in this package:

 - Docker
 - DockerImage (a local image)
 - DockerHubImage (a remote image)

The first one can be used to get some informations:

```Smalltalk
Docker version
```

You can ask for all *local* docker images:

```Smalltalk
Docker localImages 
```
which should return a collection with at least the already used "hello-world" image. Note that these are images that were already downloaded ("pulled").

You can also do a query to find all *remote* image on [DockerHub](http://hub.docker.com) starting with a specific name:

```Smalltalk
Docker searchDockerHubFor: 'ubuntu' 
```
also returning a collection.

### Pull from DockerHub

Using the project one can also access *remote* images found on DockerHub:

```Smalltalk
DockerHubImage fromHubName: 'pharo/vm'
```

and pull them locally

```Smalltalk
(DockerHubImage fromHubName: 'pharo/vm') pull
```
they will be added locally which you can check again using:

```Smalltalk
Docker localImages 
```
