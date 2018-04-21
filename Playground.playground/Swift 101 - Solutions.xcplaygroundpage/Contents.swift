// Credits to Apple Inc. “The Swift Programming Language (Swift 4.1).”:
// - https://itunes.apple.com/pt/book/the-swift-programming-language-swift-4-1/id881256329?l=en&mt=11
// - https://github.com/danielpi/Swift-Playgrounds 🙏

//: [Previous](@previous)

import Foundation

/*:
 ## Swift 101
 */

//: ### Simple Values

example("simple values") {

    var myVariable = 1337
    let myConstant = 1337
}

/*:
 #### Exercise:
 Set `myVariable` value to `0` and `myConstant` value to `0`
 */

example("type safety") {

    let implicitInteger = 1337
    let implicitDouble = 13.37
    let explicitDouble: Double = 13.37
}

/*:
 #### Exercise:
 Create a variable with an explicit type of `Float` and a value of 1.337

 _*Bonus*_: Create an implicit constant `Double` with the value `2π` ✨
 */

//let newExplicit: Float = 1.337
//let twoPi = Double.pi * 2

//: Values are never implicitly converted to another type.

example("type inference") {

    let label = "The answer is "
    let width = 42
    let widthLabel = label + String(width)
}

/*:
 #### Exercise:
 Try removing the conversion to `String` on the previous line. What happens?
 */

// let widthLabel2 = label + width // Binary operation '+' cannot be applied to operands of type 'String and 'Int'

example("string interpolation") {

    let apples = 3
    let oranges = 5
    let appleSummary = "I have \(apples) apples"
    let fruitSummary = "I have \(apples + oranges) pieces of fruit"
}

/*:
 #### Exercise:
 Use \() to include a floating-point calculation in a string and to include someone’s name in a greeting.
 */

//let π: Float = 3.14
//let name = "Peter Pie"
//let piePy = "\(name) likes the number \(π)"

//: ### Arrays and Dictionaries

example("collections") {

    var shoppingList = ["🍏", "🍖", "🥔", "🥦", "🥑"]
    shoppingList[1] = "🍄"
    shoppingList

    var occupations = [
        "Tozé": "iOS Engineer",
        "Paulo": "QA Engineeer",
        ]
    occupations["Minder"] = "Product Owner"
    occupations

    // Initialising an empty array or dict

    let emptyArray = [String]()
    let anotherEmptyArray: [String] = []
    let yetAnotherEmptyArray = Array<String>() // don't typically use this syntax 🙈

    var emptyDictionary = [String : Float]()
    var anotherEmptyDictionary: [String : Float] = [:]
    var yetAnotherEmptyDictionary = Dictionary<String, Float>() // we don't typically use this syntax 😝

    shoppingList = []
    emptyDictionary = [:]
}


/*:
 ### Optionals

 Normal values cannot be nil. They must have a valid value. Sometimes you may not have a valid value.
 In this case you can use an optional type. They are values that can either hold a valid value or nil.
 */

example("optionals") {

    var optionalString: String? = "Hello"
    optionalString == nil

    var optionalName: String? = "John Appleseed"
    //optionalName = nil

    // Optional binding

    var greeting = "Hello!"
    if let name = optionalName {
        greeting += ", \(name)"
    } else {
        greeting
    }

    // Optional chaining

    optionalName?.uppercased()

    // Optional nil coalescing

    let nickName: String? = nil
    let fullName: String = "John Appleseed"
    let informalGreeting: String = "Hi \(nickName ?? fullName)"
}

//: ### Ranges

example("ranges") {

    let range = 0..<10
    let anotherRange = 0...9
    let leftOpenRange = ...9
    let rightOpenrange = 9...
}

//: ### Control Flow

//: **if statements**

example("if") {

    let number = 12345
    var fizzBuzz = ""

    if number % 3 == 0 {
        fizzBuzz = "Fizz"
    } else if number % 5 == 0 {
        fizzBuzz = "Buzz"
    } else {
        // ¯\_(ツ)_/¯
    }

    fizzBuzz
}

/*:
 #### Exercise:
 How about the FizzBuzz case? 😢 (i.e. divisible by 3 and 5?)
 */

challenge("fizz buzz") {

    //if number % 3 == 0 && number % 5 == 0 {
    //    fizzBuzz = "FizzBuzz"
    //} else ...
}

//: **guard statements**

