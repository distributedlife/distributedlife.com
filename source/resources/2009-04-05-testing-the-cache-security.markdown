---
layout: resource
title: Testing the Cache - Security
date: 2009-04-05 23:55:47
tags: cache testing
---
Cache Security is very important. **Just because an object is in the cache doesn't mean that I should be able to see it.**

The important thing to remember with caches is that you need to perform authorisation before you go to the cache, not when you go to the source object. If you don't then as soon as an authorised user accesses the object it goes into the cache **all unauthorised users can see said object.** Their requests go to the cache and everyone is allowed to see the cache.

You may be thinking that having user level caching is sufficient security. If User A can't see User B's cached objects then we only need to check authorisation when we go to the source object. This is incorrect because we are assuming that User A is either always going to be authorised or is not going to be authorised.

A situation can occur when User A is authorised to see an object, does so and that object is placed in the cache. After this point User A has her authority revoked. Because we are not checking the access at the cache level, **as long as the object remains in the cache then User A will be able to see it.**