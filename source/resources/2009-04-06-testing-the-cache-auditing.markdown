---
layout: resource
title: Testing the Cache - Auditing
date: 2009-04-06 23:55:42
tags: cache testing
---
If you audit cache accesses then you are going to need to make sure that occurs regardless of whether you have User Level or Shared caching

Whether you audit when the source record is viewed or on any view (on cache access) is an organisational decision. I won't tell you which way to go here. In my examples I will be using the scenario that auditing is only done when the source record is read.

Three basic tests:

 - you should be auditing that when User A access the source object
 - you should not audit when User A access the cached object
 - **you should be auditing when User B access the cached object placed in the cache by User A**