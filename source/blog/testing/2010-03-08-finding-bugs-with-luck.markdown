---
title: finding bugs with luck
date: 2010-03-08 23:55:16
tags: distributedlife, feedback, google, ryan-boucher, rybo, testing, testing, user-testing, 
---
Throwing lots of users at a system does not adequately test it. Earlier this month I wrote about Google Buzz and how it would have passed testing without any issues being raised. I just found a link to the BBC article where ‘<a href="http://news.bbc.co.uk/2/hi/8517613.stm">Google admits Buzz social network testing flaws</a>’ . It’s about two weeks old now but it illustrates my point about the role testing plays in product development.
<blockquote>"We've been testing Buzz internally at Google for a while. Of course, getting feedback from 20,000 Googlers isn't quite the same as letting Gmail users play with Buzz in the wild."</blockquote>
Recently I’ve noticed a trend, and it goes with the whole crowd-sourcing thing, where through sheer weight of ‘tester’ numbers, all major bugs would be found. This isn’t a rigorous process, this is luck. 20,000 user’s using a system will give you information about the product but it is entirely based on the demographic of the users.

What is the demographic of a Google employee? I don’t know but a guess would be technically minded, open-minded, friends with other Google employees? <a href="http://blog.utest.com/testing-the-limits-with-patrick-copeland-part-iii/2010/02/">From this Q&amp;A with Patrick Copeland the Senior Engineering Director</a> he lists some advice on aspiring tech execs:
<blockquote>“Be technical: At Google all of our engineering execs have very strong technical backgrounds. They were programmers and many of them can – and do – still program today. Advice: remember your computer science and stay sharp.”</blockquote>
If your demographic isn’t varied enough you will end up having 20,000 of the same user testing the system.

In the rest of the BBC article, the author mentions the ‘Google Trusted Tester’ program:
<blockquote>Many of the firm's new services are tested by the so-called Google Trusted Tester program, a network of friends and family of Google employees who are given confidential access to products before they launch.

Buzz was not tested by this program.</blockquote>
There is a better way.

When I test a system I have a list of items that can impact the outcome of a test from including, user, invocation method, input data, state data and the environment. The first of these is the user. This is what needs to be thought about before the requirements are defined:

•	How does the user’s cultural background impact the user of the system?
<ul>
	<li>How does the user’s psychological state impact the user of the system?</li>
	<li>How does the user’s education impact the system?</li>
	<li>What is the user’s motivation and how does it impact the system?</li>
</ul>
I include more traditional testing impacts here as well:
<ul>
	<li>Mobility</li>
	<li>Accessibility</li>
	<li>Vision</li>
	<li>Geography</li>
</ul>
This is qualitative testing and this is where the bugs like the ones that plagued Buzz are found.

Throwing large numbers of users at a system will not find all the issues that a competent skilled tester will find. There is a chance that this mass of people will find no bugs. Asking users about a system is great way to get feedback; but don’t be fooled into thinking this is testing.

If I fill out a form about the service at my local restaurant am I testing or am I providing feedback? At Google you are testing the restaurant in the real world you a providing feedback to someone that may or may not care.

What irks me about the news post is that Google stated that they didn’t test it properly and the implication is that more users providing feedback will solve the issue. This isn’t a failure of testing; it’s a failure of management to think that user feedback replaces quality testing over the duration of the project.