package main

import "testing"

type HelloMessageMock struct {
    text string
}

func (message *HelloMessageMock) Text() string {
    return message.text
}

type HelloConsoleMock struct {
    Calls int
    Text  string
}

func (console *HelloConsoleMock) Print(text string) {
    console.Calls++
    console.Text = text
}

func TestShouldReturnPrintHelloMessage(t *testing.T) {
    messageText := "Hello Test!"
    message := HelloMessageMock{messageText}

    console := HelloConsoleMock{}

    app := HelloApp{&message, &console}
    app.PrintHello()

    if console.Calls != 1 {
        t.Fatalf("HelloConsole expected calls 1 but got %d", console.Calls)
    }

    if console.Text != messageText {
        t.Fatalf("HelloConsole expected text %s but got %s", messageText, console.Text)
    }
}
