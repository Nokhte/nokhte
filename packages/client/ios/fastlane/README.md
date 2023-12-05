fastlane documentation
----

# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```sh
xcode-select --install
```

For _fastlane_ installation instructions, see [Installing _fastlane_](https://docs.fastlane.tools/#installing-fastlane)

# Available Actions

## iOS

### ios bump_major

```sh
[bundle exec] fastlane ios bump_major
```

Major Version Bump

### ios bump_minor

```sh
[bundle exec] fastlane ios bump_minor
```

Minor Version Bump

### ios bump_patch

```sh
[bundle exec] fastlane ios bump_patch
```

Patch Version Bump

### ios read_version

```sh
[bundle exec] fastlane ios read_version
```



### ios apply_new_version

```sh
[bundle exec] fastlane ios apply_new_version
```



### ios rebuild_ios_archive

```sh
[bundle exec] fastlane ios rebuild_ios_archive
```

rebuild iOS Archive (PREREQ No. 1)

### ios generic_ios_beta_build

```sh
[bundle exec] fastlane ios generic_ios_beta_build
```

Generic Beta Build

----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.

More information about _fastlane_ can be found on [fastlane.tools](https://fastlane.tools).

The documentation of _fastlane_ can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
