---
title: One time offer on defects
date: 2010-04-17 23:55:59
tags: adobe, defect, discipline, distributedlife, licence, reader, ryan-boucher, rybo, testing, 
---
![Adobe Reader Licence](/images/adobe.png)

It may seem innocuous but the licence agreement for Adobe PDF Reader is a defect waiting to happen. At once place I worked they had Acrobat Reader on the server upon which their main application sat. This main application was delivered over Citrix.

What happened was that one day a new version of Acrobat Reader came out and all the servers were updated (about fifty) during the release night.

A few days later we started to hear about issues with PDF documents in prodland. Odd; we tested the new version and it works as well as it ever did.

Turns out the application couldn’t instantiate Acrobat Reader and deliver it over Citrix when the licence check had not been completed.

Now when they deploy new versions of Acrobat Reader the install process requires the installer to accept the licence agreement on each and every server before indicating the task is complete.

Bugs that only occur once per install of an application are in some cases more annoying than race conditions. They are exacerbated by a test environment that is continually used and never restarted and in organisations where deployments into test are not performed in the same way as deployments into production.

The solution is to have someone in your testing area that is involved in the [Infrastructure &amp; Integration Discipline](/blog/2010/04/futures-in-software-testing-the-infrastructure-integration-tester.html) as that covers deployment testing.