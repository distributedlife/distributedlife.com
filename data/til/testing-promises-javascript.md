# Expectations & Promises

A colleague asked me if there was a better way of testing an expectation when using a promise.

Her original code looked like this:




~~~javascript
it('should return a 404 if the store is not found', function (done) {
  stub.resolve(null);

  var req = { params: { storeId: '3000' }};

  controller.getStore(req, res).then(function () {
    expect(res.sendStatus).to.have.been.calledWith(404);
    done();
  }).catch(function(err) {
    done(err);
  });
});
~~~

I prefer to keep my `it` blocks lean. Let's move as much as we can into the `beforeEach` block. Our validation can begin once the system under test calls `sendStatus`. I'll use the async `done` callback and set `sendStatus` to be that. This will allow our it blocks to execute. We will then spy on `sendStatus` so we can find out what it's parameters were.

We also don't need to create an anonymous function for any errors either. When the done callback receives a parameter then it's an error.

~~~javascript
var res = {};
var req = { params: { storeId: '3000' }};

beforeEach(function (done) {
  res.sendStatus = done;
  sinon.spy(res, 'sendStatus');

  controller.getStore(req, res).error(done);
});

it('should return a 404 if the store is not found', function () {
  expect(res.sendStatus).to.have.been.calledWith(404);
});
~~~


An integration test

~~~javascript
var response;
var responseBody;

beforeEach(function (done) {
  request({url: "http://distributedlife.com/derp"}).spread(function (res) {
    responseBody = JSON.parse(response.body);
    done();
  }).error(done);
});

it('should return a 404 if the store is not found', function () {
  expect(response.statusCode).to.equal(404);
});
~~~