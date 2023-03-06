# Swift Package Manager for SurveyMonkey iOS SDK

## Introduction

Starting with the 2.1.0 release, SurveyMonkey supports installation via [Swift
Package Manager](https://swift.org/package-manager/).


## Limitations

- Requires Xcode 14.
- iOS support is only available.

## Installation

If you've previously used CocoaPods, remove them from the project with `pod deintegrate`.

### In Xcode

Install SurveyMonkey SDK via Swift Package Manager:

<img width="720" alt="Install" src="https://user-images.githubusercontent.com/42991157/94566222-64735100-026a-11eb-9471-b95a52f2a68b.png">

Select the SurveyMonkey GitHub repository - `https://github.com/SurveyMonkey/surveymonkey-ios-sdk.git`:


Select the version.

Note: Starting with the 2.1.0 release.


Choose the SurveyMonkey SDK product to be installed in your app.


### Alternatively, add SurveyMonkeyiOSSDK to a `Package.swift` manifest

To integrate via a `Package.swift` manifest instead of Xcode, you can add
SurveyMonkey SDK to your dependencies array of your package with:

```
dependencies: [
  .package(name: "SurveyMonkeyiOSSDK",
           url: "https://github.com/SurveyMonkey/surveymonkey-ios-sdk.git",
           from: "X.Y.Z")
],
```

Then in any target that depends on a SurveyMonkeyiOSSDK product, add it to the `dependencies`
array of that target:

```
.target(
    name: "YourProjectTarget",
    dependencies: [
      .product(name: "SurveyMonkeyiOSSDK", package: "SurveyMonkeyiOSSDK"),
    ]
),
```
