---
layout: resource
title: Service Testing Directions
date: 2008-09-21 23:55:03
tags: service testing
---
The question I am asking today is "who should be testing services?" and if more than one role is responsible for testing, "who does what?"

There are a number of different proposals on what the best way to test a service is, and who should be undertaking the testing. All of these methods have advantages and disadvantages.

In the remainder of the post when I say unit tests, I refer to both isolated unit tests (testing a method, module or class in isolation) and integrated unit tests (testing a module or class with respect to another module or class).



## Developer Only Testing

This option has the developers undertaking all test case planning, writing and execution via testing tools such as NUnit, MSTest or custom made automated testing harness. The developers performing the testing should not be the ones that wrote the code in the first place.

The traditional test team would need either need to review the validity and successfulness of the testing undertaken by the development team, or the organisation would need to allow for the deployment into production of code that had not been tested by a dedicated testing team.

### Advantages

 - Developers are writing code to test services – this is good, as the test cases can be automated.
 - Ability to use a greater set of tools to test the services, this can cross over into simpler performance, load, scalability and stress testing.
 - The test cases can be included in code-coverage metrics
 - Testing areas are freed up to focus on other aspects of the system (there are generally more developers than testers)

### Disadvantages

 - Developers are under more pressure to write extensive test suites as well as their code
 - Developers will need to spend more time test-planning and not coding
 - Developers are generally speaking, not testing-minded and therefore pose a risk to test-coverage
 - The performance, load, stress and scalability testing needs to occur in production-like environments. Developer environments are, generally, nothing like production.

### Caveats

 - The organisational software development process would need to change to incorporate either developer-tested promotions to production or give the testing area the authority to reject code promotion based on their analysis of the test-coverage and testing results.



## Developer unit &amp; functional, Tester non-functional

The next approach is to move all more complicated non-functional testing scenarios like performance, scalability, stress and load testing into the domain of the dedicated tester. The tester can then ensure that testing occurs in a production like environment.

The testers would be dependant on the developers providing a level of assurance on the quality of a developer-tested service before non-functional testing could begin.


### Advantages


 - Developers are writing code to test services – this is good as the test cases can be automated.
 - Ability to use a greater set of tools to test the services, this can cross over into simpler performance, load, scalability and stress testing.
 - The test cases can be included in code-coverage metrics
 - Testing areas are freed up to focus on other aspects of the system (there are generally more developers than testers)
 - Testers are handling the testing scenarios that need to occur in dedicated testing environments and as such the results will be more accurate

### Disadvantages


 - Developers are under more pressure to write extensive test cases as well as their code. Although this is reduced in comparison to developer-only testing.
 - Developers will need to spend more time test-planning and not coding
 - Developers are generally speaking, not testing-minded and therefore pose a risk to test-coverage
 - Testers may still require harness and or service-test applications to effectively run the non-functional testing scenarios.

### Caveats


 - The organisational software development process would need to change to incorporate either developer-tested promotions to production or give the testing area the authority to reject code promotion based on their analysis of the test-coverage and testing results.



## Test Requirement Specifications

This method requires a high level of communication between the testing and development teams. For each service the tester will produce a test specification outlining each of the test cases that needs to be performed against the service. This test specification is handed to the developer who will write the automated test cases to test the requirements. The tester is responsible for reviewing the success of the automated functional tests and signing off on the testing that was undertaken.

The developers are still required to design and code unit tests for their service.

### Advantages


 - Developers are writing code to test services – this is good as the test cases can be automated.
 - Ability to use a greater set of tools to test the services, this can cross over into simpler performance, load, scalability and stress testing.
 - The test cases can be included in code-coverage metrics
 - Testing areas are freed up to focus on other aspects of the system (there are generally more developers than testers)
 - Testers are still writing the functional test cases. This will help to ensure that the tests adequately cover the requirements
 - Testers are handling the testing scenarios that need to occur in dedicated testing environments (usually owned by the testing team) and as such the integrity of the tests can be assured

### Disadvantages


 - Developers will need to write additional code on top of their unit tests and actual code
 - Testers may still require harness and or service-test applications to effectively run the non-functional testing scenarios.
 - Not all testers have the technical skill to produce the necessary testing documentation
 - The service documentation needs to be prepared before the service is written so that the testers can provide timely input.

### Caveats


 - The development and testing areas will both need to agree to the new process and the developers and testers will need to work closely together to ensure the end product is effectively tested.
 - Efficient test scenario documentation methods like the <a href="http://distributedlife.com/blog/2008/02/test-case-structure.html">Action-Target-Scenario</a> method should be used to bring the test cases into manageable chunks for the developers.



## Tester Focused Testing via Dedicated Service Testers

If the capability is available it is possible for testers to write the functional test code to test the services. This would remove the need to for developers to write functional testing code but comes with its own set of problems:

The testing team would be required to hire dedicated test coders. These testers would require a skill-set above and beyond standard automation scripting and would require knowledge of the organisation development environment, practices and languages. For all intents and purposes the tester should be a developer with experience in testing.


### Advantages


 - Developers are writing no more code than they are now
 - The services are still being tested by reusable automatable code
 - Ability to use a greater set of tools to test the services, this can cross over into simpler performance, load, scalability and stress testing.
 - The test cases can be included in code-coverage metrics
 - Testers are still writing the functional test cases. This will help to ensure that the tests adequately cover the requirements
 - Testers are handling the testing scenarios that need to occur in dedicated testing environments (usually owned by the testing team) and as such the integrity of the tests can be assured

### Disadvantages


 - Coding Testers will need to be hired and as their skill set covers both developer and tester, they are not cheap.
 - A testing development environment would need to be established to allow for the development of functional tests
 - Licensing costs of providing the automation developers with Visual Studio, TFS and any other productivity tools similar to what the development team has.
 - Who tests the tester’s test cases?

### Caveats


 - None as yet



## Tester Focused Testing via Service Testing Tools

The final and generally considered the acceptable path to date is, the testing of services via a service testing tool. The involves the purchasing of a 3rd party product which is responsible for analysing the service and data contracts and allowing testers to script up test cases to test those services.

### Advantages


 - Ability to integrate the test execution into existing test tool frameworks
 - Automation Testers are more easily available due to the simpler skill set
 - The implementation details are abstracted away via the service testing tool, this can make it easier to produce test cases
 - Validation of results sets is not as simple as a coded solution

### Disadvantages


 - Service testing tools easily cover SOAP services but many do not yet cover WCF services
 - Service testing tools essentially shove a user interface onto something that was never meant to have one. This can increase the load of the automation tool and may impact the accuracy of non-functional testing results
 - Although automation developers are easier to find, they are still harder to find than regular manual testers.

### Caveats


 - Organisation is required to purchase additional tools to test services.
