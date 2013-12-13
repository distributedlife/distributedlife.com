---
title: Cryptography, Linux, randomness and virtualisation
date: 2008-10-24 23:20:25
tags: cloud, cloud, crypto, cryptography, entropy, linux, randomness, virtualisation, windows, 
---
<div class="post-text">

/dev/random and /dev/urandom use environmental noise to generate randomness.

With a virtualised server there can be multiple instances of an Operating System on one hardware configuration. These operating systems will all be sourcing their randomness from the same environmental noise.

Does this mean as a group the random number generators strength is reduced as all OS instances are basing their calculations of the same input? Or, is the environmental noise partitioned out so that sharing doesn't occur?

If the latter is true, I can see this reducing the effectiveness of /dev/urandom because it reuses its internal pool and with less environmental input, reduces entropy.

/dev/random should be ok because it blocks until enough noise is acquired... unless of course the OS instances are all sharing the input.

So, the question: What is the impact of virtualisation on cryptographically strong random number generators, specifically those that use environmental noise?

I thin that this would also impact Windows virtualisation because I believe (if Wikipedia is telling the truth) that Windows uses a similar technique.

If you know the answer you can answer it here or on <a href="http://stackoverflow.com/questions/233240/what-is-the-impact-of-virtualisation-on-cryptographically-strong-random-number">StackOverflow</a>. I'm kind curious because a) it's an interesting question and b) I'm working on a project that is going to use Linux, /dev/urandom and be hosted in the cloud.

UPDATE: I got the following comment from tvanfosson (<a href="http://stackoverflow.com/questions/233240/what-is-the-impact-of-virtualisation-on-cryptographically-strong-random-number#233618">link here</a>)
<blockquote>After peeking at the kernel source (actually patch history), it looks like Linux, at least, gathers entropy from keyboard presses, mouse activity, interrupt timing (but not all interrupts), and block device request finishing times. On a virtualized system, I suspect that mouse/keyboard events would be pretty low and thus not contribute to the entropy gathered. Presumably this would be offset by additional network I/O interrupt activity, but it's not clear.</blockquote>
Which is interesting, from what I understand that a system that relies on network I/O for entropy is susceptible to man in the middle attacks. The <a rel="nofollow" href="http://lwn.net/Articles/283103/">follow article</a> that discusses appropriate sources of entropy. Their suggestion is to remove network I/O from the Linux kernel because of its susceptibility.

I think that means that there is possibility for exploiting the common hardware in a virtualised environment. The chance is increased if network I/O is used. Otherwise it is low enough not to be of a concern for all but the most secure of applications. In such instances it probably safer to host your own application anyway.

</div>