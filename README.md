# Docker_Ubuntu_Vim_IDE_Clangd

A Dockerfile to build a fully featured VIM IDE for C++ Docker Image with YouComplete Code Completion Support.

## Why someone should use my Docker_Ubuntu_Vim_IDE_Clangd Docker Container

I run that container on my server at home, because it is really boring to deploy the whole Vim installation on several machines. When there is an update for YouComplete on the Git repository, i have to reinstall everything again, because the Youmplete supports now an higher python version for example. 
Therefore i invented a unified vim installation which works everywhere.





## BUILD
----------------------------------------------------
### build docker image with manual configurations
	
	
	docker build -t <your-repo-name>/ubuntu-vim-ide-clangd:latest .


## RUN 
----------------------------------------------------

### Login informations

	User : user and password: user
	
### start a new docker container in the background
	
	docker run --name ubuntu-vim-ide-clangd -dp <host-port>:22 -i -t <your-repo-name>/ubuntu-vim-ide-clangd:latest
	
### Docker_Ubuntu_Vim_IDE_Clangd Container accessible over ssh as it is meant to

	ssh user@<Ip-adress-of-docker-host-machine> -p <host-port>
	
	

### save image 

	docker save -o ubuntu-vim-ide-clangd_latest.tar  <your-repo-name>/ubuntu-vim-ide-clangd:latest 
	


## DOCKER.HUB
-------------------------------------------------------

*Push an image to your Repo on Docker Hub*

	docker push <your-repo-name>/ubuntu-vim-ide-clangd:latest

## ARCHIVING
-------------------------------------------------------

	docker save -o  ubuntu-vim-ide-clangd.tar <your-repo-name>/ubuntu-vim-ide-clangd:latest  ## save docker image on hardrive


## VOLUME
---------------------------------------------------------

You are able to bind directory /home/user/ENVIRONMENT_DATA inside docker container to a directory path on your host machine.
A prerequisite is to create a User "user" and group "users" on your host machine to circumvent permission problems and then perform
following command on a random directory of your choice.

	chown user:users  <directory_host_computer>
	
Alternative Running command:

	docker run --name ubuntu-vim-ide-clangd -dp <host-port>:22 \
	-v <docker_random_path_to_directory_host_machine>:/home/user/ENVIRONMENT_DATA \
	-i -t <your-repo-name>/ubuntu-vim-ide-clangd:latest
##  PROBLEMS

- P1.0   `echo | echo | vim +PluginInstall +qall &>/dev/null` works perfectly if i start it interactively in the CLI, but
	it i didnt run it succefully inside Dockerfile
- P2.0 Consider comments in /home/user/README.

