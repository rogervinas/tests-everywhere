package org.hello;

import org.junit.jupiter.api.Test;

import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

class HelloAppTest {

  @Test
  void shouldPrintHelloMessage() {
    var messageText = "Hello Test!";
    var message = mock(HelloMessage.class);
    when(message.getText()).thenReturn(messageText);

    var console = mock(HelloConsole.class);

    var app = new HelloApp(message, console);
    app.printHello();

    verify(console).print(messageText);
  }
}
