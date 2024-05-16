.data
LED_PIN: .word 10
C3_GPIO: .word 0x60004000

.text
.global app_main
app_main:
        lw      a0, C3_GPIO
        lw      a1, LED_PIN

        # Aktiviere den Output
        li      t0, 1
        sll     t0, t0, a1
        sw      t0, 32(a0)
    
toggle_led:
        # Schalte LED an oder aus
        lw      t4, 4(a0)
        xor     t4, t4, t0
        sw      t4, 4(a0)

        li      t5, 0
        li      t6, 10000000
loop:
        addi    t5, t5, 1
        blt     t5, t6, loop
        j       toggle_led
