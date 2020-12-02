# FURRExtensions
Some of the foundation extensions that I need. This is not something intended to be useful to a larger audience 
but I certainly don't mind if you can put it to good use.

With the beginning of version 0.3 the `master` branch is on Swift 3 now. If you need Swift 2.3 code see `swift2`

Have fun and don't hesitate to create pull requests

Because it took me some time to find out, here a tiny tip. To use the FURRTestExtensions use:
```
.testTarget(
    name: "ExampleTests",
    dependencies: ["Example", .product(name: "FURRTestExtensions", package: "FURRExtensions")]),
```

