.pos 0x1000
      ld  $data, r1
      ld  $2, r2
      ld  $10, r3
      ld  $1, r4

      st r3, 4(r1)

      #st  r3, (r1, r2, 4)   # m[data + 2] <= 3
      #st  r4, (r1, r4, 4)   # m[data + 4] <= 1
      halt


.pos 0x2000
data: .long 1
      .long 2
      .long 3
      .long 4