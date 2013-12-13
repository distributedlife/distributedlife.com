---
layout: resource
title: Load Testing the Cache - Memory Usage Over Cache Access
date: 2009-04-08 23:55:49
tags: cache testing
---
The first point of call for giving the cache a good work out is to watch the memory usage of the system where the cache resides as the users make use of the system. The point is not to keep adding users to get to breaking point, we can do that later. What we want to do is make sure that when an object is being evicted from the cache that its memory is actually freed and not left lying around.

To do this you need to know when an object is removed from the cache. You may find that the developer thinks it more efficient to only remove expired objects when it is low on system resources or when that object is accessed.

If this is the former is the case then you can get right onto pushing the system up to the point where it must remove expired objects to survive. After that you can see if you can add objects faster than it can dispose of them.

If the latter is the case then get a big object, 50MB in size or similar and have it placed in the cache. Change the source object so that it is only 5KB in size.Access that object. We should be able to notice a drop in the amount of memory being held by the caching application.

If you are using .NET then you may not notice the change for a while as the Garbage Collector (GC) determines when memory gets freed. There are various performance counters you can use to watch the Gen0, Gen1 and Gen2 garbage collections.