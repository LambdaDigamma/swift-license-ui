# LicenseUI

<p align="left">
<img src="https://img.shields.io/apm/l/atomic-design-ui.svg">
<img src="https://img.shields.io/badge/platforms-iOS-lightgrey.svg">
<img alt="Swift" src="https://github.com/LambdaDigamma/swift-license-ui/actions/workflows/swift.yml/badge.svg">
</p>

This package parses your `Settings.bundle` for licenses generated with the [LicensePlist](https://github.com/mono0926/LicensePlist) package by Masayuki Ono.

You can also provide package licenses manually by passing `LicenseItem` objects to the view model.

Some of the most popular licenses (according to [opensource.org](https://opensource.org/licenses)) can be retrieved using the `License` enum.

## Installation

Install `LicenseUI` with Swift Package Manager

```swift
dependencies: [
    .package(name: "LicenseUI", url: "https://github.com/lambdadigamma/swift-license-ui", .upToNextMajor(from: "0.0.1")),
]
```

## Documentation

## Rendering a license list from `Settings.bundle`

## Rendering a license list manually

## Rendering a custom user interface

## Roadmap

- [x] Implement `Settings.bundle` parsing
- [x] Implement rendering license list and license terms
- [x] Add the most popular licenses
- [ ] Support more localizations

## Changelog

Please see `CHANGELOG.md` for more information what has changed recently.

## Contributing

Contributions are always welcome!

## Credis

- [Lennart Fischer](https://github.com/lambdadigamma)
- [All Contributors](https://github.com/lambdadigamma/swift-license-ui/graphs/contributors)

## License

`swift-license-ui` is available under the MIT license. See the `LICENSE.md` file for more info.
