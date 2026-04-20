class LocalStringInterpolation {
    var bar: String

    init() {
        let a = "a"
        let b = "b"
        self.bar = "\(a)\(b)".uppercased()
    }
}
