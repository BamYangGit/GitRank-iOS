import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.SearchFeature.rawValue,
    targets: [
        .interface(module: .feature(.SearchFeature)),
        .implements(module: .feature(.SearchFeature), dependencies: [
            .feature(target: .SearchFeature, type: .interface),
            .feature(target: .BaseFeature),
            .feature(target: .GroupDetailFeature, type: .interface)
        ]),
        .tests(module: .feature(.SearchFeature), dependencies: [
            .feature(target: .SearchFeature)
        ])
    ]
)
