---
title: Click here to ignore this message in future...
date: 2010-04-18 23:55:14
tags: automation, distributedlife, identity, one-off-message, ryan-boucher, rybo, testing, 
---
There are plenty of programs that have one off messages; some of them relate to contextual help; others are licences or splash screens. They get in the way of robust UI automation tests. If you don’t approach the problem properly you may find your scripts are handling the existence of the one off message. This is a dependency that your tests don’t need.

How I approach it depends on whether you have access to the data store and whether the one off message is <a href="http://distributedlife.com/blog/2009/10/identity-specific-and-anonymous-data.html">identity specific data</a>.
<h3>Message is identity specific; tester does not have access to the data store</h3>
If you have the option of hiding the message then your testing here will be easier. You can create two users: one that never hides/closes the message and one that always does. You can then write your tests from each user’s perspective and the tests can start making assumptions about whether the message will exist.

If you can’t hide the message then life will be harder. You can have one user who has already been everywhere and therefore will not get the message. For the automation tests that validate the message itself you may need to dynamically create a new user at the start of the test. This is hard work and may not be possible depending on your application.

You may have to write this down as a sapient test to be executed.
<h3>Message is Identity specific; tester has access to the data store</h3>
This is an easy scenario. You only need one user. Before the test you manipulate the data store so that system believes the user is new or has been here before.

Always make sure you encapsulate your manipulation code into a fixture otherwise you may find your tests breaking under indirect change. <a href="http://distributedlife.com/blog/2010/03/an-approach-to-software-testing-automation.html">Read this article for more information on structuring automation tests for robustness</a>.

If data setup takes too long then you may want to prepare your data as per <a href="http://distributedlife.com/blog/2009/10/identity-specific-and-anonymous-data.html">this article</a>.
<h3>Message is anonymous; tester does not have access to the data store</h3>
This message shows up once and only once for whichever user gets here first and to make things worse you don’t have access to the data store to control it.

If you <strong>must </strong>automate this you will have your work cut out for you.

If the message is to only show up once per install then you will need to deploy the application at the start of the test. Then execute the test before uninstalling the application in readiness for the next test.

If the message shows up once per access then you don’t need to do the application deployment step. However messages that show up once per access generally are annoying and will probably fail a <a href="http://distributedlife.com/blog/2010/04/futures-in-software-testing-the-user-interaction-tester.html">user interaction test</a>.

There was this one application I tested where after clicking the “create” button a little dialogue popup asking “are you sure you want to create a record?”

Good times they were.

I recommend this one being left as a sapient test.
<h3>Message is anonymous; tester has access to the data store</h3>
If you have access to the data store then like identity specific data you can manipulate the data store to display the message as needed.

As I mentioned before make sure you encapsulate your fixture correctly to make the script as robust as possible.
<h3>Return on Investment</h3>
Considering all of the above you need to consider whether or not it is worth automating these scenarios. It may be better value to automate one path (no messages) and then sapient test the rest. When you work out what approach you are going to take, always factor in whether this automation attempt will be valuable to the organisation.

In some instance automation doesn’t provide value; that’s fine with me.