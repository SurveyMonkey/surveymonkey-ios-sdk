// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let version = "2.1.4"
let checksum = "5aaaef5f9a82b7d07ff6a93066cc420a9f69aefc76e204391945ad4c66da601e"
let url = "https://github.com/SurveyMonkey/surveymonkey-ios-sdk/releases/download/v\(version)/SurveyMonkeyiOSSDK.zip"

let package = Package(
    name: "SurveyMonkeyiOSSDK",
    platforms: [.iOS(.v12)],
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
