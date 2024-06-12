// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let version = "2.1.2"
let checksum = "ce2c7e934136ed30f0f15d86d6c0a58ad5433c6da4364f83cd25991175f6e2d0"
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
