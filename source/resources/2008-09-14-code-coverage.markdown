---
layout: resource
title: Code Coverage
date: 2008-09-14 23:55:03
updated: 2013-11-24
tags: development
---
Code coverage is the degree to which the unit tests execute each line of the source code.  I like code coverage. Code coverage indicates which lines of code have no tests. This would be where code coverage is low or even zero. Code coverage can also give you a false sense of security. A covered line of code is not the same as a tested line of code. Test coverage is the percentage of tests that cover 'requirements'.

I'll use an example to illustrate my point. I have a reciprocal function. You pass in a number and it returns the reciprocal. A reciprocal returns the a number, that when multiplied against the original number results in 1.

### Our Code

<code id="gist-7559563" data-file="reciprocal.cc"></code>

### Our Unit Test

- Assert.AreEqual (1.0f, reciprocal (1.0f)) ;

### Our Coverage

 - Statement Coverage = 100%
 - Branch Coverage = 100%
 
Those that aim for 100% code coverage are done. Those going for test coverage are not done. Test coverage requires us to include tests for 0 and -1. Both of which will fail for different reasons.

 - The reciprocal of zero will result in a divide by zero error
 - The reciprocal of -1 is -1 and not -0.5 as this function would work out.

Code coverage, like many other tools, figures, statistics and adages, are designed to impart information. Making an educated decision based upon such information is where you come in.