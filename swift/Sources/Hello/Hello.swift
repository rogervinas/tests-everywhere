@main
public struct Hello {
    public private(set) var text = "Hello, World!"

    public static func main() {
        print(Hello().text)
    }
}
