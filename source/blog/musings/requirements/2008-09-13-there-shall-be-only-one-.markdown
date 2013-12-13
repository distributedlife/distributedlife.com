---
title: There shall be only one! 
date: 2008-09-13 23:55:58
tags: requirements, 
---
<p style="margin-bottom: 10pt; text-align: justify;">It can be too easy for testers and developers to miss requirements when they are embedded within the definition of a different requirement. If there is more than one requirement for a particular aspect of a system, screen widget or label. Create a second requirement.</p>
<p class="MsoNormal" style="margin-bottom: 10pt; text-align: justify;"><strong><span style="font-family: ">Why is this important?</span></strong></p>

<ul>
	<li><span style="font-family: ">Developers and Testers can miss requirement </span></li>
	<li><span style="font-family: ">You lose traceability between your requirements, the code, test cases and defects.</span></li>
	<li><span style="font-family: ">Versioning requirements becomes difficult because each change request impacts multiple requirements which impacts a greater number of tests</span></li>
</ul>
<p class="MsoNormal" style="margin-bottom: 10pt; text-align: justify;"></p>
<p class="MsoNormal" style="margin-bottom: 10pt; text-align: justify;"><strong><span style="font-family: ">Take this stunning example:</span></strong></p>

<div style="border: 1pt solid windowtext; padding: 1pt 4pt; background: #ddd9c3 none repeat scroll 0% 0%; -moz-background-clip: -moz-initial; -moz-background-origin: -moz-initial; -moz-background-inline-policy: -moz-initial; margin-left: 36pt; margin-right: 36pt;">
<p class="MsoNormal" style="border: medium none; padding: 0cm; background: #ddd9c3 none repeat scroll 0% 0%; margin-bottom: 10pt; -moz-background-clip: -moz-initial; -moz-background-origin: -moz-initial; -moz-background-inline-policy: -moz-initial;"><em><span style="font-family: ">There is a rollover effect on hover and selected state is displayed after user has clicked the link
<span> </span>
The menu will only display items that contain data and the items will be sorted in alphabetical order. Items are in sentence case.</span></em></p>

</div>
<p class="MsoNormal" style="margin-bottom: 10pt;"></p>
<p class="MsoNormal" style="margin-bottom: 10pt;"><strong><span style="font-family: ">This should be:</span></strong></p>
<p class="MsoListParagraph" style="margin: 0cm 0cm 0.0001pt 36pt; text-indent: -18pt;"><span style="font-family: ">1.</span><span style="font-size: 7pt;"> </span><span style="font-family: ">On Hover – A ‘rollover’ effect applies which is defined as … </span></p>

<p class="MsoListParagraph" style="margin: 0cm 0cm 0.0001pt 36pt; text-indent: -18pt;"><span style="font-family: ">2.</span><span style="font-size: 7pt;"> </span><span style="font-family: ">On Click – A ‘selected’ state is applied to the relevant menu item. This is defined as ...
</span></p>
<p class="MsoListParagraph" style="margin: 0cm 0cm 0.0001pt 36pt; text-indent: -18pt;"><span style="font-family: ">3.</span><span style="font-size: 7pt;"> </span><span style="font-family: ">Menu items are to be sorted alphabetically</span></p>
<p class="MsoListParagraph" style="margin: 0cm 0cm 10pt 36pt; text-indent: -18pt;"><span style="font-family: ">4.</span><span style="font-size: 7pt;"> </span><span style="font-family: ">Menu </span><span style="font-family: ">Items are in sentence case </span></p>
<p class="MsoNormal" style="margin-bottom: 10pt; text-align: justify;"></p>
<p style="margin-bottom: 10pt; text-align: justify;">It’s a fairly trivial example but it illustrates how easy it is slip into non-formal English language when defining requirements. Requirements are formal, they need to be explicit.</p>

<p class="MsoNormal" style="margin-bottom: 10pt; text-align: justify;">A<span style="font-family: "> quick and easy way to check if you have too many expectations defined per requirement is to check for any joining words like ‘and’. If you have a requirement <em>and</em> another one, you can be confident that there are two requirements defined.
</span></p>
<p class="MsoNormal" style="margin-bottom: 10pt; text-align: justify;"></p>

<div style="border: 1pt solid windowtext; padding: 1pt 4pt; background: #d99594 none repeat scroll 0% 0%; -moz-background-clip: -moz-initial; -moz-background-origin: -moz-initial; -moz-background-inline-policy: -moz-initial;">
<p class="MsoNormal" style="border: medium none; padding: 0cm; background: #d99594 none repeat scroll 0% 0%; margin-bottom: 10pt; text-align: justify; -moz-background-clip: -moz-initial; -moz-background-origin: -moz-initial; -moz-background-inline-policy: -moz-initial;"><strong><span style="font-family: ">Note:</span></strong><span style="font-family: "> I shouldn’t need to be narky but the reality of it is that too few analysts manage to produce suitable documentation for testers and developers. Either that or they just don't care. The other reality is that the aforementioned people probably don’t read blogs, let alone mine. </span></p>

</div>
<p class="MsoNormal" style="margin-bottom: 10pt; text-align: justify;"></p>

<div style="border: 1pt solid windowtext; padding: 1pt 4pt; background: #d99594 none repeat scroll 0% 0%; -moz-background-clip: -moz-initial; -moz-background-origin: -moz-initial; -moz-background-inline-policy: -moz-initial;">
<p class="MsoNormal" style="border: medium none; padding: 0cm; background: #d99594 none repeat scroll 0% 0%; margin-bottom: 10pt; text-align: justify; -moz-background-clip: -moz-initial; -moz-background-origin: -moz-initial; -moz-background-inline-policy: -moz-initial;"><strong><span style="font-family: ">2<sup>nd</sup> Note:</span></strong><span style="font-family: "> &lt;/Rant&gt;</span></p>

</div>
<p class="MsoNormal"><span> </span></p>
<p class="MsoNormal"><span> </span></p>