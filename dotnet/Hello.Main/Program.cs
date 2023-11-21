using Hello.Main;

var message = new HelloWorldMessage();
var console = new HelloSystemConsole();
var app = new HelloApp(message, console);
app.PrintHello();
