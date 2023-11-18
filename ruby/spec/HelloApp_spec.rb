require "HelloApp"

RSpec.describe HelloApp do
  it "should print hello message" do
    messageText = "Hello Test!"
    message = instance_double("HelloMessage", :text => messageText)

    console = instance_double("HelloConsole")
    expect(console).to receive(:print).once.with(messageText)

    app = HelloApp.new message, console
    app.printHello
  end
end
