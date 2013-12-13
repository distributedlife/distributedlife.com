---
layout: resource
title: Testing the Cache
date: 2009-02-17 23:11:56
tags: cache testing
---
It turns out that not everyone in the world knows how to test a cache. I plan on changing that for at least three people, by blogging about it. I’ll publish them in short posts, one for each type of cache expiration policy. It means if I forget a cache expiration policy I can just write another post.

I'm going to leverage [Rory's post on Cache Expiration Policies](http://www.neovolve.com/page/Cache-Expiration-Policies.aspx) and will talk about each policy he has defined and how to test it. I will be trying to keep the test scripts generic and no tied to any technology or platform so you will need to relate the steps back to your system under test. Don't worry, once you see them you will realise that testing a cache isn't complicated.

The four polices are (and the descriptive text is all from Rory’s post):

> **Absolute expiration** - *Absolute expiration refers to a specific point in time when the cache entry will expire. Once that point in time has elapsed, the cache entry is expired and can be removed from the cache*.

> **Sliding expiration** - *Sliding expiration refers to a span of time in which the cache entry must be retrieved from the cache in order to prevent expiration. *

> **Cache dependency** - *Cache dependencies are references to other information about the cache entry. The dependency might be on a file or database record. When the dependency has changed, the cache entry is expired. The most common scenario of cache dependencies is a dependency on a file path for data loaded from that file. *

> **Cache priority** - *Cache priority indicates the importance of the data relative to other cache entries. This is used to determine which items to expire in the cache first when system resources become scarce*.


Before you begin any cache testing you need to know the following bits of information.

**Cache Parameters**

How is your cache configured? Is the absolute expiration a point in the future or relative from creation; how long is the sliding cache window. What priorities can be set? You need to know these values because they impact how long each test will take.

**Cache Keys**

What defines the key to the object in the cache? Without the correct key you can't get the cached object, you will get a new one. Some systems include the user-id in the cache key this effectively gives each user their own cache.

**How to put an object in the cache**

For example, a web-server may cache the page upon access. So the first visit to the page puts it in the cache and each subsequent visit will use the cached version (assuming the page has not expired). You need to know what triggers a cache hit. This will be core to your testing.

**A stop-watch**

You will need to measure how long it has been since the last cache access was. A stop-watch is useful. You are not going to get absolute precision with your testing without a proper synchronisation tool and in such a case it is easier for the developer to write such scenarios in their unit tests.

For our level of testing a stop watch is often sufficient. Wrist watches are ok as long as you remember what time you start. It is frustrating to redo a ten minute because you forgot what time the test started.



I’ll give you time to go and get those items and tomorrow, the *Absolute Expiration policy!*

