---
layout: resource
title: Futures in Software Testing - The Business Domain Knowledge Tester
date: 2010-04-08 23:55:57
tags: futures in software testing
---
The Business Domain Knowledge discipline is probably the most important discipline. Without our knowledge of how the business works we are limited in our effectiveness.

[Let me quote Donald Rumsfeld](http://en.wikipedia.org/wiki/Unknown_unknown):

 > "There are known knowns. These are things we know that we know. There are known unknowns. That is to say, there are things that we now know we don’t know. But there are also unknown unknowns. These are things we do not know we don’t know."

A key responsibility of the Business Domain Knowledge is taking the set of unknown unknowns and reducing it to a set of known unknowns. From there the process of knowledge discovery continues till we have only known knowns and can effectively design tests for the business.

Given the set of all Business Domain Knowledge in an organisation not all of it is relevant to any particular application or change. Scoping the set is another key responsibility and just as important as working out what needs to be learnt because we can expend more time than necessary when what we learn is irrelevant.

Some of this is easy and sometimes scoping business knowledge is very complicated. I’ve predominately worked in organisations with legacy systems are busily being rebuilt, extended or made more convoluted. When testing these legacy systems there can be large chunks of information that just isn’t known by anyone. All we have is what the system does now which is hardly an indication of correctness.

The Business Domain Knowledge tester tackles these issues and actively builds up knowledge to assist in testing both now and in the future.

There are two well known types of Business Domain Knowledge testers; the Subject Matter Expert and the Business Analyst. You may not consider them a tester but what they do belongs squarely in this discipline. Both the SME and BA  design and execute test cases from the perspective of the business and the various user roles.

The issue with the SME or BA is that their skill set is almost entirely in the one discipline. You may even say one-dimensional but that is a little harsh on their personalities.

Let me provide a example:

*A system is built where the operative has to enter the "reason for access" before use. This "reason for access" is a free text field up to 500 characters long. The system is built correctly but after a few months of use the audit logs show that most operatives are suppling a decimal point ‘.’ as their reason for access.*

![Reason for Access version 1.0](/images/DSC_4007.jpg)

*The SME or BA who understand the business will know that the operatives are overworked and measured on their performance. Consequently they don’t have time to type up a meaningful task definition each time they access. A better solution would be to automatically link the reason for access to a task that the operative specifies. Or, if that solution is too difficult to implement, allowing the operative to select one of a range of approved values.*

![Reason for Access version 2.0](/images/DSC_4008.jpg)

The same SME or BA may miss the defect where the tab order skips the OK button rendering the form useless to anyone restricted to the keyboard access.

This is an example of why no system should ever be tested from the perspective of a single discipline.

Another example:

*The UI wireframe comes back from the User Interface designer and is being reviewed by the other members of the project team. The application is for law enforcement agents to manage alert on persons of interest. An example of a alert is "escaped from prison".*

![Alerts](/images/DSC_4009.jpg)

*The Business Domain Knowledge tester reviews the design and immediately spots an issue. The alert expiration date has been left off the UI. The UI designer states it was done to simplify the UI and make it easier to use.*

*The Business Domain Knowledge tester is however, fully aware that an agent who acts on an alert could be making the wrong decision. It may turn out that the person of interest escaped from prison 25 years ago and has since served due time and been released. The alert had expired a long time ago but when the agent does a licence check during a random breath test and sees the alert the person of interest is arrested without cause.*

*Consequently the law enforcement agency loses credibility because it is making decisions based on systems that don’t fully understand how the business works.*

Not all problems facing the business domain knowledge tester are this serious or complicated but the tester is there to make sure that the systems developed for the business are a solution that is going to work; **are we building the correct system?**

### Concepts

 - Understands the language used by the business
 - Understands the business and the role software plays within the business

### Responsibilities

 - Analyse the requirements to develop test scenarios that model how the business is going to use the system
 - Analyse the requirements in the context of the business to ensure that the specified requirements are going to meet the needs of the business.
 - Analysis of semantic contracts, both explicit and implicit within the system to identify potential defects
 - Discuss the impact and severity of the defect from the perspective of the user.
 - Documentation of tacit knowledge as it is discovered
 - Identify systems that due their impacts on society or life require failure evident capabilities but do not feature them

[Here is the PDF self assessment for the Business Domain Knowledge Tester.](/files/road-map.business-domain-knowledge.pdf)