---
title: Pre-Integration Environments
date: 2010-02-18 20:58:07
tags: distributedlife, environments, function-test, integration, ryan-boucher, rybo, system-test, testing, testing, uncategorized, 
---
One the terms I like the least and dislike the most is functional test environment, this is closely followed by the system test environment. The reason being is that people fall into thinking that in the former only functional testing is done; and in the latter only system testing is done.

This is wrong.

I can name ten types of testing the will occur in a functional test environment.
<ol>
	<li>Service Testing</li>
	<li>Usability testing</li>
	<li>User acceptance testing</li>
	<li>Exception Reporting testing</li>
	<li>Deployment testing</li>
	<li>Security testing</li>
	<li>Data Integrity testing</li>
	<li>Non-repudiation testing</li>
	<li>Compliance testing</li>
	<li>Functional testing</li>
</ol>
I can name one thing that occurs in the system test environment
<ol>
	<li>Integration testing</li>
</ol>
The reason is that we no longer build systems that are not integrated. Therefore we would need to be in system test from day one. Back in the day (for people who still work in these places; today) we used to have batch systems((that was actually only just over three years ago for me)). It was quite possible to isolate each batch system and test it. In the system test environment the full chain would be pieced together.

Today if you have a UI that interacts with a dozen services you can isolate those services but you can’t isolate the UI without a lot of work and it would be foolish to leave the UI testing till the system test environment.

Therefore our functional test environment is really a project test environment. You have all the components you need for your project and you test them together. They are integrated as each component is built. They are not however integrated with any other project or change that is going on at the same time.

The term project test environment is where the bulk of the testing work is done but the term ‘project test environment’ is unwieldy and not technically true if the change you are working on is a patch that is not a project per se.

I like the term <strong>pre-integration</strong>. You test in pre-integration and when have completed your work then you move into the <strong>integration </strong>environment. The next step is pre-production and then finally production. It flows because pre-production and production are existing and appropriately named environments.

If you’re still using the term QA as you pre-production environment then you need to move into the future. <strong>Quality Assurance occurs at every step of the process</strong>. Not just the last ten minutes before production.

So in conclusion you have the following setup:
<ul>
	<li>Development – thar be developers!</li>
	<li>Pre-integration – most of the testing goes on here</li>
	<li>Integration – your changes are integrated with all other changes in the release candidate</li>
	<li>Pre-Production – meant to be a final check before production; this environment is where hardware issues will become evident.</li>
	<li>Production – thar be very little defects!</li>
</ul>
You can also have the following environments
<ul>
	<li>Performance Test – for stress, load, reliability and performance testing (sits above dev and below pre-production based on need).</li>
	<li>Development Integration – for multi-organisational testing; you need this environment to promote to after dev that allows other organisations to integrate with for their development work.</li>
</ul>
It is not a big thing but if I here another person, tester or otherwise talk about the function testing environment as though only function testing goes on there, I may just snap.