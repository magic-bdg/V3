// swift-tools-version:6.0
import PackageDescription

let package = Package(
    name: "Backdoor",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "Backdoor",
            targets: ["Backdoor"]),
    ],
    dependencies: [
        // MARK: - Core Dependencies (Actually used in the codebase)
        
        // UI and Image handling
        .package(url: "https://github.com/kean/Nuke.git", from: "12.5.0"),        
        .package(url: "https://github.com/sparrowcode/AlertKit.git", from: "5.1.8"), 
        
        // Onboarding - IMPORTANT: Using original package for API compatibility
        .package(url: "https://github.com/khcrysalis/UIOnboarding-18.git", branch: "main"),
        
        // File and Archive Management
        .package(url: "https://github.com/weichsel/ZIPFoundation.git", from: "0.9.19"), 
        .package(url: "https://github.com/tsolomko/SWCompression.git", from: "4.8.5"),  
        .package(url: "https://github.com/tsolomko/BitByteData.git", from: "2.0.1"),    
        
        // Security and Cryptography
        .package(url: "https://github.com/krzyzanowskim/CryptoSwift.git", from: "1.8.3"),
        
        // UI Enhancement
        .package(url: "https://github.com/SnapKit/SnapKit.git", .upToNextMajor(from: "5.0.1")),
        .package(url: "https://github.com/airbnb/lottie-spm.git", from: "4.5.1"),
        .package(url: "https://github.com/SwiftUIX/SwiftUIX.git", branch: "master"),
        
        // Networking and API
        .package(url: "https://github.com/Moya/Moya.git", .upToNextMajor(from: "15.0.0")),
        
        // Development & Code Generation
        .package(url: "https://github.com/mac-cain13/R.swift.git", from: "7.0.0"),
        
        // Server and Networking - Latest Vapor for modern Swift
        .package(url: "https://github.com/vapor/vapor.git", from: "4.92.4"),           
        
        // Required Vapor dependencies - Updated for Swift 5.10 compatibility
        .package(url: "https://github.com/swift-server/async-http-client.git", from: "1.25.2"),
        .package(url: "https://github.com/vapor/websocket-kit.git", from: "2.14.0"),
        .package(url: "https://github.com/vapor/async-kit.git", from: "1.20.0"),
        
        // Natural Language Processing
        .package(url: "https://github.com/SimformSolutionsPvtLtd/SSNaturalLanguage.git", from: "1.0.0"),
        
        // Security and Encryption - IMPORTANT: Using original OpenSSL package for zsign compatibility
        .package(url: "https://github.com/HAHALOSAH/OpenSSL-Swift-Package.git", branch: "main"),
        
        // Networking and SSL - Updated for Swift 5.10 compatibility
        .package(url: "https://github.com/apple/swift-nio.git", from: "2.69.0"),
        .package(url: "https://github.com/apple/swift-nio-ssl.git", from: "2.27.0"),
        .package(url: "https://github.com/apple/swift-nio-transport-services.git", from: "1.21.0"),
        
        // MARK: - Modern Swift Features
        
        // Logging - Production-grade logging system
        .package(url: "https://github.com/apple/swift-log.git", from: "1.5.4"),
        
        // Swift standard library extensions
        .package(url: "https://github.com/apple/swift-algorithms.git", from: "1.2.0"),
        .package(url: "https://github.com/apple/swift-collections.git", from: "1.0.5"),
        
        // Async/Await enhancements (for Swift 5.10 and above)
        .package(url: "https://github.com/apple/swift-async-algorithms.git", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "Backdoor",
            dependencies: [
                // Core dependencies - actively used in codebase
                .product(name: "Nuke", package: "Nuke"),
                .product(name: "NukeUI", package: "Nuke"),
                .product(name: "NukeExtensions", package: "Nuke"),
                .product(name: "NukeVideo", package: "Nuke"),
                .product(name: "UIOnboarding", package: "UIOnboarding-18"),
                .product(name: "AlertKit", package: "AlertKit"),
                .product(name: "ZIPFoundation", package: "ZIPFoundation"),
                .product(name: "SWCompression", package: "SWCompression"),
                .product(name: "BitByteData", package: "BitByteData"),
                
                // Server-side components
                .product(name: "Vapor", package: "vapor"),
                .product(name: "AsyncHTTPClient", package: "async-http-client"),
                .product(name: "WebSocketKit", package: "websocket-kit"),
                .product(name: "AsyncKit", package: "async-kit"),
                
                // Security and Cryptography
                .product(name: "CryptoSwift", package: "CryptoSwift"),
                
                // UI Enhancement
                .product(name: "SnapKit", package: "SnapKit"),
                .product(name: "Lottie", package: "lottie-spm"),
                .product(name: "SwiftUIX", package: "SwiftUIX"),
                
                // Networking and API
                .product(name: "Moya", package: "Moya"),
                .product(name: "RswiftLibrary", package: "R.swift"),
                
                // Natural Language Processing
                .product(name: "SSNaturalLanguage", package: "SSNaturalLanguage"),
                
                // Security and networking - Using OpenSSL-Swift-Package for zsign compatibility
                .product(name: "OpenSSL", package: "OpenSSL-Swift-Package"),
                .product(name: "NIO", package: "swift-nio"),
                .product(name: "NIOSSL", package: "swift-nio-ssl"),
                .product(name: "NIOTransportServices", package: "swift-nio-transport-services"),
                
                // Modern Swift features
                .product(name: "Logging", package: "swift-log"),
                .product(name: "Algorithms", package: "swift-algorithms"),
                .product(name: "Collections", package: "swift-collections"),
                .product(name: "AsyncAlgorithms", package: "swift-async-algorithms"),
            ],
            path: ".",
            exclude: [
                "README.md",
                "LICENSE",
                ".github",
                ".git",
                "backdoor.xcodeproj",
                "backdoor.xcworkspace",
                "scripts",
                "FAQ.md",
                "CODE_OF_CONDUCT.md",
                ".swiftformat",
                ".swiftlint.yml",
                ".clang-format",
                "Makefile",
                "Clean",
                "app-repo.json",
                "fix_license_headers.sh",
                "localization_changes.patch"
            ],
            swiftSettings: [
                // Debug optimization settings
                .define("DEBUG", .when(configuration: .debug)),
                .unsafeFlags(["-Onone"], .when(configuration: .debug)),
                
                // Release optimization settings
                .define("RELEASE", .when(configuration: .release)),
                .unsafeFlags(["-O", "-cross-module-optimization"], .when(configuration: .release))
            ]
        )
    ],
    swiftLanguageVersions: [.v5]
)