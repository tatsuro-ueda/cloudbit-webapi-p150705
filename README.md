# CloudBit Web API server

This is the web application using Sinatra.

You can get input percent of [Cloudbit](http://littlebits.cc/cloud) by HTTP GET.

## Installation

### General

```sh
$ git clone git@github.com:weed/cloudbit-webapi-p150705.git
$ cd cloudbit-webapi-p150705
$ bundle install
$ shotgun  # launch server on local
```

### Heroku

You can create your own server by the Heroku button below.

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

## Usage

You can get your DEVICE_ID and ACCESS_TOKEN in [LittleBits Cloud Control page](http://control.littlebitscloud.cc/) -> Settings.

You should request as below:

https://cloudbit-webapi-p150705.herokuapp.com/input?CLOUDBIT_DEVICE_ID=00e04c032d62&CLOUDBIT_ACCESS_TOKEN=04784c7ae09bea78704572648c547c472f61dfce0bdf00075fb050f85eaff8ab