.pos 0x100

    ld $x, r0           #r0 = &x
    ld $h, r1           #r1 = &h
    ld $5, r2           #r2 = 5
    ld (r1,r2,4), r3    #r3 = h[5]
    st r3, (r0)         #x = h[5]
    ld (r0), r4         #r0 = x
    ld (r1,r4,4), r3    #r3 = h[x]
    st r3, (r0)         #x = h[x]

    ld $p, r4           # r4 = address of p
    ld $b, r5           # r5 = address of pointer b
    st r4, (r5)         # b = address of p

    ld (r5), r3         # r3 = address of p
    ld $1, r2
    st r2, (r3)         # *b = p = 1

    ld $h, r0           # r0 = address of h
    ld 28(r0), r1       # r1 = h[7]
	shl $2, r1          # r1 = 4 * h[7]
	add r1, r0          # r0 = address of h[h[7]]
	ld $b, r2           # address of b
	st r0, (r2)         # b = &h[h[7]]


    ld $b, r0           # r0 = address of b
    ld (r0), r1         # r1 = b = address of h[h[7]]
    ld (r1), r2         # r2 = *b
    ld $4, r3
    ld $h, r4           # r4 = address of h
    ld (r4,r3,4), r5     # r5 = h[4]
    add r5, r2          # r1 = *b + h[4]
    st r2, (r1)         # *b = *b + h[4]
    halt


.pos 0x1000
x:      .long 1

.pos 0x2000
p:      .long 2

.pos 0x3000
h:      .long0
        .long1
        .long2
        .long3
        .long4
        .long5
        .long6
        .long7
        .long8
        .long9

.pos 0x4000
b: .long 0x2000     # b = &p


