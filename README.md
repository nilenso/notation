# Notation
NOTATION is a markdown based note-taking web app. Note down your thoughts, to-dos at any time, any place. You can also share your notes with anyone and can even set view or edit access.

## Setting up Development Environment

### Requirements:
Notation requires the following to run:
- Ruby (v2.6.8)
- Ruby on Rails (v5.2.6)
- Docker
  - To install docker follow this [documentation](https://www.docker.com/)


### Cloning the repository
```sh
$ git clone https://github.com/nilenso/notation.git
```

### Running the Application:
To run the application, make sure no processes are running in the following ports in localhost:
- :3000
- :5432

Then build and run the following commands at the root of the repository
##### Build:
  ```sh
$ docker-compose build
```
##### Run:
  ```sh
$ docker-compose up
```

##### Run in background:
  ```sh
$ docker-compose up -d
```

Verify the application is running by visiting following route in the browser.
```sh
http://localhost:3000
```

### Stoping the Application
If you started the application by running the command `docker-compose up` press `Ctrl+c` on windows or `Cmd+c` on mac to stop. If the application is running in background, stop it by running,

```sh
$ docker-compose stop
```

##### To bring the container down:
```sh
$ docker-compose down
```
## Testing

To run tests, do:

```sh
$ rspec
```

## Deployment

1. Lint your code against style guide rules using _standardrb_ linter.
```sh
$ standardrb --fix
```
2. Open a pull request in the [nilenso/notation](https://github.com/nilenso/notation) repo. A brief description of the proposed addition along with references to any discussion issues should be included.
3. The automated CI running against each pull request runs various code quality tests. 
4. Pull request is merged to master branch once it's approved.
5. Once your pull request is merged, changes can be publicly visible on [notation](https://notation-production.herokuapp.com/).

## License

Copyright © 2021 Nilenso Software

