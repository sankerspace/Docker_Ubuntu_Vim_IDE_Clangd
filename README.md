# Docker_Ubuntu_Vim_IDE_Clangd

A Dockerfile to build a fully featured VIM IDE for C++ Docker Container with YouComplete Code Completion Support.

## Why someone should use my Docker_Ubuntu_Vim_IDE_Clangd Docker Container

I run that container on my server at home, because it was boring always to deploy the whole Vim installation on my laptop and then reinstall it again on my 
computer at home. When there is an update for YouComplete on the Git repository, i have to reinstall everything again, because the Youmplete supports now an higher python version. Therefore i invented my whole IDE at a central point, as a docker distribution and the best thing i can code and implement even with my apple ipad and my MagicKeyboard 2, of course over ssh.




## BUILD
----------------------------------------------------
### build docker container with manual configurations
	
	
	docker build -t sankerspace/ubuntu-vim-ide-clangd:latest .


## RUN 
----------------------------------------------------

	User : user and password: user
	
### start in background
	
	docker run --name ubuntu-vim-ide-clangd -dp <host-port>:22 -i -t sankerspace/ubuntu-vim-ide-clangd:latest
	
### Docker_Ubuntu_Vim_IDE_Clangd Container accessible over ssh as it is meant to

	ssh user@<Ip-adress-of-docker-host-machine> -p <host-port>
	
	


### save image 

	docker save -o ubuntu-vim-ide-clangd_latest.tar  sankerspace/ubuntu-vim-ide-clangd:latest 
	


## DOCKER.HUB
-------------------------------------------------------


	docker push sankerspace/ubuntu-vim-ide-clangd:latest

## ARCHIVING
-------------------------------------------------------

	docker save -o  ubuntu-vim-ide-clangd.tar sankerspace/ubuntu-vim-ide-clangd:latest  ## save docker image on hardrive


## VOLUME
---------------------------------------------------------

chown user:users  <directory_shared_with_docker_container>