example("guard") {

    func doSomethingWhenOdd(number: Int) {
        guard number % 2 != 0 else {
            print("number \(number) is even! 👋😭")
            return
        }
        print("number \(number) is odd! 😄🎉")

        // do something
    }

    doSomethingWhenOdd(number: 123)
}

//: **defer**

example("defer") {

    var fridgeIsOpen: Bool = false
    let fridgeContent = ["🥛", "🥚", "🍅"]

    func fridgeContains(_ food: String) -> Bool {
        fridgeIsOpen = true
        defer {
            // this always runs when exiting the scope
            fridgeIsOpen = false
        }

        let result = fridgeContent.contains(food)
        return result
    }
    fridgeContains("🥦")
    fridgeIsOpen
}


//: **switches**

example("switch") {

    let fruit = "🍊"
    switch fruit {
    case "🍓": "Goes well with chocolate."
    case "🍊": "Great for some fresh juice."
    case "🍏", "🍎": "Perfect to eat raw."
    case let x where x.count > 1: "That's a lot of fruit! Are you eating all those \(x)? 😂"
    default: "All fruits are delicious "
    }
}

/*: Note
 > If `default:` is removed we get the error "Switch must be exhaustive". This means that every
 > possible option must be included in the switch/case statement so that the result cannot be
 > undefined.
 */

/*:
 #### Exercise:
 Add a new case to match any set of fruit containing at least one banana `"🍌"`
 */

//: **for-in loop (also tuples)**

example("for-in") {

    let interestingNumbers = [
        "Prime": [2,3,5,7,11,13],
        "Fibonacci": [1,1,2,3,5,8],
        "Square": [1,4,9,16,25],
        ]
    var largest = 0
    var largestKind = ""
    for (kind, numbers) in interestingNumbers {
        for number in numbers {
            if number > largest {
                largest = number
                largestKind = kind
            }
        }
    }
    largest
    largestKind
}

//: Indexes in loops and the Range operators

example("enumerations and ranges") {

    var total = 0
    for i in 0..<5 {
        total += i
    }
    total

    var total2 = 0
    for (i, num) in [1,2,3,4,5].enumerated() {
        total2 += num * i
    }
    total2
}


//: **while loop**

example("while") {

    var n = 2
    while n < 100 {
        n = n * 2
    }
    n
}

//: **repeat-while (do-while) loop**

example("repeat-while") {

    var m = 2
    repeat {
        m = m * 2
    } while m < 100
    m
}

//: ### Functions and Closures

example("Simple Function") {

    func greet(person: String, day: String) -> String {
        return "Hello \(person), today is \(day)."
    }

    let result = greet(person: "Toy", day: "Saturday")
    print(result)
}

example("Custom Argument Labels") {

    func greet(_ person: String, on day: String) -> String {
        return "Hello \(person), today is \(day)."
    }

    let result = greet("Toy", on: "Saturday")
    print(result)
}

example("Nested Functions") {

    func fifteen() -> Int {
        var n = 10
        func add() {
            n += 5
        }
        add()
        return n
    }

    print(fifteen())
}

example("Returning Functions") {

    // Functions are a first-class type.
    // This means that a function can return another function as its value.

    func makeIncrementer() -> ((Int) -> Int) {
        func addOne(number: Int) -> Int {
            return 1 + number
        }
        return addOne
    }

    let incrementer = makeIncrementer()
    let eight = incrementer(7)
    print(eight)
}

/*:
 #### Exercise:
 Write a function that returns another function that prints any given string.
 */

challenge("Printer") {

    //    let printer = makePrinter()
    //    printer("I can see this on the console!")
}

//: ### Objects and Classes

class Shape {
    var numberOfSides = 0

    func simpleDescription() -> String {
        return "I'm an shape with \(numberOfSides) sides."
    }
}

var shape = Shape()
shape.numberOfSides = 2
shape.simpleDescription()

class NamedShape: Shape {
    let name: String

    init(name: String) {
        self.name = name
    }

    override func simpleDescription() -> String {
        return super.simpleDescription() + "My name is \(name)."
    }
}

var whiteCircle = NamedShape(name: "⚪️")
whiteCircle.simpleDescription()

/*:
 #### Exercise:
 Shape's number of sides don't (usually) change, right? 🤔.
 Make `Shape.numberOfSides` immutable. What happens?
 Now remove it's default value of 0. Now what?
 */

