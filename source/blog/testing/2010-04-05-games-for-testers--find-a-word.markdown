---
title: Games for Testers – Find a Word
date: 2010-04-05 23:55:20
tags: defect, distributedlife, findaword, puzzle, ryan-boucher, rybo, software-testing, teaching, techniques, testing, training, 
---
I had the opportunity to do some find a word puzzles on the long weekend. These are puzzles that contain a grid of letters and you need to find a number of set words in this grid. Words are arranged vertically, horizontally, diagonally and backwards along any of the preceding directions.

![find-a-word](/images/find-a-word.png)

*[Solar System findaword image courtesy of wikibooks.org](http://en.wikibooks.org/w/index.php?title=File:Solar_System_Word_Find.png&filetimestamp=20060930021411)*

I find this an interesting puzzle for teaching testers because you can illustrate how different techniques exist for finding the words.

One system is to iterate through each letter going across and then down. For each letter does it match the start or end of a word we care about; if it does look in each adjacent position for the next letter of the word; repeat until word found or no match found.

Another process is to look at the entire mass of letter hoping that words you are familiar with jump out at you. Your subconscious processes the mass of letters makes sense of it by identifying patterns and words. Match the words against your list.

A third process is to take the first word and scan through the words looking for the first letter. When found look for the second letter in the adjacent positions. Continue for each letter of the word and then onto the next word.

Each of these techniques has tradeoffs. The first is the most thorough and uses rigorous process to ensure that only one pass is needed to find everything. It may take longer than the other two.

The third technique I find takes less time than the third because the word you are looking for stays fresh in your mind and you’re not looking for all words at once.

The second technique requires the player to know the words already; they have to experience in the language to be able to find the words. The player’s brain won’t pick out the words as the arrangement of letter is no more meaningful than any other random combination. The second technique will identify words more quickly than other techniques but will struggle as the number of available words dwindle.

All three techniques work and some work better for different people; the skill is in knowing when to use the correct technique.

You can liken these three techniques for finding words to different techniques for finding defects. You can be thorough, you can focus on a defect type or you can use your experience and knowledge and defects to spot them out with an approach that isn’t following a predefined method.

Being able to change testing techniques is important because sometimes we need a few quick bugs to keep idle developers busy but we still need to be controlled enough to know when a technique isn’t producing enough and fall back to a different technique that will deliver.