---
layout: resource
title: Service Testing - What are we checking?
date: 2010-02-26 23:55:52
tags: service testing
---
To test a service we need to validate the outcomes of the service. How we validate each service outcome depends on the service. We can verify database contents, we can manually assert out expectations, we can examine emails being sent, inspect RSS feeds or use private twitter accounts to ensure that tweet was posted correctly. We can also fall into traps of validation and do too much, not enough or end up in a situation where our tests never fail.

I’m going to talk about a few of these now and list what you should be testing and why. I won’t worry about the how as that is implementation specific.

### Operations that get data
I’m a firm believer in [data dependant service testing](/resources/data-dependant-service-testing.html) and the prime candidate for this is operations that return data. We are making the assumption that the service operation follows the [Command/Query Separation principle](http://en.wikipedia.org/wiki/Command-query_separation). You can use [data integrity testing](/resources/automated-data-integrity-testing.html) to verify that behaviour too.

The reason why we should be heading towards data dependant testing is that when it comes to complex business objects generating them dynamically before each test takes time, may be beyond the knowledge of the service tester and in some cases may be impossible ((inter-organisational integration systems for example)). We also have the issue that you are adding into the equation that your creation routines could be incorrect and the maintenance issue that accompanies maintaining that code. When you create data via the front end it is as real as it gets.

When we manually assert our data we are being very specific about our expectations. If someone changes the data then the test will fail and you will be alerted. This event shouldn’t occur if you following [this advice about working in a service test environment](/resources/data-dependant-service-testing.html). If you are strict about access, when you have a failing test it is more than likely going to be due to a change in behaviour in the service.

This is what we want.

If we attempt to automate this verification we can fall into a false sense of security. <strong>It’s a trap! </strong>If the service response came from a database and we take the response and compare it back to the database then the test will always pass assuming the service is getting the data correctly. Having a test that always pass will hide certain kinds of defects.

Let’s say that our test was verifying the service can return a string of 1 character. You code this test to check the value against the original data store. You do this to ensure the correct character is returned. If another user changed that data to 2 characters; the test would still pass but it is no longer testing the behaviour. A service change could occur that creates a defect where 1 character strings fail. Your tests would keep passing whilst a bug is lying in production, waiting for the opportune moment.

![services that get data](/images/DSC_3736.png)

### Operations that change data
If you have a service that creates, updates or deletes are record then you are going to have to do more checking. If the service returns a response document you will want to make sure what is returned matches what is in the data store. You can do this automatically. This will ensure that the service response and the data store change match each other.

You should then verify the response document manually; just like a get data test. We need to do this for the same reasons listed above; the data store and service response may have the same data but that doesn’t mean the data is correct. If you verify the response manually it logically implies the data store is verified via a [transitive proposition](http://en.wikipedia.org/wiki/Transitive_closure).

Finally; there is a good chance that data changed and wasn’t returned back to the consumer. In such an event you need to manually inspect the data store to ensure that the change made was correctly done. You should also be employing data integrity testing to ensure that any other changes are being made are valid.

![services that alter data](/images/DSC_3737.png)

### lessons to remember
If the service gets data; verify its response manually

If you service writes data; verify the response against the store and then manually

If you service writes data with no response; verify the data store manually