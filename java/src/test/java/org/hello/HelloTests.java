package org.hello;

import org.junit.jupiter.api.Test;
import org.mockito.Mockito;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

class HelloTests {

  @Test
  void shouldReturnHelloWorld() {
    var message = new HelloMessage();
    assertThat(message.getText()).isEqualTo("Hello World!");
  }

  @Test
  void shouldPrintHelloMessage() {
    var messageText = "Hello Test!";
    var message = mock(HelloMessage.class);
    when(message.getText()).thenReturn(messageText);

    var console = Mockito.mock(HelloConsole.class);

    var app = new HelloApp(message, console);
    app.printHello();

    verify(console).print(messageText);
  }
}
