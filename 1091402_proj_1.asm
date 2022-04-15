.globl main
.data
	Input0:	.string"Input a number:\n"
	Output0:	.string "The damage:\n"
	Output1:	.string "(Input number out of range.)\n"
.text
main:
	la a0,Input0
	li a7,4
	ecall
	li a7,5
	ecall
        jal   x1, L2
        mv    x11, a0
        jal ra,end
L2:
	addi x6,x0,2
	blt   a0,x6, L1
	
	addi x7,zero,11
	bge a0,x7,L3
        
        addi  sp, sp, -12
        sw    ra, 8(sp)
        sw    a0, 4(sp)
        addi  a0, a0, -1
        jal   ra, L2
        sw    a0, 0(sp)
        lw    a0, 4(sp)
        addi  a0, a0, -2
        jal   ra, L2
        lw    x5, 0(sp)
        add   a0, a0, x5
        lw    x1, 8(sp)
        addi  sp, sp, 12
        ret
L1:
	beq a0,zero,L0
	addi x28,zero,-1
	beq a0,x28,otherwise
	addi a0,zero,5
        ret
L0:
	addi a0,zero,1
        ret
    
L3:
	addi x30,zero,21
	bge a0,x30,L4
        blt   a0, x7, L2
        
        addi  sp, sp, -12
        sw    x1, 8(sp)
        sw    a0, 4(sp)
        addi  a0, a0, -2
        jal   x1, L3
        sw    a0, 0(sp)
        lw    a0, 4(sp)
        addi  a0, a0, -3
        jal   x1, L3
        lw    x5, 0(sp)
        add   a0, a0, x5
        lw    x1, 8(sp)
        addi  sp, sp, 12
        ret
L4:	
	addi x28,zero,100
	bge a0,x28,OutOfRange
        blt   a0, x30, L3
	
        addi  sp, sp, -12
        sw    x1, 8(sp)
        sw    a0, 4(sp)
        slli a0,a0,1
        sw    a0, 0(sp)
        lw    a0, 4(sp)
        addi x29,zero,5
        div a0,a0,x29
        jal   x1, L4
        lw    x5, 0(sp)
        add   a0, a0, x5
        lw    x1, 8(sp)
        addi  sp, sp, 12
        ret
end:
        la    a0, Output0
        li    a7, 4
        ecall
        mv    a0, x11
        li    a7, 1
        ecall
        li   a7, 10
        ecall
OutOfRange:
	la    a0, Output1
        li    a7, 4
        ecall
otherwise:
