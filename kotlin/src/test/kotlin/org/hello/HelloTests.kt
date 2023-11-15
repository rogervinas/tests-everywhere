package org.hello

import io.kotest.core.spec.style.DescribeSpec
import io.kotest.matchers.shouldBe
import io.mockk.Runs
import io.mockk.every
import io.mockk.just
import io.mockk.mockk
import io.mockk.verify

class HelloTests : DescribeSpec({

  describe("HelloMessage") {
    it("should return hello world") {
      val message = HelloMessage()
      message.text shouldBe "Hello World!"
    }
  }

  describe("HelloApp") {
    it("should print hello message") {
      val messageText = "Hello Test!"
      val message = mockk<HelloMessage>()
      every { message.text } returns (messageText)

      val console = mockk<HelloConsole>()
      every { console.print(any()) } just Runs

      val app = HelloApp(message, console)
      app.printHello()

      verify { console.print(messageText) }
    }
  }
})
