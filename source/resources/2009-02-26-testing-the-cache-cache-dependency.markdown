---
layout: resource
title: Testing the Cache - Cache Dependency
date: 2009-02-26 23:55:26
tags: cache testing
---
The cache dependency policy is one of the harder policies to test because you can't always tell if the source record is coming from the cache or not. Consider a situation where the cached object is updated whenever a particular file is updated. Without updating the file how do you change the file contents such that you can tell that caching is working? You can't and you need to talk to your developer about how well they tested this.

### What the tester can do
What you can do is make sure the cache updates when the file or database record is changed and then you should try a few scenarios around large files or database rows and whether only a portion of a file (or database record) needs to be updated. I'll cover these test cases here:

**Latest information is displayed when dependency is updated** - with this test you can't even tell that the cache is working. The code responsible for getting the data on request could be going to the source every time. If the developer has proven the cache works (see below) then you are confirming that it still works at the application level.

The basic process for testing cache dependency scenarios is the following (note that this doesn’t actually prove the cache but can be used to test other aspects of the cache):

 1. View the object (putting it in the cache)
 1. Change the source (file or database)
 1. View the object again (it should display the updated information)

**Large Cacheable Objects** – This is relevant especially for caches that store file contents. You need to find out how big a file it takes to bring the system down. 2GB is usually a good place to start.

**Partial Dependencies** – if only parts of the file are cached. How does it determine when to update the cached file segments? When the entire file is changed or just that part? How big can a cached part get?



### What the developer can do
Talk to the tester about the level of coverage that needs to be done at the unit test level. I see the following unit tests being required:

In my example I will work with a simple scenario where you have a Data Access Layer (DAL) that is responsible for getting the data from somewhere; a File which is the true source and represents both the File Accessor and the File data itself for brevity and; a Cache which is a big black box that represents what a cache is. When I talk about a Data Object it is a copy of the file contents in memory.

Hopefully this makes sense. If it doesn’t I’ll draw a diagram.

**Test 1** - The DAL is real and Cache is mocked out so that it always returns *Object Not Found In Cache* and the File which is mocked to return a Data Object. This tests that your DAL goes to the cache and then to the true source when required

**Test 2** - The DAL is real and the Cache is mocked out so that it returns a valid Data Object that has an old date time modified and the File which is mocked out to return a different Data Object that has a more recent date time modified. This tests that your DAL will compare the cached Data Object with the true source and should use the File version.

This test case is entirely dependent on how you work out which Data Object is the correct one. You may get the true source and then compare or you may just past a timestamp to the File and ask if the cached time stamp is still valid. In any case you will factor this in when you do your compare. The end result of this test is the DAL should end up getting the latest version of the Data Object from the File.



**Test 3** - The DAL is real and the Cache is mocked out so that it returns a Data Object that has a date time modified of now and the File is mocked out to return a different Data Object that has an older date time modified. This tests that your DAL will compare the cached Data Object with the true source and should use the Cache version.

I won't go into the requisite tests needed to prove that the Cache works correctly or that the File object gets files appropriately. That is out of scope of this post but definitely in scope of your development work. On top of these tests cases we need to do some integration tests between the DAL, the Cache and the File. Let me suggest some:

 - The Cache is empty
 - The Cache had the latest object but we update the File before making the get call. This replicates the full process of the file being changed as it would be in a live system.
 - The Cache has the latest object

The integration tests are there to make sure that while the components work correctly independently or with mocks that they still work correctly together.

### In Summary

When you have a cache dependency policy, go and talk to the developers and get them to cover the code thoroughly as it’s not going to be easy to do at the application level.