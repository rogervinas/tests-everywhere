package main

import "testing"

func TestShouldReturnHelloWorld(t *testing.T) {
  messageText := "Hello World!"
  message := HelloWorldMessage{}
  if message.Text() != messageText {
    t.Fatalf("Expected %s but got %s", messageText, message.Text())
  }
}
