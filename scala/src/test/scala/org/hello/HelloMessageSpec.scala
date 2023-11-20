package org.hello

import org.scalatest.flatspec.AnyFlatSpec

class HelloMessageSpec extends AnyFlatSpec {

  "A HelloMessage" should "return hello world" in {
    val message = HelloMessage()
    assertResult(message.text) {
      "Hello World!"
    }
  }
}
