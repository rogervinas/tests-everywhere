package org.hello

@main def main(): Unit =
  val message = HelloMessage()
  val console = HelloConsole()
  val app = HelloApp(message, console)
  app.printHello()

