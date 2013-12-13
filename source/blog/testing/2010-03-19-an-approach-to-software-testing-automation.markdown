---
title: An approach to software testing automation
date: 2010-03-19 23:55:39
tags: automation, development, distributedlife, ryan-boucher, rybo, service-testing, software-testing, testing, testing, ui-automation, 
---
Let me talk about the standard issues I hear with software testing automation:

 - **Breaks under change** – when you’re software changes your automated checks break and you have to fix them all.
 - **Personnel dependant** – A particular person or a small group of people produces the vast majority of the tests and when those people leave the scripts can’t be maintained. New automation developers would rather rewrite the scripts than work out what is going on
 - **High barrier to use** – automation testers have a large hurdle to get over before they can use the tools. Often

You know what. It doesn’t have to be this way. I’m not going to talk about all aspects of automation; that’s a topic for the automation strategy. This is about an automation approach to solve the issues listed above.

Most of the problems I see with automation are due to a lack of a preparation. Not before you write your current script but before you write your first script. How you write your scripts and separate your test code is no different to software development and the sooner automation testers realise this, the better.

Software development has been coping with the design/reuse issue for many years and we should be learning from them.

Here is the layer diagram for your classes. I am going to tell you what each of these layers means and will talk about how to take existing scripts and rewrite them using this approach.

![the call dependencies in automation scripts](/images/DSC_3825.jpg)

The first step to look at your current test scripts and break your code up into one of three groups:

 - **Fixtures** – data setup and result validation should be in this group
 - **Pipeline** – this is the code that enables your automation. In services it is the actual service call in UI automation it is the code that gets you to the screen you care about or interacts with the screen.
 - **Test Scripts** – this is the code that does the work it and isn’t a fixture or pipeline. When you first look a script you will see fixtures and pipeline code. The stuff that isn’t that; is test scripts.


### Language
Before I get to each section you need to ensure that you use the correct language in your scripts and functions. This means that you should use the business language in your method names. The second language you should use after the business language is the testing language. This will help your scripts read like manual test scripts and will reduce the barrier to comprehension. Third is to use the language of developers.

Code that alters the state of data should be named using a verb in the business language:

 - DeductFundsFromCustomerAccount

Code the returns a value should use either get or is depending on whether the result is a value or a Boolean:

 - IsAccountBankrupt
 - GetAccountBalance

I use check when the method reports the error on my behalf. If you have a method that checks the validity of a drivers licence then I would have the following function:

 - CheckDriversLicenceIsValid (“3434343”)

I use a more development like setup when the method returns the result to me:

 - IsDriversLicenceValid (“3434343”)


### Fixtures
Take a look at your fixture code and try and encapsulate it into reusable methods. You should try and avoid fixtures that change the location of the user. By this I mean do not change screens or controls on a screen. These belong in the pipeline section which I will discuss that next.

Your fixture should be achieving one of the following:

 - Establishment of state data
 - Checking of result data

Your script should have few dependencies on pipeline code. It is possible but when you see the layer diagram I’ve put fixtures at level with the pipeline code. Why we do this is to reduce our dependency on the current layout of the screen or service contract.

I’ll provide an example:

You have a fixture that sets up a customer address. Your fixture might navigate to that module and then run through the address creation process. If the UI gets redesigned then you will have to update your fixture and the pipeline code. Had your written the fixture to directly configure the data store then you would not have to make change.

All this being said; it isn’t always a simple undertaking to directly update the data store. If the model is too complex or the store exists in another organisation you may not be able to do it or you may cause more problems than you solve. Data stores do change over time but in my experience they change less frequently than user interfaces. Furthermore when the data store does change there is often less effort involved in altering the procedure.

When you write a fixture you should weigh up the impact of change versus the complexity of implementing the fixture. In all cases you are creating more robust code because only the fixture changes when the application changes. If you had kept the fixture code in your test case then every test will have to change with the application.

Fixtures that validate results should do it separately from pipeline code. It is better that the test scripts extract the value using a pipeline method and pass the value to a fixture rather than coupling the two together. If you do this you won’t be able to write validation methods that can be used on any screen. Rather you’ll be forced to write one for each screen and the goal is to reduce the number of methods you write so that when change occurs you have less to do.

