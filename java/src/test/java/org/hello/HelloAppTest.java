package org.hello;

import org.junit.jupiter.api.Test;
import org.mockito.Mockito;

import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

class HelloAppTest {

  @Test
  void shouldPrintHelloWorld() {
    var messageText = "Hello World!";
    var message = mock(HelloMessage.class);
    when(message.getText()).thenReturn(messageText);

    var console = Mockito.mock(HelloConsole.class);

    var app = new HelloApp(message, console);
    app.printHello();

    verify(console).println(messageText);
  }
}
