class HelloApp {

  let message: HelloMessage
  let console: HelloConsole

  init(message: HelloMessage, console: HelloConsole) {
    self.message = message
    self.console = console
  }

  func printHello() {
    console.print(👋: message.👋)
  }
}
