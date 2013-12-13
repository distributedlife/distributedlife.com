---
layout: musing
title: Getting to the real issue
date: 2010-05-07 23:55:03
tags: integration
---
I was called into the discussion; the environment manager wanted to change when we integrate. He wanted all the changes to be integrated before we started testing. This would allow us the absolute maximum amount of time in integration. There had been complaints that we were not getting enough time in integration.

I knew we were not getting enough time in general but I didn't know that integration issues were being uncovered in production because of a lack of integration time. In his defence there had been a terribly short period of time for integration.

<a href="http://distributedlife.com/blog/2008/10/a-case-against-early-integration.html">You may already know my thoughts on early integration</a>. So I need a good reason to change to such an approach. We discussed it and the longer it went on the more I realised that he didn't actually want early integration any more than I did.

That is what he said but it wasn't what he wanted. He had been told about a problem and with that someone had suggested a solution; early integration.

The problem was that there was only 7 environments and 20 changes so some changes were queueing for a test environment.

Given that these environments were not used constantly all day long I suggested that he have a roster. You need to use an environment; grab a machine that is free. It only takes 10 minutes to deploy and you can have 4x two hour session everyday. Across 7 machines that is 28 slots per day. We could even reserve one machine for data creation and a stable build to refer back to.

When you're discussing a solution to a problem it is always worth making sure you're fixing the right problem.