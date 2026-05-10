org 100h

jmp start

;start

mainMenu db 13,10,'==== RESTAURANT SYSTEM ====',13,10
         db '1- Food Menu',13,10
         db '2- Drinks Menu',13,10
         db '3- Show Bill',13,10
         db '4- Exit',13,10,'$'

foodMenu db 13,10,'==== FOOD MENU ====',13,10
         db '1- Pizza',13,10
         db '2- Burger',13,10
         db '3- Pasta',13,10,'$'

pizzaMenu db 13,10,'==== PIZZA ====',13,10
          db '1- Margherita (80)',13,10
          db '2- Pepperoni (120)',13,10
          db '3- Chicken (160)',13,10,'$'

burgerMenu db 13,10,'==== BURGER ====',13,10
           db '1- Beef Burger (90)',13,10
           db '2- Chicken Burger (85)',13,10
           db '3- Double Burger (140)',13,10,'$'

pastaMenu db 13,10,'==== PASTA ====',13,10
          db '1- Alfredo (110)',13,10
          db '2- Red Sauce (95)',13,10
          db '3- Seafood Pasta (170)',13,10,'$'

drinkMenu db 13,10,'==== DRINKS ====',13,10
          db '1- Cola (10)',13,10
          db '2- Pepsi (10)',13,10
          db '3- Sprite (10)',13,10
          db '4- Water (5)',13,10,'$'

msgName db 13,10,'Enter Customer Name: $'
msgQty db 13,10,'Enter Quantity: $'

msgBill db 13,10,'===== FINAL BILL =====',13,10,'$'
msgCust db 13,10,'Customer: $'
msgItems db 13,10,'Items:',13,10,'$'
msgTotal db 13,10,'TOTAL = $'

newline db 13,10,'$'
star db ' *$'

customer db 20,0,20 dup('$')

choice db 0
qty db 0
price dw 0
grandTotal dw 0

;flags

f_mar db 0
f_pep db 0
f_chick db 0

f_beef db 0
f_cburger db 0
f_double db 0

f_alf db 0
f_red db 0
f_sea db 0

f_cola db 0
f_pepsi db 0
f_sprite db 0
f_water db 0

;amounts

q_mar db 0
q_pep db 0
q_chick db 0

q_beef db 0
q_cburger db 0
q_double db 0

q_alf db 0
q_red db 0
q_sea db 0

q_cola db 0
q_pepsi db 0
q_sprite db 0
q_water db 0

;item name

n_mar db 13,10,'Margherita','$'
n_pep db 13,10,'Pepperoni','$'
n_chick db 13,10,'Chicken Pizza','$'

n_beef db 13,10,'Beef Burger','$'
n_cburger db 13,10,'Chicken Burger','$'
n_double db 13,10,'Double Burger','$'

n_alf db 13,10,'Alfredo Pasta','$'
n_red db 13,10,'Red Sauce Pasta','$'
n_sea db 13,10,'Seafood Pasta','$'

n_cola db 13,10,'Cola','$'
n_pepsi db 13,10,'Pepsi','$'
n_sprite db 13,10,'Sprite','$'
n_water db 13,10,'Water','$'

;main code

start:

mov grandTotal,0

;reset flags

mov f_mar,0
mov f_pep,0
mov f_chick,0

mov f_beef,0
mov f_cburger,0
mov f_double,0

mov f_alf,0
mov f_red,0
mov f_sea,0

mov f_cola,0
mov f_pepsi,0
mov f_sprite,0
mov f_water,0

;reset qtty

mov q_mar,0
mov q_pep,0
mov q_chick,0

mov q_beef,0
mov q_cburger,0
mov q_double,0

mov q_alf,0
mov q_red,0
mov q_sea,0

mov q_cola,0
mov q_pepsi,0
mov q_sprite,0
mov q_water,0

;custumer name

mov dx, offset msgName
mov ah,09h
int 21h

mov dx, offset customer
mov ah,0Ah
int 21h

;main manu

menu_loop:

mov dx, offset mainMenu
mov ah,09h
int 21h

