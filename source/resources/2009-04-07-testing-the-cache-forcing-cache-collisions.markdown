---
layout: resource
title: Testing the Cache - Forcing Cache Collisions
date: 2009-04-07 23:55:39
tags: cache testing
---
Something that is a lot harder to do and requires some serious thinking is trying to force cache collisions. You will need to know how the cache keys are constructed for this. If you can get a cache key collision then the wrong object will be returned and all sort of fun will be had.

Ask the developers how the cache key is constructed. In the meantime I'll contrive a scenario so you can see what I am talking about. In most cases you will not be able to force a key collision but it is something to think about.

In our contrived scenario the key is formed using the following:

[user-id][url]

**An example:** 

 - user-id = distributedlife
 - url = http://www.distributedlife.com/blog


If we concatenate them into a string we get: distributedlifehttp://www.distributedlife.com/blog

**A cache collision would be:** 

 - user-id = distributedlifehttp://
 - url = www.distributedlife.com/blog

If we concatenate them into a string we get: distributedlifehttp://www.distributedlife.com/blog

I know, I know, a totally contrived scenario but the **point of this is to get you to think about what you are testing** and how to break it.