I've done this in the past by drilling down into the fake DOM and then invoking the bound listener directly. It's horrible to read and terribly brittle.

A friend showed me how to do it better. Create a `KeyboardEvent` or, if you so want a `MouseEvent` or a `TouchEvent`. In any way the method calls are the same. Once the event has been initialised add the properties you need and dispatch the event.

I am using jsdom to create a simple DOM.

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