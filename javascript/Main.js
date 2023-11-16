const HelloMessage = require("./HelloMessage");
const HelloConsole = require("./HelloConsole");
const HelloApp = require("./HelloApp");

const message = new HelloMessage();
const console = new HelloConsole();
const app = new HelloApp(message, console);
app.printHello();
