---
layout: resource
title: Quality Assured
date: 2010-02-15 20:32:30
tags: user interaction
---
One of the problems I see facing testers is their own lack of knowledge about what can and needs to be tested. The second problem is that not enough people in power include testers in the entire development process.

Many of you are probably aware of the issues surrounding Google Buzz and the publication of private information. One of the ones that caught my attention, second hand I might add as the original post is now private. Here is the article that I read. <a href="http://www.guardian.co.uk/technology/blog/2010/feb/12/google-buzz-stalker-privacy-problems">Click here for article.</a>

Based on the article it would be easy and foolish to say that Buzz and the rollout of Buzz weren’t tested properly. I would say that there is a lot of testing going on here and my guess is that almost none of it is defective or underdone.

As I did with the “<a href="http://distributedlife.com/blog/2010/01/the-great-australian-internet-blackout.html">Great Australian Internet Blackout</a>” I am going to talk about testing and how that relates to the issue at hand rather than the actual issue at hand.

Firstly let’s get to the obvious testing that was probably done on Buzz. There are some basic concepts of information security; Confidentiality, Integrity, Authentication, Authorisation, Availability and Non-Repudiation. <a href="http://en.wikipedia.org/wiki/Information_security">Here is a Wikipedia article about Information Security.</a>

When it comes to testing I call these testing aspects and add a seventh called Penetration testing.
<ul>
	<li>Confidentiality – testing to ensure the correct disclosure of information</li>
	<li>Integrity – testing that ensures that a receiver of a message can determine whether or not the message has been altered since initial transmission.</li>
	<li>Authentication – testing to ensure that sender and receiver are who they say they are.</li>
	<li>Authorisation – ensuring that only authorised parties can request a message</li>
	<li>Availability – testing to ensure the system supports its uptime requirements (must be available 23 hours a day, etc) and the staleness of data. An example of stale data is that when a piece of information gets changed there will be a requirement that all copies of that data are updated within a time frame (maybe 24 hours)</li>
	<li>Non-Repudiation – testing to ensure that an action undertaken by an authorised party is recorded such that they cannot deny the action took place. This is commonly implemented to as auditing.</li>
	<li>Penetration – A penetration test is a method of evaluating the security of a computer system or network by simulating an attack from a malicious source ((http://en.wikipedia.org/wiki/Penetration_test))</li>
</ul>
You may already be looking at the confidentiality tests and thinking that Google didn’t test that. It’s not that simple because what is correct disclosure?

When they (Google People) were designing Buzz they probably had some meaningful and great requirements, user stories, use cases or feature lists. These probably specified the automatic following of most frequent contacts, sharing of information between contacts, etc, etc. The underlying concept is that my most frequent contacts are my friends or family.

If I had a Gmail account then that is how my contact would look; friends and family. As you’ve seen from the aforementioned article (link again); that is not always the case.

This leads me back to the confidentiality; there was probably tests run to ensure that people who are not on your follow list cannot see your confidential data. There were also probably tests run that ensure that the follow list was created correctly, etc, etc.  These were all based on the requirements and no doubt all these tests passed.

It is my belief that this problem was caused by not engaging testers early on in the process. A good tester involved in the process has the job of questioning everything and coming up with scenarios well before testing that will highlight potential concerns.

Consider this:

A social network relationship is one that is formed between two people. These relationships can be one way or bi-directional. The direction relates to the flow of information.

Example: In twitter I may follow you; this is a by default a one way relationship whilst in Facebook we are friends and that is a bi-directional relationship.

Can you see the problem with the above statement?

The problem is that assuming that the relationship involves people. In terms of the business language in the problem domain you have people in the relationship but in the implementation; what do you really have?

In the sense of Buzz the relationship is actually just a Gmail email address. And an email address is something that is very easy to create.

How is any of this a problem?

Consider a piece of functionality that features often in social network tools; the ability to block a person who you do not want to give access to your information. This leads off the use case: “how do I stop someone following me and seeing my information?” ((If you want a user story “as a user I want to be able to block people from following me”)) ((Or a requirement “A user must be able to block another user from following them.”)) The answer is to “block” them.

What does it really mean though? If a person is just an email address and email address are easy to create how does the ability to block an email address going to solve the problem. If one gets blocked you create another, if you hadn’t already.

This is an example of logically correct rules that are implemented and tested without issue but fail because whilst it is a solution it isn’t a good solution in terms of the user experience.

How does all this relate to a problem facing testers? In my experience there are not enough testers out there that can adequately test the aspects of security and I don’t just mean penetration testers; as there are even fewer of them. I’m not qualified to do penetration testing and I’m the most experienced in the topic amongst the testers where I currently work.

Secondly there are not enough testers that when they are involved early in the project do they sufficiently analyse the system and raise the necessary concerns. Most of them focus on whether the requirements are testable; a worthy goal but nothing in comparison to focussing on whether the requirements are correct.

Finally in my experience the other area that I see testers have the least amount of experience and knowledge is the user experience. Interestingly enough that was the other talked about flaw in the Buzz release (<a href="http://www.scripting.com/stories/2010/02/14/googleDidSomethingSeriousl.html">see this article by Dave Winer</a>); automatically signing everyone up. Ironically it was probably done to make the system easier to use; reducing friction and the barriers to participation, etc.

Testing isn't just about proving the requirements have been implemented correctly. If you're just doing that then you need to skill up or get out of the game. It's about challenging assumptions and asking the question why. If we don't do that then we are nothing more than checkbox in the development life cycle. Quality has been assured. Then again the people who think we are just about assuring quality, including testers, have probably never asked the question; whose quality?