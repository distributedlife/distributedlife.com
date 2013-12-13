---
layout: resource
title: Futures in Software Testing - The Behavioural & Functionality Tester
date: 2010-04-12 23:55:38
tags: futures in software testing
---
The behavioural and functionality tester is the traditional testing scope with an emphasis on the behaviour of the system rather than just meeting functional outcomes.

The behavioural and functionality tester inspects the requirements documentation to create test cases and then executes these in whatever way is most appropriate for the system.

Functionality is defined as a specific task that the system performs. Behaviour is a system response to interaction. Behaviour can be implemented through the combination of functions (functional integration) or by a set of discrete functions. By this I mean that each function implements the behaviour in isolation.

Behaviour should be consistent and predictable. A system can be functionally correct and still have each function implemented with a different behaviour. A system with this kind of behaviour is less than ideal because it becomes more difficult to predict the outcome of an interaction.

Behavioural and functionality testing does not mandate a user interface as batch applications and windows services do not require user interaction.

**Example:**

Imagine a system of batch processes that are connected. There is a document scanning process which generates a flat file of scanned documents. This is passed into a rules analysis process and produces another flat file of analysed records. The third process is a letter producing application that takes analysed records and produces a flat file that can be given to a printer for physical production.

Each of those processes performs a discrete function and the behaviour is to produce a flat file in a specific format. If each system produced a file in a different format or one of them used a relational database or one of them emails the file to the next process we can see that the functionality remains the same (scanning, analysing or printing preparation) but the behaviour is now different.

This difference may not seem like much and each component may have been built using different teams, technologies and timelines. What we have though is a maintenance cost because of these differences. We will have more test cases because we can’t reuse the same set of tests against each process. There are different ways to initiate the process and our means of validation is also different. This is increased effort, both development and testing. Complexity is also increased because of inconsistent behaviour across functions.

Not every system has this problem or is built so haphazardly but it serves to illustrate the point that the Behaviour and Functionality tester is looking at more than just functional correctness as consistent behaviour across functional interaction is just as important.

### Concepts

- Understands equivalence partitioning to assist in the creation of test cases
- Understands exploratory testing and can use it as an approach to testing the system


### Responsibilities

- Use boundary analysis to identify states in complex business objects that may impact expectations
- Analyse the documented requirements, user expectations use cases, user stories, marketing material and help and training material to identify test cases
- Can test system behaviour by combining functionality implemented within the system
- Creation of end to end behavioural testing scenarios that exercise multiple systems within the organisation.


### Aspects

- **Functionality** – what the functions of the system are and testing to ensure the system meets the specified expectations; this is done in both a positive and negative sense
- **Behavioural** – system behaviour is a feature that the system supports, potentially via functional integration or potentially through multiple discrete, isolated functions. Behavioural testing seeks to ensure that the expected behaviour is supported by the system and that behaviour is consistent across the system.
- **Compliance** – testing the system to ensure that it meets any required standards for functionality or behaviour.
- **Regression **– the identification of test cases that should be run after subsequent system changes to ensure the system has not regressed
- **Data Integrity** – inspection of system data after each function test is executed to identify incorrect storage of data

[Here is the link to the Behavioural & Functionality Tester self assessment.](/files/road-map.behavioural-and-functionality-tester.pdf)