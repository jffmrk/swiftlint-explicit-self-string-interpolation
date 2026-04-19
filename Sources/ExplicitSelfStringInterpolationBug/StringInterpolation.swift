class StringInterpolation {
    let foo = "foo"
    let bar = "bar"
    var combo: String

    var description: String {
        return "StringInterpolation{foo: \(self.foo)}"
    }

    var rawStringLiteral: String {
        return #"StringInterpolation{foo: \#(self.foo)} using "raw" string literals."#
    }

    init() {
        let a = "a"
        let b = "b"
        self.combo = "\(a)\(b)"
    }
}
