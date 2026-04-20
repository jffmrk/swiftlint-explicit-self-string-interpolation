class RawStringInterpolation {
    let foo = "foo"

    var description: String {
        return #"StringInterpolation{foo: \#(self.foo)} using "raw" string literals."#
    }
}
