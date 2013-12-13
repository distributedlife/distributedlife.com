---
layout: resource
title: Testing SOA - an introduction
date: 2008-01-10 13:05:00
tags: service testing
---
I might as well start with a fairly large topic and one that puts me in, I feel, an interesting position. The testing of Web services is inherently a technical task in the realm of generally non-technical testers.

There are a number of products out there that attempt to simplify the process of testing services for testing personnel. HP's Service Test, Parasoft's SOAtest, soupUI, etc, but in reality they are just UI wrappers that generate code facilitating communication with the service. Sure they may it easier than cutting your own code to do the same thing and I'm sure some of them auto-generate boundary tests (I don't know if they do but it's not that hard or unreasonable so I'll assume it) but deep down there are couple of issues nagging at me.

### Should testers be testing services in the first place?
I've heard some good arguments for both and I've yet to make up my mind. This is really the basis for all my questions, can I justify who is going to test service code? My decision will impact the direction our organisation takes, so this question, I take very seriously. Currently I see five paths:

 1. Developers test all service code (unit, functional, performance, etc, etc)
 1. Developers perform unit and functionality testing and testers perform performance, scalability, availability, etc.
 1. Testers produce a test-specification which they hand to the developer who will code the tests
 1. Testers cut the code themselves (requires a technical-tester)
 1. Testers use a service testing tool


### How should the testing of services be performed?
Using an SOA test tool? Cutting code? I'll get onto this in more detail once I've given the various tools a solid workout but they haven't convinced me yet and while that isn't a complete write off, I feel if you can't prove your worth immediately, in the one task you do, you're not effective. Then again, cutting code is prone to human error and having to write repetitive code to test a service, arduous. Code Generation anyone?

### How will the testing environment be structured?
Testing services from any perspective is hardly trivial. There are deployment and configuration issues and these impact the viability of testing. I know that it is very easy to spawn a thread at the start of a MS-Test object that creates a service. It then notifies the main test-thread it is ready and testing can commence. The unit-test cases are executed and then everything is cleaned up. This setup would allow a developer to prove a service in the comfort of his own box. It also allows the test cases to be placed on the end of a continuous integration run. However, that deployment of the service will not match how the service is deployed in production. Therefore our testing is only good enough to prove functionality. This leads me to the next question:

### Who, and how are we going to test services for Performance, Scalability, Robustness, Load/Stress, Availability, Configuration and Deployment?
These testing scenarios are complex and often time consuming. Will this move into the realm of the developer or will they remain world of testers? I feel that testing most of the above scenarios requires prod-like configuration and deployment. This automatically moves them out of the development environment where stability is mandated.

### What defines a service from a documentation perspective?
Services are an IT solution to a Business problem and because of that a requirement specification is not going to detail the interfaces on a service. That belongs in a technical specification. Enter Agile and my chances of seeing such specifications are reduced (apologies to all those that use and like Agile. I like it too but in a world where specifications are thin on the ground Agile doesn't appear to make it any easier).

### How do you determine if a service is fit for production?
This may seem like a trivial question but if we were to remove the testers from the equation (and replace them with developer-testers) how do we know that the testing performed by a developer is adequate and proves the service? Years of testing have given me trust issues and organisations generally don't have in place code-promotion paths that bypass the test area.

Have more questions but for the sake of brevity I'll save them for specific topics. Furthermore, I don't plan to answer these questions right away. I'm tackling them all at once at work and when I come up with, what I feel is the answer to a single question. I will put it up here to get some feedback and to share my decision.

Aside from all this I'll be writing and testing some services from a developer perspective. I'll trial the various SOA testing tools to gauge their effectiveness and I'll be having many discussions with my colleagues who are a mix of testers and developers.

Stay tuned