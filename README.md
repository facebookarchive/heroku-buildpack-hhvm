# Heroku Buildpack for HHVM 

[![Build Status](https://travis-ci.org/ptarjan/heroku-buildpack-hhvm.png?branch=master)](https://travis-ci.org/ptarjan/heroku-buildpack-hhvm)

This is a [Heroku buildpack](http://devcenter.heroku.com/articles/buildpacks)
for PHP apps to run on HHVM.

The buildpack will detect your app as PHP if it has a `index.php` file in the 
root. 

## Usage

To use it with a new app:

    heroku create --buildpack https://github.com/ptarjan/heroku-buildpack-hhvm

Or to convert your existing PHP app:

    heroku config:set BUILDPACK_URL=https://github.com/ptarjan/heroku-buildpack-hhvm
    <make some git change and commit it>
    git push

If your app needs a custom [`config.hdf`](https://github.com/facebook/hiphop-php/wiki/Runtime-options) just save it in the root of your project. Otherwise, a default one will be applied with the following settings:

    Server {
      DefaultDocument = index.php
    }

## Performance

You should see anywhere between 2x and 10x performance gains on your app. 
This means you will need fewer dynos to serve the same amount of traffic.

## Problems

If you have some PHP code that won't run with HHVM, we would love you to send 
us example code and [open a task](https://github.com/facebook/hiphop-php/). 
HHVM's goal is to support all open source projects, so please report any and 
all issues.
