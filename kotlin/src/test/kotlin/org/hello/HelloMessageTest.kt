package org.hello

import io.kotest.core.spec.style.DescribeSpec
import io.kotest.matchers.shouldBe

class HelloMessageTest : DescribeSpec({

  describe("HelloMessage") {
    it("should return hello world") {
      val message = HelloMessage()
      message.text shouldBe "Hello World!"
    }
  }
})
