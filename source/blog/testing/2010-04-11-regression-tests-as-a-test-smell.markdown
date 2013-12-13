---
title: Regression Tests as a Test Smell
date: 2010-04-11 23:55:39
tags: distributedlife, impact-analysis, regression-testing, ryan-boucher, rybo, software-testing, testing, 
---
Regression checks are a feedback mechanism designed to detect functionality regressions. They are implemented as a subset of tests that have already been run during the project. The types of tests selected as regression checks are usually tests that cover important functionality or are likely to fail.
<h3>When are regression tests run?</h3>
In many places I have worked regression checks are run after the project work has been completed in each separate project environment and all work is merged into an integrated environment. In this setup the testers are trying to determine whether the other projects have caused any issues.

Another place I worked they would run regression checks each time a new build was delivered to their project environment. This was because each build contained substantial changes and they had many tests. Running them all would take more time than they had. They would run checks that were likely to break after each build.

I’ve also seen an entire test team down tools and execute regression checks for 2-3 days. Projects had to factor this time into their schedule every release. With ten releases a year it was 20-30 days of regression testing. Between 8% and 12% of testing time was dedicated to regression testing. <a href="http://distributedlife.com/blog/2010/03/if-you%E2%80%99re-not-testing-you%E2%80%99re-not-testing.html">At least they were testing</a>.
<h3>What does this really mean though?</h3>
I think the fundamental problem with regression testing is that in these cases we are doing it to cover up our own lack of understanding about the business, change or technology. The behaviour I am seeing is if we don’t know how one system impacts on another, we run some regression tests to find out.

Regression checks are just a selection of tests so the reality of it is that we are doing a risk based analysis approach to impact analysis. With any risk based approach you are relying on the person who identified the tests to run to have gauged the risk without knowing what the change is. This is dangerous because while the most frequently used workflows or functional components will be identified for regressions but edge cases and unusual integration points won’t.

This is fine if you have a good understanding of the impact of the change. If this is the case then the regression check becomes no different to unit tests, a quick way of determining if our change has an impact.

However if we have a good understanding of the impact then we will be executing tests against the areas of concern and regression checks won’t be required in any real volume.

So if you understand the change you don’t need many regression checks and if you don’t understand the impact of the change then you shouldn’t use regression checks for impact analysis.

Now some may argue that existing legacy systems are a pain to test. They have had many changes, some without any real testing, they frequently have little to no documentation and the business domain knowledge has either left the building Elvis style or is split amongst the thousands of users and is not within the testing team.

Too bad; I think the amount of time spent running the same checks against a system every release is wasted when that time could have been spent doing impact analysis. Talk with the development team to find out what changed and why. Then targeted testing can be done.

We should be asking the question “why are we regression testing?” If the answer is because you don’t understand the impact of the change, then find out.
<h3>What about automation checks?</h3>
Automation checks are targeted tests; you run them against a system when it changes. The speed at which they can be run allows you to run all of them rather than just the relevant ones. This does mean you are doing some regression testing; however you are not spending any effort or energy doing this so it doesn’t really matter.
<h3>What about the technological impact on regression?</h3>
A technological impact on regression is a regression that occurs because how the solution was implemented has impacted otherwise working functionality. For example; changing a module that is used by ten different areas of a system could impact them all.

This comes down to impact analysis. If you change a common module you should look at the significance of the change and then test all impacted areas accordingly. They may only require a cursory glance but your impact analysis should tell you what to test and how much.