import Foundation

public func example(_ description: String, action: () -> Void) {
    print("\n--- \(description) ---\n")
    action()
}

public func challenge(_ description: String, action: () -> Void) {
    print("\n|> Challenge: \(description)\n")
    action()
}

public enum Prefix: String {
    case imperative = "Imperative"
    case functional = "Functional"
}

public func output(_ prefix: Prefix, value: Any) {

    print("\(prefix.rawValue): \(value)")
}
