class StringInterpolation {
    let foo = "foo"
    let bar = "bar"

    var description: String {
        return "StringInterpolation{foo: \(self.foo)}"
    }

    var rawStringLiteral: String {
        return #"StringInterpolation{foo: \#(self.foo)} using "raw" string literals."#
    }

    func localVariableInterpolation() -> String {
        let a = "a"
        let b = "b"
        return "\(a)\(b)"
    }
}
