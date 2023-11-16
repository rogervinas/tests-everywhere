const HelloMessage = require("./HelloMessage");
const HelloConsole = require("./HelloConsole");
const HelloApp = require("./HelloApp");

const helloMessage = new HelloMessage();
const helloConsole = new HelloConsole();
const helloApp = new HelloApp(helloMessage, helloConsole);
helloApp.printHello();
