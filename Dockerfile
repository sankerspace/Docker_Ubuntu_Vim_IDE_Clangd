# our local base image

#######################################################################  FROM  ###########################################################################################################
FROM ubuntu:latest 

LABEL description="Container for use VIM" 

# install build dependencies 
# SET TIME ZONE INFORMATIONS
##ENV TZ=Europe/Minsk
##RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
## OTHER ALTERNATIVE
ENV DEBIAN_FRONTEND=nonintercative
RUN apt-get update && apt-get install -y build-essential zip openssh-server sudo make
RUN apt-get -y install python3-dev libncurses5-dev git
RUN apt-get -y install clang-tools-8 clangd-10

#--------------------------------------------------------------------------------------------
# INSTALL VIM
## no sudo prefixed 
## from git repository
##after build and installation delete all builded files, should not consume the memory
RUN cd /usr && git clone https://github.com/vim/vim.git 
RUN cd /usr/vim && ./configure --with-features=huge --enable-multibyte --enable-python3interp=yes --with-python3-config-dir=$(python3-config --configdir) --enable-gui=gtk2 --enable-cscope --prefix=/usr/local/
#RUN make VIMRUNTIMEDIR=/usr/local/share/vim/vim82 
RUN cd /usr/vim  && make &&  make install  && make distclean
#RUN cd /usr  && rm -r vim

#--------------------------------------------------------------------------------------------

# CREATE USER
RUN  useradd -m user -d /home/user -s /bin/bash -g users -G sudo && cd /home/user && HOME=/home/user
RUN echo 'user:user' | chpasswd  # CREATE PASSWORT FOR USER AFTER BUIDLING CONTAINER	


#--------------------------------------------------------------------------------------------

#INSTALL VUNDLE AND MY .VIMRC
RUN git clone https://github.com/VundleVim/Vundle.vim.git /home/user/.vim/bundle/Vundle.vim
RUN git clone https://github.com/sankerspace/vim-environment-and-settings.git /home/user/vim-environment-and-settings
RUN mv /home/user/vim-environment-and-settings/.vimrc /home/user/
RUN rm -r /home/user/vim-environment-and-settings/

## or from apt-get instal
#apt-get install vim-nox

#--------------------------------------------------------------------------------------------

# configure SSH for communication OUTSIDE	
RUN mkdir -p /var/run/sshd
RUN echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config && service ssh start


#--------------------------------------------------------------------------------------------
#FINAL INSTALLATIONS 

RUN cd /home/user && chown -hR user:users .* 
RUN apt-get -y install cmake

# install support for all langiuages in vim and YouComplete
#RUN vim +'PlugInstall --sync' +qa  ##UNCOMMENT if ith works
#RUN  echo | echo | vim +PluginInstall +qall &>/dev/null
#RUN cd /home/user/.vim/bundle/YouCompleteMe && python3 install.py --all ##UNCOMMENT if ith works





#######################################################################  COPY  ###########################################################################################################


COPY ./data /home/user/data
RUN chown -R user:users /home/user/data
RUN mkdir /home/user/ENVIRONMENT_DATA
RUN chown -R user:users /home/user/ENVIRONMENT_DATA

#######################################################################  EXPOSE  ###########################################################################################################

# expose port 22 
EXPOSE 22


#######################################################################  ENTRYPOINT  ###########################################################################################################

##ENTRYPOINT ["sh", "-c", "/home/user/data/start_up_vim.sh" ]
	

#######################################################################  CMD  ###########################################################################################################



CMD ["/usr/sbin/sshd","-D"]



