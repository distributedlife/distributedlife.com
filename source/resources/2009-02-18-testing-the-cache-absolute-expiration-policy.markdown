---
layout: resource
title: Testing the Cache - Absolute Expiration Policy
date: 2009-02-18 23:55:43
tags: cache testing
---
The absolute expiration policy is one of the easiest policies to test. There are two basic test cases:

 - The object is cached until expiration
 - The object is refreshed after expiration


The object is cached until expiration:


 1. For my example I'll use five minutes relative from creation as the cache expiration time
 1. Place an object in the cache (the cache timer starts now)
 1. **Update the object (this may involve changing a web-page or updating a record in the database, whatever you do, do not access the object such that it will be cached or update its cache)**
 1. Wait four minutes
 1. Access the object You should get the cached version and not the updated version


The object is refreshed after expiration:


 1. For my example I'll use five minutes relative from creation as the cache expiration time
 1. Place an object in the cache (the cache timer starts now)
 1. **Update the object (this may involve changing a web-page or updating a record in the database, whatever you do, do not access the object such that it will be cached or update it's cache.)**
 1. Wait five minutes.
 1. Access the object. You should get the updated version and not the cached version

As you can see that it is not complicated. The only hard part is making sure you can update your record within the cache timeout. Naturally this only covers the policy and not the rest of the cache behaviour. Such behaviour is common regardless of the expiration policy so I'll save that for a seperate post.