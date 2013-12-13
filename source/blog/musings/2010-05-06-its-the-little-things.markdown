---
title: It's the little things...
date: 2010-05-06 23:55:42
tags: cakephp, defect-dependencies, development, distributedlife, integration, ryan-boucher, rybo, 
---
That is what they say; it's the little things in life that make life worth living or something.

Obviously they have never had to debug code before.

I just raised a <a href="http://cakephp.lighthouseapp.com/projects/42648-cakephp-1x/tickets/673-configuration-sessioncookie-with-fullstop-causes-auth-component-to-forget-successful-authentication-attempt">bug with cakephp</a> that has had me confused for about a month now but it wasn't a blocker. It became one and after almost two days of debugging and fishing for red herrings I finally uncovered the cause of my grief.

It turns out that it was a full-stop.

Let me explain the problem. The user would be successfully validated and then redirected to their home page. But would be logged out by the time they got there.

It turns out that when the session.cookie variable has a full-stop in it doesn't retain the session information. The authentication part still works so as I was debugging it I was seeing code that works great. On the next request it was pretending like there was no session information. Tracing it back to the session.cookie configuration option took a while.

This isn't a post about cakephp having bugs; most software has bugs and cakephp is generally good to work with.

This is about implicit dependencies in integration problems. The cakephp people may come back and say that this isn't an issue and I should stop putting full-stops in my session cookie names... <a href="http://cakephp.lighthouseapp.com/projects/42648-cakephp-1x/tickets/673-configuration-sessioncookie-with-fullstop-causes-auth-component-to-forget-successful-authentication-attempt#ticket-673-3">oh wait I haven't even finished this article and they already have.</a>

Let me tell another story; I was asked to test a service that was responsible for auditing. Other services would call this service to audit. I said there was not enough time to test it before the release <strong>and</strong> I was going on six weeks leave. They had business approval to go without auditing so that was the safe option.

I come back 6 weeks later and find auditing had gone to production without being tested.

Apparently without issue.

The first test I run finds that the consuming services are putting null in the source column so all audit records are being written and you can't tell where they came from. Not a big issue as we only have 40 services. End sarcasm.

I raised the issue with the auditing service developer and he responded. "This isn't a bug, it is the responsibility of a service to populate the source property".

He is correct in one regard. But he is also wrong in another.

His service shouldn't let the consuming services fail. They depend on the auditing service to let them know when they get it wrong.

A null source value is an invalid record as per the business and the auditing service should not allow invalid audit records to exist. Therefore bug.

A session cookie name with a fullstop is invalid as per cakephp code components and cakephp should not allow invalid session cookie names. Therefore to maintain the integrity of the system cakephp should ensure that it's dependencies are correct.