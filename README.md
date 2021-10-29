# Lofft Readme

The Lofft API has been built using Ruby on Rails --api and has limited front end and views. Please refer to the [Contribution Guidlines](https://github.com/LofftApp/lofft-web-api/wiki/Development-Cycle) on how to structure your workflow.

The following commands are required to get the Lofft API set up on your device.

Once the project has been downloaded into your files run the following commands to start the project.

```
  bundle install
```

Once installed create, migrate and seed the database

```
  rails db:create db:migrate db:seed
```

**Running the server**

The Clinet module of Lofft searches for the project at localhost:3001 this port should be used when launching the server.

```
  rails s -p 3001
```
