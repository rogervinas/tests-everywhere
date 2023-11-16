const HelloMessage = require("./HelloMessage");
const HelloConsole = require("./HelloConsole");
const HelloApp = require("./HelloApp");

jest.mock('./HelloMessage');
jest.mock('./HelloConsole');

describe('HelloApp', () => {
    it("should print hello message", () => {
        const helloMessageText = "Hello Test!";
        HelloMessage.mockImplementation(() => {
            return {
                text: helloMessageText
            }
        });
        const helloMessage = new HelloMessage();

        const helloConsole = new HelloConsole();

        const helloApp = new HelloApp(helloMessage, helloConsole);
        helloApp.printHello();

        expect(helloConsole.print).toHaveBeenCalledTimes(1);
        expect(helloConsole.print).toHaveBeenCalledWith(helloMessageText);
    })
});
