const HelloMessage = require("./HelloMessage");
const HelloConsole = require("./HelloConsole");
const HelloApp = require("./HelloApp");

jest.mock('./HelloMessage');
jest.mock('./HelloConsole');

describe('HelloApp', () => {
  it("should print hello message", () => {
    const messageText = "Hello Test!";
    HelloMessage.mockImplementation(() => {
      return {
        text: messageText
      }
    });
    const message = new HelloMessage();

    const console = new HelloConsole();

    const app = new HelloApp(message, console);
    app.printHello();

    expect(console.print).toHaveBeenCalledTimes(1);
    expect(console.print).toHaveBeenCalledWith(messageText);
  })
});
