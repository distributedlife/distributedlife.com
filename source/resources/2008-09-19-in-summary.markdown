---
layout: resource
title: In Summary
date: 2008-09-19 23:55:57
tags: service testing
---

We have integration environments where our release candidate is first brought together. This shouldn’t be confused with a development integration environment where multiple code lines are merged before delivery to test. The development integration environment isn’t where unit integration tests are performed, these occur in the development environment. It also shouldn’t be confused with integration testing which can either occur in an integration environment to ensure the components integrated seamlessly, or is used to ensure that separate systems integrate properly; this tends to occur in a system testing environment.

System testing is the act of testing the integration of systems in an integration environment. However there is also, often a system testing environment after the integration environment. System testing environments can be more formalised than integration environments.

Functional testing occurs in a test environment but has been known to occur in an integration environment, it doesn’t occur in a system test environment. Non-functional testing occurs in a performance testing environment, but then so do all the other types of non-functional testing including performance.

Regression testing tends to occur in the QA environment where we assure quality. This is often performed by the QA team and can easily be mistaken for the pre-production and staging environments, which of course, are all the same. The QA team is made up of non-technical and technical testers and is also known as the test team, except that users perform User Acceptance Testing and developers perform unit testing, which is both at a unit level and at the integration level, but not the tester’s integration level, the unit integration level.

Technical testers can also be automation developers because they develop automation scripts, not because they are developers. These scripts test the application at an integration level and shouldn’t be mistaken for the scripts that testers execute. Those scripts are manual scripts and describe how to execute a test case, which is a test scenario and form together into a test suite or test plan.

Service testing is the testing of services, while a testing service is a service (a company) that tests. Service testing tends to occur at the interface level where each service is tested in isolation, which is also known as unit testing services. Services are also tested to ensure they integrate well with each other. This is service integration testing and occurs at the development integration, integration or system test level… but isn’t called system integration testing, which it also is.