### Pipeline
Pipeline code is code that gets the user to a screen, invokes an action or calls a service. It’s the doing part of the test but must not involve any actual validation. This is important because there is often more than one way to perform an action or navigate to screen.

Each time you need to get to a screen you can write a new pipeline method to do that for you. The premise behind this is; if you wanted to be sure that a module behaves the same way when you get to it from two different locations you can write an automated test, copy it and then change the pipeline code. All the other code should be same.

For service testing; as [I’ve written in previous articles](/blog/2010/03/improving-hp-service-testing-summary.html) the pipeline code is straight forward. When you write UI automation code you will have pipeline code that does one of the following:

 - **Interaction** – clicking, typing, tabbing, etc
 - **Navigation** – moving from one location to another
 - **Result extraction** – getting the value from a control or screen and providing in a consistent way to easily pass into a fixture.

Try to name your pipeline methods in a way that makes it obvious what it does remembering to use the business language.

 - NavigateTo.AddressScreen
 - EnterCityValue.OnAddressScreen (Canberra)
 - GetCityValue.FromAddressScreen (parameter)

The naming convention you use it up to the cultural and language characteristics of where you work. Whatever you decide to do; try to make your test code it read like a manual test script. I can’t stress this enough. Reducing the barriers to test automation is about speaking a common language and the test language is one that testers know best.

When you write pipeline code we have the opportunity to leverage other pipeline code. Each tier of pipeline code should become more general as you go down. You don’t want your Address Screen pipeline code being dependant on the Banking Screen pipeline code. You should extract the common aspect and make it into a pipeline method that they both use.

### Libraries
When you’re extracting your fixture and pipeline code out of your test scripts you will notice that there are two types of methods. Those that are directly tied to your application and business domain and ones that could apply to any automated test anywhere.

A fixture that gets the current time from an Oracle database is one such function that could run in any script in any organisation.

These methods you should separate from your fixtures and pipeline functions and put them into a library. You’ll use these and the libraries provided by your language and automation tool to compose your fixtures and pipeline functions.

This separation will improve the reusability of your code. It may also mean that if you change automation tools you will have less work to do. You’ll still have a lot of work but it would be less than if you didn’t make this separation.

### Managing Change
So how does all this improve the robustness of your test scripts?

I’ll go through the changes you can expect whilst developing automation scripts and how this approach will help you.

**UI layout changes** – if the layout changes but not the actual content then depending on your tool you may need to do nothing at all. It’s always best to write pipeline methods that don’t rely on screen resolutions, visible area or x and y coordinates. If you do have to make changes then you will only have to change the impacted pipeline methods. You’re tests should not have to change.

**UI content changes** – If the content of a screen changes then you will always have changes as you have to write checks for the new features and delete some no longer applicable checks. Checks for existing content should not have to change unless there is a layout change as described above.

**UI navigation changes** – if the navigation to a module changes you will have some pipeline changes. This is just like a layout change but could impact many tests. Consider a new home page for your website. This may seem like a big change but if you have tiered your pipeline functions correctly then you will only need to make a few changes to those pipeline functions and any impact on actual test can be fixed with a find and replace across your source base.

**Data store changes** – if your data store changes; and this does occur in organisational change processes then you will have fixture changes to make. Once again the impact of your change has been localised to a small set of methods rather than thousands of tests.

**Service contract changes** – [I’ve discussed this before when writing about the service pipeline](/blog/2010/02/improving-hp-service-test-part-4.html) when the service contract changes we will have to write new tests and delete old ones. This is like a UI content change; we have to make some changes but the impact to all other test should be zero.

**Service response data contract changes** – if the service contract changes then we will have to change a few tests like a contract change but once again we are looking at fixture changes and pipeline changes; not thousands of tests.

### Conclusions
The bottom line in all of this is if writing tests is easy we won’t have any issues writing new ones, deleting old ones or updating fixtures. Automation shouldn’t be hard and with a well structured approach we can reduce the barriers to test automation by making change possible.

We’ve simplified the language we use to that off the business and the profession rather than a programming language. This makes automation easier to teach because automation testers are speaking the same language as manual testers.

Finally you can be assured that when your main automation tester leaves the organisation or falls under the proverbial bus you will be able to reuse their contributions without have to re-write the entire test suite again or let it fall be the wayside.