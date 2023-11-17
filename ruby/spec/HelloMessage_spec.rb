require "HelloMessage"

RSpec.describe HelloMessage do
  it "should return hello world" do
    message = HelloMessage.new
    expect(message.text).to eq("Hello World!")
  end
end
