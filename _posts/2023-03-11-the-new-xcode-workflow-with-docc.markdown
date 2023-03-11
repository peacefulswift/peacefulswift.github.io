---
layout: post
title:  "The New Xcode Workflow with DocC"
date:   2023-03-11 17:20:24 +0700
categories: docc
---

I have noticed a pattern when creating new projects lately, whether it be a toy project or for learning a new framework: using SPM is the way to go when adding any library to the project. Since Xcode fully supports SPM, it is very easy to add any dependencies from the internet. However, once we add these dependencies to our project, the next question is `how to use them?`.

Good frameworks come with good documentation, and some might also want step-by-step tutorials. 

Apple introduced [DocC](https://developer.apple.com/documentation/docc) in WWDC21, which dictates how to create documentation in the Apple ecosystem. It helps us create and use documentation for frameworks with a seamless experience in Xcode, including creating articles or even interactive step-by-step tutorials.

Here is an example: when I had an idea to create a Swift command line tool, I needed a [ArgumentParser](https://github.com/apple/swift-argument-parser) to help me deal with a certain task. So, it was a good idea to plug the library into my Xcode project.

![Adding SPM](/assets/2023-03-11-spm.png)￼

This step is easy enough for any developer who knows how to add a dependency with SPM. However, as I mentioned earlier, how can we learn to use this framework?

At this point, before we even write more code to the project, let's try to build the documentation for our project. 

We can do this by selecting `Project -> Build Documentation` or by hitting `Option + Shift + CMD + D` for a shortcut. After finishing the building process, we might see a `Developer Documentation` window like this.

![Create docc](/assets/2023-03-11-docc-sample.png)￼

Notice on the left-hand side that we have built documentation for our project along with the other thrid party frameworks that we added from SPM earlier.


With the arrival of DocC, developers can provide well-integrated documentation that works seamlessly with Xcode, without the need for context switching to search for usage or articles on the web. Additionally, any symbol or definition can link to the actual declaration inside the framework, making it easier for us to browse any API that we want to use or dive into more deeply.


From what I can see, many frameworks created by Apple provide DocC with a lot of information about the framework itself, making it very easy for us to learn how to use it. Even [Swift language guide book](https://www.swift.org/blog/tspl-on-docc/) has already migrated to DocC. Therefore, we can expect DocC to be with us for a long time and to see future improvements in the upcoming WWDC.

More about the DocC you can check these links:
- [Meet DocC documentation in Xcode](https://developer.apple.com/videos/play/wwdc2021/10166)
- [Build interactive tutorials using DocC](https://developer.apple.com/videos/play/wwdc2021/10167)
