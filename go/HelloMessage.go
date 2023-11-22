package main

type HelloMessage interface {
    Text() string
}

type HelloWorldMessage struct{}

func (message *HelloWorldMessage) Text() string {
    return "Hello World!"
}
