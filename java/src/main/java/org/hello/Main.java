package org.hello;

public class Main {

  public static void main(String[] args) {
    var message = new HelloMessage();
    var console = new HelloConsole();
    var app = new HelloApp(message, console);
    app.printHello();
  }
}
