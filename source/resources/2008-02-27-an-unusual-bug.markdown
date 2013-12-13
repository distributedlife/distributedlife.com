---
layout: resource
title: An unusual bug
date: 2008-02-27 12:28:00
updated: 2013-11
tags: defects
---
I gave a deploy of a test application to a friend the other day to test.  Whenever he ran the application it would shutdown (not crash) almost  immediately. The logs reported no issues and the very same deploy works on every  other computer I tried and as a matter of fact this runtime code works on just  about every platform I have tried to date. Just not his.

I created a debug build, turned on every scrap of instrumentation I have and  sent it back to my friend. Nothing in the instrumentation logs. No exceptions,  no errors being thrown. Standard execution paths, it shuts down early and gracefully.

I went around to my friends place and checked out the code base, installed  visual studio and built the lot from scratch on his machine. Still no luck, so I  traced through every step the program makes before it shuts down and found the  "problem" or more accurately the cause.

The application is receiving a WM_QUIT message before it should. It handles  it appropriately and performs the standard shutdown. Now the user did not close  the application and no exceptions were thrown so I am at a bit of a loss why  the message was added to my application pump.

The only thing I can think of is a personal firewall application has its  heart set on blocking my application. So I checked that and there was a few  installed. So I uninstalled them and killed any dormant processes that were left  lying around (don't get me started on how offensively intrusive virus scanners  and software firewalls are, the only reason they work is because there are no  system resources left for the user to use their system let alone install a virus).

Back to my story, fresh reboot and no processes running on the OS that I  didn't want (the OS happens to be Windows Home SP2). No windows firewall, no  random process, just a bare-bones execution. Ran my test application (in debug  mode again) and the same problem occurred. Now I really don't know why the quit  message is being sent.

So far the interwub has borne no answers on this problem, the code is lightweight, vanilla  win32 and the only major difference I can think of on this box is that it is  running XP Home rather than XP Pro. I have an XP Home CD around here somewhere  that came with my laptop. While I do remember testing this code on XP Home  previously, it has been a while.

If it also fails on my XP Home install then that is the problem (no solution though). If it  doesn't then I suspect I'll be slowly deconstructing the application until the  solution reveals itself. As painful as all this will be, it's a boon in some  regards (not enough to make it fun though). There is a problem somewhere and I  am just glad it came up in test rather than in prod.