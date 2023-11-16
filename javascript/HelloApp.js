const HelloMessage = require("./HelloMessage.js");
const HelloConsole = require("./HelloConsole.js");

class HelloApp {
  constructor(helloMessage, helloConsole) {
    this.helloMessage = helloMessage;
    this.helloConsole = helloConsole;
  }

  printHello() {
    this.helloConsole.print(this.helloMessage.text);
  }
}

module.exports = HelloApp;
