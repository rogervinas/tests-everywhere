[![CI](https://github.com/rogervinas/tests-everywhere/actions/workflows/cobol.yml/badge.svg)](https://github.com/rogervinas/tests-everywhere/actions/workflows/cobol.yml)
![GnuCOBOL](https://img.shields.io/badge/GnuCOBOL-3.2.0-blue?labelColor=black)

# COBOL

[COBOL](https://xxx/) testing with [cobol-check](https://github.com/openmainframeproject/cobol-check)

- [Show me the code](#show-me-the-code)
  - [Implementation](#implementation)
  - [Test](#test)
- [Run this project using 🐳 docker](#run-this-project-using--docker)
- [Run this project locally](#run-this-project-locally)

## Show me the code

### Implementation

1. Create a program `HELLO` in [HELLO.CBL](src/main/cobol/HELLO.CBL):

- Define an alpha-numeric variable `MSG`
- `MAIN` paragraph just calling the `HELLO` paragraph
- `HELLO` paragraph calling:
  - `HELLO-MESSAGE` paragraph that sets `MSG` value
  - `HELLO-CONSOLE` program that displays passed `MSG` value

We use a [paragraph]() for `HELLO-MESSAGE` and a program for `HELLO-CONSOLE` just to show two different options and how to mock them in the tests.

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

2. Create a program `HELLO-CONSOLE` in [HELLO-CONSOLE.CBL](src/main/cobol/HELLO-CONSOLE.CBL):

```cobol
IDENTIFICATION DIVISION.
PROGRAM-ID. HELLO-CONSOLE.

DATA DIVISION.
LINKAGE SECTION.
01 MSG PIC A(20).

PROCEDURE DIVISION USING MSG.

HELLO-CONSOLE.
    DISPLAY MSG.
```

### Test

Following [xxx](https://xxx) and [mock paragraph](https://xxx) guides ...

1. Test `HELLO-MESSAGE` paragraph:

```cobol
TestSuite "HELLO-MESSAGE"

TestCase "SHOULD RETURN HELLO WORLD"
  MOVE "" TO MSG
  PERFORM HELLO-MESSAGE
  Expect MSG = "HELLO WORLD!"
````

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

Note: cobol-check and testing of hello-console ??

## Run this project using 🐳 [docker](https://www.docker.com/)

- Execute `./docker-run.sh`
- Once inside the container:
  - Test with `./cobolcheck -p HELLO`
  - Build `HELLO-CONSOLE.so` with `cobc src/main/cobol/HELLO-CONSOLE.CBL`
  - Build `HELLO` with `cobc -x src/main/cobol/HELLO.CBL`
  - Run with `./HELLO`

## Run this project locally

### Pre-requisites

- cobol-check?
- cobol distributions

https://sourceforge.net/projects/gnucobol/
https://gnucobol.sourceforge.io/faq/index.html#using-gnucobol
https://gnucobol.sourceforge.io/faq/index.html#are-there-pre-built-gnucobol-packages

### Run locally

??

- Test with `python -m unittest discover -v`
- Run with `python -m main`

### Create project from scratch

- Just create a cobol file and compile it
