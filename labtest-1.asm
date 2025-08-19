


org 100h

  MOV R1, 1
  MOV R2, 1

  MOV A, 1
  INC A
  MUL R1, A
  INC A
  MUL R1, A
  INC A
  MUL R1, A
  INC A
  MUL R1, A
  MOV B, 1
  INC B
  MUL R2, B
  INC B
  MUL R2, B   
  MOV R3, R1
  SUB R3, 7
  DIV R3, R2

  MOV RESULT, R3

ret




