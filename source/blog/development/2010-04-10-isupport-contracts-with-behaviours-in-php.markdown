---
title: ISupport Contracts with Behaviours in PHP
date: 2010-04-10 23:55:16
tags: behaviour, cakephp, development, distributedlife, integration-test, php, ryan-boucher, rybo, unit-testing, 
---
One of the problems I have with working with the Model-View-Controller setup is that I'm continually reinventing the same functionality in each model and then the same set of tests. This was slowing me down and felt too much like a code smell.

Some frameworks like [CakePHP](http://cakephp.org/) provide behaviours which is a discrete behaviour that can be applied to any Model. This option was close but didn't feel right. I wanted to be more explicit about my behaviours.

So what I did was abstract out common methods into interfaces that use the convention ISupport...

An example is ISupportDeletion which has the following contract:

<code id="gist-7422799" data-file="17.php"></code>

Another example is the ISupportCollections contract:

<code id="gist-7422799" data-file="18.php"></code>

The model then inherits these contracts piecing together promised behaviour from the setting of contracts. I had original thought that the model should only implement interfaces and never add new methods; but this would be pointless as each model would need to implement an interface designed for itself, which is extra coding for no benefit.

<code id="gist-7422799" data-file="19.php"></code>

So there are a bunch of contracts that a model can support:

 - ISupportActiveInactive
 - ISupportCollections
 - ISupportDefaultState
 - ISupportDeletion
 - ISupportFilteredCollections
 - ISupportObjectAccess
 - ISupportSuspendedState
 - ISupportHistory
 - ISupportComments
 - ISupportTags
 - ISupportVersioning

And as I come up with behaviour that belongs to more than one model then it'll become a supported behaviour.

The idea is that the model is really just content but in my MVC setup I require the model manage its own behaviour. This is to stop data oriented code being scattered across the controllers. The controller defines user interaction while the model defines data interaction. Interactions have behaviour and common behaviours are defined in ISupport contracts.

Having an interface isn't enough and does need to be implemented. This is where the behaviour implementations come in. For each ISupport contract there are one or more implementations of behaviour.

For example ISupportDeletion is implemented in two ways

 - LogicalDeleteBehaviour
 - PhysicalDeleteBehaviour

From the perspective of the controller it doesn't care how the model implements the ISupportDeletion contract as long as it does. My user model requires logical deletion whilst most other models require physical deletion.

Let's take a look at the User model cut down to only support deletion

<code id="gist-7422799" data-file="20.php"></code>

As shown the constructer instantiates our logical delete behaviour and accepts the model itself as input. This is needed because the behaviour provides an implementation but is dependent on information in the model. So we dependency inject the model in.

If we were worried about the foot print of these behaviours we could delay their instantiation until needed. The delete operation is nothing more complicated then delegation to the behaviour.

Our behaviours are similar to the command pattern and when the need arises to provide undo support it could be implemented in the behaviour rather than each model.

Let's take a look at a behaviour implementation:

<code id="gist-7422799" data-file="21.php"></code>

The injection of the model is purely required to get the table name and the pk for the model although it could be assumed as id.

I've used inline SQL here but we could be calling a stored proc which would be preferred.

The physical deletion behaviour is not too different:

<code id="gist-7422799" data-file="22.php"></code>

<h3>Testing</h3>
So this just helps us implement behaviour more easily but the big benefit for me was to also simplify the number of tests I had to write. Tests needed to be written in three places:

 - Against the behaviour
 - To prove the model implements the behaviour
 - Integration tests against the model involving multiple behaviours

**Against the behaviour**

These were unit tests against the ISupport contract to prove the implementation of the behaviour. So for the ISupportDeletion contract the following tests were written:

 - Is Already Deleted
 - Is Not Currently Deleted
 - ID Not Supplied
 - ID Does Not Exist

These were encapsulated in a test set object. These tests were written also using dependency injection to provide the model, the implementation and the test runner which contained methods for creating records, etc.

It's all very abstract but a test reads like this:

<code id="gist-7422799" data-file="23.php"></code>

**To test the Model implements Behaviour**

Having tested the behaviour is a good start but we haven't proven the model is even using that behaviour. So we need some tests against the model the proves that it supports the contract. The test looks like this:

<code id="gist-7422799" data-file="24.php"></code>

We instantiate our User object for testing. We then create an instance of the behaviour test set passing in the test runner and the model. We then execute the behaviour test set using the model. This proves the model supports the contract assuming all tests pass.

**Behaviour Integration Tests**

Finally we have scenarios were you want to test logical delete behaviour with the object access behaviour. Object access provides a “Get” operation but given our understanding of what logical deletion is; the get should not return anything.

The behaviour test set for Get can't handle this because it doesn't know if the model uses physical or logical delete if it even supports delete.

So we write integration tests for this:

<code id="gist-7422799" data-file="25.php"></code>

These are just our normal tests that are written from the perspective of the model.

Finally before I go here are some diagrams of how the various objects inherit/interact with each other.

![Interaction Contract Usage](/images/DSC_4012.jpg)

![Model Inheritance &amp; Interaction Contracts](/images/DSC_4011.jpg)

![Behaviour Interaction Contracts](/images/DSC_4010.jpg)