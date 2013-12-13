---
layout: resource
title: Non Functional Service Testing Implications
date: 2008-09-22 23:55:28
tags: service testing
---
Where the services are deployed can also cause testing issues. Ideally services should be deployed to an environment as close to production as possible. Is it load balanced, does it share resources, is it dependant upon other infrastructure components, is the same hardware configurations being used, are some aspects virtualised. This poses some question on where to undertake non-functional testing and who should be doing the testing.

If the developer is doing the testing the service deployment environment will not mirror the production. More often than not the service will be locally deployed on the developer’s machine. While this doesn’t invalidate functionality testing that a developer performs it will invalidate some kinds of non-functional testing such as performance, scalability, stress and load testing. While other forms availability and robustness are still valid forms of testing that can occur.

Replicating the entire production environment is costly but the ideal solution. The problem with any major development shop is that multiple projects are often being developed simultaneously which can have impacts on environment scheduling. Some forms of non-functional testing can take weeks to complete.

When the testing is being performed in tester controlled non-functional environment is there are fewer opportunities to use the automated unit and integration tests written by the developers to validate the application. Often proprietary third party softwares solutions are used which require automation developers to write scripts, that duplicate integration unit tests, and take additional time and resources, to produce, operate and maintain.

In some rare scenarios the development team has the advantage of dedicated non-functional environments. This is a good thing as the earlier an application is tested for performance, stress, load, etc, the earlier design changes can be made and the smaller the cost to the project.

There is not one size fits all solution to this problem. If the money is available to get a production replica for non-functional testing, get one. Scheduling is irrelevant when you have at least one software product being tested at all times. If the money isn’t available replicate important parts of the environment where you can. With **smart people** one can achieve suitable levels of non-functional testing with partial environments.

Where possible educate your developers on how to perform non-functional testing in their own environments. Integrate the solution with the continuous integration and automated testing tools so you can visualise code changes over time. If the dedicated testers are managing the non functional environment (which I prefer) get them to work with the developers to produce some automated non-functional testing tools that leverage the pre-existing unit integration tests in a realistic environment.