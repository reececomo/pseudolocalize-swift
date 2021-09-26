<h1 align="center">Pseudolocalize</h1>
<p align="center">Build your App UI to adapt and respond to translations, and find localization bugs!<br /></p>

<p align="center">
  <a href="https://github.com/reececomo/pseudolocalize-swift/actions/workflows/lint.yml"><img src="https://github.com/reececomo/pseudolocalize-swift/actions/workflows/lint.yml/badge.svg?branch=main" alt="Lint"/></a>
  <a href="https://github.com/reececomo/pseudolocalize-swift/actions/workflows/test.yml"><img src="https://github.com/reececomo/pseudolocalize-swift/actions/workflows/test.yml/badge.svg?branch=main" alt="Test"/></a><br />
</p>

<p align="center">
  <img width="60%" src="https://user-images.githubusercontent.com/7390781/134794681-ec38c868-5dd5-4470-b688-8192bb937899.png" alt="Without Pseudolocalization" />
</p>

## Usage

```swift
pseudolocalize("Hello")
  // "[~Hêëèllóøõ~]"
```

### Using in an app

Here is how you might override the built-in `NSLocalizedString(_:comment:)` handler in a simple iOS App:

```swift
#if DEBUG
import Foundation
import pseudolocalize

func NSLocalizedString(_ key: String, comment: String) -> String {
  let value = NSLocalizedString(key, tableName: nil, bundle: Bundle.main, value: "", comment: "")
  return pseudolocalize(value)
}
#endif
```

For apps with more complex abstraction or multiple strings files, you may want to generate/preprocess your `en.lproj/*.strings` files and run `pseudolocalize()` as a Build Phase.

### Advanced usage

There are a number of different options you can take advantage of.

```swift
pseudolocalize("Hello"
               accents: true,
               vowelExpansions: 2,
               idealExpansionRate: 2.0,
               encapsulated: true)
```

## Features
- **Accenter:** Replaces the vowels of your string with extended character versions.
- **Encapsulator:** Wraps your text in brackets to highlight issues with concatenation.
- **Expander:** Makes your text longer to simulate the length of other languages.

## License

MIT License
