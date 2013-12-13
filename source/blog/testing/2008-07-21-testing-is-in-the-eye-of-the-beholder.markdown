---
title: Testing is in the eye of the beholder
date: 2008-07-21 22:05:30
tags: chuckles, testing, 
---
Today I was asked to raise a defect because the background colour in the header was different to the background colour in the footer. I politely pointed out that the colour variation was more than likely caused by the LCD monitor and the viewing angle. "Definitely not!" was the reply and I sheepishly agreed. I should be berated for even considering such a thing.

To be a thousand percent sure I went back to my desk and checked. Wouldn't you know it. Identical colour codes. What could cause the mystery of the colour variation?

Here is the Wikipedia entry for <a href="http://en.wikipedia.org/wiki/Liquid_crystal_display">Liquid Crystal Display</a>

Here is a quote from the <em>drawbacks </em>section:
<blockquote>LCD panels using <a title="Thin film transistor liquid crystal display" href="http://en.wikipedia.org/wiki/Thin_film_transistor_liquid_crystal_display#Types">TN</a> tend to have a limited <a title="Viewing angle" href="http://en.wikipedia.org/wiki/Viewing_angle">viewing angle</a> relative to CRT and plasma displays. This reduces the number of people able to conveniently view the same image – laptop screens are a prime example. Usually when looking below the screen, it gets much darker; looking from above makes it look lighter. Many panels which are based on the IPS, MVA, or PVA panels have much improved viewing angles; typically the color only gets a little brighter when viewing at extreme angles.</blockquote>
This brings me to the title of this post. Testing is in the eye of the beholder. Which is wrong. Testing is, generally speaking, a quantitative process. The eye of beholder metaphor is about qualitative judgement. In this example we solved a qualitative judgement using a quantitative approach. We check the CSS file and proved that although our eyes perceived a colour variation the colour did indeed match the specification.

This now concludes my argument on why testing is a specialist skill like every other facet of the software development life cycle.

<strong>note: </strong>I won't go into when qualitative testing is appropriate. I'll save that for another post. It is a justifiable approach, just not in this scenario.

<strong>2nd note: </strong>I'm sure not if I added enough sarcasm to the first part of this post.