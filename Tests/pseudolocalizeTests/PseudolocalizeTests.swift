@testable import pseudolocalize
import XCTest

final class PseudolocalizeTests: XCTestCase {

  typealias BasicUsage = (
    input: String,
    expected: String
  )

  typealias AdvancedUsage = (
    input: String,
    accents: Bool,
    vowelExpansions: Int,
    idealExpansionRate: Double,
    encapsulated: Bool,
    expected: String
  )

  static let baseCases: [BasicUsage] = [
    (
      input: "Hello",
      expected: "[~Hêëèllóøõ~]"
    ),
    (
      /* Identical substring should return differently accented characters. */
      input: " Hello",
      expected: "[~ Hèéêllõôö~]"
    ),
    (
      input: "Lorem ipsum, dolar sit amet.",
      expected: "[~~~~~Lõôörëèém íìîpsüùúm, dôöòlâäãr sîïít äãåméêët.~~~~~]"
    ),
    (
      /* Vowel expansion. */
      input: "Hi",
      expected: "[Hìîï]"
    ),
    (
      /* Not enough vowels expanded, uses padding. */
      input: "SMS",
      expected: "[~~SMS~~]"
    )
  ]

  static let advancedCases: [AdvancedUsage] = [
    (
      input: "Hello",
      accents: false,
      vowelExpansions: 0,
      idealExpansionRate: 1.0,
      encapsulated: false,
      expected: "Hello"
    ),
    (
      /* Accents - basic */
      input: "The armadillo yaps loudly.",
      accents: true,
      vowelExpansions: 0,
      idealExpansionRate: 1.0,
      encapsulated: false,
      expected: "Thè àrmädìllò ÿåps løúdlÿ."
    ),
    (
      /* Accents / Vowel expansions - expanded vowels should use different characters */
      input: "The armadillo yaps loudly.",
      accents: true,
      vowelExpansions: 1,
      idealExpansionRate: 1.0,
      encapsulated: false,
      expected: "Thèé àármäãdìîllòó ÿÿåàps løõúûdlÿÿ."
    ),
    (
      /* Vowel expansions */
      input: "The armadillo yaps loudly.",
      accents: false,
      vowelExpansions: 2,
      idealExpansionRate: 1.0,
      encapsulated: false,
      expected: "Theee aaarmaaadiiillooo yyyaaaps looouuudlyyy."
    ),
    (
      /* Vowel expansions / Ideal expansion rate - No padding needed if enough vowels expanded */
      input: "Yes",
      accents: false,
      vowelExpansions: 2,
      idealExpansionRate: 2.0,
      encapsulated: false,
      expected: "Yyyeees"
    ),
    (
      /* Vowel expansions / Ideal expansion rate - Padding added if vowels not enough */
      input: "Yes",
      accents: false,
      vowelExpansions: 1,
      idealExpansionRate: 2.0,
      encapsulated: false,
      expected: "~Yyees~"
    ),
    (
      /* Ideal expansion rate - Padding added until string at least desired length */
      input: "Yes",
      accents: false,
      vowelExpansions: 0,
      idealExpansionRate: 2.0,
      encapsulated: false,
      expected: "~~Yes~~"
    ),
    (
      /* Encapsulation */
      input: "Test",
      accents: false,
      vowelExpansions: 0,
      idealExpansionRate: 1.0,
      encapsulated: true,
      expected: "[Test]"
    )
  ]

  func testBaseCases() throws {
    for (input, expected) in Self.baseCases {
      XCTAssertEqual(expected, pseudolocalize(input))
    }
  }

  func testAdvancedCases() throws {
    for test in Self.advancedCases {
      let actual = pseudolocalize(
        test.input,
        accents: test.accents,
        vowelExpansions: test.vowelExpansions,
        idealExpansionRate: test.idealExpansionRate,
        encapsulated: test.encapsulated
      )

      XCTAssertEqual(test.expected, actual)
    }
  }
}
