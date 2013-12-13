---
layout: resource
title: Service Testing Focus
date: 2008-09-25 23:55:02
tags: service testing
---
I see the following levels of testing required for testing services, distributed or otherwise.

### Services as a White Box

**Isolation Unit Testing** – The testing of a single method, class or component with respect to itself. Any dependencies are mocked. This is generally referred to as Unit Testing, but I’m trying to avoid confusion here.

**Integration Unit Testing** – the testing of a class or component with respect to other class, components and its consumers. Developers call this integration testing or unit testing. This is where confusion comes in. Testing here doesn’t commence until Isolation Unit Testing has been completed.



### Services as a Black Box

**Services In Isolation Testing** – Testing the service and its interfaces in isolation. External service dependencies are mocked.

**Non Functional Services In Isolation Testing** – Ignoring the wordy name, this is testing the service’s non functional requirements (robustness, performance, stress, load, availability, etc). Not all forms of non-functional testing can be achieved here and not all should be. Availability testing is a good candidate because you can easily mock out broken dependencies to see how gracefully your service handles it.

**Integrated Service Testing** – Testing the service with respect to its other services and consumers. Integrated service testing doesn’t start until the Services in Isolation testing have been completed, unless you are using a [conditional proof system](/resources/testing-soa-service-dependencies-and-their-impacts-on-testing.html).

**Non Functional Integrated Service Testing – **The testing of non-functional requirements of a service with respect to the other services and its consumers. This is what most people think of when undertaking non-functional service testing. The first point I want to make is that some non-functional testing can be pushed forward, before we integrate. While some forms of non-functional testing like robustness; should be tested again. Service orchestration is a prime candidate because while we may know that a service interface can handle dodgy input, we may not realise that inter-service communication is generating dodgy input.