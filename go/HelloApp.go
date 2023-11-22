package main

type HelloApp struct {
    message HelloMessage
    console HelloConsole
}

func (app *HelloApp) PrintHello() {
    app.console.Print(app.message.Text())
}
