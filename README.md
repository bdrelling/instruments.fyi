# instruments.fyi

[![CI Status](https://github.com/bdrelling/instruments.fyi/actions/workflows/tests.yml/badge.svg)](https://github.com/bdrelling/instruments.fyi/actions/workflows/tests.yml)
[![Latest Release](https://img.shields.io/github/v/tag/bdrelling/InstrumentKit?color=blue&label=latest)](https://github.com/bdrelling/InstrumentKit/releases)
[![Swift Compatibility](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fbdrelling%2Finstruments.fyi%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/bdrelling/instruments.fyi)
[![Platform Compatibility](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fbdrelling%2Finstruments.fyi%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/bdrelling/instruments.fyi)
[![License](https://img.shields.io/github/license/bdrelling/instruments.fyi)](https://github.com/bdrelling/instruments.fyi/blob/main/LICENSE)

**instruments.fyi** provides API access to localized musical instruments and their tunings provided by [InstrumentKit](https://github.com/bdrelling/InstrumentKit).

## Table of Contents

- [Work In Progress](#work-in-progress)
- [Usage](#usage)
- [Performance](#performance)
- [Contributing](#contributing)
- [Support](#support)
- [Credits](#credits)
- [License](#license)

## Work In Progress

:warning: This package is very much a work in progress. Here are some immediate next steps.

- The underlying [InstrumentKit](https://github.com/bdrelling/InstrumentKit) module needs initial review, _prior_ to loading it with an immense amount of data.
- The localization are only available in English at this time, but support for Spanish, German, and French will be the first follow-ups.

## Usage

Visit [instruments.fyi](https://instruments.fyi/api) for API documentation.

## Performance

[instruments.fyi](https://instruments.fyi) is built using [Vapor](https://vapor.codes), a [Server-side Swift](https://www.swift.org/server/) framework.

Please note: This server behind this API has _very_ low performance. It is deployed to Heroku using the cheapest pricing tier in order to provide dedicated uptime and SSL support. This API is **NOT** intended to be used at runtime for any reason. As such, it is **heavily rate-limited**.

Instead, fetch the information you need and store the response, then de-serialize the data for your own application. Or better yet: use the JSON to generate the client-side code you need!

## Contributing

If you're looking to provide corrections and/or localizations to any of the data fetched via this API, you can do so by opening an issue or pull request in [InstrumentKit](https://github.com/bdrelling/InstrumentKit).

If you're looking to contribute code to this repository, feel free to open a pull request. The more contributors, the merrier!

## Support

If you encounter any problems using API, feel free to open an issue and I'll look into it.

## Credits

Special thanks to [AudioKit](https://github.com/AudioKit/AudioKit) for all of their expertise and support.

## License

**instruments.fyi** is released under the MIT license. See [LICENSE](/LICENSE) for details.
