---
layout: resource
title: N95 obscure integration bug
date: 2009-02-02 23:56:48
updated: 2013-11
tags: defects
---
While I am here talking about my phone. Let me talk about an obscure bug that exists in the message writer on the N95. I use the phone in dictionary mode and when you are typing a word, an underline appears under the word to indicate it has focus. When a word has focus you can cycle through potential words or append words. This is all standard dictionary mode behaviour.

The N95 also has a rotating screen display. If you tilt it on its side the display goes from portrait to landscape. If you have a word that has focus and rotate the display, the word gets deleted. But only if the word you are typing is at the end, or after, the first line. So the first few words won't cause the error to occur, but once you get to the end of the line or on a second line then an accidental camera rotation will delete your word.

If you don't notice it you can write some obtuse messages.

These applications, the screen rotation and the word editor probably work fine in isolation. It's only the integration of the two components that causes the problem. And then, only in the situation when the word wrap feature is engaged.

Detecting these kinds of bugs during integration testing is not easy.