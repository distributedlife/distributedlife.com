---
layout: resource
title: Testing the Cache - Sliding Expiration Policy
date: 2009-02-19 23:55:18
tags: cache testing
---
The second of my posts on how to test the cache and the cache expiration policy. Click [here](/resources/testing-the-cache.html) for what you should do before reading this post. It explains the different policies and what you need in advance to test.

Another fairly simple cache policy test, the sliding expiration has three basic test cases:

 - The cache expiration timeout is updated on each access
 - The cache expiration timeout once updated eventually expires
 - The object is refreshed after expiration

The cache expiration timeout is updated on each access - *what this means is that each time we visit an object that exists in the cache it's timeout clock is reset giving it N more minutes*.


 1. This test case ensures that each time the cache is access the expiration time is extended by the sliding timeout amount. I will use a 5 minute sliding policy in my example.
 1. Place an object in the cache (the cache timer starts now)
 1. <strong>Update the object (this may involve changing a web-page or updating a record in the database, whatever you do, do not access the object such that it will be cached or update it's cache.)</strong>
 1. Wait four minutes.
 1. Access the object. You should get the cached version and not the updated version
 1. Wait four minutes
 1. Access the object. You should get the cached version and not the updated version


The cache expiration timeout once updated eventually expires - *this test is exploring the scenario where, once an object has had it's timeout clock reset; that it will eventually expire. It also tests for a bug specific to the sliding expiration policy.*


 1. This case is similar to above except that it ensure that the cache will expire eventually and at the correct time. The timing has to be correct on this test case to detect sly little cache timing bugs.
 1. Place an object in the cache (the cache timer starts now)
 1. <strong>Update the object (this may involve changing a web-page or updating a record in the database, whatever you do, do not access the object such that it will be cached or update it's cache.)</strong>
 1. Wait 4 minutes.
 1. Access the object. You should get the cached version and not the updated version
 1. <strong>Wait 5 minutes but not 6 minutes.</strong>
 1. Access the object. You should get the cached version and not the updated version.


The reason that step six should not wait 6 minutes is because step three accessed the cache at 4 minutes and not 5. This should add 5 minutes to the expiration time making it 9 minutes to expiry (from the start) and not 10 minutes. <strong>It is a bug to add 5 minutes to the total expiration time rather than updating the cache entry time. </strong>This is<strong> </strong>an implementation detail but important for us to test functionally.





The object is refreshed after expiration - *this is the same as the absolute expiration policy test.*


 1. For my example I'll use five minutes relative from creation as the cache expiration time
 1. Place an object in the cache (the cache timer starts now)
 1. <strong>Update the object (this may involve changing a web-page or updating a record in the database, whatever you do, do not access the object such that it will be cached or update it's cache.)</strong>
 1. Wait five minutes.
 1. Access the object. You should get the updated version and not the cached version

I've taken to bolding the update step. It was pointed out to me that as this is the most important step in the whole process and should be made mention to.

Apologies if the formatting is a bit borked. I will update my css to give the paragraph node a top margin.