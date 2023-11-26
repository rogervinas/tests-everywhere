@main
public struct Hello {
  public static func main() {
    let message = HelloMessage()
    let console = HelloConsole()
    let app = HelloApp(message: message, console: console)
    app.printHello()
  }
}
