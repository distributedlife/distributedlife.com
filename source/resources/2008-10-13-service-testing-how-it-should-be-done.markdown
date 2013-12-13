---
layout: resource
title: Service Testing - How It Should Be Done
date: 2008-10-13 23:55:28
tags: service testing
---
In all scenarios the service documentation is produced before the team starts. A service dependency system is introduced to support [conditional proofs of services](/resources/testing-soa-service-dependencies-and-their-impacts-on-testing.html). The service dependencies ideally should be generated from the code.

The coder is responsible for the construction of the service and the following types of testing:

 - Unit in Isolation
 - Unit Integration
 - Service in Isolation Testing (functionality, robustness, performance, load and stress)
 - Service Integration Testing (availability)


The tester contributes to the development work by producing a [test specification for the service]. This test specification is a series of test cases, both functional and non-functional, that can be coded by the developer that exist at the service interface level. The test scenarios are derived from the business requirements specification and the service contract.

The tester will then perform the following types of testing on the service:

 - Service Integration Testing (functionality, robustness, availability)
 - Performance Testing
 - Load Testing
 - Stress Testing
 - Deployment testing
 - Consumer Testing (testing of services via the consuming applications with user interfaces; i.e. traditional testing)

The coder contributes to the testing effort by using and building upon an organisational [mock library](/resources/service-mockery-and-automated-integration-testing.html). These mocks are leveraged by the testers to allow for automated integration testing.

The following types of testing needs to be done on the service platforms and mapped to each service:

 - Scalability Testing (scaling up and scaling out)

The amount of non-functional testing that occurs on each service is entirely driven by the type of service being developed, its expected usage scenarios and the non-functional requirements specified by business.

The coders should be automating all of their tests into their unit test framework of choice. The non-functional tests can leverage these automated tests and by operating on more indicative infrastructure can generate some useful metrics. All of this is wrapped up in a neat little continuous integration package. The testers write their automation integration scripts and tie that into the continuous integration server. Each build, each change exercises the system from unit testing to deployment testing giving greater confidence in services.