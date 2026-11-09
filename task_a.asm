# задание а: ввод x, вывод 1 если x = мой номер в списке, иначе 0

.eqv MY_NUM 8           # номер в списке группы

.text
main:
    li a7, 5            # read int
    ecall               # x в a0

    li t0, MY_NUM
    li t1, 0
    bne a0, t0, print
    li t1, 1
print:
    mv a0, t1
    li a7, 1            # print int
    ecall

    li a7, 10           # exit
    ecall
