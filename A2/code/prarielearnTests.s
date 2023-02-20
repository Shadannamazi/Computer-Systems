.pos 0x100
#ld $dyn, r0
#ld $var, r1
#ld (r1), r3
#ld $4, r2
#st r3, (r0,r2,4)

ld $var, r0          # r0 = addres of var
ld (r0), r1          # r1 = var
ld $4, r2
ld $dyn, r3          # r3 = address of dyn
ld (r3), r4          # r4 = dyn = address of dyn[0]
st r1, (r4, r2, 4)   # dyn[4] = var

.pos 0x1000
var:          .long 10

.pos 0x2000
dyn:            .long 0
                .long 1
                .long 2
                .long 3
                .long 4
                .long 5
                .long 6
                .long 7
                .long 8
                .long 9
