---
layout: resource
title: The Testing of Services Summary
date: 2008-10-15 23:55:11
tags: service testing
---
The question of how to test services is one that comes with a bit of contention and a lot of 3rd Party tools. Firstly, the contention comes in on who actually performs the testing. Services have no UI and form part of a reusable IT solution to a Business problem. Therefore they are nothing more than a glorified reusable component and its testing should remain in the realm of the developer.

Services are more complicated than that. They are a complete end product. While the Business may not always have specifically requested it, it is an asset to the organisation and its development follows the software development lifecycle from start to finish. The purpose of a service is to be as loosely coupled to any particular Business solution but provide a service to any Business solution that requires it. Therefore testing services sits firmly in the realm of requiring a more dedicated test and from people not responsible for its development. **Independent testing: just like regular software application development.**

In the area of 3rd Party Testing tools, a quick search on the web will show HP, IBM and numerous other vendors all vaunting the tool to solve service testing woes. At present I can see them providing benefit for non-technical testers to test service interfaces and the creation of performance, load and stress tests. Beyond that I don’t see much value. Interface testing via these tools is not currently a scalable solution and the use of a mock library combined with automated integration testing will provide greater reuse of existing resources and can scale with complexity of the service interactions.

The following is a summary of my series of posts about service testing. I may find away to make these sticky or at least more prominent and easier to find. A prominent location will allow me to add additional posts as they occur.

 - [Service Testing Introduction](/resources/testing-soa-an-introduction.html)
 - [Service Dependencies and their impacts on Testing](/resources/testing-soa-service-dependencies-and-their-impacts-on-testing.html)
 - [Service Testing Directions](/resources/service-testing-directions.html)
 - [Non Functional Service Testing Implications](/resources/non-functional-service-testing-implications.html)
 - [Service Documentation & Testing Implications](/resources/service-documentation-testing-implications.html)
 - [Service Testing Focus](/resources/service-testing-focus.html)
 - [Service Mockery and Automated Integration Testing](/resources/service-mockery-and-automated-integration-testing.html)
 - [Service Testing - How it should be done](/resources/service-testing-how-it-should-be-done.html)