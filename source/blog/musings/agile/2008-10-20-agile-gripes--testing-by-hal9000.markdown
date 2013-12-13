---
title: Agile Gripes – Testing by HAL9000
date: 2008-10-20 23:55:01
tags: agile-presentation-2008, automation, testing, 
---
<p class="MsoNormal" style="text-align: justify;"><em>On this topic I am specifically talking about functional test automation as achieved by a tool like <a href="http://selenium.openqa.org/">Selenium</a>. Furthermore this could apply to any software development process. It’s just a bit more pertinent in the Agile world.</em></p>
<p class="MsoNormal" style="text-align: justify;">Now don’t get me wrong, I love automation. Automation when used appropriately is smart development. What I don’t like is throwaway statements made by test managers with a grand vision to automate everything.</p>
<p class="MsoNormal" style="text-align: justify;">Firstly you can’t. Automation tools do not come with the “did we build the correct system?” assertion. Validation is one half of what we are testing and this extends into the qualitative testing scenarios like usability testing.</p>
<p class="MsoNormal" style="text-align: justify;">When we talk about verification then we have a host of different problems. The second problem with automation is that it breaks under change. Agile is all about being able to handle change and if you have to reengineer your automated tests every time you want to refactor then it is painful for the automation developer.</p>
<p class="MsoNormal" style="text-align: justify;">The next problem is that automation scripts take time to write and suitably skilled personnel are required. This is a bigger problem than it looks. Most automation developers I have encountered are not overly fussed with software development concepts like code reuse, good coding practices or management concepts like source control and versioning. This last point is more about automation in general than directly related to Agile.</p>
<p class="MsoNormal" style="text-align: justify;">Automation tests <strong>do have value and does have a place</strong> in the software development lifecycle. They are very useful for evaluating your non-functional performance testing requirements. They help provide assurance that nothing as regressed in your application due to some other change. They help repeating tests across multiple platforms.</p>
<p class="MsoNormal" style="text-align: justify;">Where should automation developers sit in the lifecycle? In Agile it is my feeling that automation developers should sit a few sprints behind so that the likelihood of change is reduced. Manual testers can then provide feedback to the automation developers about which requirements are done and the work can commence on automating those scenarios.</p>
<p class="MsoNormal">The bottom line is that automation is good but is not a silver bullet.</p>

<div style="border: 1pt solid windowtext; padding: 1pt 4pt; background: #e5b8b7 none repeat scroll 0%; -moz-background-clip: -moz-initial; -moz-background-origin: -moz-initial; -moz-background-inline-policy: -moz-initial;">
<p class="MsoNormal" style="border: medium none; padding: 0cm; background: #e5b8b7 none repeat scroll 0%; -moz-background-clip: -moz-initial; -moz-background-origin: -moz-initial; -moz-background-inline-policy: -moz-initial;"><strong>Note:</strong> For laughs feel free to implement Asset.IsWhatUserWants ()</p>

</div>
<p class="MsoNormal"></p>