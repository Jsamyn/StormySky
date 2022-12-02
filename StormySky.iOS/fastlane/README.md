fastlane documentation
----

# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```sh
xcode-select --install
```

For _fastlane_ installation instructions, see [Installing _fastlane_](https://docs.fastlane.tools/#installing-fastlane)

# Available Actions

### build

```sh
[bundle exec] fastlane build
```

The `build` lane is responsible for building the Bolt application with development configuration.


### build_adhoc

```sh
[bundle exec] fastlane build_adhoc
```

The `build_adhoc` lane is responsible for building the application for adhoc distribution
on Google firebase App Distribution.


### build_appstore

```sh
[bundle exec] fastlane build_appstore
```

The 'build_appstore' lane is responsible for building the application for app store distribution


### increment_build

```sh
[bundle exec] fastlane increment_build
```

The 'increment_build' lane is responsible for incrementing the build number in the iOS project


### deploy_testflight

```sh
[bundle exec] fastlane deploy_testflight
```

The 'deploy_testflight' lane is used to deploy the bolt application to a proper TestFlight channel in 
App Store connect. 


### test_ios

```sh
[bundle exec] fastlane test_ios
```

The `test_ios` lane is responsible for running unit tests and automation tests on iPhone 14


----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.

More information about _fastlane_ can be found on [fastlane.tools](https://fastlane.tools).

The documentation of _fastlane_ can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
