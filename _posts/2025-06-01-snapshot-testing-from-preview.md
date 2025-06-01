---
layout: post
title: "Snapshot Testing from Preview"
date: 2025-06-01 14:14:05 +0900
categories: [swift]
tags: [swift,swiftui,xcode,preview,testing]
---

# Auto Snapshot Testing

SwiftUI was introduced alongside with a companion tool called *[Preview](https://developer.apple.com/documentation/swiftui/previews-in-xcode)*, which made writing SwiftUI code in Xcode much easier, thanks to instant hot reloading of the views we’re working on.

Like many of Apple’s tools, Preview works great for small and simple use cases. However, during my journey working with large teams on SwiftUI projects over the years, I’ve encountered several recurring problems:

- We often spend more time fixing broken previews than actually using them.
- Even when a preview isn’t broken, it may still behave unexpectedly.
- Preview and Xcode can be unreliable, causing significant frustration when the preview doesn't work.
- Debugging within Preview is limited and not very effective.

You’ve likely run into these issues yourself. Preview is useful early on but frustrating to maintain. Without automated tests, it’s hard to stay confident—especially as team size and code complexity grow.

## Introducing SnapshotPreview from Emerge

Recently, I discovered a tool that addresses many of the issues I've experienced with Preview: [`SnapshotPreviews`](https://github.com/EmergeTools/SnapshotPreviews) by EmergeTools. This tool makes it possible to write tests around your previews and offers several key benefits:

- Ensures the preview renders correctly at runtime, preventing forgotten environment injections or missing dependencies.
- Generates reference images for previews, so you can visually inspect test results.
- Automatically builds a standalone app containing all your previews, allowing you to inspect all views in the simulator at once.
- Simplifies debugging by enabling you to run the views in an actual simulator, where breakpoints and console logs work — unlike with the standard Preview.

There are other useful features as well, such as accessibility testing, though I haven't explored them yet.

One limitation I noticed: the library doesn’t support snapshot verification in an automated CI pipeline out of the box — or perhaps I missed something?

## Customizing for Automated Snapshot Testing

I spent some time exploring the library's source code to understand how it works. I found several clever implementations and learned a lot. In fact, I was able to extract parts of the library to solve other problems in different areas. 

With a small tweak, I found it’s possible to enable automated snapshot testing based on preview-generated images.

Here's the relevant adjustment:

```swift
// >> Sources/SnapshottingTests/SnapshotTest.swift

open class func viewForRecord(_ view: AnyView, name: String?) {
  // Customizable hook for snapshot recording
}

override func testPreview(_ preview: DiscoveredPreviewAndIndex) {
  // ...
  Self.viewForRecord(AnyView(preview.view()), name: previewDisplayName)
}
```
[Here is the original commit](https://github.com/ambas/SnapshotPreviews/commit/7ec51631760446d308425f876fca1b962a828062#diff-ec2efc3fbf7d7fb61842e6752102cc3c3f9d74ef7826921d6db1869cac2f5f0c)

With this change, we can override the `viewForRecord` method in our test files and use a tool like [`swift-snapshot-testing`](https://github.com/pointfreeco/swift-snapshot-testing) by Point-Free to perform actual snapshot tests.

Now, we can easily copy a sample test and create all the necessary snapshot tests with some adjustments like this:

```swift
class DemoAppPreviewTest: SnapshotTest {

    override class func viewForRecord(_ view: AnyView, name: String?) {
        guard let name else { return }
        let previewDisplayName = name.replacing("RecordModeTrue", with: "")
        let result = verifySnapshot(
            of: UIHostingController(rootView: view),
            as: .image,
            named: previewDisplayName,
            record: name.contains("RecordModeTrue")
        )

        guard let result else { return }
        XCTFail(result)
    }

}
```

In the code above, we override the `viewForRecord` function to either record or verify the saved image from disk.

To control whether we’re recording or verifying, we use a simple trick: we check if the test name contains `"RecordModeTrue"`. Based on that, we adjust the way the preview is created accordingly.

```swift
#Preview(.name("AddCategoryView", recordMode: false)){
    Driver {
        AddCategoryView { _ in }
    }
}

extension Optional where Wrapped == String {
    static func name(_ name: String, recordMode: Bool = false ) -> String {
        if recordMode {
            name + "RecordModeTrue"
        } else {
            name
        }
    }
}
```

With a small extension on `Optional<String>`, we can conditionally add a record mode suffix to the preview name. This suffix will be trimmed during the recording process.

Now, we can save the preview’s view to disk and automatically verify all recorded images. This allows us to detect any changes to the view whenever it’s modified.

![Record Example](/assets/2025-06-01-record-exmaple.png)￼


## Conclusion

The example above shows that it’s possible to build automation around SwiftUI Previews. By combining tools like [Emerge’s SnapshotPreview](https://github.com/EmergeTools/SnapshotPreviews) and [Point-Free’s SnapshotTesting](https://github.com/pointfreeco/swift-snapshot-testing), we can make our previews more reliable — even in large teams and complex projects.

> Note: EmergeTools also [provides](https://www.emergetools.com/#snapshots) an official way to perform automated snapshot testing through their own cloud service. This service handles the full process for you. If you’re looking for a ready-to-use solution, I recommend checking out what the EmergeTools offers.



