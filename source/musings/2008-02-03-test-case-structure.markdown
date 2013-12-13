---
layout: musing
title: Test Case Structure
date: 2008-02-03 15:02:00
tags: testing
---
Wherever I go, I see test cases named after an aspect of a system (logging on, or a module: like tasking). All the test cases are stored in a single word-doc or excel spreadsheet containing, in some cases 10-15 test cases all written line after line or a 100+ step work-flow that covers potentially 25+ different test cases. It's hard to tell and it's even harder to maintain. In both cases what is being documented is misleading and wasteful.

I think we as testers need to review how we write our test cases. This review should emphasize on how we name our test cases and to minimise the amount of work being performed with every test case being written within the team.

The primary scope or more accurately the goals of this blog is to cover:

 - how we name test cases
 - what we document as test steps
 - what kind of supplementary information is required with a test case to ensure understanding whilst assuming minimal amounts of prior knowledge

I won’t be talking about what test cases need to exist to cover a requirement and the impacts of a test case registry (like QualityCenter) has on test case structure.

Harkening back to my tale of woe, in the first method described the document doesn’t accurately represent the tests covered within. In the second method the work-flow doesn’t let you know if you are correctly covering all the possible scenarios. Both methods are difficult to extend as new functionality is written. In such cases new documents are often written to cover all the new test cases.

This happened with a system I looked into recently where a search of the past twelve months revealed about 15 documents all containing test cases. It was unsure how many of them were still relevant.

### Singular of Purpose
To me a test case should attempt to achieve only one thing: the testing of a specific requirement or a specific aspect of a requirement.

***Example:*** There is a requirement that states when creating a task, a title is required. I would have the following test cases:
 - Creating a task without a title
 - Creating a task where title is maximum allowed length
The testing of whether a title is required is separately tested under the two scenarios where you have tested creation of a task without a title and with a title that is the maximum length (bounds-checking).

What this gives you is a very clear understanding of what the objective of the test case is. What this will also give you is a lot more test cases. This is not a bad thing. It just means you know how many test cases you have.

### It’s All In The Name
Now that the number of distinct test cases is going to increase, we need to ensure that our test cases are named appropriately. It is my firm belief that the name of the test case should describe what you are attempting to do. It shouldn’t include pass or fail conditions and should be as succinct as possible, but not necessarily as short as possible.

I call this the **Action Target Scenario** method

> **Action** – a verb that describes what you are doing, some good examples are: create, delete, ensure, edit, open, populate, observe, login, etc.

> **Target** – the focus of your test, usually a screen, object entity, program, etc

> **Scenario** – The rest of what your test is about and how you distinguish multiple test cases for the same Action and Target*.

So using this method, my test cases would be:

 - **Create** – **Task** – **title is not supplied**
 - **Create** – **Task** – **title is the maximum allowable length**

A useful way of formulating your test-case names is to ask yourself questions like:
 
 >*What happens when a user ... *

And onto the end of that open ended question you derive your test case name. So using the above, we get the following questions:

 - What happens when a user **creates** a **Task** and the **title** **is** **not supplied**?
 - What happens when a user **creates** a **Task** and the **title** **is** **the** **maximum allowable length**?

You will find that your test case names will get much longer than what you are used to. This is also ok, it just means that you need to use more characters to accurately represent what you are trying to do.

> ***Note**:* The inclusion of decimal points and hyphens in test case names is a personal style thing that should be moderately consistent within a team. The important thing is the spelling of the action and the target are identical across test cases that do the same thing or hit the same targets. This will ensure that your test cases can be easily searched upon.

### Preconditions
Often when testing, the preconditions required to achieve a test cannot (and should not) be included in the test case name. However, these preconditions still need to be documented somewhere.

So for the first step of your test case, include your pre-conditions. These can be as informal or formal as required and the use of business language is advised.

***Examples:***
 - Task exists
 - Task exists with a state of [Expired]
 - A User existing that does not have any Tasks created against them
How the pre-conditions are established is outside the scope of the test case. I’ll get to where these are documented later on the article but for the time being, pre-conditions are established as your first few steps of your test case. I suggest that using one test step per pre-condition to aid in clarity.

Test Step 1 [Precondition] User exists in the tasking system

OR

Test Step 1 [Precondition] Task exists in the system that has expired but is not complete

### Acceptance Criteria
How do when we know when a test case has passed or failed? All test cases require acceptance criteria and these should be included in your test case. As the test case is only targeting a single objective then your acceptance criteria should be only be a single or a few criterion.

**Create – Task – title not supplied**

 - A message is displayed to the user: *"Tasks required a title before they can be created"*

**Create – Task – title is maximum allowable length**

 - The Task is created as per standard business flow. The title must not be truncated.

While the acceptance criterion of the second test case seems a little wishy-washy, that is exactly what the acceptance criterion is. If anything else occurs, then the test fails. I.e. if a database error occurs then fail, if the user receives a message saying that the input is too long, fail.

How do you define standard business flow? That belongs to the realm of supplementary documentation.

### Supplementary Documentation
Supplementary documentation is all the documentation that exists to support the system. This can be help-documentation, requirement specifications, technical design documents or how-to documents written on a team-wiki or shared drive.

Use this documentation so that you don’t have to write out for every single test case all of your pre-condition work-flows, test-steps and acceptance criteria. **Have it written once**, put it in a common location for everyone to use and refer to it in your test cases.

When writing your preconditions, work-flows or acceptance criteria, refer to the particular help document, specification or how-to so that users know where to look for it.

***Examples:***

 - [Precondition] User exists in the tasking system {Use: Help > Tasking > Creating Tasks}

OR

 - [Precondition] Task exists in the system that has expired but is not complete {Help > Tasking > Creating Tasks, Wiki > Task Expiration Job}
Standardise the way you refer to help documentation, where it is, etc so that all team members know that when they see supplementary documentation they know where to find it.

### Detailed Test Steps
If after following all of the above, you feel the user-flow that needs to be undertaken to complete the test case is not documented enough that a competent tester, inexperienced with the system being tested can’t complete the test without seeking assistance, then I propose the following:

 >If the work-flow information that you need to document is more than likely going to be used by more than one test case, then write a how-to document and store it in the how-to section on a wiki, or on the shared drive.

An example of this is the test case: **Create – Task – title is not supplied**. This test case and others require knowledge of:

 - Where the Task system resides? How do I login etc?
 - What user access levels are required?
 - How to create a Task under normal conditions?

I would include a test step in the test-case after the pre-conditions and before the acceptance criteria that specifies each of the additional documents that should be used and where that document resides.

If the work-flow information is never going to be reused then include the test-steps within the test case as you currently would do now.

### Conclusion
The guidelines I've discussed above are very similar to the process that a Business Analyst uses to ensure that each requirement in a specification states only one thing. It is also similar to the process software developers use to ensure their methods are singular of purpose, well named and easy to maintain. The reason for this is, that is where I drew my inspiration.

I couldn't work out why I spend time ensuring well named, modular class methods exist in the software I develop but I don't spend the same time ensuring well named, modular test cases exist in the software I test.

Enjoy