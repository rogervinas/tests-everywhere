using HelloApp.Main;

var message = new HelloWorldMessage();
var console = new HelloSystemConsole();
var app = new HelloApp.Main.HelloApp(message, console);
app.PrintHello();
