---
layout: resource
title: Testing the Cache - Multiple Caches 
date: 2009-04-03 23:55:14
tags: cache testing
---
In systems where there is more than one system you may find that each system has its own cache. This can make testing caches a little bit more complicated.

In one system I tested; our system had a cache with a configurable timeout and the external system we interfaced with had a cache of 15 minutes.This was not optional. The external system was where sourced our data from. As I've mentioned before, **to** **test a cache one needs to change the source data so that you can determine if the cache version or the original version is being returned**. The existence of a second cache makes this harder.

For us to test our cache we had to change our cache timeout from 6 minutes to 17 so that when we made our second request at 16 minutes we could tell if we were hitting our cached version and not their cached version and not the original record. If we waited till 18 minutes we would have gotten a new record.

If we only waited 15 minutes and our cache had expired or less we would have picked up the external system cache object, which being identical to ours would have told us nothing.

**The numbers aren’t important, just the sequencing.** If you have two or more caches you will need to think about the impact the secondary caches have on your testing.