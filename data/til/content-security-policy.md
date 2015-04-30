Don't try to retrofit Content Security Policy (CSP) into an existing project.




[CSP support in Angular](https://docs.angularjs.org/api/ng/directive/ngCsp)
[Twitter's CSP experience report](https://blog.twitter.com/2011/improving-browser-security-csp)
[Twitters CSP report capturing behaviour](https://blog.matatall.com/2014/07/twitters-csp-report-collector-design/)
[A NodeJS endpoint for capturing reports](https://www.npmjs.com/package/csp-endpoint)
[How chrome handles it](https://developer.chrome.com/extensions/contentSecurityPolicy)

The gem we are using (and some stuff about nonces that we may be able to use to pay back the tech debt):
https://github.com/twitter/secureheaders

[CSP Playground with detail on what's allowed and what is not.](http://www.cspplayground.com/compliant_examples)