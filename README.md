<h1 align="center">Pseudolocalize</h1>
<p align="center">Prepare your iOS/MacOS App UI to adapt and respond to translations, and find localization bugs!<br /></p>

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
  // -> "[~Hêëèllóøõ~]"
```

### Using in an app

Here's an example of how you might pseudolocalize a simple iOS App:

```swift
import Foundation
import pseudolocalize

#if DEBUG
func NSLocalizedString(_ key: String, comment: String) -> String {
  let value = NSLocalizedString(key, tableName: nil, bundle: Bundle.main, value: "", comment: "")
  return pseudolocalize(value)
}
#endif
```

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
