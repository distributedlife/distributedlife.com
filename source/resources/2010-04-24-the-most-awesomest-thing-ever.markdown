---
layout: resource
title: The Most Awesomest Thing Ever
date: 2010-04-24 23:55:16
tags: user interaction
---
I got a tweet regarding the [Most Awesomest Thing Ever](http://www.mostawesomestthingever.com/) the other day. A site where you choose between two things  in order to determine which is more awesome.

With enough people and enough things you could work out what is most awesome.

![The Most Awesomest Thing Ever](/images/awesome.png)

The problem is that I got stuck. I couldn't work out what was more awesome between two things. They provide a "What This?" link to wikipedia but that isn't enough. I still couldn't work out what is more awesome.

So I quit. And it wasn't event a 2 dollar bill vs. MM's. I mean MM's are made of chocolate which is awesome but it's not as good as chocolate and I can buy chocolate with a $2 dollar bill. Currency would trump that a $2 bill though.

Anyway I quit.

As soon as I did my [user interaction tester](/resources/futures-in-software-testing-the-user-interaction-tester.html) kicked in and asked "why?"

I didn't know what the difference between them was and there was no avenue for me to say "Skip this, I'll work on the next one.".

Now this is where I highlight a system that is implemented correctly. Being able to select which is more awesome of two things is implemented correctly (probably, I didn't actually do any testing on it) but still has a potential issue because the user can't opt-out.

Now, you could argue that this system requires the selection of one or the other two so the user must make a choice. However my [business domain knowledge tester](/resources/futures-in-software-testing-the-business-domain-knowledge-tester.html) is coming to my defence.

The goal was to create a system to allow the identification of the most awesomest thing. If I were to choose one thing over another I consider equal or am unsure of, then the system is forcing me to pollute the results. If I opt-out then the system knows no more and I move onto another comparison. At a later date it may be able to infer my preference through subsequent votes.

Testing is understanding the whole problem not just the solution being implemented. Testing is also making sure that the solution implemented supports the whole problem.

I'm not against the creators of The Most Awesomest Thing Ever. I certainly contributed my fair share of input in their important quest. I just need material to highlight the responsibilities of a tester. We provide feedback on how to make things even more awesome.