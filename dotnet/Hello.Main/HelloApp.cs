namespace Hello.Main;

public class HelloApp
{
  private HelloMessage message;
  private HelloConsole console;

  public HelloApp(HelloMessage message, HelloConsole console) {
    this.message = message;
    this.console = console;
  }

  public void PrintHello() {
    console.Print(message.Text);
  }
}
