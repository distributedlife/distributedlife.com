---
layout: resource
title: What a flaky build looks like
date: 2008-11-08 01:51:20
updated: 2013-11
tags: defects
---
Have you ever been coding away, running tests, coding some more, running more tests and then having a large swathe of your tests fail. I did a few hours ago. I looked at it and thought to myself, nah, that can’t be right.

So I ran it again.

Many fails, not the same either. Most of the problems seem to be establishing the system under test and that impacts the eventual results.

Rollback.

Fail.

What? These tests worked last night.

Run again.

Fail.

Fail.

Fail.

Ok, what is normally the cause of this? Caching! Let’s go and have a look at that. The caching code appears to be working as normal.

What if I comment out all of my tests except one?

That one fails 50% of the time. The same problem again. Failing when trying to establish the system under test. Look at the incredibly simple code and wonder how it could possible result in the scenario that being reported.

 1. I empty the database
 1. I manually create two rows with two unique identifiers
 1. I get an error saying that the database already has that row... ?

Ok, halt execution after the first record creation. Everything is OK. Inputs for second row are correct. Still gets an error.

Hit refresh 50 times (these are web based tests here) in the dire hope I can exorcise the system.

Try it in Internet Explorer.

It works perfectly. No errors, no database issues, 100% passes as I have been getting for the past few weeks.

Go to a second machine and launch Firefox.

It works perfectly. No errors, no database issues, 100% passes as I have been getting for the past few weeks.

What is going on?

Back to dev box. Kill Firefox. Start again.

It works perfectly. No errors, no database issues, 100% passes as I have been getting for the past few weeks.

I hate computers.

What was the problem? I don’t know.

Will this affect the operation of my application in production? I don’t know.

Does this bother me? Yes.