package org.hello

import org.mockito.Mockito.{verify, when}
import org.scalatest.flatspec.AnyFlatSpec
import org.scalatestplus.mockito.MockitoSugar.mock

class HelloAppSpec extends AnyFlatSpec {

  "A HelloApp" should "print hello message" in {
    val messageText = "Hello Test!"
    val message = mock[HelloMessage]
    when(message.text).thenReturn(messageText)

    val console = mock[HelloConsole]

    val app = HelloApp(message, console)
    app.printHello()

    verify(console).print(messageText)
  }
}