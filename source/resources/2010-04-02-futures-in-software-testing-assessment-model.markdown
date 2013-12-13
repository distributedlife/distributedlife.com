---
layout: resource
title: Futures in Software Testing – Assessment Model
date: 2010-04-02 23:55:40
tags: futures in software testing
---
One of the issues I have with training software testers is that the reality of testing is the plethora of skills that need to be applied and they all need to be applied from day one. This overload of information is overwhelming for new testers. What I see most people doing is taking an aspect of software testing and getting the trainee to practice the fundamentals. Keep doing this until the trainee can manage it themselves and then give them something new to work on.

But how do you measure what they do and don’t know and how do you match that up against the disciplines and the needs of the organisation.

What I’m doing with the Disciplines of Software Testing approach is to use a [formative self assessment model](http://en.wikipedia.org/wiki/Formative_assessment) to measure competency. The goal of the system is to **reveal areas for improvement** without ranking them.

The process for measuring competence is a self-assessment process where the tester asks themselves how confident they are in applying each of the skills within the discipline or fundamentals. For a tester that feels their self-assessment is not accurate they can they mentor to work through their assessment with them.

Within each discipline and testing fundamentals are five levels of competency:

### Level 0
The tester is completely unaware of the concept, technique or responsibility or has no formal knowledge. The tester cannot explain what the concept means or why it is applied.

### Level 1
**Fundamentals** - The tester is aware of testing and understands why testing needs to be done but not how. This is the first level of competence where the tester can engage in discussions on the why of testing without getting into implementation details.

**Discipline** - The tester is aware of the discipline and understands what types of testing are performed, why it is done, the types of defect identified and the benefits of such a testing approach. A tester at this level does not know how the testing is performed.

**Results** - Not applicable. The tester is not yet capable of producing output.

### Level 2
**Fundamentals** - The tester is learning the concepts but is not yet competent enough to apply the concepts without continual attention. The tester should not be in charge of any part of a project and all work should be done with or reviewed by a mentor.

**Discipline** - The tester is able to identify what needs to be tested for a small subset of aspects within the discipline. The tester is able to execute existing test cases but may not be skilled enough to design all but the simplest of test cases.

**Results** - Not applicable. No work should be signed off without being reviewed by the test lead.

### Level 3
**Fundamentals** - The tester understands the concepts and processes and is applying them with regular review and guidance. The tester should not be in charge of a test project. The tester can be given ownership of a subsection of the project. All effort should be regularly reviewed by the experienced test lead.

**Discipline** - The tester is able to identify what is to be tested within the discipline for any particular project but may not be able fully to execute the test cases. The tester should not be in charge of a discipline within a project. The tester can be given ownership of a subsection of the project relating to that discipline. All effort should be regularly reviewed by the experienced test lead.

**Results** - Not applicable. No work should be signed off without being reviewed by the test lead.

### Level 4
**Fundamentals** - The tester understands the concepts and processes and is able to apply them with infrequent review. The tester can be responsible for a test project. The tester does not need to be given guidance. At this point the tester is focusing on the application of their skill set. Testers of this level should be able to provide guidance.

**Discipline** - Is able to build the test plan and test suite for the discipline on any given project and execute the majority of tests. May need occasional guidance to overcome more complicated test scenarios. Testers of this level should be able to provide guidance.

**Results** - Ideally a competent tester should not be responsible for more than 3 major, avoidable defects being found in production per project.

### Level 5
**Fundamentals** - Satisfies all requirements for the fundamentals of software testing and should be able to provide sound guidance to any tester.

**Discipline** - Is able to build the test plan and test suite for the discipline on any given project and execute all tests. The expert disciplinarian should be able to overcome the most complicated of testing scenarios within the discipline.

**Results** - The expert tester should not be responsible for any major, avoidable defects being found in production.

### A note on results
I’ve included the concept of results in this article. What I want to emphasise is that at the lower levels the tester should not be responsible for their performance in production. They have already indicated that they need some degree of guidance and therefore someone should be mentoring them and verifying their work. 

The aim is that an inexperienced tester who is less concerned with their performance in production will be more relaxed about trying, experimenting and learning. I have no idea if this will work but I’m trying it with my trainees now. This is also to try stop accusations of insufficient testing or unqualified testing when bugs are found in production. I don’t like my testers being blamed for a problem when they’ve only been testing for 6 months and still need guidance.

At the competent and expert levels I think results are important and some may argue that 3 major avoidable defects is a major failing by a tester. The 3 is just an arbitrary number and is not for assessment. I’ll repeat it again;

**The results component is not for scoring of testers.** There are too many factors involved for a scoring system to work; define avoidable, define major, how much time did the tester have, how much churn was there, was the system trivial or complex, were new technologies being tried, etc.

The goal of the results component is for the tester who, when performing **the self assessment**, sees that they could have avoided a number of defects from getting into production. They can then use this to identify potential areas where they can improve. The tester obviously considers themselves capable within the fundamental or discipline. A number of bugs were released which contradicts their previous assessment and challenges them to review their self assessment in order to find a place where they perhaps need more guidance.

If a competent tester releases a bug into production I still believe that tester is competent but after an arbitrary number of bugs in one release then there is cause for reassessment.

[Click here for the handout on measuring competence.](/files/testing.competencies.pdf)