[![CI](https://github.com/rogervinas/tests-everywhere/actions/workflows/javascript.yml/badge.svg)](https://github.com/rogervinas/tests-everywhere/actions/workflows/javascript.yml)
![Node](https://img.shields.io/badge/Node-18.x-blue?labelColor=black)

# JavaScript

[JavaScript](https://developer.mozilla.org/docs/Web/JavaScript) testing with [Jest](https://jestjs.io/)

- [Show me the code](#show-me-the-code)
  - [Implementation](#implementation)
  - [Test](#test)
- [Run this project using 🐳 docker](#run-this-project-using--docker)
- [Run this project locally](#run-this-project-locally)

## Show me the code

### Implementation

1. Create `HelloMessage` class in [HelloMessage.js](HelloMessage.js):

```javascript
class HelloMessage {
  text = "Hello World!";
}
```

2. Create `HelloConsole` class in [HelloConsole.js](HelloConsole.js):

```javascript
class HelloConsole {
  print(text) {
    console.log(text);
  }
}
```

3. Create `HelloApp` class in [HelloApp.js](HelloApp.js):

```javascript
class HelloApp {
  constructor(helloMessage, helloConsole) {
    this.helloMessage = helloMessage;
    this.helloConsole = helloConsole;
  }

  printHello() {
    this.helloConsole.print(this.helloMessage.text);
  }
}
```

4. Create main function in [Main.js](Main.js) that wraps it all together:

```javascript
const HelloMessage = require("./HelloMessage");
const HelloConsole = require("./HelloConsole");
const HelloApp = require("./HelloApp");

const message = new HelloMessage();
const console = new HelloConsole();
const app = new HelloApp(message, console);
app.printHello();
```

### Test

Following [Jest > Getting Started](https://jestjs.io/docs/getting-started) guide ...

1. Test `HelloMessage` in [HelloMessage.test.js](HelloMessage.test.js):

```javascript
describe("HelloMessage", () => {
  it("should return hello world", () => {
    const message = new HelloMessage();
    expect(message.text).toBe("Hello World!");
  });
});
```

2. Test `HelloApp` in [HelloApp.test.js](HelloApp.test.js):

```javascript
// 2.1 Mock ./HelloMessage module
jest.mock("./HelloMessage");
// 2.2 Mock ./HelloConsole module
jest.mock("./HelloConsole");

describe("HelloApp", () => {
  it("should print hello message", () => {
    const messageText = "Hello Test!";

    // 2.3 Set mock implementation to be returned
    // anytime new HelloMessage() is called
    HelloMessage.mockImplementation(() => {
      return {
        text: messageText,
      };
    });
    // 2.4 Create a HelloMessage
    // - It will be a mock thanks to 2.1 and 2.2
    const message = new HelloMessage();

    // 2.5 Create a HelloConsole
    // - It will be a mock thanks to 2.3
    const console = new HelloConsole();

    // 2.6 Create a HelloApp, the one we want to test, passing the mocks
    const app = new HelloApp(message, console);
    // - Execute the method we want to test
    app.printHello();

    // 2.7 Verify HelloConsole mock print() method
    // has been called once with "Hello Test!"
    expect(console.print).toHaveBeenCalledTimes(1);
    expect(console.print).toHaveBeenCalledWith(messageText);
  });
});
```

3. Test output should look like:

```
> jest

 PASS  ./HelloMessage.test.js
 PASS  ./HelloApp.test.js

Test Suites: 2 passed, 2 total
Tests:       2 passed, 2 total
Snapshots:   0 total
Time:        1.229 s
Ran all test suites.
```

## Run this project using 🐳 [docker](https://www.docker.com/)

- Execute `./docker-run.sh`
- Once inside the container:
  - First time only, install dependencies with `npm install`
  - Test with `npm test`
  - Run with `npm start`

## Run this project locally

### Pre-requisites

- Install [Node.js](https://nodejs.org/en/) manually or ...
  - Install [Node Version Manager](https://github.com/nvm-sh/nvm) and ...
    - List available versions executing `nvm list`
    - Install **Node.js** executing `nvm use v18` or `nvm use stable`

### Run locally

- First time only, install dependencies with `npm install`
- Test with `npm test`
- Run with `npm start`

### Create project from scratch

- Create project using `npm init`
- Install [Jest](https://jestjs.io/) using `npm install --save-dev jest`
- Configure scripts in [package.json](javascript/package.json):
  ```json
  "scripts": {
    "start": "node Main.js",
    "test": "jest"
  }
  ```
