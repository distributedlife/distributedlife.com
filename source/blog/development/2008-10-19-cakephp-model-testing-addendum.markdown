---
title: CakePHP Model Testing Addendum
date: 2008-10-19 23:55:43
tags: cakephp, cakephp, model, testing, testing, 
---
Something that I didn’t think of <a href="http://distributedlife.com/blog/2008/10/cakephp-unit-testing-gotchas.html">the other day</a> is that there is an even better solution to what I posted. Override the query method in the AppModel so that whenever your Models call query the useCache parameter is automatically included.

[code="php""""""""""]
class AppModel extends Model
{
  var $useCache = 'true' ;

  function query ($sql)
  {
    return parent::query ($sql, $this->useCache) ;
  }
}
[/code]

The query signature is different to what I typed above. It uses <a href="http://au2.php.net/func_get_args">func_get_args</a> to support any number of parameters. I don’t use query that way and have taken the shortcut of expecting a fully formed SQL statement and nothing more.