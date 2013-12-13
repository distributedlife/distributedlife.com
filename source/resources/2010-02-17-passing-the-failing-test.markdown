---
layout: resource
title: Passing the failing test
date: 2010-02-17 23:55:05
tags: test automation
---
Something I have been mulling over is whether or not to automatically pass a failing automated test when the project ends. The tests are converted to ‘regression’ tests and are run as part of nightly process.

The problem comes about with the way we structure our service tests. <a href="http://distributedlife.com/blog/2009/10/structuring-hp-service-tests.html">My article here</a> discusses the various options and we took the Project per Service Aspect route. This means that if you have 60 tests and one of them fails you have to manually inspect the project to determine which one failed.

During the project this is not an issue. You are actively working in the project and can see what is failing. Once the project has completed it becomes an issue. I don’t want to inspect all projects each morning to ensure that the failing project was caused by a known failing test.

So my theory is that for tests that are known to fail we invert the result. A pass is a failure and a failure is a pass. We then comment the test in such a way that it is obvious for someone analysing the test that it is a known failing test.

This means that if the test at some point in time fails the defect will be eventually fixed and the test script can be restored to the default setup. If the test continues to pass then we know that the defect is still present.

The goal here is to identify when <strong>indirect changes impact a service</strong> and resolve defects. Any direct action to resolve a specific defect should result in active test execution and therefore won’t warrant this setup.