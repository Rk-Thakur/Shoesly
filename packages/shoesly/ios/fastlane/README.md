fastlane documentation
----

# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```sh
xcode-select --install
```

For _fastlane_ installation instructions, see [Installing _fastlane_](https://docs.fastlane.tools/#installing-fastlane)

# Available Actions

### flutter_prepare

```sh
[bundle exec] fastlane flutter_prepare
```

Clean, get dependencies, fix issues, and format Flutter project

### get_release_notes_from_user

```sh
[bundle exec] fastlane get_release_notes_from_user
```

Get release notes from user input and store in ENV['RELEASE_NOTES']

----


## iOS

### ios iosalpha

```sh
[bundle exec] fastlane ios iosalpha
```

Build a new alpha version

----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.

More information about _fastlane_ can be found on [fastlane.tools](https://fastlane.tools).

The documentation of _fastlane_ can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
