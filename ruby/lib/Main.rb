require_relative "HelloMessage"
require_relative "HelloConsole"
require_relative "HelloApp"

message = HelloMessage.new
console = HelloConsole.new
app = HelloApp.new message, console
app.printHello
