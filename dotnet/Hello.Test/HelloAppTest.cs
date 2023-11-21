using Hello.Main;
using Moq;

namespace Hello.Test;

public class HelloAppTest
{
    [Test]
    public void ShouldPrintHelloMessage()
    {
        var messageText = "Hello Test!";
        var messageMock = new Mock<HelloMessage>();
        messageMock.Setup(message => message.Text).Returns(messageText);
        var message = messageMock.Object;

        var consoleMock = new Mock<HelloConsole>();
        var console = consoleMock.Object;

        var app = new HelloApp(message, console);
        app.PrintHello();

        consoleMock.Verify(console => console.Print(messageText), Times.Once);
    }
}