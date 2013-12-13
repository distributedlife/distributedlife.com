---
title: Automating the passing of a failing test
date: 2010-03-17 23:55:49
tags: automation, distributedlife, ryan-boucher, rybo, service-testing, testing, 
---
In February I talked about <a href="http://distributedlife.com/blog/2010/02/passing-the-failing-test.html">passing a failing test</a> and why that was sometimes a good idea.

The main benefit was to identify indirect changes to service behaviour. We’ll I’ve come up with a better approach that is more reliable and helps other testers understand the current and past state of the test.

The primary issue with forcing a passing test to fail is that in some cases the test script had to be changed to achieve the result. This meant undoing the change when the code passes again. This is effort and effort can have mistakes in it.

Another issue I’ve noticed is that when service testers have to maintain their colleague’s tests they have to reanalyse the behaviour to see what it is failing. This could be solved if Quality Centre allowed the linkage of defects to actions within a Service Test project. Having them just at the project level is insufficient for our <a href="http://distributedlife.com/blog/2009/10/structuring-hp-service-tests.html">QC structure</a>. It doesn’t though so when a test fails they have to inspect the code to see why and then look up the defect list to see if the defect has been raised yet.

To get around this I asked my testers to ‘annotate’ their tests with some code that would indicate any defects that relate to the test. This has to be done for every test that has a defect against it.

<code id="gist-7445603" data-file="2.c"></code>

The function OutstandingDefectExists takes the ID of a defect from QC and the scope of the defect. We do this because we don’t want a defect relating to auditing to impact our functional test execution. <a href="http://distributedlife.com/blog/2010/03/testing-cross-cutting-concerns-in-hp-service-test.html">Remembering that these are all coded in the one script now</a>

If there is an outstanding defect the code outputs a message (a passable action in HP Service Test) and ends that particular test. The test passes in the results file. If the defect gets resolved or rejected then the test executes again and will pass or fail of its own accord. If a resolved defect subsequently passes, due to a correctly applied fix, we won’t necessarily know because our test keeps passing as it always did. The good thing is that we don't necessarily care either.

We leave this code in the test for all time; it serves as a history lesson for the tester that has to maintain the test. They can see what defects impacted this test with a reference to the defect in QC.

How it works

Each night there is a scheduled application that runs. It peeks into QC and gets all the defects that exist and builds a lookup table that looks like this:

<code id="gist-7445603" data-file="3.c"></code>

When the defect id gets passed in we look up the result which is either a Yes or a No and the test continues.

We have a 24 hour turnaround from when a defect gets marked as fixed in QC and when the test runs. As this runs over night when we come to work in the morning we know exactly how our services are going and whether yesterdays fixes worked and whether or not there has been any behavioural regression.