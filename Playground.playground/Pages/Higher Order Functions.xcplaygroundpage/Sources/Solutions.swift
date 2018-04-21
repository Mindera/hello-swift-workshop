import Foundation

// MARK: - Map

func uppercasedNames() {

    let names = [
        "Cassandra Hubbard",
        "Yolanda Stevens",
        "Sasha Hampton",
        "Kylee Holbrook"
    ]

    let uppercase = names.map { name in name.uppercased() }
}


// MARK: - Filter

func products() {

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

    let outOfStock = products.filter { product in product.stock == 0 }
}


// MARK: - Reduce

func join() {

     let languages = ["Swift", "Kotlin", "Ruby", "Python", "Java"]

    let join = languages.reduce("") { result, language in
        return result.isEmpty ? language : result + " > " + language
    }
}


// MARK: - Flat Map

func evenNumbers() {

    let numbers = [[1, 3, 6], [4, 5], [8, 3, 1, 2]]
    let even = numbers.flatMap { $0.filter { $0 % 2 == 0 } }

}


// MARK: - Chaining

func ownedProducts() {

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

    let names = people.flatMap { $0.products }.map { $0.name }
}