// let numberOfSides -> let numberOfSides: Int -> init(numberOfSides:) -> super.init(numberOfSides:)

final class Square: NamedShape {

    private(set) var sideLength: Double

    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }

    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }

    func area() -> Double {
        return sideLength * sideLength
    }

    var perimeter: Double {
        get {
            return sideLength * 4
        }
        set (newPerimeter){
            sideLength = newPerimeter / 4.0
        }
    }
}

let square = Square(sideLength: 5.2, name: "🔲")
square.area()
square.simpleDescription()

/*:
 #### Exercise:
 Implement the class `Circle`, that also has an `area` and a `perimeter`
 */

//: ### Enumerations

// enums don't need to be backed by a raw value if they don't make sense. You can also use Int, Double or String as the raw backing type
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
let ace = Rank.ace
let aceRawValue = ace.rawValue
ace.simpleDescription()
let two = Rank.two
two.simpleDescription()
two.rawValue

/*:
 #### Exercise:
 Write a function that compares two `Rank` by comparing their raw values
 */

//func compare(rank: Rank, toRank: Rank) -> Bool {
//    return rank.rawValue == toRank.rawValue
//}
//compare(rank: ace, toRank: two)
//compare(rank: ace, toRank: ace)

if let newRank = Rank(rawValue: 3) {
    newRank.simpleDescription()
}

let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()
// hearts.toRaw() // This is an error because Suit doesn't have a raw backing type.

//: ### Structures

struct Card {
    var rank: Rank
    var suit: Suit

    func simpleDescription() -> String {
        return "\(rank.simpleDescription())\(suit.simpleDescription())"
    }
}

/*:
 #### Exercise:
 Add a method to Card that creates a full deck of cards, with one card of each combination of rank and suit
 */

//extension Card {
//    func createFullDeck() -> [Card] {
//        var deck: [Card] = []
//
//        func appendFullRank(suit: Suit) {
//            for rawRank in 1...13 {
//                let card = Card(rank: Rank(rawValue:rawRank)!, suit: suit)
//                deck.append(card)
//            }
//        }
//
//        for suit in [Suit.hearts, Suit.diamonds, Suit.spades, Suit.clubs] {
//            appendFullRank(suit: suit)
//        }
//
//        return deck
//    }
//}
//
//let aFullDeck = threeOfSpades.createFullDeck()
//aFullDeck.map({ card in card.simpleDescription() })


let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()

//: ### Protocols

protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += " Now 100% adjusted."
    }
}
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription

// Experiment -

/*:
 #### Exercise:
 Write an enumeration that conforms to this protocol
 */

//enum SimpleEnum: Int, ExampleProtocol {
//    case A = 1, B, C, D, E
//
//    var simpleDescription: String {
//        get {
//            return "A simple enum \(self.rawValue)"
//        }
//    }
//    mutating func adjust() {
//        self = SimpleEnum(rawValue:(self.rawValue + 1))!
//    }
//}
//var c = SimpleEnum.A
//c.adjust()
//let cDescription = c.simpleDescription

//: ### Extensions

//: Type extensions

extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }

    mutating func adjust() {
        self += 42
    }
}

7.simpleDescription
/*: Note:
 > The 7 above is a literal constant, not a variable. Therefore you can't mutate it with adjust.
 */

var someInt = 4
someInt.adjust()
someInt

/*:
 #### Exercise:
 Write an extension for the `Double` type that adds an `absoluteValue` property.
 */

//extension Double {
//    var absoluteValue: Double {
//        return self > 0 ? self : -self
//    }
//}
//
//var aDouble = -7.0
//aDouble.absoluteValue
//
//4.absoluteValue
// (-6.0).absoluteValue
//let neg = -6.0
//neg.absoluteValue

//: Protocol extensions

extension ExampleProtocol {

    var upperDescription: String {
        return simpleDescription.uppercased()
    }
}
 
//: Protocols enabling polymorphism

let protocolValue: ExampleProtocol = a
protocolValue.simpleDescription
protocolValue.upperDescription
// protocolValue.anotherProperty // Uncomment to see the error

//let protocols: [ExampleProtocol] = [a, 123, Double.pi]

//: Associated types

protocol Animal {
    associatedtype Food

    func eat(food: Food) -> String
}

enum Bug: String {
    case 🐛
    case 🦗
}

class Bird: Animal {
    typealias Food = Bug

    func eat(food: Food) -> String {
        return "🐦 is eating an \(food.rawValue)"
    }
}

