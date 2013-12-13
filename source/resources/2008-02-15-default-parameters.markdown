---
layout: resource
title: Default Parameters
date: 2008-02-15
updated: 2013-11-12
tags: development
---
The original article I wrote was about how I had burned myself using default parameters. Because of this I cautioned against them. I've reviewed my own post puncuated with what I think now.

> I no longer like default parameters. Three times in the past week I have been caught out by default parameters, some of it in my own code! You would think I would know what is going on.

Such a strange expectation to have. If I write the code then I understand how it works. Having not seen the code for five years I no longer know how it works. One's understanding of the code they have written has a half life. 
The code didn't have any unit tests. The code was produced by three developers of varying skill levels. None of the developers, including myself, wrote clear code.

> I like default parameters, I think they are are good way of allowing optional parameters on interfaces and they can provide an automatic suite of function overloads. However, when it comes to refactoring and debugging they can be hazardous.

I no longer consider this true. If you want to provide an interface, do it with well named functions. This may call down to your shared code that uses default parameters. Default parameters don't belong on interfaces. I consider the usability of my APIs as important.

> The first scenario was when I was refactoring some collection code to accept a "catalogue" type that would define what is allowed in the collection. This code wasn't my own but I had designed the overall solution. Anyway every parameter on the collection constructor had a default value (one may argue, why have parameters at all, but there was a fair bit going on behind the scenes). I removed some no redundant parameters and added my catalogue. No compiler errors but the code didn't work. I had made changes to about 3 classes for this change, so it took a little while to work out what I had done wrong.

OK. There are two problems here. The first is there are no tests. "No compiler errors but the code didn't work". I put too much faith in computers to tell me when I get it wrong. Write a test. 

Problem two: I had to make a change in three classes. There is a smell here. I have coupling that should not be there. I am probably *newing* up my collaborators. I could decouple the constructor interface using a factory pattern. 

> I had forgotten to take a parameter out of some calling code, and because the defaults were optional, this parameter was pushed down the list. Hence no compiler error, and technically a valid object, it just wasn't what my code was expecting. A while later we're in Crash-ville. Naturally I should have (and this was how I resolved it) found the references to the constructor and made sure they were correct. This was only a right-click away but I had gotten lazy on compiler warnings.

I had gotten lazy? I was already lazy. Write a test! It's that simple. Debugging is the clue you don't know what is going on. Set down some expectations and execute those tests.

> The second scenario was a bit of a doozy. It relates to the same set of objects. The catalogue has a function that when an object is passed to it, it returns true if the object is a match for the catalogue, false if it isn't. There is a default parameter that specifies whether the object passed in should update some information inside the catalogue. I only needed the update in a few places (less than I don't need it), so the default is false (or don't update).

Perhaps a strategy pattern would be better. Find out when you want to do the update and then, in those circumstances, dispatch that code.

> my code reads something like this:
<code id="gist-7422799" data-file="1.cpp"></code>

I appear to have puked code onto my keyboard. Still, there are no compiler errors, so it probably works.

> Now, that code compiles and works fine for a number of test scenarios. However, it always evaluates to 'true'. The reason is, the true at the end of the if-statement should be a parameter inside isMatch, but it isn't so isMatch defaults (giving me incorrect logic) and the true is evaluated by the comma-operator. Fun-times.

OK. That is a nasty. Still, a test would have found that. Those test scenarios mentioned above are, no doubt, manually executed. Or, I was stepping through the debugger.

> The correct if-statement is:
<code id="gist-7422799" data-file="2.cpp"></code>

> With the context removed my original code is resembling something similar to this:
<code id="gist-7422799" data-file="3.cpp"></code>

> In reality I should have named my methods better (Yes, I know, I harp on about test-case naming conventions and then do this).
<code id="gist-7422799" data-file="4.cpp"></code>

> I no longer have default parameters and I do have code that works. I suspect my usage of default parameters will approach zero from here on in. I won't discount them entirely as that is foolish, I'll just think twice before using them.

My suspicions were true. My use of default parameters did approach zero. The good news is that I write a lot more tests. Not because of this day. A shame really. It should have been a wake up call. It's hard to treat the problem when you spend all your time on the symptoms.