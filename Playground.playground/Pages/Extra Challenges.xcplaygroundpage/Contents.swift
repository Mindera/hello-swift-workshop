/*:
 [Table of Contents](Table%20of%20Contents) • [Previous page](@previous) • [Next page](@next)
 */

/*:
 ### Challenge: Forward Operator `|>` (or Pipe Operator)
 */

challenge("challenge 01") {

    // Examples:
    // - `100 |> toString |> count` is equivalent to `count(toString(100))`
    // - `convertToGrayscale(image: adjustColors(image: image)` is equivalent to
    //   `image |> adjustColors |> convertToGrayscale`
    // TIP: You need two generic types.

    func toString(_ value: Int) -> String { return String(value) }
    func count(_ string: String) -> Int { return string.count }

    let result = count(toString(100))
    print(result)
}

/*:
 ### Challenge: Reverse Polish Notation

 Reverse Polish notation (RPN), also known as Polish postfix notation or simply postfix notation,
 is a mathematical notation in which operators follow their operands.

 In reverse Polish notation, the operators follow their operands; for instance, to add 3 and 4, one would write 3 4 +
 rather than 3 + 4. If there are multiple operations, operators are given immediately after their second operands;
 so the expression written 3 − 4 + 5 in conventional notation would be written 3 4 − 5 + in reverse Polish notation.
 */
challenge("challenge 02") {

    func solve(expression: String) -> Double {

        return 0
    }

    // "3 4 +" => 7
    // "3 5 + 2 *" => 16
    let input = "3 5 + 2 *"
    let output = solve(expression: input)
    print("Input: \(input)\nOutput: \(output)")

}

/*:
 [Table of contents](Table%20of%20contents) • [Previous page](@previous)
 */
