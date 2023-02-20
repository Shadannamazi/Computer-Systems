.pos 0x100
    ld $a, r0       # r0 = address of a
    ld $p, r1       # r1 = address of pointer p
    ld (r1), r2     # r2 = p
    ld $3, r3
    st r3, (r0)     # a = 3

    st r0, (r1)     # p = &a
    ld (r2), r4     # r4 = *p
    dec r4          # r4 = *p - 1
    st r4, (r2)     # *p = *p - 1

    ld $b, r5       # r5 = address of b or b[0]
    st r5, (r1)     # p = &b

    ld $p, r0        # r0 = address of p
    ld (r0), r1      # r1 = p
    inca r1          # r1 = p++
    st r1, (r0)      # p = p++

    ld $a, r0           # r0 = address of a
    ld (r0), r1         # r1 = a
    ld $p, r2           # r2 = address of p
    ld (r2), r3         # r3 = address of b[1]
    ld $b, r4           # r4 = address of b[0]
    ld (r4,r1,4), r5    #r5 = b[a]
    st r5, (r3,r1,4)    # p[a] = b[a]

    #ld (r5), r3     # r3 = b or b[0]

    ld $p, r0       # r0 = address of p
    ld (r0), r1     # r1 = p
    ld $b, r2       # r2 = address of b[0]
    ld (r2),r3      # r3 = b[0]
    ld $3, r4
    st r3, (r1,r4,4)    # *(p+3) = b[0]

    halt

.pos 0x1000
a:          .long 4

.pos 0x2000
p:          .long 0x1000

.pos 0x3000
b:          .long 10
            .long 11
            .long 12
            .long 13
            .long 14