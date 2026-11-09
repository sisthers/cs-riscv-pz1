# задание б: ввод x, вывод чисел от min(x,y) до max(x,y) с шагом h
# y - номер группы, h - номер в списке

.eqv GROUP 118
.eqv STEP 8

.text
main:
    li a7, 5
    ecall               # a0 = x

    li t0, GROUP
    mv t1, a0           # t1 = x
    # t2 = min, t3 = max
    mv t2, t1
    mv t3, t0
    ble t1, t0, loop
    mv t2, t0
    mv t3, t1

loop:
    bgt t2, t3, end
    mv a0, t2
    li a7, 1
    ecall
    li a0, 10           # перевод строки
    li a7, 11
    ecall
    addi t2, t2, STEP
    j loop

end:
    li a7, 10
    ecall
