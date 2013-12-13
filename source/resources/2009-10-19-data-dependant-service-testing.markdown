---
layout: resource
title: Data Dependant Service Testing
date: 2009-10-19 23:55:21
tags: service testing
---

Service testing is data dependant. It is unrealistic to try and generate all data on the fly. A 2GB file that has to be generated on demand is just slowing your test execution down therefore there must be data created in advance. The creation and continual reliability of this data is important for service testing. I’m going to talk about an approach for managing this data.

How you setup this data depends on what you plan on doing to it. In all cases of data creation a data registry of is required. Each tester can manage their own data in whatever way they feel comfortable. The most important rule is: **if you don’t own the data; you can’t use it. Even if you only want to read it, if it is not yours, you can’t use it.**



### Creating Data

The creation of data is the easiest case to handle. You need data? Easy! You’re creating it! Over time though, you will end up with lots and lots of new records. We also don’t want any created records from impacting existing or upcoming tests; like searching functionality.

You can also fall into the belief that the service is behaving correctly. It might not be and you can end up with half constructed objects in your data store. Anything that is corrupt should be deleted or rolled back after the test has been run and the defect resolved. It’s usually best to wait until the defect has been resolved so the developers have something to work from.

The searching problem is a little bit harder. Something you can do is assign a prefix to your created records. For example: creating a user account you could give all your records a prefix of 9999_ and then whatever data you need afterwards.

If you start to use prefixes I recommend maintaining a list of used prefixes within a particular type of business object. This lets other testers know what data is being created and why.



### Reading Data 

Reading data has the problem that the data has to exist before you start the test. This is more complicated if the service itself doesn’t support creating data and harder again if the data required is [identity data](/resources/identity-specific-and-anonymous-data.html).

If you can automate the data creation within the test then do so otherwise you will have to create the data manually. If you manually create the data in advance then you are going to manage that data to ensure it does not change. If it changes then your test will break. This leads back to my basic rule. **If you didn’t create it; don’t use it.**

One of things you need to consider when testing service operations that read data, is if that data exists in a privileged location. You may need to have multiple instances of the same data at different privilege levels and understand what should happen when that data is viewed by unprivileged users.

All of this will need to go into your data registry otherwise you may use data that is restricted in a test and **it fails not because of the service’s behaviour but because the test isn’t setup correctly.**



### Updating Data

Updating data has similarities to read tests. The data needs to exist before your test commences. Update data has the added complication of if you don’t have the ability to create the data then how do you create data in advance such that it is in a known state before you update it?

If you have the ability to read in the data you are going to update, before you update it, read it in and do some analysis on it. You want to get your data in one of two states. All fields populated or mandatory fields only populated. If all fields are mandatory then look at short strings vs. long strings and if you have enumerations you can try first element vs. last element.

Once you have determined the known state make your update request and set the data to the opposite. So fill all the fields or blank them. If your update is successful then you will be able to compare your before and after shots with one of two expected outcomes and pass the test accordingly.

This way each time your run the test the data flips back and forth and doesn’t require manual intervention.

If you can’t read the data in advance then you should manually manage the state. It’s harder but in the long run it’s better as your tests will be automated.

If you have a create method; use it.



### Deleting Data

This is getting harder and harder. Delete is like update and read, the data has to be there in advanced. The disadvantage is that you can’t toggle between states. It’s either deleted or it isn’t. If your organisation prefers to logically delete rather than physically delete then you can run a script during your setup to “undelete” the data.

If you can’t setup your data automatically then you have some issues. There is no simple solution but there are some things you can do.

Firstly I suggest looking for an automated way of generating the data; not during the test setup but in advance. Ask the database admin to run to do it if you don’t have privileges. Add a prefix to the data if you don’t want it impacting search results. When you generate data in advance, generate lots; like 100,000 records. That way it’ll be a while before the test breaks and if you document the test caveat in your automated script whoever has to fix it has any easier job.

It’s not a great solution but it’s still better than an entirely manual process.

As always if you have a create method; use it.



### Searching for Data

For automated searching tests I find it best to separate your functionality tests from your load, performance and stress tests into separate environments. If you’re setup correctly your organisation should have a performance testing environment with the data it needs to work.

Your searching functionality tests are about trying to ensure the searching algorithm pulls back the correct results when specific criterion are supplied. You don’t need as much data for this as you do for load.

Now that your testing is focusing on specific outcomes you can build your datasets to suit. You’re going to need results sets of specific sizes to test pagination; you’re going to need result sets that are empty. Each dataset can be managed using a field prefix and stored in the same registry you have been using for everything else.

If you have multiple testers working on searching functionality then you can hand out chunks of prefixes to each tester so they spend more time testing and less time maintaining the data registry.



### Identity Data

Identity specific data is more complicated to have setup in advance. Each combination of data needs a user account. It doesn’t take much before the number of users has blown out to unmanageable proportions. What I find work best is have users created in advance that you cannot setup on the fly and with that have a user per service which has the necessary permissions to work but isn’t setup for security testing.

At the start of each test you reset the test user. Deleting all relevant identity data before creating only the data you need to achieve your result. This keeps the number of users down whilst still automating where possible.





### Security

For security testing I’m specifically talking about Authorisation and Authentication. In both cases we have identity specific data and in the case of authorisation the number of privilege permutation often means that we can’t have all our data setup in advance.

With security testing I find it best to setup up one user for each security configuration you have; expired password, suspended account, no privileges, etc. Put them in the registry and let all your service testers use them as need be.

For specific privilege tests then you’re better of using the one user per service approach I mentioned under identity data. You give this user the data you need for the test just before your test.



### The Registry

Your registry doesn’t need to be very complicated. The goal is to document what data you’re using and why with as little effort as possible. I’ve found that I document my data in one of two ways: by some aspect like logically deleted, restricted access, public or by the business object.

The following is a short example of grouping by aspect. As I said before the registry should be simple.

![Data Registry by Aspect](/images/data-registry-by-aspect.png)

And here is an example of a registry grouped by business object. I’ll call the entire spreadsheet by the business object name or I’ll use a single sheet in the workbook for that single business object. I don’t mix business objects ever as it makes finding the data you need hard.

If you find you use certain data more frequently. Move them to the top of the list so you don’t have to scroll to find your most used data.

![Data Registry by Business Object](/images/data-registry-by-business-object.png)