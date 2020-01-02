// swift-tools-version:5.0

/**
 * Copyright IBM Corporation 2016-2019
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 **/

import PackageDescription
import Foundation

let package = Package(
    name: "Kitura",
    products: [
        .library(
            name: "Kitura",
            targets: ["Kitura"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/IBM-Swift/LoggerAPI.git", from: "1.9.0"),
        .package(url: "https://github.com/apple/swift-log.git", Version("0.0.0") ..< Version("2.0.0")),
        .package(url: "https://github.com/IBM-Swift/Kitura-TemplateEngine.git", from: "2.0.0"),
        .package(url: "https://github.com/IBM-Swift/KituraContracts.git", from: "1.0.0"),
        .package(url: "https://github.com/IBM-Swift/TypeDecoder.git", from: "1.3.0"),
        .package(url: "https://github.com/apple/swift-nio.git", from: "2.8.0"),
        .package(url: "https://github.com/apple/swift-nio-ssl.git", from: "2.0.0"),
        .package(url: "https://github.com/apple/swift-nio-extras.git", from: "1.0.0"),
        .package(url: "https://github.com/IBM-Swift/BlueSSLService.git", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "Kitura",
            dependencies: ["KituraNet", "KituraTemplateEngine", "KituraContracts", "TypeDecoder", "LoggerAPI", "Logging"]
        ),
        .target(
            name: "CLinuxHelpers",
            dependencies: []),
        .target(
            name: "KituraNet",
            dependencies: ["NIO", "NIOFoundationCompat", "NIOHTTP1", "NIOSSL", "SSLService", "LoggerAPI", "NIOWebSocket", "CLinuxHelpers", "NIOConcurrencyHelpers", "NIOExtras"]),

        .testTarget(
            name: "KituraTests",
            dependencies: ["Kitura", "KituraContracts", "TypeDecoder", "LoggerAPI"]
        ),
        .testTarget(
            name: "KituraNetTests",
            dependencies: ["KituraNet"])
    ]
)
