# задание в: заполнить массив из 16+n чисел с клавиатуры
# читаем пока не наберём 16+n чисел или пока не введут 0
# n - номер в списке

.eqv N 8
.eqv SIZE 24            # 16 + N

.data
arr:    .space 96       # SIZE * 4 байта
msg:    .asciz "count = "

.text
main:
    la s0, arr          # адрес текущего элемента
    li s1, 0            # сколько считали
    li s2, SIZE

read:
    beq s1, s2, done    # массив заполнен
    li a7, 5
    ecall
    beqz a0, done       # ввели 0 - выходим (0 в массив не пишем)
    sw a0, 0(s0)
    addi s0, s0, 4
    addi s1, s1, 1
    j read

done:
    # для проверки печатаем сколько считали и сам массив
    la a0, msg
    li a7, 4
    ecall
    mv a0, s1
    li a7, 1
    ecall
    li a0, 10
    li a7, 11
    ecall

    la s0, arr
    li t0, 0
print:
    beq t0, s1, exit
    lw a0, 0(s0)
    li a7, 1
    ecall
    li a0, 32           # пробел
    li a7, 11
    ecall
    addi s0, s0, 4
    addi t0, t0, 1
    j print

exit:
    li a7, 10
    ecall
