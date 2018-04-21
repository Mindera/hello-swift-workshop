import Foundation

// MARK: - Type Safety

// Variable with an explicit type of `Float` and a value of `1.337`.

let newExplicit: Float = 1.337

// Implicit constant `Double` with the value `2π`

let twoPi = Double.pi * 2


// MARK: - Type Inference

// Removing the conversion to `String`.

let label = "The answer is "
let width = 42
// Binary operation '+' cannot be applied to operands of type 'String and 'Int'
// let widthLabel = label + width


// MARK: - String Interpolation

// Including a floating-point calculation and someone’s name in a string.

let π: Float = 3.14
let name = "Peter Pie"
let piePy = "\(name) likes the number \(π)"


// MARK: - Control Flow

// FizzBuzz case.

func fizzBuzz() {

    let number = 12345
    var fizzBuzz = ""

    if number % 3 == 0 && number % 5 == 0 {
        fizzBuzz = "FizzBuzz"
    } else {
        // ¯\_(ツ)_/¯
    }
}

// Matching any set of fruit with one 🍌.

func fruit() {

    let fruit = "🍊"
    switch fruit {
    case "🍓": "Goes well with chocolate."
    case "🍊": "Great for some fresh juice."
    case "🍏", "🍎": "Perfect to eat raw."
    case let x where x.contains("🍌"): "Banana!"
    case let x where x.count > 1: "That's a lot of fruit! Are you eating all those \(x)? 😂"
    default: "All fruits are delicious "
    }
}


// MARK: - Functions and Closures

// Writing a function that returns another function that prints any given string.

func printer() {

    func makePrinter() -> ((String) -> Void) {

        return { input in
            print(input)
        }
    }

    let printer = makePrinter()
    printer("I can see this on the console!")
}


// MARK: - Objects and Classes

// Shape with immutable number of sides.

class Shape {
    let numberOfSides: Int

    init(numberOfSides: Int) {
        self.numberOfSides = numberOfSides
    }

    func simpleDescription() -> String {
        return "I'm an shape with \(numberOfSides) sides."
    }
}

class NamedShape: Shape {
    let name: String

    init(name: String, numberOfSides: Int) {
        self.name = name
        super.init(numberOfSides: numberOfSides)
    }

    override func simpleDescription() -> String {
        return super.simpleDescription() + "My name is \(name)."
    }
}

// Implementation of circle with `area` and `perimeter`.`area`.

class Circle: NamedShape {

    var radius: Double

    init(radius: Double, name: String) {
        self.radius = radius
        super.init(name: name, numberOfSides: 0)
    }

    func area() -> Double {
        return Double.pi * radius * radius
    }

    var perimeter: Double {
        return 2 * Double.pi * radius
    }

    override func simpleDescription() -> String {
        return "A circle with radius \(radius)."
    }
}

// Comparing ranks.

enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    func simpleDescription() -> String {
        switch self {
        case .ace: return ""
        case .jack: return "J"
        case .queen: return "Q"
        case .king: return "K"
        default: return String(self.rawValue)
        }
    }
}

func compare(rank: Rank, with anotherRank: Rank) -> Bool {
    return rank.rawValue == anotherRank.rawValue
}

enum Suit {
    case spades, hearts, diamonds, clubs

    func simpleDescription() -> String {
        switch self {
        case .spades: return "♠️"
        case .hearts: return "♥️"
        case .diamonds: return "♦️"
        case .clubs: return "♣️"
        }
    }
}

struct Card {
    var rank: Rank
    var suit: Suit

    func simpleDescription() -> String {
        return "\(rank.simpleDescription())\(suit.simpleDescription())"
    }
}

// Generating a full deck of cards.

extension Card {

    static func fullDeck() -> [Card] {

        var deck: [Card] = []

        func appendFullRank(suit: Suit) {
            for rawValue in 1...13 {
                let card = Card(rank: Rank(rawValue: rawValue)!, suit: suit)
                deck.append(card)
            }
        }

        for suit in [Suit.hearts, Suit.diamonds, Suit.spades, Suit.clubs] {
            appendFullRank(suit: suit)
        }

        return deck
    }
}


// MARK: - Protocols

// Enumeration that conforms to `ExampleProtocol`.

protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

enum SimpleEnum: Int, ExampleProtocol {
    case a = 1, b, c, d

    var simpleDescription: String {
        return "A simple enum \(rawValue)"
    }

    mutating func adjust() {
        if let adjusted = SimpleEnum(rawValue: rawValue + 1) {
            self = adjusted
        } else {
            self = .a
        }
    }
}

// Adding an `absoluteValue` property to the `Double` type.

extension Double {
    var absoluteValie: Double {
        return self > 0 ? self : -self
    }
}


// MARK: - Error Handling

enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}

enum Printer {
    case paperLess
    case tonerLess
    case gasolineBased
    case normal(String)
}

// Implementating Result.

enum Result<Value, Error: Swift.Error> {
    case success(Value)
    case failure(Error)
}

func send(job: Int, toPrinter printer: Printer) -> Result<String, PrinterError> {

    switch printer {
    case .tonerLess: return .failure(PrinterError.noToner)
    case .paperLess: return .failure(PrinterError.outOfPaper)
    case .gasolineBased: return .failure(PrinterError.onFire)
    case .normal(let name): return .success("Job sent to \(name) 🖨")
    }
}


// MARK: - Generics

// Generic stack.

struct Stack<T> {

    private(set) var items: [T] = []

    mutating func push(_ item: T) {
        items.append(item)
    }

    mutating func pop() -> T {
        return items.removeLast()
    }
}

// Random container.

struct Random<T> {
    let items: [T]

    func random() -> T {
        let index = Int(arc4random_uniform(UInt32(items.count)))
        return items[index]
    }
}

let container = Random(items: ["lorem", "ipsum", "dolor", "sit", "amet"])
