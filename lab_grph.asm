d_s segment
 x equ 50 ; ширина х в пикселях
 y equ 50 ; ширина у в пикселях

d_s ends

c_s segment
 assume ds:d_s, cs:c_s

begin:
 mov dx, x
 mov cx, y

  mov al, 4h
  int 10h
 
  mov ah, 0bh
  mov bh, 0
  mov bl, 0  
  mov al, 31 ; цвет
  mov ah, 0ch

  line1: 
    inc dx 
     cmp dx, 101
    je line2
   int 10h
  jmp line1

  line2:
    inc cx
     cmp cx, 100
    je line3
   int 10h 
  jmp line2

  line3:
    dec dx
     cmp dx, 51
    je line4
   int 10h 
  jmp line3
  
  line4:
    dec cx
     cmp cx, 51
    je new_lines
   int 10h
  jmp line4

  new_lines:
   mov cx,50
   mov dx,50
   mov al,33 ; color
  
  line5:  ; вертикаль
    inc dx 
     cmp dx, 90
    je line6
   int 10h
  jmp line5

  line6: ; горизонталь 
    inc cx
     cmp cx, 90
    je line7
   int 10h 
  jmp line6

  line7:
    dec dx
    dec cx
     cmp cx, 50
    je tochka1
   int 10h 
  jmp line7
 

  tochka1:
   mov cx, 50
   mov dx, 51
   mov ah, 0ch
   mov al,4
   int 10h
  jmp tochka2
 
  tochka2:
   mov cx, 50
   mov dx, 90
   mov ah, 0ch
   mov al,4

    int 10h
  jmp tochka3

  tochka3:
   mov cx, 51
   mov dx, 90
   mov ah, 0ch
   mov al,4

    int 10h
  jmp tochka4

  tochka4:
   mov cx, 51
   mov dx, 51
   mov ah, 0ch
   mov al,4
   int 10h
  jmp stop


  stop: 
   mov ah, 10h
   int 16h

 c_s ends

end begin