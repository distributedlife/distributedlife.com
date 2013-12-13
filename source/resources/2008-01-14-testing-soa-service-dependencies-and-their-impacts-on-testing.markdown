---
layout: resource
title: Testing SOA- Service dependencies and their impacts on testing
date: 2008-01-14 23:53:00
tags: service testing
---
[A few days ago](/resources/testing-soa-an-introduction.html), I asked a series of questions regarding testing services and whose responsibility it is, how it should tested, etc. Today I’ll provide a solution, but to a different question. Service dependencies and how they can impact testing.

Whilst talking about service dependencies, I will be ignoring the impact of service-deployment-platforms, service implementations, who does the testing and any tools that could be used to assist in testing. I’ll be looking at the services from a testing organisation viewpoint.

From the aforementioned testing viewport there are two types of services: Simple services (including CRUD services), those being services that do not have dependencies on other services and Orchestration services, those that have such dependencies.

As we all know, the only acceptable way to test a service is in isolation. Reducing a service to the infrastructure dependencies that it will have in production will allow a testing team to prove the service for use amongst a bigger solution.

> **Prove:** to validate the functionality of a service through the act of testing

Now, for illustrative purposes I’ll define some example services:

**Person-Service** – CRUD service for a Person Object. Has a dependency on persistent-storage
**Time-Service** – Simple service that returns the time in a particular time zone. Has no external dependencies.
**Searching-Service** – an Orchestration Service that utilises the Person service for searching. Is expected to support other services in the future.

In our example the searching-service is dependant upon the person-service. To test the searching-service the person-service is required to be proved before testing on the searching-service can commence. Failing to do so can invalidate the testing undertaken on searching-service and provide a false level-of-confidence.

> **Conditional Proof:** the validation of a subset of service interfaces to facilitate concurrent development and testing

If timeframes are restricted or concurrent development and testing of services is required then a conditional proof can be organised. In our example this is where the interfaces of the person-service that are required by the searching-service are proved but the entire service itself has not been proved.

Conditional Proofs will allow testing on the searching-service to commence. The only issue is if a different interface on the person-service fails test. In such a scenario the conditional proof is revoked until person-service is fixed and retested once again establishing the original conditional proof or proving the service as a whole.

This may seem implicit to an experienced tester or developer out there. When an aspect of an application is proven (add new-customer address), other dependant code (update customer address) can be tested. However, I believe that when testing services, a more regimented approach to the organisation of testing is required to ensure that all service interfaces are tested against proven dependencies.

To facilitate this I feel a proof-register is required. This can be used within a project team to manage their development and testing responsibilities, or it can be used among a development shop to map which services are stable and what their interfaces are.

A simple spreadsheet listing services and their interfaces and the current state of testing for that interface is all that is required. As can be seen from the example, the searching-service testing has begun on an interface that has a conditional proof.

![service proof register](/images/service-proof-register.JPG)

Now, for 3rd party services, things get a little more complicated. Your organisation for example, may have purchased a simple off-the-shelf Client Relationship Management (CRM) service from Company-XYZ and your organisation wants your searching service to be expanded to include the CRM service in its list of services it searches on.

Now, hopefully your company received a test report from Company-XYZ for the CRM service and you can see what testing has been performed on each interface.

Back in the real world, you have some tough choices. (a) Assume the service is proven and hope it works as written on the brochure or (b) spend precious resources retesting a product that might be sound. I prefer option (c) add the service to your proof-register and set the status for every interface to conditional-proof.

If no bugs are ever raised against the service, then your testing is sound. If a bug is raised, then you can determine which services are reliant on the unproven interface. This will bubble up the service dependency chain and you would be able to identify which interfaces will need to be retested after the fix is applied to your CRM service.

**In summary**: when planning for the testing of services, utilise a process like the one described above to minimise the impacts of defects whilst maximising testing and development concurrency.

 - Services must be tested in isolation.
 - A service’s dependencies must be proved before the service is tested
 - Conditional proofs may allow for some degree of concurrent development and testing
 - Use a proof-register to manage the status of proved services and conditional proofs granted to interfaces.

Oh and before I go, it’s my firm belief that if you purchase an off-the-shelf service, a test-report is a mandatory part of the package. Off-the-shelf applications are generally speaking self-contained and as such any bugs in the application don’t result in the end of the world. Off-the-shelf services that are going to be integrated into your enterprise architecture may just cause the end of your world.