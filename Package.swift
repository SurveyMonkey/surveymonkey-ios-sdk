// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let version = "2.1.0"
let checksum = "33094c8ead6b1b080ed6ec6d7f16ff6b6ff6dc710e49bb78992c465e29063513"
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
