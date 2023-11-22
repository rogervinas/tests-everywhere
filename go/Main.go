package main

func main() {
    message := HelloWorldMessage{}
    console := HelloSystemConsole{}
    app := HelloApp{&message, &console}
    app.PrintHello()
}
