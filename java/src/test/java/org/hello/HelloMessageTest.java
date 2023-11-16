package org.hello;

import org.junit.jupiter.api.Test;

import static org.assertj.core.api.Assertions.assertThat;

class HelloMessageTest {

  @Test
  void shouldReturnHelloWorld() {
    var message = new HelloMessage();
    assertThat(message.getText()).isEqualTo("Hello World!");
  }
}
