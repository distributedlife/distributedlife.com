---
layout: resource
title: Service Documentation & Testing Implications
date: 2008-09-24 23:55:56
tags: service testing
---

**When service documentation is produced** impacts how it is tested and who tests it. Services are an IT solution to a Business problem. This often means that the decision to create a service occurs after the requirements discovery phase and is the decision is made by the coding team, not the business itself.

This causes a fundamental problem for testers. Testers rely on documentation for requirements, for expectations and to get an understanding of the software under test. Service documentation, because it lies outside the domain of the business analyst, is written by the coder. This impacts testing in two ways. The first is that the documentation produced is not for consumption by non-technical team members. The second is that **following traditional software development methodologies**, the documentation is produced after the fact, if at all.

An organisation cannot wait until the coder has; written the service, tested it, written the documentation, have the tester write the test cases, tested it in isolation and finally to integration test it.

**Regardless of who tests services,** coders or dedicated testers, **the documentation needs to be produced first**. With dedicated testers there is potential to parallelise coding and developer testing with dedicated test case writing and [if you believe in conditional proofs](/resources/testing-soa-service-dependencies-and-their-impacts-on-testing.html), some degree of concurrency is additionally possible with service in isolation testing and service integration testing.

If the developer is going to test it all, and I know some want to, you now have one person documenting, coding and performing four levels of testing on a single product. This bottleneck leads me back to the point of your organisation not wanting to wait until for all this work to be completed in a linear way.

**To parallelise the software development process**, you need to include dedicated testers on your service projects. To bring dedicated testers onto your service projects you need to produce your documentation first.

The one caveat in all of this is that you shouldn’t change how you document your services. Service documents are still technical documents**. You need to include suitably skilled testers on these projects.**

