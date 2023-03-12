void sort (int* a, int n) {
  for (int i=n-1; i>0; i--)
    for (int j=1; j<=i; j++)
      if (a[j-1] > a[j]) {
        int t = a[j];
        a[j] = a[j-1];
        a[j-1] = t;
      }
}
#calculate average 
        ld $s, r0           # address of s
        ld (r0), r0         # s
        ld $n, r1           
        ld (r1), r1         # n

        ld $0x0, r2         # r2 = temp_i


        
        bgt r1, loop        # if n > 0 go to loop

loop:   mov r2, r3          # r3 = temp_i
        





.pos 0x1000
n:      .long 1       # just one student
m:      .long 0       # put the answer here
s:      .long base    # address of the array
base:   .long 1234    # student ID
        .long 80      # grade 0
        .long 60      # grade 1
        .long 78      # grade 2
        .long 90      # grade 3
        .long 0       # computed average 