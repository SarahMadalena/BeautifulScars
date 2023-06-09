// swift-tools-version: 5.6

// WARNING:
// This file is automatically generated.
// Do not edit it by hand because the contents will be replaced.

import PackageDescription
import AppleProductTypes

let package = Package(
    name: "Beautiful_scars",
    platforms: [
        .iOS("15.2")
    ],
    products: [
        .iOSApplication(
            name: "Beautiful_scars",
            targets: ["AppModule"],
            bundleIdentifier: "Sarah.Beautifull-scars",
            teamIdentifier: "S2FBP6VDL8",
            displayVersion: "1.0",
            bundleVersion: "1",
            appIcon: .placeholder(icon: .tv),
            accentColor: .presetColor(.teal),
            supportedDeviceFamilies: [
                .pad,
                .phone
            ],
            supportedInterfaceOrientations: [
                .landscapeRight,
                .landscapeLeft
            ]
        )
    ],
    targets: [
        .executableTarget(
            name: "AppModule",
            path: "."
        )
    ]
)
