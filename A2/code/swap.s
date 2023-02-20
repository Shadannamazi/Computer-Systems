.pos 0x100
            # first = array[7];
            ld $first, r0           # r0 = &first
            ld $array, r1           # r1 = &array
            ld $7, r2               # r2 = 7
            ld (r1, r2, 4), r3      # r3 = array[7]
            st r3, (r0)             # first = r3

            # array[7] = array[1];
            ld $1, r4                # r4 = 1
            ld (r1,r4,4), r5         # r5 = array[1]
            st r5, (r1,r2,4)         # array[7] = r5

            # array[1] = first;
            ld (r0), r6
            st r6, (r1,r4,4)
            halt

.pos 0x1000
first:          .long 10

.pos 0x2000
array:          .long 0
                .long 1
                .long 2
                .long 3
                .long 4
                .long 5
                .long 6
                .long 7
                .long 8
                .long 9


