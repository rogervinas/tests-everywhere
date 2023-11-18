class HelloApp
  def initialize(message, console)
    @message = message
    @console = console
  end

  def printHello
    @console.print(@message.text)
  end
end
