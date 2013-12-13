---
layout: resource
title: Automated Data Integrity Testing
date: 2010-02-19 23:55:07
tags: test automation
---
Something I have been keen on lately is the concept of automated data integrity testing and I had a chance to roll my thoughts out into our service testing process with so far, great success.

The first step was to provide some means of identifying changes in the data store. For a database that supports triggers you are well on your way. I had a database developer build a script that took each table in the database and add a trigger to it. This trigger would write the following metadata into a history table whenever the source table was changed:
<ul>
	<li>Date time changed</li>
	<li>Operating System User</li>
	<li>Database User</li>
	<li>Name of table that changed</li>
	<li>Type of change (insert, update, delete)</li>
</ul>
We then setup our service tests to establish some expectations about service behaviour. There are two potential outcomes:
<ul>
	<li>No data is changed</li>
	<li>One or more tables are changed in some way.</li>
</ul>
In either case our coding effort is minimal:

<code id="gist-7447486" data-file="1.c"></code>

Or

<code id="gist-7447486" data-file="2.c"></code>

When we expect a change to occur we specify the table name and how we expect it to change.

Immediately after our test we have one more call

<code id="gist-7447486" data-file="3.c"></code>

What this does is compare the state of the history table before and after the test. It then looks at our expectations. Any table that changed that we did not expect to change we report as a potential data integrity error. Tables that change in ways we don’t expect or don’t change at all are also reported.

Once a report has been made, the tester then needs to perform some analysis. The result is either an unknown outcome or a defect.

Documenting each outcome that is found is a great way for building up rules around existing systems. In the very first test I updated to use Automated Data Integrity Testing I found a business rule I had never known.

My hope for this is that this approach will make it easier to test services that make use of distributed transactions. A service fault should result in no data changes. With this we can be sure.

At the moment I’ve only got it working via Vanilla C and Oracle but with a bit of effort it would be possible to setup a package that automates the setup of triggers, tables and scripts on Oracle, SQL Server and MySql. A consistent API and a nifty little Open Source project could be available for adding Automated Data Integrity validation into unit tests and other automated testing tools.

I’ll let you know if I ever get that far.