mov ah,01h
int 21h
sub al,'0'
mov choice,al

cmp choice,1
je food

cmp choice,2
je drinks

cmp choice,3
je bill

cmp choice,4
je exit

jmp menu_loop

;food

food:

mov dx, offset foodMenu
mov ah,09h
int 21h

mov ah,01h
int 21h
sub al,'0'

cmp al,1
je pizza

cmp al,2
je burger

cmp al,3
je pasta

jmp menu_loop

;pizza

pizza:

mov dx, offset pizzaMenu
mov ah,09h
int 21h

mov ah,01h
int 21h
sub al,'0'

cmp al,1
je p1

cmp al,2
je p2

cmp al,3
je p3

jmp menu_loop

p1:
mov f_mar,1
mov choice,1
mov price,80
jmp qty_input

p2:
mov f_pep,1
mov choice,2
mov price,120
jmp qty_input

p3:
mov f_chick,1
mov choice,3
mov price,160
jmp qty_input

;burger

burger:

mov dx, offset burgerMenu
mov ah,09h
int 21h

mov ah,01h
int 21h
sub al,'0'

cmp al,1
je b1

cmp al,2
je b2

cmp al,3
je b3

jmp menu_loop

b1:
mov f_beef,1
mov choice,4
mov price,90
jmp qty_input

b2:
mov f_cburger,1
mov choice,5
mov price,85
jmp qty_input

b3:
mov f_double,1
mov choice,6
mov price,140
jmp qty_input

;pasta

pasta:

mov dx, offset pastaMenu
mov ah,09h
int 21h

mov ah,01h
int 21h
sub al,'0'

cmp al,1
je pa1

cmp al,2
je pa2

cmp al,3
je pa3

jmp menu_loop

pa1:
mov f_alf,1
mov choice,7
mov price,110
jmp qty_input

pa2:
mov f_red,1
mov choice,8
mov price,95
jmp qty_input

pa3:
mov f_sea,1
mov choice,9
mov price,170
jmp qty_input

;drinks

drinks:

mov dx, offset drinkMenu
mov ah,09h
int 21h

mov ah,01h
int 21h
sub al,'0'

cmp al,1
je d1

cmp al,2
je d2

cmp al,3
je d3

cmp al,4
je d4

jmp menu_loop

d1:
mov f_cola,1
mov choice,10
mov price,10
jmp qty_input

d2:
mov f_pepsi,1
mov choice,11
mov price,10
jmp qty_input

d3:
mov f_sprite,1
mov choice,12
mov price,10
jmp qty_input

d4:
mov f_water,1
mov choice,13
mov price,5
jmp qty_input

;calculations

qty_input:

mov dx, offset msgQty
mov ah,09h
int 21h

mov ah,01h
int 21h
sub al,'0'

mov qty,al

;save

cmp choice,1
je save_mar

cmp choice,2
je save_pep

cmp choice,3
je save_chick

cmp choice,4
je save_beef

cmp choice,5
je save_cburger

cmp choice,6
je save_double

cmp choice,7
je save_alf

cmp choice,8
je save_red

cmp choice,9
je save_sea

cmp choice,10
je save_cola

cmp choice,11
je save_pepsi

cmp choice,12
je save_sprite

cmp choice,13
je save_water

jmp calc_total

save_mar:
mov q_mar,al
jmp calc_total

save_pep:
mov q_pep,al
jmp calc_total

save_chick:
mov q_chick,al
jmp calc_total

save_beef:
mov q_beef,al
jmp calc_total

save_cburger:
mov q_cburger,al
jmp calc_total

save_double:
mov q_double,al
jmp calc_total

save_alf:
mov q_alf,al
jmp calc_total

save_red:
mov q_red,al
jmp calc_total

save_sea:
mov q_sea,al
jmp calc_total

save_cola:
mov q_cola,al
jmp calc_total

save_pepsi:
mov q_pepsi,al
jmp calc_total

save_sprite:
mov q_sprite,al
jmp calc_total

save_water:
mov q_water,al

;total calculation

calc_total:

mov al,qty
mov bl,byte ptr price

