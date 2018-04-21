
/*:
 [Table of Contents](Table%20of%20Contents) • [Previous page](@previous) • [Next page](@next)

 ## Higher Order Functions

 In mathematics and computer science, a higher-order function is a function that does at least one of the following:
   - takes one or more functions as arguments,
   - returns a function as its result.
 */

/*:
 ### Map

 Applies a given function to each element of a collection, returning a collection of results in the same order.
 It is often called `apply-to-all` when considered in functional form.

 `[🐖, 🐓].map(cook) => [🥓, 🍗]`

 In Swift, `map` is declared as a method on collections with the signature: `func map<U>(transform: (T) -> U) -> [U]`.
 It just means that it receives a function named `transform`that maps the each element of type `T` to a new type `U`
 and returns a new collection of `U`s.
 */

example("map") {

    func square(a: Int) -> Int {
        return a * a
    }

    // Imperative

    let numbers = [1, 2, 3, 2, 1]
    var squaredNumbers: [Int] = []

    for number in numbers {
        let squared = square(a: number)
        squaredNumbers.append(squared)
    }

    output(.imperative, value: squaredNumbers)

    // Functional

    let squaredNumber2 = numbers.map(square)
    output(.functional, value: squaredNumber2)

    // or
    numbers.map({ number in square(a: number) })
    numbers.map { number in number * number }
}

/*:
 ***Exercise:***

 Write a function that converts any given string into its uppercased representation.

 Example: `"Cassandra Hubbard" => "CASSANDRA HUBBARD"`
 */

challenge("UPPERCASED NAMES") {

    let names = [
        "Cassandra Hubbard",
        "Yolanda Stevens",
        "Sasha Hampton",
        "Kylee Holbrook"
    ]

    // TIP: String has a method called `uppercased`.
}

/*:
 ### Filter

 Processes a collection in some order to produce a new collection containing exactly those elements of
 the original data structure for which a given predicate returns the boolean value `true`.

 `[🍶,🍓,🍖,🍎,🥩].filter(isVegetarian) => [🍶,🍓,🍎]`

 In Swift, `filter` is declared as a method on collections with the signature:
 `func filter<U>(isIncluded predicate: (U) -> Bool) -> [U]`. It receives a function `isIncluded` that returns `true`
 or `false` for elements of the collection and returns only elements that return `true` when the predicate is called
 on them.
 */

example("filter") {

    func isEven(_ a: Int) -> Bool {
        return a % 2 == 0
    }

    // Imperative

    let numbers = [1, 2, 3, 4, 5]
    var evenNumbers: [Int] = []

    for number in numbers {
        if isEven(number) {
            evenNumbers.append(number)
        }
    }

    output(.imperative, value: evenNumbers)

    // Functional

    let evenNumbers2 = numbers.filter(isEven)
    output(.functional, value: evenNumbers2)

    // or
    numbers.filter { number in isEven(number) }
    numbers.filter { $0 % 2 == 0 }
}

/*:
 ***Exercise:***

 Find all the products out of stock.
 */

challenge("Products out of stock") {

    struct Product {
        let name: String
        let stock: Int
    }

    let products = [
        Product(name: "MacBook Pro", stock: 10),
        Product(name: "iMac Pro", stock: 0),
        Product(name: "iPhone X", stock: 5),
        Product(name: "AirPods", stock: 0)
    ]
}

/*:
 ### Reduce

 Analyzes a recursive data structure and through use of a given combining operation, recombines the results of
 recursively processing its constituent parts, building up a return value.

 `[🎷,🎺,🎹].reduce(play) => [🎶]`

 In Swift, `reduce` is declared as method with the signature: `func reduce<U,T>(initial: U, combine: (U, T) -> U) -> U`.
 It receives an initial element of type `U` and a function that specifies how to combine an element of type `U` with an
 element of type `T` to a single element of type `U`.
 */

example("reduce") {

    let costs = [20, 30, 10]

    // Imperative

    var sum = 0
    for cost in costs {
        sum += cost
    }

    output(.imperative, value: sum)

    // Functional

    func add(left: Int, right: Int) -> Int {
        return left + right
    }

    let sum2 = costs.reduce(0, add)
    
    output(.functional, value: sum2)

    // or
    costs.reduce(0, { sum, number in return sum + number })
    costs.reduce(0, +) // Can you guess why is this possible?
}

/*:
 ***Exercise:***

 Combine all the strings into a single one. Languages should be separated with the separator: " > ".

 Example: `["abc", "def"] => "abc > def"`
 */
challenge("Joined strings") {

    let languages = ["Swift", "Kotlin", "Ruby", "Python", "Java"]
}

/*:
 ### Flat Map

  Flattens a collection of collections.

 `[[🍏, 🍐, 🍊], [🍌, 🍉], [🍓]] => [🍏, 🍐, 🍊, 🍌, 🍉, 🍓]`

 In Swift, `flatMap` is declared as a method with the signature: `func flatMap<U>([T] -> U?) -> [U]`.
 */

example("flatMap") {

    let collections = [[3, 4, 8], [3], [4, 7, 2]]

    var flattened: [Int] = []

    // Imperative

    for collection in collections {
        for value in collection {
            flattened.append(value)
        }
    }

    output(.imperative, value: flattened)

    // Functional

    let flattened2 = collections.flatMap { $0 }

    output(.functional, value: flattened2)
}

/*:
 ***Exercise:***

 Flat into a single collection all the even numbers.
 */

challenge("Nested even numbers") {

    let numbers = [[1, 3, 6], [4, 5], [8, 3, 1, 2]]

    // TIP: You can use another higher-level function inside the `flatMap` to find the even numbers.
}

/*:
 ### Chaining

 The `map` and `filter` methods act on a collection and returns another collection. You can then apply another higher
 order function on this collection.
 */

example("chaining") {

    // Sum of the squares of all even numbers from arrays of arrays

    let arrays = [[1, 3, 6, 6], [2, 7], [1, 2, 3, 4]]

    func isEven(_ n: Int) -> Bool { return n % 2 == 0 }
    func square(_ n: Int) -> Int { return n * n }

    // Imperative

    var sum = 0

    for array in arrays {

        for value in array {

            if isEven(value) {

                sum += square(value)
            }
        }
    }

    output(.imperative, value: sum)

    // Functional

    let sum2 = arrays.flatMap({ $0 }).filter(isEven).map(square).reduce(0, +)

    output(.functional, value: sum2)
}

/*:
 ***Exercise:***

 Retrieve an array containing all names of the products.
 */

challenge("All products owned in a group of people") {

    struct Product {
        let name: String
    }

    struct Person {
        let name: String
        let products: [Product]
    }

    let people = [
        Person(name: "Josh", products: [Product(name: "iMac"), Product(name: "Apple Watch")]),
        Person(name: "Minder", products: [Product(name: "MacBook Pro"), Product(name: "iPad")])
    ]
}

/*:
 [Table of contents](Table%20of%20contents) • [Previous page](@previous) • [Next page](@next)
 */
