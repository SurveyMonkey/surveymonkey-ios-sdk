# Swift Package Manager for SurveyMonkey iOS SDK

## Introduction

Starting with the 2.1.0 release, SurveyMonkey supports installation via [Swift
Package Manager](https://swift.org/package-manager/).


## Limitations

- Requires Xcode 15.
- iOS support is only available.

## Installation

If you've previously used CocoaPods, remove them from the project with `pod deintegrate`.

### In Xcode

Install SurveyMonkey SDK via Swift Package Manager:

<img width="720" alt="Install" src="https://user-images.githubusercontent.com/42991157/94566222-64735100-026a-11eb-9471-b95a52f2a68b.png">

Select the SurveyMonkey GitHub repository - `https://github.com/SurveyMonkey/surveymonkey-ios-sdk.git`:

<img width="720" alt="Install" src="https://user-images.githubusercontent.com/42991157/223386611-ec1fc153-6032-4f54-8c1a-c45f65f5f86c.png">

Select the version.

Note: Starting with the 2.1.0 release.

<img width="720" alt="Install" src="https://user-images.githubusercontent.com/42991157/223386593-2508d6ce-3cea-4c26-b179-ed51aef9bcc7.png">

Choose the SurveyMonkeyiOSSDK product to be installed in your app target.

<img width="720" alt="Install" src="https://user-images.githubusercontent.com/42991157/223386603-b57e7f3d-05d1-4cdb-956c-11be23607e27.png">


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
