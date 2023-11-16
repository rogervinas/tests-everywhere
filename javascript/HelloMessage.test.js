const HelloMessage = require("./HelloMessage");

describe('HelloMessage', () => {
    it("should return hello world", () => {
        const helloMessage = new HelloMessage();
        expect(helloMessage.text).toBe('Hello World!');
    })
});
