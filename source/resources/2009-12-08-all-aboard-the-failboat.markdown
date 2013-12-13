---
layout: resource
title: all aboard the failboat
date: 2009-12-08 23:55:16
tags: user interaction
---
Today I rant and rave about my hilarious attempt to report the bug to Canberra Cabs.

I had some lovely screenshots to send them. Evidence to prove it happened. But they don’t have an email address; just a contact form.

So I typed in my problem and included a link to my blog post so they could get my screenshot. I hit submit and what awesomeness did I experience?

This awesomeness.

![Do NOT try that! !](/images/do-not-try-that.png)

I like the spelling mistake in the url. I especially like the double bang with space in between. They are serious about the message.

I can see the Canberra Cabs team sitting around the office congratulating [108 Digital](http://www.108.net.au/) for a fine website. No complaints reported to date... or ever.

This is a production website and I’ve tried to do three things so far and two of them have resulted in bugs. Now, this bug probably doesn’t appear too often. Even developers run the positive path through an application. I suspect there was either too much data or they reject any field that contains a hyperlink. It could be SPAM!

More hilarity came when there was a power outage in my suburb and Firefox restarted back to that page. This time with no POST data.

![Fill in all fields! !](/images/fill-in-all-fields.png)

Double bang again. Love it.

Seriously though, this little website scores close to zero in the usability stakes. If a contact form requires mandatory fields then indicate them on screen so the user knows; if the user gets it wrong use client side validation to provide contextual help about how to get it right. If the server gets incorrect data return to the UI with the same contextual help.

None of this is new information and that is what irks me the most.

Testing and usability are not new nor are they mysterious hieroglyphics that cannot be comprehended. They just have to be done and if you don't know how you hire one. They tend to cost less than every other field in the industry. If you don't you end up looking a like an idiot and your customers go elsewhere.

Going to production without testing: **Do NOT try that! !**

