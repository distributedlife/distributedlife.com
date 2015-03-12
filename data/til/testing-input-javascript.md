I've done this in the past by drilling down into the fake DOM and then invoking the bound listener directly. It's horrible to read and terribly brittle.

A friend showed me how to do it better. Create a `KeyboardEvent` or, if you so want a `MouseEvent` or a `TouchEvent`. In any way the method calls are the same. Once the event has been initialised add the properties you need and dispatch the event.

I am using jsdom to create a simple DOM.

<script src='https://gist.github.com/distributedlife/a9b4e344a45e2ab3afe7.js'></script>