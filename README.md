# AlamofireMocks

## Why?

Because embedding mocks inside your app is awesome. It de-couples you from the
backend during development and can save you a ton of time.

## How does it work?

AlamofireMocks makes it easy to switch between sending real http request using
Alamofire and returning mock responses.

Simple just switch the ``SessionManager`` and use the ``MockSessionManager`` to
start receiving mock responses.

Normal response

```
let sessionManager = Alamofire.SessionManager.default
sessionManager.request("https://httpbin.org/get").responseJSON { response in    
    if let json = response.result.value {
        print("JSON: \(json)")
    }
}
```

Mock response

```
let sessionManager = MockSessionManager()
sessionManager.request("https://httpbin.org/get").responseJSON { response in    
    if let json = response.result.value {
        print("JSON: \(json)")
    }
}
```

## Configuring Mock Responses

By default the ``MockSessionManager`` uses the ``DefaultResponseStore``.
