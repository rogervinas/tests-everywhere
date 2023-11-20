package org.hello

class HelloApp(message: HelloMessage, console: HelloConsole):
  def printHello(): Unit =
    console.print(message.text)
