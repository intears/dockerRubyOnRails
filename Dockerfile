# docker uses prebuilt images to build containers
# from this we are taking the ruby image and adding to it
# we selected the version 3.0.2 you could go further and select what version of linux
# you want to use as well but we are using the default which is most likely debian or alpine since its small
FROM ruby:3.0.2 

# this is the dir in the docker iamge to work in it really doesn't matter
# just needs to be consistent throught the app
WORKDIR /home/app 


## expose the port so we can link it in the docker-compose.yml
EXPOSE 3000

# install the rails systems like we did before
# we are using the run command to run the commands in the container
RUN gem install rails bundler
RUN gem install rails

## update the linux system and install nodejs for webpacker and yarn
## nodejs is used for the js part of rails such as the webpacker
## npm is used for the node package manager to install the packages for the js uses
## -qq is the quiet flag to not show the progress of the install
## -y is the yes flag to say yes to all the prompts
RUN apt-get update -qq && apt-get install -y nodejs npm 

## this is the yarn package manager for the ruby side of rails
## this is required for webpacker to install and is needed to be the one from npm since
## it is the latest version, if you install this from the apt-get it will be an older version .32git
## and will not work with the latest rails
## -g is the global flag to install it globally
RUN npm install -g yarn

## I do not know if we need to install chrome for capybara to work
## but I am going to leave it in here for now.

# what command to run when the container starts
# this is so we can just use this as a way to navigate to the app dir
# and run the rails server instead of auto running.
# if you are only using one app and its just in this dir you can just run the rails server
ENTRYPOINT [ "/bin/bash" ]
