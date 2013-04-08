# Overview

**For the love of all things moist, please don't use this on a publicly-accessible server.**

A super-simple [Vagrant][vagrant] LAMP stack, provisioned using [Puppet], and customised for local [Laravel 4][laravel] development.

[laravel]: http://laravel.com/
[puppet]: http://www.phpunit.de/manual/current/en/index.html
[vagrant]: http://vagrantup.com/

In addition to the usual LAMP stuff, we automatically:

- Install [PHPUnit][phpunit]
- Install [Composer][composer]
- Create a development database (`devdb`)
- Point the document root at Laravel's `public` folder
- Set the correct permissions on the Laravel `storage` directory
- Set up a custom `~/.profile` to automatically `cd /vagrant` on SSH login.

[phpunit]: http://www.phpunit.de/manual/current/en/index.html
[composer]: http://getcomposer.org/

# Database
Configure Laravel to use the following database credentials when developing locally.

| Item     | Value |
|:---------|:------|
| DB Name  | devdb |
| Username | root  |
| Password | root  |

## Connecting to the database with Sequel Pro
Import the `SequelPro.plist` into Sequel Pro, and you should be sorted. If that doesn't work for some reason, the credentials are as follows:

| Item       | Value 							   |
|:-----------|:------------------------------------|
| Name 		 | Vagrant			   				   |
| MySQL Host | 127.0.0.1 						   |
| Username   | root      						   |
| Password   | root      						   |
| Database   | devdb     						   |
| Port       | 3306      						   |
| SSH Host   | localhost 						   |
| SSH Key    | `~/.vagrant.d/insecure_private_key` |
| SSH Port   | 2222                                |