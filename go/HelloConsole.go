package main

import "fmt"

type HelloConsole interface {
  Print(text string)
}

type HelloSystemConsole struct{}

func (console *HelloSystemConsole) Print(text string) {
  fmt.Println(text)
}
