## iOS Project Template for SwiftUI
[![IDE](https://img.shields.io/badge/Xcode-14-blue.svg)](https://developer.apple.com/xcode/)
[![Language](https://img.shields.io/badge/swift-5.5-orange.svg)](https://swift.org)
[![Platform](https://img.shields.io/badge/iOS-15-green.svg)](https://developer.apple.com/ios/)
[![Build Status](https://github.com/monstar-lab-oss/swiftui-template-tca/actions/workflows/build.yml/badge.svg)](https://github.com/monstar-lab-oss/swiftui-template-tca/actions/workflows/build.yml)


Project template to jumpstart your next iOS project with integrating best practices and tools.

## Motivation

Everytime we create a new project, we do lots of repeated tasks that kills our effective hours. 
This template will save those hours and help to follow standard project architecture.


## Best Practices
* [Composable Architecture](https://github.com/pointfreeco/swift-composable-architecture) TCA/Composable Architecture of iOS app using Combine and SwiftUI
* [R.swift](https://github.com/mac-cain13/R.swift) Get strong typed, autocompleted resources like images, fonts and segues in Swift projects
* [Standard gitignore](https://github.com/github/gitignore/blob/master/Swift.gitignore)
* [Moya](https://github.com/Moya/Moya) for netwoking layer
* [Swiftlint](https://github.com/realm/SwiftLint) [SwiftLint SPM Plugin showing build error]
* [Swinject](https://github.com/Swinject/Swinject) [Swinject SPM Plugin showing build error]
* Development/Staging/Production app flavours
* Separate build configuration for each flavour

### Todo
* Database Platform
* Persistency Platform
* Base classes for handling deeplink, notifications and multiple scheme

### Supporting Tools
Xcode 14.0 or later and Swift 5.5 or later.

### Prerequisites:
* [Cookiecutter](https://cookiecutter.readthedocs.io/en/latest/installation.html)

Install cookiecutter by runing below terminal command.

```
brew install cookiecutter
```

## Usage

The project template uses Cookiecutter to create your project from it. Run the below command to create your project:

```
cookiecutter git@github.com:monstar-lab-oss/swiftui-template-tca.git
```
Enter your desire app name followed by company name. Thats it, you should be able to see your app directory created based on the template.

## Build Configurations
The templete used `.xcconfig` and `BuildConfiguration.plist` files to maintain different environments(Development/Staging/Production). To know how it is done please follow the [link](https://medium.com/better-programming/how-to-create-development-staging-and-production-configs-in-xcode-ec58b2cc1df4).
## Additional configuration

You will have to manually configure the bundle id of the main target and test target.

## Contributing Code
Please refer to [Contributing Guidelines](https://github.com/monstar-lab-oss/swiftui-template-tca/blob/main/CONTRIBUTING.md) before participating.


## Acknowledgments

* [iOS project best practices and tools](https://medium.com/@piotr.gorzelany/ios-project-best-practices-and-tools-c46135b8116d)
* [Development/Staging/Production Configs in Xcode](https://medium.com/better-programming/how-to-create-development-staging-and-production-configs-in-xcode-ec58b2cc1df4)
* [iOS Build Management using Custom Build Scheme](https://www.talentica.com/blogs/ios-build-management-using-custom-build-scheme/)

## 👥 Credits
Made with ❤️ at Monstarlab
