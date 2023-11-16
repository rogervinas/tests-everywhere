package org.hello;

public class Main {

  public static void main(String[] args) {
    var message = new HelloMessage();
    var console = new HelloConsole();
    new HelloApp(message, console).printHello();
  }
}
