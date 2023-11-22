namespace Hello.Main;

public interface HelloMessage
{
  public String Text {
    get;
  }
}

public class HelloWorldMessage : HelloMessage
{
  public string Text {
    get {
      return "Hello World!";
    }
  }
}
