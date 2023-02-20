.pos 0x100
        # g = g + 1
        ld $g, r0        # r0 = &g
        ld (r0), r1      # r1 = g
        ld $1, r2
        ld $4, r3

        add r2, r1      # r1 = r1 + 1
        #inc r1
        add r3, r1      # r1 = r1 + 4
        #inca r1

        shl $7, r1      # r1 = r1 << 7
        ld (r0), r5      # r5 = g
        and r5, r1      # r1 = r1 & g
        shr $2, r1      # r1 = r1 / 4

        # i = r1
        ld $i, r4       # r4 = &i
        st r1, (r4)     # i = r1

        halt






.pos 0x1000
i:          .long 1

.pos 0x2000
g:          .long 0xff8b0000

