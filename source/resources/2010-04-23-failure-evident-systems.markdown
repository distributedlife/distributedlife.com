---
layout: resource
title: Failure Evident Systems
date: 2010-04-23 23:55:35
tags: testing
---
Last weekend I went to a [4WD course](http://www.getabout.com.au/). It’s part of our preparation for the 3 month drive across the top of Australia starting July 1st. There was a stage where we were practising recovering a vehicle using [snatch straps](http://en.wikipedia.org/wiki/Snatch_strap) and the instructor was showing a recovery point that was failure evident. What happened was that if the piece was going to fail or show signs of failure it would be obvious. This was implemented as a hook that would straighten as it failed. This would happen well before the breaking capacity of the hook.

This got me thinking about my post about whether some [software systems were too big to fail](/resources/software-that-is-too-big-to-fail.html).

Should these systems that are too big to fail contain features that make them failure evident?

Should testers be obliged to defect a system that isn’t failure evident if the impact of failure is great?

My first thought is that medical or defences systems would need these features but I’ve never tested either types of system. Perhaps software testers from these domains could comment?

I don’t think that failure evident systems are exclusive to medical or defence systems because as the world becomes increasingly integrated the impact of system failure, whether total or a degradation of quality, has the potential to impact many people. I’m not considering impacts that are just an annoying error message or a lack of functionality. I’m more interested in impacts that cost lives either directly; car software failing, or indirectly; the societal impact on families due to job losses caused by payment system failure.

The world is one big integrated system where each and every organic component shouldn’t fail.

There is no failover for humans.

So do testers have an ethical responsibility to defect systems that are not failure evident and **can** cause negative impacts on society? What are their responsibilities should their defect be ignored. The tester provides information to stakeholders and it is the stakeholder that makes the decision. Does that stakeholder have the authority to approve the deployment of a system that **could** negatively impact society? Should the tester go further and alert authorities? Who are the authorities and would they care?

I don’t have the answers.

What I do have though is a set of road-maps to software testing disciplines. I have updated these to add additional responsibilities for testers:

 - **Business Domain Knowledge tester** – Identify systems that due their impacts on society or life require failure evident capabilities but do not feature them.
 - **Infrastructure & Integration Tester** – Verify organisational system operations can monitor system behaviour and can respond accordingly to system failure
 - **Performance tester** – test the system failure evident capabilities using performance testing techniques