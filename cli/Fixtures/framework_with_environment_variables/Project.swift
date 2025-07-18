import ProjectDescription

let project = Project(
    name: "Framework",
    targets: [
        .target(
            name: Environment.frameworkName.getString(default: "Framework"),
            destinations: [.mac],
            product: .framework,
            bundleId: "dev.tuist.App",
            infoPlist: .default,
            sources: .paths([.relativeToManifest("Sources/**")])
        ),
    ]
)
