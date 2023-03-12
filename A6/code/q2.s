.pos 0x100
            ld $0x0, r0     # r0 = temp_i = 0
            
            ld $a, r2       
            ld $b, r3 
            ld $c, r7
            ld (r7), r7

loop:       mov r0, r4      # r4 = temp_i
            ld $n, r1
            ld (r1), r1     # r1 = n
            not r1          # r1 = ~n
            inc r1          # r1 = -n
            add r1, r4      # r4 = temp_i - n

        
            beq r4, end_loop # if i=n end_loop
            
            ld (r2,r0,4), r5    #r5 = a[i]
            ld (r3,r0,4), r6    #r6 = b[i]

            not r6
            inc r6              # r6 = -b[i]

            add r5, r6          # r6 = a[i]-b[i]

            bgt r6, L1
            br end_if

L1:         inc r7              # c+=1
end_if:     inc r0              # temp_i++
            br loop
            



end_loop:   ld $i, r1
            st r0, 0x0(r1)
            ld $c, r2
            st r7, (r2)
            halt



        



.pos 0x1000
i:          .long 0xffffffff
n:          .long 0x00000005

a:          .long 0x0000000a
            .long 0x00000014
            .long 0x0000001e
            .long 0x00000028
            .long 0x00000032

b:          .long 0x0000000b
            .long 0x00000014
            .long 0x0000001b
            .long 0x0000002b
            .long 0x00000030

c:          .long 0x00000000
