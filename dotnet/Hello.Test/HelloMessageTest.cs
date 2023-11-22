using Hello.Main;

namespace Hello.Test;

public class HelloMessageTest
{
  [Test]
  public void ShouldReturnHelloWorld()
  {
    var message = new HelloWorldMessage();
    Assert.That(message.Text, Is.EqualTo("Hello World!"));
  }
}