---
layout: resource
title: Service Mockery and Automated Integration Testing 
date: 2008-10-10 23:55:52
tags: service testing
---
Service integration testing is an increasingly complicated task depending on how service interactions are defined. When you get to service orchestration and choreography then your integration testing is complex.

Ideally services, due to their nature, should have as much testing as possible automated. Automating all this **is possible** but like everything the cost to effort ratio needs to be worked out. If the coders and testers work together then there is a solution to maximise the benefits from the effort.

When the coder is testing their service they will test the service internals (unit in isolation, unit integration testing) before moving to the service contract. If their service has dependencies on other services then they will probably mock out those services based on the service contract to effectively isolate the service and test it. With the clever use of mocks, the coder can establish a set of tests to perform some degree of non-functional testing (availability for example).

As they are by themselves these mocks are not being reused by other consumers of the mocked service, this means that each coder will need to mock the service for its own uses. This is fairly common; with some of the cool mocking frameworks out there it is easy to quickly mock out your dependencies.

I propose that the coders build up a shared mock library for use in service testing. Like coffee it has its disadvantages but its advantages extend into the realm of the tester as well.

### Mock libraries

One of the biggest problems with a mock library is the need to maintain mocks over the course of development. Not only do unit tests need to be maintained, but mocks as well. The second is the need to manage the versioning of mock services with their versioned service counterparts. Without these two things then the mock library will get out of date and fall into disuse.

On top of this in a large development shop you have the problem of mock discovery, where it is stored in version control, mock ownership. I could wrap it all in the grandiose term Mock Governance but in reality it isn’t that complicated and doesn’t need that much management. It just needs to be thought about before you start.

The benefits of a mock library are such that each service has this framework of code around it to ensure that it works correctly. As you build the service, unit tests are written to make sure the internals work correctly. As its consumers are being built, mocks are being written to ensure that they handle the services behaviour correctly.

A bigger benefit is seen when we move into the** established integration testing environments**. When the testers get their hand on the service code they are going to try and do two things. Test the service interfaces to see if they work and secondly; test the service integration to make sure that they services work together.

The service integration as mentioned before is the hard part. With many possible combinations of services and a variety of behaviours coming out of each service the permutations can escalate out of control. Naturally not everything can be tested and what can be tested can be made easier.

### Automated Integration Testing

If you take a tool like [Capistrano](http://www.capistranorb.com/) and use it to build a suite of deployment scripts. These scripts deploy combinations of real services and mock services automatically. These scripts become your automated integration tests. You can setup your integration environment to simulate the deployment of one service and five mock services to see how it handles the unavailability of its dependencies. You could deploy the real version of all the services to your performance testing environment. Add a mock consumer to simulate the UI layer and you can generate some load on your services to see how it handles.

If you have a virtualisation server sitting idle you can spin up multiple instances of your service integration at the same time. This can reduce the time to test. When testing integration you don’t always need the entire environment replicated for your test, just the nodes that are within the scope of your test.

### Why not service testing tools?

Service testing tools basically provide a wrapper UI for a service. This allows the tester to generate test scripts for validating the interface. The coders however, tested that when they tested the service in isolation. The tester should verify the results, but there is no need to duplicate the effort.

The next problem is that if the service has dependencies and they don’t exist, how is a UI wrapper to the service going to help? You are going to find out how well the service handles not having any of its dependencies but you won’t be able to handle any other integration scenarios.

If you ever get to a situation where at least one service in development is lagging behind your integration testing has to wait. Why wait when you can mock and prove that the service behaves under specific scenarios. When you finally get your complete set of services, you can perform full end to end tests using live versions.

It’s not all sour for service testing tools, some tools do handle aspects of load generation and service result verification, but the way I see **it’s a lot of money spent and you are not even getting the benefit of automated service integration testing**. The complexity of service integration is what makes testing services hard. In comparison service interface testing is trivial.

### Why don’t the coders write the Integration tests?

I said that the testers would be writing these inherently code-like scripts. The coders can if they want, there is no reason that they can’t but there are couple of considerations to be kept in mind before making the decision.

The first the skilling issue and whether or not your developers have the necessary skill set and mindset to adequately create the right scripts to provide good test coverage. The second is a resourcing issue. You have N number of developers. Do they have time to write integration tests as well as their unit and service in isolation testing? If they do, good, I’m sure they will get a kick out of writing scripts to spin up virtual machines establish the system under test, let it loose and bring it all down again. It is pretty cool.

### A Final Sell

There are other benefits to come all of this. Deployment testing is given a solid workout with each integration test potentially establishing the system under test each time it is run. The automated integration testing scripts can be reused for future work and can be included in a continuous integration server that exercises each new build. It would be nice to know that when I make a code change I can still see whether my service is still integrating with it consumers and dependencies.

The scripts can be used to develop scoped performance, load and stress tests. By creating mocks that enact scenarios of high load (high latency or low throughput) you more easily determine if your load balancer will scale up or out correctly.