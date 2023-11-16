package org.hello

fun main() {
  val message = HelloMessage()
  val console = HelloConsole()
  val app = HelloApp(message, console)
  app.printHello()
}
