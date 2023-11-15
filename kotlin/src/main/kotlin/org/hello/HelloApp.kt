package org.hello

class HelloApp(private val message: HelloMessage, private val console: HelloConsole) {
    fun printHello() {
        console.print(message.text)
    }
}
