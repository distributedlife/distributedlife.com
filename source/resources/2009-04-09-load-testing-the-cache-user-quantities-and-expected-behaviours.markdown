---
layout: resource
title: Load Testing the Cache - User Quantities and Expected Behaviours
date: 2009-04-09 23:55:41
tags: cache testing
---
Especially relevant for User Level caching is how many users can be supported; each with their own cache. A good place to start here is to determine what the standard or expected usage patterns are. Then multiply that usage quantity against each user to see how well the system handles the expected numbers of users performing expected behaviour.

Beyond this you want to see how unexpected behaviour is handled, each user viewing many more objects than anticipated. You also want to see what happens when many more users use the system, both with expected and unexpected behaviour. Keep pushing the system until it *[can’t stands no more](http://en.wikipedia.org/wiki/Popeye)*. This is stress testing now but very important. The business likes to know how far we can expand before we run into trouble.

If you use Shared Caching then you should have a look at what objects are going to be updated within some regularity but at the same time be of interest to many users. Then depending on the caching policy ([sliding expiration](/resources/testing-the-cache-sliding-expiration-policy.html) being particularity bad here) you want to see if standard or expected usage patterns will causes objects in the cache to live so long that they no longer resemble the source object.

When shared caching you should still observe memory usage but in comparison to User Level caching it is less likely to be an issue.