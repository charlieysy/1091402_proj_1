.globl main
.data
	Input0:	.string"Input a number:\n"
	Output0:     .string "The damage:\n"
.text
main:
	la a0,Input0
	li a7,4
	ecall
	li a7,5	#input number
	ecall
        li    s0, 2            # for comparison with x (x <= 1)
        jal   ra, L2          # call f(x)
        mv    a1, a0           # a1 : final falue
        jal ra,end
L2:
	addi x6,zero,11
	bge a0,x6,L3		#if(x>=11) ->L3
	blt   a0, s0, L1       # if(x <= 1)
        
        addi  sp, sp, -12      # push the stack
        sw    ra, 8(sp)        # store return address
        sw    a0, 4(sp)        # store argument n
        addi  a0, a0, -1       # argument = x - 1
        jal   ra, L2          # call f(x - 1)
        sw    a0, 0(sp)        # store return value of f(x - 1)
        lw    a0, 4(sp)        # load argument n
        addi  a0, a0, -2       # argument = x - 2
        jal   ra, L2          # call f(x - 2)
        lw    t0, 0(sp)        # load return value of f(x - 1)
        add   a0, a0, t0       # f(x - 1) + f(x - 2)
        lw    ra, 8(sp)        # load return address
        addi  sp, sp, 12       # pop the stack
        ret                    # return
L1:
	beq a0,zero,L0
	addi x28,zero,-1
	beq a0,x28,otherwise	#if(x=-1) -> otherwise
	addi a0,zero,5
        ret                    # return	
L0:
	addi a0,zero,1
        ret
otherwise:
    
L3:
	addi x7,zero,21
	bge a0,x7,L4		#if(x>=21) ->L4
	
        blt   a0, x6, L2       # if(x < 11)
        addi  sp, sp, -12      # push the stack
        sw    ra, 8(sp)        # store return address
        sw    a0, 4(sp)        # store argument n
        addi  a0, a0, -2       # argument = x - 2
        jal   ra, L3          # call f(x - 2)
        sw    a0, 0(sp)        # store return value of f(x - 2)
        lw    a0, 4(sp)        # load argument n
        addi  a0, a0, -3       # argument = x - 3
        jal   ra, L3          # call f(x - 3)
        lw    t0, 0(sp)        # load return value of f(x - 2)
        add   a0, a0, t0       # f(x - 2) + f(x - 3)
        lw    ra, 8(sp)        # load return address
        addi  sp, sp, 12       # pop the stack
        ret                    # return     
L4:	
        blt   a0, x7, L3       # if(x < 21)
        addi  sp, sp, -12      # push the stack
        sw    ra, 8(sp)        # store return address
        sw    a0, 4(sp)        # store argument x
        
        slli a0,a0,1		#argument=x*2
        sw    a0, 0(sp)        # store return value of f(n - 2)
        lw    a0, 4(sp)        # load argument n
        addi x29,zero,5		#x29=5
        div a0,a0,x29		#argument=x/5
        jal   ra, L4          # call f(x/5)
        lw    t0, 0(sp)        # load return value of f(n - 2)
        add   a0, a0, t0       # x*2 + f(x/5)
        lw    ra, 8(sp)        # load return address
        addi  sp, sp, 12       # pop the stack
        ret                    # return
end:
	mv    t0, a0
        mv    t1, a1
        la    a0, Output0
        li    a7, 4
        ecall                  # print string str1str2
        mv    a0, t1
        li    a7, 1
        ecall                  # print int result
        li   a7, 10
        ecall                  # exit