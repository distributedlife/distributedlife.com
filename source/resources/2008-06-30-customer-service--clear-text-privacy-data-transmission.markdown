---
layout: resource
title: Customer service != clear-text privacy data transmission
date: 2008-06-30 23:54:34
tags: user interaction
---
Two rants today. The first on customer service and the second on requesting private user information in clear-text.

I had to call Vodafone today because they had accidentally double charged me for phone plan. I'm transitioning phone plans so it's reasonable to assume an accidental oversight occurred. I rang their customer service number today and was told that they are too busy and I should email them. Then they hung up.

I hate it when phone systems to do this. Its unacceptable. I've already called you. I am in the queue. As a matter of fact, you have my number, how about you call me when my position reaches the front of the queue. If you can't do that, I would rather wait in the queue than send you an email. Why?
<ol>
	<li>When I send you an email, you say you will respond within 3 days. No deal, I want a response now, that's why I called. If I wanted a response in three days I would have sent an emissary by carriage.</li>
	<li>Emails can easily be ignored, lost, or more frequently, delayed with a "please send more information" response.</li>
	<li>Its unprofessional. You end up ticking off the very people who give you money. All they are going to do is blog it at anyone walking past the intertubes. Imagine if I was a new customer only to find out a phone company can't handle a load on the service desk... what does this imply about their ability to handle load on their mobile infrastructure?</li>
</ol>
So I sent Vodafone an "email" via their email web-form and it turns out I didn't have an account. I have at least one account on their website, but apparently you need two accounts. The account registration form requested my email, mobile number and my account password (or equivalent, I forget) and wanted to transmit this information via a clear-text http. Seriously, its not that hard to setup a SSL cert to encrypt the packets to provide that minimal level of privacy management the average consumer expects from a website.

If I were a spammer I would listen in on Vodafone network packets, not only do I get email addresses, I also get mobile phone numbers and if I'm lucky, mobile account passwords.