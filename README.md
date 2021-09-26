<h1 align="center">Pseudolocalize</h1>
<p align="center">A simple Swift utility for producing pseudolocalized strings.<br /></p>

<p align="center">
  <a href="https://github.com/reececomo/pseudolocalize-swift/actions/workflows/lint.yml"><img src="https://github.com/reececomo/pseudolocalize-swift/actions/workflows/lint.yml/badge.svg?branch=main" alt="Lint"/></a>
  <a href="https://github.com/reececomo/pseudolocalize-swift/actions/workflows/test.yml"><img src="https://github.com/reececomo/pseudolocalize-swift/actions/workflows/test.yml/badge.svg?branch=main" alt="Test"/></a>
</p>

## Summary

Pseudolocalization helps you find bugs in your UI and see how well your project will adapt to translated text.

## Usage

```swift
pseudolocalize("Hello")
  // -> "[~Hêëèllóøõ~]"
```

## Features
- **Accenter:** Replaces the vowels of your string with extended character versions.
- **Encapsulator:** Wraps your text in brackets to highlight issues with concatenation.
- **Expander:** Makes your text longer to simulate the length of other languages.

## License

MIT License
