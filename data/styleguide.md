# Separating Sections

## An inline header
It's important to mention reflexes at this point. When talking to other people about reactions we seem to confuse reflexes and reactions. Both a fast responses from our body, but there is a difference between the two.

### An inline subheader
Reflexes are the unconscious reactions of your body to a stimulus. The patellar reflex, or knee-jerk, of your leg kicking when your knee is tapped in the correct spot is an example of an unconscious response from our body. As they are unconscious they are of little interest to game design.

#### Four levels deep is a big excessive
We are going to talk about three types of stimulus or cue that are used to trigger a reaction test. Seeing the cue (vision), hearing the cue and feeling the cue (tactile).

In the *100m Sprint* it's the sound of the starter's pistol that sets the runners off. In *Duck Duck Goose*, the touch on the head starts the chase and in *Jungle Speed* it's seeing a matching pair of symbols that starts the violent grab for the token.

Humans react to different stimulus at different speeds. Audible cues are reacted to fastest, then vision and finally tactile. This is important when adding these elements to your game. As you make your reaction tests harder your players will need to rely on audio cues more and more.

##### Really? Five!?
We can make reaction games harder by slowly reducing the amount of time the player has before they must respond. If they take too long they automatically fail.

This is a very common aspect of endless runner games. Take a look at Temple Run, Super Hexagon and Canabalt. All three of them require the player to react within a certain time period. If you wait too long then you lose.

###### Stop it now.
Return to the Wild West. Two players, forty paces apart facing each other. One of them takes their neckerchief off and throws it high into the air. The first to press the trigger on their controller, after the neckerchief touches the ground, wins. This is a reaction game.

This is a paragraph the contains a link to moar content: [the blog](http://distributedlife.com).

And now a quote from the movie The Counselor:

> Some believe that death is meaningless. I don't believe this. My family are all dead and it's my life that is meaningless.

## Polariod Image
<div class="polaroid">
  <figure>
    <img src="https://s-media-cache-ak0.pinimg.com/236x/79/ec/4a/79ec4a8b7d903a3d75813b7f09b78da1.jpg" alt="Manual image"/>
    <figcaption>And I will whisper: "no."</figcaption>
  </figure>
</div>

## Markdown Image
![And I will whisper no.](https://s-media-cache-ak0.pinimg.com/236x/79/ec/4a/79ec4a8b7d903a3d75813b7f09b78da1.jpg)

## An Ordered List
1. First
1. Second
1. Third

## An Unordered List
- Milk
- Coffee Beans
- Icing Sugar

## Source Code
A friend showed me how to do it better. Create a `KeyboardEvent` or, if you so want a `MouseEvent` or a `TouchEvent`. In any way the method calls are the same. After the event initialises, add the properties you need and dispatch the event.

~~~javascript
var expect = require('expect');
var jsdom = require('jsdom').jsdom;

describe('Atom', function() {
  var document;

  beforeEach(function() {
    document = jsdom(undefined, {});
  });

  describe('when type a single key', function() {
    var atom = {
      input: {
        _pressed: {},
        onkeydown: function(e) {
          this._pressed[e.KeyCode] = true;
        },
        pressed: function(action) { return this._pressed[action]; }
      }
    };

    beforeEach(function() {
      document.onkeydown = atom.input.onkeydown.bind(atom.input);

      var event = new document.createEvent('KeyboardEvent');
      event.initEvent('keydown', true, true);
      event.keyCode = 37;
      document.dispatchEvent(event);
    });

    it('should register the key pressed', function() {
      expect(atom.input.pressed(37)).toBe(true);
    });
  });
});
~~~