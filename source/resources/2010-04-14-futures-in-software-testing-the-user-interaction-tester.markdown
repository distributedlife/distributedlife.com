---
layout: resource
title: Futures in Software Testing - The User Interaction Tester
date: 2010-04-14 23:55:19
tags: futures in software testing
---
The user interaction tester is concerned with the human-computer interface. User interaction testing factors in the user experience, usability and testing the implementation of the user interface itself.

User interaction testing covers all interaction mechanisms from keyboard and mouse to touchpad and console as well as training and documentation, the last two are sometimes forgotten ways the system interacts with the user.

The user interaction tester is aware that the success of a system extends beyond its feature set or functional correctness and that applications that help users achieve their goals can be more successful.

User interaction testing finds potential issues as well as defects.

**Example:**

Here is a screenshot from the [National Australia Bank](http://www.nab.com.au/) internet banking site. I am attempting to get a list of all available transactions on my account. The system states on another part of the screen that 560 days of transactions are supported.

![NAB - Select Filter](/images/nab-one.png)

I entered 600 for the last x days.

I then get the following message (first Firefox and then Chrome):

![](/images/nab-two-be.png)

![](/images/nab-two.png)

As we can see we have a warning symbol and the word error in the message. It should either be a warning or an error. Not an issue for chrome where the warning symbol doesn't show. Next we have an error code in our message which should not be there. Users shouldn’t need to know that 303010 is the error code for maximum number of days of "Transaction History".

The real issue here is that the system knows the limit is 560 so it should have accepted 561 or 600 and on the filter page it could have had a message like "We currently provide only 560 days of transaction history. These have been displayed below.".

Instead I have to read an error message; close it and then resupply my value just so I can get all records available.

The altered process is simpler, more efficient, more tolerant and satisfying. The user gets a good feeling because the system does what I want rather than me having to do what it wants.

### Concepts

 - Understands the difference between user testing and user feedback
 - Understands exploratory testing and can use it as an approach to testing the system


### Techniques

 - Can apply the A/B testing technique in order to quantify an aspect of a design.
 - Can apply the ladder interview technique to identify user motivations.
 - Can apply one of several usability inspection techniques (cognitive walkthrough, heuristic evaluation, pluralistic walkthrough) to identify design issues.
 - Can apply the ‘think aloud’ technique for identifying user interaction issues
 - Can apply the hallway testing technique for identifying user interaction issues


### Responsibilities

 - Analyse the any potential requirements to develop workflows and identify potential user interaction issues
 - Analyse user interface wireframes and identify potential user interaction issues.
 - Read and review the training &amp; help to ensure correct usage of business language; that it has correct spelling, grammar and tone; has correct content; is easy to learn and provides task oriented concise manuals.
 - Can organise and run User Acceptance Testing sessions
 - Organise and run User testing sessions and understands the implications of user demographic on such sessions
 - Produce the User Acceptance Testing report after the UAT sessions have completed and all feedback received.
 - Analyse product marketing and training material to develop test scenarios that exercise user expectations
 - Analyse the requirement specifications to develop user interaction test cases
 - Analyse user interface wireframe and develop user interaction test cases
 - Design tests that ensure the cultural background, psychological mindset and physical attributes of a user do not impact the user experience
 - Design tests that ensure all potential invocation mechanisms are catered for and support full user interaction with the system
 - Is able to debate user interaction issues calmly and intelligently.


### Artefacts

 - **User Accepting Testing Report** – This report details the outcomes of the UAT session and details the input from the users. The report can contain an outline of what will be fixed in the current release and will detail which concerns will not be resolved. This report is relayed to the owners for signoff.


### Aspects

 - **Accessibility** – testing the user interaction so that it meets accessibility requirements for the intended users, organisation, country or standards committee. WCAG2.0 is the current W3 standard for web content accessibility.
 - **Consistency** – the system should be consistent in its behaviour and interaction mechanisms. Consistency testing should also ensure that common UI components are used in ways that they user would expect.
 - **Internationalisation &amp; Localisation** – internationalisation testing covers the adaption of the system for potential use. Testing should focus on the mechanisms for internationalisation rather than the outcomes. Localisation testing covers the adaption of a software system for particular locale. It covers language and dialect translation, use of symbols, aesthetics, sort order, subtitling, cultural values and writing conventions.
 - **Structure** – The structure of the user interface should be consistent and relevant to the functional purpose. It is making sure that the layout of the user interface has logical groupings of information, it contains sufficient information without being busy and workflows between screens make sense.
 - **Training &amp; Help** – the training and help testing focuses on ensuring that each UI component provides contextual help where necessary.
 - **Trustworthiness** – focuses on ensuring that the system is forgiving of user errors and respond quickly to user input. A trustworthy system should allow the user to interact with it without fear of penalty.
 - **Usability** – testing the usability of a system covers concepts such as efficiency, memorability, learnability, satisfaction and tolerance. An efficient system should be easy to use whilst satisfaction encompasses the usefulness of the system.
 - **Visibility** – how well the system allows the user to construct a mental model and predict the effect of their actions. The user interaction tester should be able to identify when system information will assist users in making the best decision. Clear &amp; simple navigation, good feedback, predicable behaviour, etc.

[Here is the self assessment for the User Interaction Tester.](/files/road-map.user-interaction-tester.pdf)