# Lofft Readme

## Ruby version

**v2.7.4**

## Rails version

**v6.1.4**

The Lofft API has been built using Ruby on Rails --api it has limited front end and views. Please refer to the [Contribution Guidelines](https://github.com/LofftApp/lofft-web-api/wiki/Development-Cycle) on how to structure your workflow.

The following commands are required to get the Lofft API set up on your device.

Once the project has been downloaded into your files run the following commands to start the project.

**Download Project**

```
git clone git@github.com:LofftApp/lofft-web-api.git
```

**Install components through Bundler**

```
bundle install
```

**Database**

Once installed create, migrate and seed the database

```
rails db:create db:migrate db:seed
```

**Running the server**

The Client module of Lofft searches for the project at localhost:3001 this port should be used when launching the server.

```
rails s -p 3001
```

### Services (job queues, cache servers, search engines, etc.)

_There are currently no external service integrations_

### Deployment instructions

_Deployment is to Heroku through the main branch, this is completed after merge and review of new code_
