[![CI](https://github.com/rogervinas/tests-everywhere/actions/workflows/cobol.yml/badge.svg)](https://github.com/rogervinas/tests-everywhere/actions/workflows/cobol.yml)
![Ubuntu](https://img.shields.io/badge/Ubuntu-24.04-blue?labelColor=black)
![GnuCOBOL](https://img.shields.io/badge/GnuCOBOL-3.1.2.0-blue?labelColor=black)
![Cobol-Check](https://img.shields.io/badge/Cobol-Check-0.2.8-blue?labelColor=black)

# COBOL

[COBOL](https://www.tutorialspoint.com/cobol/index.htm) testing with [cobol-check](https://github.com/openmainframeproject/cobol-check)

- [Show me the code](#show-me-the-code)
  - [Implementation](#implementation)
  - [Test](#test)
- [Run this project using 🐳 docker](#run-this-project-using--docker)
- [Run this project locally](#run-this-project-locally)

## Show me the code

### Implementation

1. Create a program `HELLO-CONSOLE` in [HELLO-CONSOLE.CBL](src/main/cobol/HELLO-CONSOLE.CBL):

- Declare an alpha-numeric parameter `MSG`
- Program will just display `MSG`

```cobol
IDENTIFICATION DIVISION.
PROGRAM-ID. HELLO-CONSOLE.

DATA DIVISION.
LINKAGE SECTION.
01 MSG PIC A(20).

PROCEDURE DIVISION USING MSG.
    DISPLAY MSG.
```

2. Create a program `HELLO` in [HELLO.CBL](src/main/cobol/HELLO.CBL):

- Declare an alpha-numeric variable `MSG`
- Create `HELLO-MESSAGE` paragraph that sets a value to `MSG` variable
- Create `HELLO` paragraph calling:
  - `HELLO-MESSAGE` paragraph
  - `HELLO-CONSOLE` program
- Create `MAIN` paragraph just calling the `HELLO` paragraph

💡 We use a [paragraph](https://www.tutorialspoint.com/cobol/cobol_program_structure.htm) for `HELLO-MESSAGE` and a [program](https://www.tutorialspoint.com/cobol/cobol_program_structure.htm) for `HELLO-CONSOLE` just to show two different options and how to mock them in the tests.

```cobol
IDENTIFICATION DIVISION.
PROGRAM-ID. HELLO.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 MSG PIC A(20).

PROCEDURE DIVISION.

MAIN.
    PERFORM HELLO.
    STOP RUN.

HELLO.
    PERFORM HELLO-MESSAGE.
    CALL 'HELLO-CONSOLE' USING MSG.

HELLO-MESSAGE.
    MOVE 'HELLO WORLD!' TO MSG.
```

### Test

Following [A Brief Example](https://github.com/openmainframeproject/cobol-check/wiki/A-Brief-Example), [Mock a paragraph](https://github.com/openmainframeproject/cobol-check/wiki/Mock-a-paragraph-and-provide-fake-results) and [Mock a CALL statement](https://github.com/openmainframeproject/cobol-check/wiki/Mock-a-CALL-statement-and-provide-fake-results) guides ...

1. Test `HELLO-MESSAGE` paragraph:

```cobol
TestSuite "HELLO-MESSAGE"

TestCase "SHOULD RETURN HELLO WORLD"
  MOVE "" TO MSG
  PERFORM HELLO-MESSAGE
  Expect MSG = "HELLO WORLD!"
```

2. Test `HELLO` paragraph mocking `HELLO-MESSAGE` and `HELLO-CONSOLE`:

```cobol
TestSuite "HELLO"

TestCase "SHOULD DISPLAY HELLO MESSAGE"
  * 2.1 Mock HELLO-MESSAGE
  MOCK PARAGRAPH HELLO-MESSAGE
      MOVE "HELLO TEST!" TO MSG
  END-MOCK

  * 2.2 Mock HELLO-CONSOLE
  MOCK CALL 'HELLO-CONSOLE' USING MSG
      CONTINUE
  END-MOCK

  * 2.3 Execute the paragraph we want to test
  PERFORM HELLO

  * 2.4 Verify MSG has the expected value
  Expect MSG = "HELLO TEST!"
  * 2.5 Verify HELLO-MESSAGE has been called once
  VERIFY PARAGRAPH HELLO-MESSAGE HAPPENED ONCE
  * 2.6 Verify HELLO-CONSOLE has been called once
  VERIFY CALL 'HELLO-CONSOLE' USING MSG HAPPENED ONCE
```

3. Test output should look like:

```
TESTSUITE:
HELLO-MESSAGE
     PASS:   1. SHOULD RETURN HELLO WORLDe
TESTSUITE:
HELLO
     PASS:   2. SHOULD DISPLAY HELLO MESSAGE
     PASS:   3. VERIFY EXACT 1 ACCESS TO PARAGRAPH HELLO-MESSAGE
     PASS:   4. VERIFY EXACT 1 ACCESS TO CALL 'HELLO-CONSOLE'

  4 TEST CASES WERE EXECUTED
  4 PASSED
  0 FAILED
  0 CALLS NOT MOCKED
================================================
```

I have no idea how to unit test `HELLO-CONSOLE` program as it seems [cobol-check](https://github.com/openmainframeproject/cobol-check) does not support `PROCEDURE DIVISION USING X` sections 😓

## Run this project using 🐳 [docker](https://www.docker.com/)

- Execute `./docker-run.sh`
- Once inside the container:
  - Test with `./cobolcheck -p HELLO`
  - Build `HELLO-CONSOLE.so` with `cobc src/main/cobol/HELLO-CONSOLE.CBL`
  - Build `HELLO` with `cobc -x src/main/cobol/HELLO.CBL`
  - Run with `./HELLO`

## Run this project locally

### Pre-requisites

- **Java 8** required to run **cobol-check 0.2.8**
- You can try to build [GnuCOBOL](https://sourceforge.net/projects/gnucobol/) from scratch or ...
- Install any [pre-built GnuCOBOL package](https://gnucobol.sourceforge.io/faq/index.html#are-there-pre-built-gnucobol-packages):
  - on [Ubuntu](https://ubuntu.com/) `sudo apt-get update && sudo apt-get install -y gnucobol`
  - on [Fedora](https://fedoraproject.org/) `sudo dnf -y install gnucobol`
  - ...

### Run locally

- Test with `./cobolcheck -p HELLO`
- Build `HELLO-CONSOLE.so` with `cobc src/main/cobol/HELLO-CONSOLE.CBL`
- Build `HELLO` with `cobc -x src/main/cobol/HELLO.CBL`
- Run with `./HELLO`

### Create project from scratch

- Get [cobol-check distribution](https://github.com/openmainframeproject/cobol-check/tree/Developer/build/distributions) and unzip it locally
- Remove samples and place your own files under `src/main/cobol` and `src/test/cobol`