struct Banana {
    let description = "🍌"
}

class Monkey: Animal {
    func eat(food: Banana) -> String {
        return "🐒 is eating a \(food.description)"
    }
}

/*:
 #### Exercise:
 Try to create an array of `[Animal]`. What happens?
 */
// let animals: [Animal]

/*: ### Error Handling
 You represent errors using any type that conforms to the `Error` protocol
 */

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

func send(job: Int, toPrinter printer: Printer) throws -> String {

    switch printer {
    case .tonerLess: throw PrinterError.noToner
    case .paperLess: throw PrinterError.outOfPaper
    case .gasolineBased: throw PrinterError.onFire
    case .normal(let name): return "Job sent to \(name) 🖨"
    }
}

do {
    let response = try send(job: 1337, toPrinter: .normal("Room 404"))
} catch {
    error
}

/*:
 #### Exercise:
 Try sending a job to the `tonerLess` printer
 */

//do {
//    let response = try send(job: 123, toPrinter: .tonerLess)
//    printerResponse2
//} catch {
//    error
//}

// You can provide multiple catch blocks to handle specific errors, using pattern matching 💪

do {
    let response = try send(job: 123, toPrinter: .normal("Room 404"))
} catch PrinterError.onFire {
    print("I'll just put this over here, with the rest of the fire 🔥")
} catch let printerError as PrinterError {
    print("Printer error: \(printerError).")
} catch {
    print(error)
}

/*:
 #### Exercise:
 - Try sending a job to other printers and see what happens... 💣 👀
 - use `try?` to avoid having to use `do catch` blocks, and receive `nil` when an error occurs (ignoring the error)
 */

//let printerSuccess = try? send(job: 1884, toPrinter: .normal("Room 203"))
//let printerFailure = try? send(job: 1885, toPrinter: .tonerLess)

/*:
 *Result*

 Avoid the `throws` and `do-try-catch` dance, by wrapping both success and failure cases into a single type, and using it as the return type 😍
 */

/*:
 #### Exercise:
 - Implement a basic `Result` type.
 - Convert the Printer example to use your new `Result` type.
 */

/*:
 ### Generics
 */

example("Generic Types") {

    func swapInts(a: inout Int, b: inout Int) {
        let tempA = a
        a = b
        b = tempA
    }

    var first = 5
    var second = 20

    swapInts(a: &first, b: &second)
    print("first is \(first) and second is \(second)")

    // What if now you want to swap two String values or two Double values?
    // You would need to write different functions, such as 'swapStrings' and 'swapDoubles'.
    //
    // Generics come to rescue.
    //
    // Generic programming is a way to write functions and data types while making minimal
    // assumptions about the type of data being used.

    func swap<T>(a: inout T, b: inout T) {

        let temp = a
        a = b
        b = temp
    }

    var hello = "hello"
    var world = "world"

    swap(a: &hello, b: &world)
    print("hello is \(hello) and world is \(world)")
}

/*:
 #### Exercise:
 Write a generic stack that accepts any kind of values.
 */

challenge("Generic Stack") {

    struct IntStack {

        private(set) var items: [Int] = []

        mutating func push(_ item: Int) {
            items.append(item)
        }

        mutating func pop() -> Int {
            return items.removeLast()
        }
    }
}

example("Type Constraints") {

    // The following function search for an integer in an array of integers and returns the
    // corresponding index or nil if the element doesn't exist.

    func findInt(element: Int, in array: [Int]) -> Int? {
        for (index, value) in array.enumerated() {
            if value == element {
                return index
            }
        }
        return nil
    }

    // A generic version allows to search an element in any kind of array. For this to work,
    // a type constraint is used. We're basically saying that we can use any type as long as it
    // conforms to the `Equatable` protocol.

    func find<T: Equatable>(element: T, in array: [T]) -> Int? {
        for (index, value) in array.enumerated() {
            if value == element {
                return index
            }
        }
        return nil
    }
}

/*:
 #### Exercise:
 Write a random container that takes an array of elements and returns a random element.
 */

challenge("Random Container") {

    struct RandomInt {
        let items: [Int]

        func random() -> Int {
            let index = Int(arc4random_uniform(UInt32(items.count)))
            return items[index]
        }
    }

    let container = RandomInt(items: [1, 2, 3, 4, 5])
    print(container.random())
}

//: [Next](@next)
