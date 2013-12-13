---
layout: resource
title: Testing the Cache - Shared vs. User Level Caching
date: 2009-04-04 23:55:33
tags: cache testing
---
Another thing to consider when testing caches is how granular is the cache. Is it on a per-user basis or is it shared caching across all users. The latter has security considerations that I will get to in a subsequent post.

If the cache is on a per-user basis then it is likely the username is used in the key to distinguish between one user’s cached object and another's.

When testing with multiple user caches you need to ensure the following:

 - When User A puts an object in the cache, User B does not get the cached object
 - When User A puts an object in the cache they get their object on subsequent requests
 - When User A puts an object in the cache, User B's access to its object does not alter any expiration policies.

When testing with a shared cache you need to ensure the following:

 - When User A puts an object in the cache User B gets the cached object
 - Either user can get the latest object when the cached object expires
 - When User B accesses an object placed in the cache by User A, the sliding expiration policy is extended