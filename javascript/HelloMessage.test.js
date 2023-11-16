const HelloMessage = require("./HelloMessage");

describe('HelloMessage', () => {
  it("should return hello world", () => {
    const message = new HelloMessage();
    expect(message.text).toBe('Hello World!');
  })
});
