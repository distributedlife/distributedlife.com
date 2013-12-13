---
title: Games for Testers - Logic Puzzles
date: 2010-04-26 23:55:36
tags: distributedlife, games, logic-puzzle, practice, ryan-boucher, rybo, software-testing, testing, 
---
One of my favourite games for enjoyment and testing practice, aside from testing itself, is logic puzzles and one particular type of puzzle, the grid logic puzzle.

You are probably seen this type of puzzle before:

![Logic Puzzle Grid](/images/logic-puzzle-01.png)

The objective is to work out an answer to the puzzle from the set of statements. An example of a question is "Who won the 100m hurdle competition?" or "[Who owns the Zebra?](http://en.wikipedia.org/wiki/Zebra_Puzzle)" and the set of statements for this puzzle:

![Logic Puzzle Clues](/images/logic-puzzle-02.png)

Using these statements you use deduction to work out the final answer. For example: "Colton didn’t award the swimming or camping merit badge" means exactly that and you would cross of Colton from swimming and the camping merit badge. This reduces the set of possible badges to basketry and horsemanship.

This is then combined with other statements: "Of Colton and Ella, one earned the $870 reward and the other award the camping merit badge."

We know that Colton didn’t award the camping merit badge; therefore Colton must have received the $870 reward and Ella awarded the camping merit badge.

It’s not all as obvious as this; as the easy clues are used up you have to rely on techniques like supposition to identify positive or negative outcomes.

The benefit this is for testers is that it practices your ability to understand the relationships between seemingly disjointed pieces of information. You may testing an existing application and uncover a new business rule; this new rule is the same as a statement in a logic puzzle; you take all the information you have and apply the new rule in the hope of coming up with new test scenarios to execute.

Logic puzzles leverage English (or the language of choice) to make statements that can appear confusing or illogical but obviously they always are. This can provide practice for collecting software requirements from analysts or stakeholders; each requirement is another statement and you may realise before the project even begins whether something is feasible or not.

If you want to practice some logic puzzles; the website [logic-puzzles.org](http://www.logic-puzzles.org/) appears to have a large collection and no doubt there are other sites on the web. If you want something to practice on the train then I recommend grabbing a logic puzzle book; when I was younger the newsagent always carried them.