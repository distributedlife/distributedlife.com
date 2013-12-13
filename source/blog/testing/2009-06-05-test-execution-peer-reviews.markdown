---
title: Test Execution Peer Reviews
date: 2009-06-05 23:59:12
tags: distributed-life, distributedlife, peer, qa, quality-assurance, review, ryan-boucher, rybochad, test-execution, testing, testing, 
---
A problem that I have, when working in test teams, is trusting my fellow testers to give the green tick only when the test case passes. It does happen and can be caused by a number of factors from test fatigue to laziness. I won't talk about my trust issues or how it can come about aside from providing the premise that it does occur and what we can do to minimise the impact of it. 

What I am going to suggest is a second peer review and a different one to the normal test suite peer review that occurs early in the project. This one occurs later in the project, is much shorter and easier. I've not actually tried this in a project but am going to try it on my current project and on my next project to see whether it works.

Our first peer review is to make sure that our test cases are accurate, well documented and providing sufficient coverage. Our second peer review is going to provide a measure of assurance that our test execution is accurate. I won't talk about the first peer review here. The second peer review involves an experienced tester that has an hour or two to spare. The reviewer will talk to the test team to suss out the gooey bits. The places where defects were high, there was more code churn than or where identified as high risk areas due to legacy code, integration points or some other reason. The reviewer will then take a selection of test cases, random or otherwise but it's up to the reviewer. The basic assumption is that all selected test cases have passed.

The reviewer will execute each test case.

If any test case fails then all test cases in that functional area has to be rerun by the test team with added vigilance. It should be obvious by this point that someone, and it shouldn't matter who, passed a test that should have failed.

If all selected test cases pass then the test team can be confident that their results are accurate.

This may sound like a waste of time and money but we've already made the statement that **people can and do make mistakes, even testers.** Therefore we need some way of catching these mistakes.

This method does have flaws; a random selection of test cases may miss the one test case that fails, the reviewer may select trivial test cases because he or she doesn't feel like working hard today. These are real concerns but what we are trying to do is get a measure of confidence.

This method also relies on the assumption that the first peer review process, the one that ensure our tests were accurate and well documented was done properly. Otherwise we may have invalid tests, being passed and then retested by the peer reviewer who will also pass them. So this peer review process can only occur if the first one has been done successfully.

Having an active peer review process is more than just doing the peer reviews. It's a culture you grow and it breeds confidence and better results. Those that were lazy and passed tests because they couldn't be bothered or assumed it was still working will be less likely to be so blasé because their work is being checked. Test cases that were passed due to test fatigue also have a chance of being picked up before going to production. This also gives your testers some backup.

The developers will also be more confident that the testing being done is up to standard because we are reviewing our own work.

This process shouldn't be left to the very last minute. If problems are being uncovered the team is going to need to time to retest. The best time to do a peer review is when one functional component has been deemed "done" by the test team. That functional component and only that component is peer reviewed and the team goes on. Dissecting the product into functional deliverables, where possible, will allow you to stagger the peer review process across the life of the project and give the test team more time to retest should the worst occur.