# Deployment



# CI/CD Pipelines

Terminology:
* Continuous Integration [CI]: Integrates the newly pushed code into master in a safe and rigorous manner. Phases may include
  * Trigger CI due to new push to master. Can also test pull requested branches
  * Build after new code is pushed, Docker build can also be included
  * Execute Unit tests
  * If all phases passed, move onto CD
* Continuous Delivery/Deployment [CD]: 
  * More unit tests if required
  * Intergration testing so see if everything still works after the merge
  * Either manually (continuous delivery) or automatically (continuous delpoyment) deploy the production server.  

Potential Platforms:
* Github Actions, CircleCI, TravisCI
* Watchtower to automatically update Docker Container when an new image is created

# Docker

*Docker is a platform for developers and sysadmins to develop, deploy, and run applications using containers.*

Basic Docker Terminology:
* Dockerfile: A text document that contains all the commands a user could call on the command line to assemble an image. The Dockerfile is essenitally a blueprint for
building docker images
* Docker Containers: Designed to run applications in isolation and at scale. They are based on and spawned from Docker images. 


## Docker Commands:
* For any docker commands, use --help for more info
* $ docker images -> lists all Docker images found locally along with related data. Comparable to ls
* $ docker build -t <image name> <Dockerfile_dir> -> Creates a Docker image with a tag using -t. TODO: Look into Docker naming conventions
* $ docker ps -> Lists all containers that are running. 
  * -a flag to see a history of containers that have been ran
* $ docker run <image_name> -> Starts a container based off the specified image
  * --rm flag to automatically delete a container once it's exited
#### Building
* $ docker-compose up [ Runs the container, -d flag to circumvent erros and run in background ]
* $ docker-compose build [ Rebuilds the container ]
* $ docker-compose run <some_command> [ Runs the container as a one off ]
* NOTE: Use docker-compose up for a more prolonged process, and docker-compose run for one off commands ]
#### Removal
* $ docker rm <container_id> -> Removes the specified container
* $ docker rm $(docker ps -a -q -f status=exited) -> rmeoves all containers that have a status of exited
* $ docker system prune -> Removes all images, containers, volumes, and networks not associated with a container
* $ docker rmi <image_name> -> Removes specified image

# Backend

Serialization: The act of transforming an object into another data format. After transforming an object we can save it to a file or sent it through the network

MVC (Model View Controller):
* The Model: Is repsonsible for getting and manipulating the data which is retrieved from the database. The models takes care of queires like, select, insert, update
and delete. The model also communicates with the controller. In most cases, the controller can request data through the model, and the controller updates the view. Keepin mind there are many variations of this architecture and the previous may not necessarily be implemented
* The View: Consists of the UI. The controller communicates with the view as well as the model
* The Controller: Takes in user input, which could be a user clicking a link, and thus sending a GET request, or submitting a form which triggers a POST request. The
controller acts like a middleman between the model and the view. The controller asks the model to get some data from a database, with the controller then taking that
to the view so the Ui can be updated accordingly. 


* What is a ViewSet?: Allows us to create a full CRUD API without having to specify explicit methods


# Webpack

*At its core, webpack is a static module bundler for moden JavaScript applications. When webpack processes your application, it internally builds a dependency graph
which maps every module your project needs, generating one or more bundles*

### Core Concepts

* Entry:
  * An entry point indicates which module webpack should use to begin buiding out its dependency graph. Webpack will figure out which other modules and libraries that      entry point depends on
  * By default the entry point is ./src/index.js, but you can specify a different one by setting an `entry: '<path>'` property in webpack.config.js

* Output:
  * The output property tells webpack where to emit the budles it creates and how to name these files
  * It defaults to ./dist/main.js for the main output file, and to the ./dist for any other generated file. Configure the output process through `output: {...}` entry
  * The output property has many configurable features, consult the docs 

* Loaders
  * Out of the box, webpack only understands JavaScript and JSON files. Loaders allow webpack to process other types of files and convert them into valid modules
  * Loaders can be specified through the `module: { rules: [...]}` entry. At a high level, loaders have two properties in your webpack config:
    * The `test` property identifies which file or files should be transformed
    * The `use` property indicates which loader should be used to do the transforming
    * Both of these properties should be defined within `module.rules`
  * NB: Exercise care when using Regex to match files! For example, `/\.txt$/` is **NOT** the same as `'/\.txt$/'` or  `"/\.txt$/"`. The former instruct webpack to         match any file that ends with .txt, at the latter two instructs webpack to match a SINGLE file with and absolute path '.txt'.
  * Again, there is a lot more customisation availbale for loaders. Consult the docs

* Plugins
  * While loaders are used to transform certain types or modules, plugins can be lerveraged to peform a wider range of tasks like bundle optimisation, asset management,    and injection of environment variables
  * In order to use a plugin, you must `const pluginName = require('pluginName');` at the top of webpack.config.js, then add it to the `plugins: [...]` array. Plugins      can be used multiple times in a config for different purpoes, so call it in the array prefaced with the `new` operator

* Mode
  * By setting the `mode` parameter to either `development`, `production`, or `none`, you can enable webpack's built in optimisations corresponding to the specified        environment


# HTTP Requests

* GET: Requests data from an endpoint
* POST: Should be used for sending new data to an endpoint
* PUT: Should be used to update existing data at an endpoint
* PATCH: Should be used to update a single field of an existing data object at an endpoint


# HTTP Error Codes

* 200: OK
* 301: Requested object has moved permanently. New URL is specified in the header of response, client will automatically retrieve
* 400: Bad Request, couldn't be understood by the server
* 404: Not Found
* 500: Internal Server Error
* 505: HTTP Version Not Supported
