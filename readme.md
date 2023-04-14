# information

#### hot fixes

- this still uses hot fixing so you can update the app from the host machine and it will send it through to the docker image

- Dockerfile is the actual image while we add to it with the docker-compose.yml with a config like structure.
	- When running the docker compose command it will use the docker-compose file and link it with the dockerfile to build.
 	- If you wanted to create a prod and a dev one that is possible. I didnt add it to this but you would just make a file like docker-compose.prod.yml and use that as the build.

# build the image

##### use this command to build the server

```
$ docker-compose build
```

#### how to start the server and terminal

use this command to start the project and will open with that terminal and it will port into the server so you can run commands into the server from your own terminal instead of using the one from the docker panel

```
$ docker-compose run --rm --service-ports ruby_dev
```

the last arg is the name of your service in docker-compose

inside the container use the basic commands to error fix and compile.

#### make file

- if you prefer not to memorize these commands add it to a make file, should be installed by default on linux and mac (might need a package manager). If you are on windows you can download it through the choco package manager or their website

##### create the makefile

##### linux/mac

```
$ touch Makefile
```

##### windows or all

- create a new file and name it Makefile with no extention

##### example of what you could do

```
build:
	docker-compose build
up:
	docker-compose run --rm --service-ports ruby_dev
```

#### to use this file

##### build the image

- will run the commands under that name in the file

```
$ make build
```

##### run the image

```
$ make up
```

# Run the server

#### clone git project into this dir

- can use this in the host or docker image, name it what ever in this case we used **myapp**

```
$ git clone URL ./myapp
```

#### cd into project

- need to do this and the rest of the steps on the docker container

```
$ cd myapp
```

#### might need to rake the db

```
$ rake db:migrate
```

#### fix webpacker since we did a new git clone

```
$ bundle exec rake webpacker:install
```

#### run the server just like usual

```
$ rails s -b 0.0.0.0
```

# notes

#### exit terminal

- if you want to leave the terminal that the docker image is using type

```
$ exit
```

#### reinstall bundle gems

- there might be an issue when you shutdown to open again the next day and will require you to install bundle packages again. I didnt save the volume that the bundles are saved at.

#### other issues

- did not test(might work idk) this with later tech in this class, im sure that capybara will cause issues since there isnt a chrome browser installed
  - this will make it error out on trying to test.
  - solution would be to import chrome into the image adding it to the Dockerfile
