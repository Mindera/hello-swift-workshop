import Foundation

// MARK: - Forward Operator

precedencegroup LeftApplyPrecedence {
    associativity: left
    higherThan: AssignmentPrecedence
    lowerThan: TernaryPrecedence
}

infix operator |> : LeftApplyPrecedence

func |> <A, B>(x: A, f: (A) -> B) -> B {
    return f(x)
}

// MARK: - Reverse Polish Notation

enum Element {
    case operand(Double)
    case `operator`(Operator)
}

enum Operator {
    case add
    case subtract
    case divide
    case multiply

    var operation: (Double, Double) -> Double {
        switch self {
        case .add:
            return { $0 + $1 }
        case .subtract:
            return { $0 - $1 }
        case .divide:
            return { $0 / $1 }
        case .multiply:
            return { $0 * $1 }
        }
    }
}

func element(string: String) -> Element {

    switch string {
    case "+":
        return .operator(.add)
    case "-":
        return .operator(.subtract)
    case "/":
        return .operator(.divide)
    case "*":
        return .operator(.multiply)
    default:
        return .operand(Double(string)!)
    }
}

func solve(expression: String) -> Double {

    let elements = expression.components(separatedBy: " ").map { element(string: $0) }

    let results = elements.reduce([]) { accumulator, element -> [Double] in

        switch element {
        case .operand(let value):
            return [value] + accumulator
        case .operator(let `operator`):
            let value = `operator`.operation(accumulator[0], accumulator[1])
            return [value] + Array(accumulator[2..<accumulator.count])
        }
    }

    return results.first!
}

// "3 4 +" => 7
// "3 5 + 2 *" => 16
let input = "3 5 + 2 *"
let output = solve(expression: input)
