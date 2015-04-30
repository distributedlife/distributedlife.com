# I learned a lesson

Retrofitting a Content Security Policy (CSP) into an existing project is painful.

CSP is an approach that asks the browsers to not execute code if it appears inline or, if it comes from unauthorised sources. CSP applies to javascript, styles, images and iframes.

The configuration we wanted was to lock down all javascript, css, images to our domain and to disallow iframes. We also banned **all** inline javascript and css. By ban I mean politely ask the client's browser to respect our policy.

On a ruby project it's trivial. Use Twitter's [secureheaders](https://github.com/twitter/secureheaders) gem.

# realisation sets in

The moment you turn on CSP you'll realise which libraries you depend on don't behave in a CSP-friendly way. They're doing unconscionable things like injecting `script` tags into your source.

It's distressing to add a stack of tech debt to your wall within the first two weeks. We had to work through these in time continuing to deliver while cleaning up after ourselves.

The lesson learnt is: **start every project with CSP as a baseline**.

# for reference
This is our configuration:

~~~ruby
# /config/initializers/secureheaders.rb
:SecureHeaders::Configuration.configure do |config|
  config.hsts = {:max_age => 20.years.to_i, :include_subdomains => false}
  config.x_frame_options = 'DENY'
  config.x_content_type_options = 'nosniff'
  config.x_xss_protection = {:value => 1, :mode => 'block'}
  config.x_download_options = 'noopen'
  config.x_permitted_cross_domain_policies = 'none'
  config.csp = {
    enforce: true,
    default_src: 'self',
    frame_src: 'none',
    img_src: 'self data:',
    script_src: 'self',
    style_src: 'self'
  }
end
~~~