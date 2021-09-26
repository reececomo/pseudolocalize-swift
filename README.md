# pseudolocalize

A simple Swift utility for producing pseudolocalized strings.

Pseudolocalization helps you find bugs in your UI and see how well your project will adapt to translated text.

### Usage

```swift
pseudolocalize("Hello")
  // -> "[~Hêëèllóøõ~]"
```

### Features
- **Accenter:** Replaces the vowels of your string with extended character versions.
- **Encapsulator:** Wraps your text in brackets to highlight issues with concatenation.
- **Expander:** Makes your text longer to simulate the length of other languages.

### License

MIT License
