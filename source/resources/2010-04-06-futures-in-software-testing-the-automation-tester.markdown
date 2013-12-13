---
layout: resource
title: Futures in Software Testing – The Automation Tester
date: 2010-04-06 23:55:29
tags: futures in software testing
---
Where I mean an automation tester I am not exclusive talking about someone who spends 100% of their time automating tests. Automation can be used in two contexts; to assist in testing and for the testing and checking of behaviour. Testers who are not dedicated automation testers can leverage the facilitation aspect whilst dedicated automation testers will be interested in both.

At some point I think there is benefit in splitting the automation tester discipline into the facilitation of testing for testers who are not interested in writing automation tests as such a tester can become competent in using automation to assist them whilst not progressing down the path of full time automation.

The dedicated automation tester usually takes one of two roles; Interface testing or UI checking. The former can be subdivided into the application components that are tested (batch processes, services, APIs, etc) and are often named after what they test. As a group they directly interact with the application component interface to test it. I also **specifically mean test** in this context as the** automation tester is designing the test** and executing it by writing the code. It becomes a check after this but the design is the test. The UI Automation tester is primarily responsible for creating build verification tests and regression suites. These are checks but they still have a purpose.

For more information on the testing/checking semantics see [this article by Michael Bolton](http://www.developsense.com/blog/2009/08/testing-vs-checking/) and others he has written on the topic.

The automated discipline is also responsible for developing new testing tools or using automation techniques to make their testing effort easier.

The automated skill set it broken into three lists; common skills and then skills associated with interface testers and UI automation testers.

### Common Skills
**Concepts**

 - Has a solid understanding of the concepts of software development and can apply them in development automation test cases or a automation test framework
 - Understands when automation is the ideal approach for behaviour verification and when it should not be used at all
 - Understands how change impacts automation tests
 - Understands the value of automation with respect to repeated execution against changing environment states
 - Understand the difference between identity and anonymous data and the impacts it has on automated data creation and automated test execution
 - Understanding the difference between data dependant and data independent tests and when to use each one
 - Understands the difference between testing and checking

**Techniques**

 - Can communicate with other infrastructure components programmatically to assist in testing. E.g. calling a database to verify state data
 - Understands mocks and how they can be used for isolating systems under test.
 - Understands stubs and how they can be used for isolating systems under test

**Responsibilities**

 - Write automation tests that are resilient against change
 - Create both state and input data for use within automated tests
 - Use programming languages associated with the infrastructure to assist in testing.
 - Use programming languages associated with the automation tool.
 - Debug automation test code during development and fix broken automation scripts.
 - Use the organisation’s automated testing tool set to execute automated tests
 - Writing new automation tools
 - Evaluation of difference automation tools to identify which one is best for the organisation given specific criterion
 - Define processes for automation code reviews


### Interface Automation Tester Skills
**Concepts**

 - Understanding the role the component plays in the organisation and the impact that has on testing
 - Understands the difference between RPC, Message and Message Bus invocation mechanisms and how that impacts testing.
 - Understands component configuration based on technologies selected by developers

**Concepts, Service Tester**

<em>The following concepts specifically relate to service automation</em>

 - Understands the difference between SOAP, WCF and RESTful services and how they impact service testing
 - Understands service discovery and how that impacts service integration testing.
 - Understands the difference between service orchestration and service choreography and how they impact service integration tests

**Techniques**

 - The analysis of component contracts to identify design issues
 - The analysis of component documentation to identify design issues

**Responsibilities**

 - Analyse the component contract to create test scenarios
 - Analyse component documentation to create test scenarios
 - Identify a change in component contract and update test accordingly
 - Automation the configuration of a component for testing
 - Configuring the component tool to work with non-trivial component configurations
 - Understands the standards associated with component development (SOAP, WCF standards, etc)
 - Communicate effectively with developers to rely potential design or implementation issues

**Aspects**

 - **Input Validation** – testing the component contract with varying forms of invalid data. Considers invalid data in terms of the contract (technical) and invalid data in terms of the business (semantic).
 - **Functionality** – testing the functionality of the component in isolation
 - **Security** – working with the security tester to test the security characteristics of the component from infrastructure and message security to business security implementations.
 - **Compliance** – testing the component to ensure it complies with applicable standards.
 - **Exception Reporting** – testing the component to ensure that it reports exception information correctly and appropriately.
 - **Auditing** – working with the security tester to ensure the component correctly audits requests made to it and that the audit information is secure.
 - **Data Persistence Integrity** – ensuring that any information persisted by the component is done in a consistent manner.
 - **Negative Testing** – executing a positive test path scenario over an incorrectly configured component to ensure the component gracefully handles the error.
 - **Interoperability **– Testing the component so that it can be used with different technologies (Java vs. dotNet, etc)


### UI Automation Tester Skills
**Concepts**

 - Understands the complexities associated with writing checks for different UI technologies and how that impacts check authoring.
 - Understands the impacts of change on UI automation checks and how to alleviate these issues.
 - Understands the purpose of UI automation and that it is not always focused on identifying bugs that exist now
 - Understands the additional complexities identity data places on UI automation checks especially when it results in custom workflows

**Techniques**

 - Is able to identify when to use UI automation to create data and when to use non UI based techniques.

**Responsibilities**

 - Liaise with the other test disciplines to devise appropriate automation scenarios
 - Develop automation scripts that are resistant to changes in the content and layout of the user interface
 - Work with performance testers to develop automation performance tests that with the user interface

[Here is the PDF document for doing the self assessment](/files/road-map.automation-tester.pdf). Any improvements or suggestions; let me know.