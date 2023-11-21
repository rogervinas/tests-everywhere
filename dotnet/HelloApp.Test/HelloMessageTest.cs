using HelloApp.Main;

namespace HelloApp.Test;

public class HelloMessageTest
{
    [Test]
    public void ShouldReturnHelloWorld()
    {
        var message = new HelloMessage();
        Assert.That(message.Text, Is.EqualTo("Hello World!"));
    }
}