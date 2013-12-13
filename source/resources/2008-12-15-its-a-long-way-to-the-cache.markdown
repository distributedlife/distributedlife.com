---
layout: resource
title: It's a long way to the cache...
date: 2008-12-15 23:55:29
tags: cache testing
---
I had fun last night. I didn't manage to waste too much time on this problem but I wasted more than none which is enough. CakePHP has a *feature* where it maintains a cached list of database tables it is aware of.

So I created a new table and the requisite model, controller, view files and was ready to test it when CakePHP claimed my database table didn't exist. It did and I spent plenty of time checking database connection strings and removing all but the simplest of code. I eventually found [this blog post by Eric Simmerman](http://www.jroller.com/agileanswers/entry/missing_database_table_in_cake).

Delete the cache database table list and it all works fine. A simple fix and part of the reason for this post is to get Eric's post closer to number one on a Google search. It wasn't when I searched.

The answer I want to know is at what point did a cache become the final word? Caches are about performance enhancement and nothing else. You cache data so that you don't have to go as far to get the answer. Distance is time is performance in computers. If you miss the cache then you go to your level two cache or you go to the persistent storage and get the data. The bottom line is that you keep going till you get an answer.

At no point in a cache do you ever say: "Well I don't have it so you can bloody well sod off. No, I'm not going to ask around. I can't see it, my eyes are closed and my fingers are in my ears. LA LA LA LA."