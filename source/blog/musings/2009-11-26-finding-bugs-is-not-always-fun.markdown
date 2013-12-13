---
title: Finding bugs is not always fun
date: 2009-11-26 23:55:00
tags: 108-digital, bug, cabs, canberra, distributedlife, online-booking-system, ryan-boucher, rybo, taxi, testing, testing, usability, 
---

Let me pose a hypothetical; you are developing a system that allows people to book events in the future. Based on this information and this information alone what tests would you execute before delivering the system to production.

 - The user is able to book an event in the future
 - The user is not allowed to booking an event in the past

That is about it.

Let me tell a short tragedy; I’m without a car at the moment, I sold mine when the lease expired and have been deliberating what to get, and I was working late the other night. When I work late I order a cab for somewhere between two and four in the morning to get home.

So that night I booked a cab as I usually do and specified to be picked up "today" at 2AM. Some of you already know what has happened. That cab never arrived. I had order the taxi at 11PM and therefore "today" at 2AM is 21 hours ago. I waited 35 minutes before realising what had happened and calling them up. They had no job on their system.

To me "today", in the context, is until I go to sleep or the sun rises, whichever comes first. The definition of today is loose as it more than just a midnight to midnight meaning. For example: "the world of today" does not mean the state of the world on the 26/11/2009.

You could argue that I should use their vocabulary as I’m using their site but this blog post is about testing and usability. If you are going to use a word like "today" then you have understand the culture of your target audience and what that means. Now I’m sure the web developers understand this. They just didn’t test it. I mean there are two basic use cases and one of them epic failed.

They did have a go though; you can’t pick a **date** that was in the past as shown here:

![No prior dates](/images/cabstoday.png)

But that isn’t good enough in my opinion. In the worst case scenario the web server at the other end should be validating input and rejecting dates in the past. I suspect that you could send anything to that server it would accept it. Building on from this what is interesting is whether or not the jobs sent in the past getting written into the logs as "unattended pick-ups" or something similar. You could then flood the system with old dates poisoning their reports on the number of pickups within a certain period.

It could just be that the server drops any request that was in the past; a safer policy, but one that is scoring close to zero in the usability stakes. Consumers whether they are users or other applications need to know why something doesn’t work or isn’t allowed.

For those that want to know the correct implementation is to limit the hour and minute selection controls to times that are valid and in the future. Then on the server validate input and respond to the client when a pickup time that is in the past is supplied.

The bottom line in all of this is that the application has four pages, about ten options and other existing usability issues. The drop down lists down even support using the keyboard to jump to the first letter. All in all it is a very simple web application really that still had a serious bug in it that impacted clients. Clients who as of next week, when my new car arrives, will happily never have to catch a cab again.



Naturally I’ve notified [Canberra Cabs](http://www.canberracabs.com.au/) and their [web developer](http://www.108.net.au/). If I’m going to rant and rave about the lack of quality in simple systems I’ll have the decency to let them know.

Anyway just so you know I’m not making this up here is my email. Delivered to my inbox at 11:06PM and made for 2AM earlier that day. I had to hide some details because my employer prefers that and I prefer that you didn't know where I live.

![Notification email](/images/canberracabscom.jpg)

**Testing just has to be done no matter how simple that application is.**