package org.hello;

public class HelloApp {

  private final HelloMessage message;
  private final HelloConsole console;

  public HelloApp(HelloMessage message, HelloConsole console) {
    this.message = message;
    this.console = console;
  }

  public void printHello() {
    console.print(message.getText());
  }
}
