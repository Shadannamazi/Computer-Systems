.pos 0x100
    # tmp = 0; tos = 0;
    ld $tmp, r0         # r0 = &tmp
    ld $0, r1
    st r1, (r0)         # tmp = 0
    ld $tos, r2         # r2 = &tos
    st r1, (r2)         # tos = 0

    # s[tos] = a[0]
    ld $s, r3           # r3 = &s
    ld $a, r4           # r4 = &a
    ld (r2), r5         # r5 = tos
    ld (r4,r1,4), r6    # r6 = a[0]
    st r6, (r3,r5,4)    # s[tos] = a[0]

    # tos++
    inc r5

    # s[tos] = a[1]
    ld $1, r7
    ld (r4,r7,4), r6    # r6 = a[1]
    st r6, (r3,r5,4)    # s[tos] = a[1]

    # tos++
    inc r5

    # s[tos] = a[2]
    ld $2, r7
    ld (r4,r7,4), r6    # r6 = a[2]
    st r6, (r3,r5,4)    # s[tos] = a[2]

    # tos++
    inc r5

    # tos--
    dec r5

    # tmp = s[tos]
    ld (r3,r5,4), r7    # r7 = s[tos]
    st r7, (r0)         # tmp = s[tos]

    # tos--
    dec r5

    # tmp = tmp + s[tos]
    ld (r0), r4         # r4 = tmp
    ld (r3, r5,4), r7   # r7 = s[tos]
    add r7, r4          # r4 = tmp + s[tos]
    st r4, (r0)         # tmp = tmp + s[tos]

    # tos--
    dec r5

    # tmp = tmp + s[tos]
    ld (r0), r4         # r4 = tmp
    ld (r3, r5,4), r7   # r7 = s[tos]
    add r7, r4          # r4 = tmp + s[tos]
    st r4, (r0)         # tmp = tmp + s[tos]
    halt


.pos 0x1000
a:          .long 10
            .long 11
            .long 12

.pos 0x2000
s:          .long 0
            .long 1
            .long 2
            .long 3
            .long 4

.pos 0x3000
tos:        .long 5

.pos 0x4000
tmp:        .long 10
