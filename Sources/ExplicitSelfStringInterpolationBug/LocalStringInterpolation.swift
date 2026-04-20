class LocalStringInterpolation {
    let foo = "foo"

    var description: String {
        let a = "a"
        let b = "b"
        return "\(a)\(b)\(self.foo)"
    }
}
