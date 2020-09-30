# Docker_Ubuntu_Vim_IDE_Clangd

A Dockerfile to build a fully featured VIM IDE for C++ Docker Container with YouComplete Code Completion Support.


# BUILD
----------------------------------------------------
## build docker container with manual configurations
	
	
	docker build -t sankerspace/ubuntu-vim-ide-clangd:latest .


# RUN 
----------------------------------------------------

	
## start in background
	
	docker run --name ubuntu-vim-ide-clangd -dp 5000:22 -i -t sankerspace/ubuntu-vim-ide-clangd:latest


## save image 

	docker save -o ubuntu-vim-ide-clangd_latest.tar  sankerspace/ubuntu-vim-ide-clangd:latest 
	


# DOCKER.HUB
-------------------------------------------------------


	docker push sankerspace/ubuntu-vim-ide-clangd:latest

# RCHIVING
-------------------------------------------------------

	docker save -o  ubuntu-vim-ide-clangd.tar sankerspace/ubuntu-vim-ide-clangd:latest  ## save docker image on hardrive


# VOLUME
---------------------------------------------------------

chown user:users  <directory_shared_with_docker_container>
