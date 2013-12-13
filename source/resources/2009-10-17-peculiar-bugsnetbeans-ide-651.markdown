---
layout: resource
title: "Peculiar Bugs: NetBeans IDE 6.5.1"
date: 2009-10-17 23:55:31
updated: 2013-11
tags: defects
---
This one is from NetBeans IDE 6.5.1

Cursor is at bottom of page and </HTML> tag is left aligned

![Netbeans Working 001](/images/netbeans001.png)

Hit Enter

![NetBeans working 002](/images/netbeans002.png)

New line is added. This is our expected behaviour.

If we indent the </HTML> before we start...like so

![NetBeans Borked 001](/images/netbeans003.png)

Hit Enter

![NetBeans Borked 002](/images/netbeans004.png)

The line was added but the cursor moved up to the end of the last line...

![NetBeans Borked 003](/images/netbeans005.png)

The cursor is now in the middle of the </html> tag and hitting enter again will of course start to work as expected.

![NetBeans Borked 004](/images/netbeans006.png)

So very odd