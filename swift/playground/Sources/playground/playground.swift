@main
public struct playground {
    public private(set) var text = "Hello, World!"

    public static func main() {
        print(playground().text)
    }
}
