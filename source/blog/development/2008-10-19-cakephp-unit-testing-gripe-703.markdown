---
title: CakePHP Unit Testing Gripe #703
date: 2008-10-19 23:57:04
tags: cakephp, cakephp, configuration-management, database, deployment, testing, testing, 
---
Next up in my problems with testing with CakePHP, database management. CakePHP supports the ability for models to specify which database configuration to use. This allows you to define two separate database instances for development, test or whatever.

The problem I have is when I test my controller it uses the real versions of the model, not the unit test versions. It has no concept of a unit test model (created purely for configuration management). Therefore it never gets the message to use the test database and the test cases fail.

In the end I feel it is safer and a lot less painful if you use your default database for development (or have a continuous integration server run the unit tests) and then when you have a build you want to move out of development; change your database configuration file so it affects the site as whole. When you do deploy to the next environment up I suggest you write a script to build the database configuration accordingly. <a href="http://distributedlife.com/blog/2008/05/automated-deployment-why-it-is-a-good-idea.html">We all know how I feel about manual steps in deployments.</a>