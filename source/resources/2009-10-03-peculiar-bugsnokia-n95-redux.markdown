---
layout: resource
title: "Peculiar Bugs: Nokia N95"
date: 2009-10-03 23:55:48
updated: 2013-11
tags: defects
---
If you stop the standard music player at about one second it will stop, but there is a delay between when you press the button and when the music player receives the event and when the UI updates. You’ll either get the next song or the current song at zero seconds remaining and with a broken progress bar.

Pressing play to unpause the song will briefly play before pausing the song again. It’s not possible to play the song without skipping forward.