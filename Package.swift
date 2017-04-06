import PackageDescription
let package = Package(
    name: "MyFirstPerfectProject",
    dependencies: [
        .Package(url: "https://github.com/PerfectlySoft/Perfect-HTTPServer.git",majorVersion: 2,minor:0),
        .Package(url: "https://github.com/Hearst-DD/ObjectMapper.git", majorVersion: 2, minor: 2)        
    ]
)

