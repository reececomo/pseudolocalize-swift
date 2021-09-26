/**
 Turns a string like "Pseudolocalized" into "[\~\~Psëêùùdöölóçåålîîzëêd\~\~]".
 */
public func pseudolocalize(
  _ source: String,
  accents: Bool = true,
  vowelExpansions: Int = 2,
  idealExpansionRate: Double = 2.0,
  encapsulated: Bool = true
) -> String {
  // Seed number used to generate deterministic but "random looking" accents.
  let sourceSeed: Int = source.count
  var result: String = ""

  for (charOffset, char) in source.enumerated() {
    if "AEIOUYaeiouy".contains(char) {
      // Vowel
      result += "\(accents ? accent(char, sourceSeed + charOffset) : char)"

      // Vowel expansions
      for expansionOffset in 0 ..< vowelExpansions {
        let charSeed: Int = sourceSeed + charOffset + expansionOffset + 1
        let lowercaseChar: String.Element = char.lowercased().first!

        result += "\(accents ? accent(lowercaseChar, charSeed) : lowercaseChar)"
      }
    } else {
      // Consonant
      result += "\(char)"
    }
  }

  // Expansion/padding
  let idealLength = Int((Double(source.count) * idealExpansionRate).rounded())

  while result.count < idealLength {
    result = "~\(result)~"
  }

  // Encapsulation
  return encapsulated ? "[\(result)]" : result
}

// MARK: - Implementation

/// Accenter: Swaps out characters with an accented version.
private func accent(_ char: String.Element, _ seed: Int) -> String.Element {
  switch char {
  case "a": return ["à", "á", "â", "ä", "ã", "å"][seed % 6]
  case "A": return ["À", "Á", "Â", "Ä", "Æ", "Ã", "Å"][seed % 7]
  case "e": return ["è", "é", "ê", "ë"][seed % 4]
  case "E": return ["È", "É", "Ê", "Ë"][seed % 4]
  case "i": return ["î", "ï", "í", "ì"][seed % 4]
  case "I": return ["Î", "Ï", "Í", "Ì"][seed % 4]
  case "o": return ["ô", "ö", "ò", "ó", "ø", "õ"][seed % 6]
  case "O": return ["Ô", "Ö", "Ò", "Ó", "Œ", "Ø", "Õ"][seed % 7]
  case "u": return ["û", "ü", "ù", "ú"][seed % 4]
  case "U": return ["Û", "Ü", "Ù", "Ú"][seed % 4]
  case "y": return "ÿ"
  case "Y": return "Ÿ"
  default: return char
  }
}