mul bl

add grandTotal,ax

jmp menu_loop

;bill

bill:

mov dx, offset msgBill
mov ah,09h
int 21h

mov dx, offset msgCust
mov ah,09h
int 21h

mov dx, offset customer+2
mov ah,09h
int 21h

mov dx, offset msgItems
mov ah,09h
int 21h

;print items

cmp f_mar,1
jne skip1
mov dx,offset n_mar
mov ah,09h
int 21h

mov dx,offset star
mov ah,09h
int 21h

mov dl,q_mar
add dl,'0'
mov ah,02h
int 21h
skip1:

cmp f_pep,1
jne skip2
mov dx,offset n_pep
mov ah,09h
int 21h

mov dx,offset star
mov ah,09h
int 21h

mov dl,q_pep
add dl,'0'
mov ah,02h
int 21h
skip2:

cmp f_chick,1
jne skip3
mov dx,offset n_chick
mov ah,09h
int 21h

mov dx,offset star
mov ah,09h
int 21h

mov dl,q_chick
add dl,'0'
mov ah,02h
int 21h
skip3:

cmp f_beef,1
jne skip4
mov dx,offset n_beef
mov ah,09h
int 21h

mov dx,offset star
mov ah,09h
int 21h

mov dl,q_beef
add dl,'0'
mov ah,02h
int 21h
skip4:

cmp f_cburger,1
jne skip5
mov dx,offset n_cburger
mov ah,09h
int 21h

mov dx,offset star
mov ah,09h
int 21h

mov dl,q_cburger
add dl,'0'
mov ah,02h
int 21h
skip5:

cmp f_double,1
jne skip6
mov dx,offset n_double
mov ah,09h
int 21h

mov dx,offset star
mov ah,09h
int 21h

mov dl,q_double
add dl,'0'
mov ah,02h
int 21h
skip6:

cmp f_alf,1
jne skip7
mov dx,offset n_alf
mov ah,09h
int 21h

mov dx,offset star
mov ah,09h
int 21h

mov dl,q_alf
add dl,'0'
mov ah,02h
int 21h
skip7:

cmp f_red,1
jne skip8
mov dx,offset n_red
mov ah,09h
int 21h

mov dx,offset star
mov ah,09h
int 21h

mov dl,q_red
add dl,'0'
mov ah,02h
int 21h
skip8:

cmp f_sea,1
jne skip9
mov dx,offset n_sea
mov ah,09h
int 21h

mov dx,offset star
mov ah,09h
int 21h

mov dl,q_sea
add dl,'0'
mov ah,02h
int 21h
skip9:

cmp f_cola,1
jne skip10
mov dx,offset n_cola
mov ah,09h
int 21h

mov dx,offset star
mov ah,09h
int 21h

mov dl,q_cola
add dl,'0'
mov ah,02h
int 21h
skip10:

cmp f_pepsi,1
jne skip11
mov dx,offset n_pepsi
mov ah,09h
int 21h

mov dx,offset star
mov ah,09h
int 21h

mov dl,q_pepsi
add dl,'0'
mov ah,02h
int 21h
skip11:

cmp f_sprite,1
jne skip12
mov dx,offset n_sprite
mov ah,09h
int 21h

mov dx,offset star
mov ah,09h
int 21h

mov dl,q_sprite
add dl,'0'
mov ah,02h
int 21h
skip12:

cmp f_water,1
jne skip13
mov dx,offset n_water
mov ah,09h
int 21h

mov dx,offset star
mov ah,09h
int 21h

mov dl,q_water
add dl,'0'
mov ah,02h
int 21h
skip13:

mov dx, offset newline
mov ah,09h
int 21h

mov dx, offset msgTotal
mov ah,09h
int 21h

; print total

mov ax,grandTotal

mov cx,0
mov bx,10

convert:
xor dx,dx
div bx
push dx
inc cx
cmp ax,0
jne convert

print:
pop dx
add dl,'0'
mov ah,02h
int 21h
loop print

jmp start

;finish

exit:
mov ah,4Ch
int 21h

end start