// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let version = "2.1.1"
let checksum = "8a9c6cbe6427394b01b2a24a4890065468fdf421573354f1c24dafe344b7ed7c"
let url = "https://github.com/SurveyMonkey/surveymonkey-ios-sdk/releases/download/v\(version)/SurveyMonkeyiOSSDK.zip"

let package = Package(
    name: "SurveyMonkeyiOSSDK",
    platforms: [.iOS(.v11)],
    products: [
        .library(
            name: "SurveyMonkeyiOSSDK",
            targets: ["SurveyMonkeyiOSSDK"]),
    ],
    targets: [
        .binaryTarget(
            name: "SurveyMonkeyiOSSDK",
            url: url,
            checksum: checksum)
    ]
)
