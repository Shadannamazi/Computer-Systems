.pos 0x100
    ld $p, r0       # r0 = &p
    ld $h, r1       # r1 = &h
    ld $q, r2       # r2 = &q

    ld (r0), r3      # r3 = p
    ld $v, r4       # r4 = &v
    ld (r4,r3,4), r5    # r5 = v[p]

    ld $2, r6
    #inc r3
    #inc r3
    add r6, r3              # r3 = r3 + 2
    ld (r4,r3,4), r7        #r7 = v[p+2]

    add r5, r7      # r7 = r7 + r5 -> v[p] + v[p+2]

    #q = v[p] + v[p+2]
    st r7, (r2)     # q = r7

    ld $0xf0f0f0f0, r6
    and  r6, r7         # q & 0xf0f0f0f0

    #h = q& 0xf0f0f0f0
    st r7, (r1)
    halt


.pos 0x1000
p:              .long 2

.pos 0x2000
h:              .long 2

.pos 0x3000
q:              .long 3

.pos 0x4000
v:              .long 0
                .long 1
                .long 2
                .long 3
                .long 4
                .long 5



