---
title: Defensive Programming
date: 2008-06-12 01:42:27
tags: bizzare, development, 
---
I went to uni at the Australian National University and we all worked on a big Solaris setup. Generally speaking it wasn't too bad but on occasion it would become unusable. This would either occur shortly after the new concurrency students learnt about forking and then pondered the age old question about <a href="http://en.wikipedia.org/wiki/Fork_bomb">what would happen if you forked into infinity</a>. The other time is at 3AM every morning when the server was bounced.

Normally the latter scenario was not a problem. However there were occasions when you were working away, completely oblivious to the hour, when the screen would go blank. A quick look up would show you your expression mirrored on your fellow students faces.

To combat this problem I, like many other students, formed that habit of pressing ctrl+s every time we took our fingers off the keyboard or paused for a sentence. I carried this with me for many years after uni and only recently realised that I no longer did this. I blame this one web-based applications that don't support ctrl+s as a save shortcut and working on far too stable operating systems and development environments.

Unfortunately the way I found out I was no longer continually saving my work was when my computer turned off for the first time. This started several months ago over the course of summer. My development area was not in the coolest part of the building and when the computer got too hot it shutdown. This is was pretty easy to fix, just add cooling.

That solved the problem for a little while. The second time it started to occur wasn't directly related to the ambient temperature. It seemed somewhat erratic. It plagued me for about a week before I found the cause. It was only occurring when I was running some performance testing on No Horizons. An OpenGL application running flat-strap on a GeForce 8800 GTX with 768MB of RAM is not normally a problem. However, the later nVidia cards have a variable fan speed. The GPU was running fine until performance testing began. However as the testing wore on the temperature would slowly rise, at a predefined temperature the fan would spin faster. This would require more power. My power supply couldn't meet the demand. Off.

Unfortunately it took three power supply units to work this out. Two toasted in one day. So I installed a 750w power supply. I am not sure why I thought I could get away with 550w PSUs.

So problem solved. Or so I thought. A few weeks ago I installed Vista and installed another 2GB of ram into my dev machine. Within a few days the problem returned. Seemingly localised to late at night on weekends, it wasn't a major problem as I took as a hint to get some sleep.

This time I didn't believe it was the PSU, I suspected it was a power-surge on that circuit. It is winter here and the heaters do suck a bit of juice. No luck, one freezing nights work and it still failed. I also tried moving the computer onto a different circuit in the house. No luck there either. Still I pushed on, the failures were infrequent enough to not distract me from work.

Last week it came to a head when a crash occurred during a compile. This destroyed my outlook centric email and RSS setup and fried my build configuration files. The build stuff was easy to replace with a revert to the latest check-in and a bit of rework to cover what had been written since the last commit. The outlook file took me close to a week to fix, including re-subscribing to all my rss feeds and buying an app to recover my pst file because outlook couldn't do it. Vista couldn't copy the file either.

After this I tested without the new RAM, then without the sound card and was going to test without the GPU but the computer switched off twice whilst running a CHKDSK. The CHKDSK completed eventually which means the GPU is probably ok. There isn't much visual stress occurring during a CHKDSK. As the CHKDSK and a defrag both managed to complete without errors the HDDs are probably ok. That pretty much leaves the CPU, motherboard and PSU left to test.

The CPU and motherboard are a lot harder to directly test as I don't have immediate replacements. However their may be an easier way. Buy a new more expensive, greater wattage PSU this weekend and see if the computer still turns off. There may also be a lazier option. A friend suggested just buying a UPS and being done with this tale of woe.

Unfortunately the UPS is only a good idea if the problem is the PSU. If the cpu or mobo is failing then a UPS is not going to help. I suspect I'll buy whichever is cheaper this weekend. Wish me luck!

<strong>notes:</strong>
<ul>
	<li>blogger uses ctrl+s, wordpress doesn't.... ironic?</li>
	<li>This was going to be posted two days ago but I had this problem with my computer turning off...</li>
</ul>