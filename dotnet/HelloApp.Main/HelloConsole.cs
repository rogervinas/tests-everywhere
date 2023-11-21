namespace HelloApp.Main;

public interface HelloConsole {
    void Print(String text);
}

public class HelloSystemConsole : HelloConsole
{
    public void Print(String text) {
        Console.WriteLine(text);
    }
}
