---
layout: resource
title: Testing the Cache Priority Policy
date: 2009-03-31 23:55:03
tags: cache testing
---
You are at the mercy of environmental configurations. **As a tester you need to talk to the developer to find out when cached objects are collected.** It could be when system resources are low, or it could be when a specific memory limit is reached within the cache.The latter is easier to test because the amount should be adjustable via configuration.You also need to find out how the priorities are specified on the various objects that can be put in the cache.

You also need to find out if there are additional policies in place that will cause an object that is in the cache to be refreshed. If you only have a cache priority policy then your objects will be cached until they are kicked out by competition for resources. Such an event could take a long time or be tedious to setup in your testing environment. This also means that the longer an object stays in the cache the less chance it has of accurately representing the source object. This is assuming of course that the source object can or does change over time.

It is therefore likely that a cache priority policy will be implemented with another policy like [sliding expiration](/resources/testing-the-cache-sliding-expiration-policy.html), [dependency](/resources/testing-the-cache-cache-dependency.html) or [absolute expiration](/resources/testing-the-cache-absolute-expiration-policy.html). **I won’t talk about testing the cache priority policy with respect to any particular policy. You just need to be mindful of it when doing cache priority policy testing**.

Like the dependency policy, the priority policy is more easily and more thoroughly tested from the developer’s perspective with mocks, unit tests and integration tests. I will therefore provide a list of tests developers should be undertaking but with as little emphasis on implementation as possible.


**Objects are put in cache with correct priorities [developer integration test]**

What we want to ensure here is that when we put an object into the cache that it is has the correct priority.This will ensure that it gets collected at an appropriate time.

You can do this by writing a unit test for each type of object you put in the cache and verifying that after an object is placed in the cache that its priority is set appropriately. If you don’t have a way of seeing the cached objects priority from the cache interface you will have to write an accessor and do some white-box testing.

You should also check that when the object is refreshed from the source its priority remains constant.



**Lower priority objects are cleaned up first [developer unit test]**

A fairly simple test; make sure your cache is configured to only handle a few objects in the cache. Place in objects using a variety of priorities. For example's sake there are five mock-objects with priorities 1 through 5. Each object is the same size and the cache can hold four objects.

 1. Assuming that the fifth object going into the cache is not the lowest priority, the lowest priority object in the cache will be marked for disposal.
 1. Then change each of the source objects in the background (edit database record/file/url target). This will allow you to tell if your object is from the cache (the pre-updated object) or has been refreshed from the source (update has been applied). **This is very important.**
 1. Check each object. Only the lowest priority object should be updated, all other objects should be pre-updated versions.

*There is a special case with this test which I will discuss separately below*.



**Low priority object when placed into a full cache and all existing objects in the cache are of a higher priority the low priority object should never be cached.[developer integration test]**

This scenario is exactly the same as above except that the object being requested does not currently exist in the cache, has a priority that is lower that all other objects in the cache and the cache has run out of resources. In such an event **we would expect** our object not to be cached for future access.

 1. We make a request and a copy is placed in the cache. The cache should dispose of the object immediately.
 1. We should then update our record so we can tell a change has occurred
 1. Next we make the same request again; we should get the latest refreshed version.

If you think about it, step two is not actually helping us. With this test case we can't actually tell if the requested object was placed in the cache or not. We are just getting the desired net result, the refreshed object every time. In such an event I would recommend writing a white-box unit test that peeks inside the cache to find out what is really going on.



**Equal priority [developer unit test]**

The next step is to look at what happens when all the objects in the cache are the same priority.This sounds a lot like assigning priorities to emergency-fixes. They are all priority 1!This is one of the reasons why a second policy is combined with the cache priority policy; to break the deadlock.

The bottom line is making sure that the cache behaves correctly when the unimaginable occurs and every object is of the same cache priority.

Testing is simple:

 1. Set your cache limit to a small amount like 3
 1. Add mock-objects that all have the same cache priority
 1. **Update those objects so you can tell something has changed.**
 1. Add a new object, also of the same cache priority as the others.One of the existing objects will now be marked for deletion or has already been kicked out.
 1. You should have an expectation of which object is no longer cached (oldest, least recently used, etc) make a request to view that object and you should get the changed version.