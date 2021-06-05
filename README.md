![Screenshots](.assets/hero.png)

# LicenseUI

<p align="left">
<img src="https://img.shields.io/apm/l/atomic-design-ui.svg">
<img src="https://img.shields.io/badge/platforms-iOS-lightgrey.svg">
</p>

This package parses your `Settings.bundle` for licenses generated with the [LicensePlist](https://github.com/mono0926/LicensePlist) package by Masayuki Ono.
You can also provide package licenses manually by passing `LicenseItem` to the view model.
Some of the most popular licenses can be retrieved using the `License` enum.

## Installation

Install `LicenseUI` with Swift Package Manager:

```swift
dependencies: [
    .package(name: "LicenseUI", url: "https://github.com/lambdadigamma/swift-license-ui", .upToNextMajor(from: "0.0.1")),
]
```

## Documentation

You can render the default user interface shipped with this package by using the `LicenseList` and its corresponding view model `LicensesViewModel` .
Be aware that the default implementation is based on a SwiftUI `List`.

## Rendering a license list from `Settings.bundle`

To render licenses in your `Settings.bundle` generated with the [LicensePlist](https://github.com/mono0926/LicensePlist) package,
you can display the list like that:

```swift
// Render the list
LicensesList(viewModel: LicensesViewModel())
```

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

## Credits

- [Lennart Fischer](https://github.com/lambdadigamma)
- [opensource.org](https://opensource.org/licenses)
- [All Contributors](https://github.com/lambdadigamma/swift-license-ui/graphs/contributors)

## License

`swift-license-ui` is available under the MIT license. See the `LICENSE.md` file for more info.
