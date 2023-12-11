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
           MOVE "HELLO WORLD!" TO MSG.
