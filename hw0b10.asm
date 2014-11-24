j TEST0

j QUIT

GCD:
	beqz $a1 RETA # if $t0 is zero
	div $a0, $a1 # divide a by b
	mfhi $t1 # pull remainder out of 'hi' into temp1
	move $a1 $a0 # move contents of b to a
	move $a1, $t1 # move contents of temp1 into b
	j GCD # jump to head

RETA:
	move $v1 $a0 # move a to v1, aka answer slot
	jr $ra

QUIT:
	li $v0 10 # magic number
	syscall # magic cal

TEST0:
	li $a0 125 # a
	li $a1 625 # b
	jal GCD
	beq $v1 125 TEST1
	
TEST1:
	li $a0 125 # a
	li $a1 625 # b
	jal GCD
	beq $v1 125 TEST2
	
TEST2:
	li $a0 125 # a 
	li $a1 625 # b
	jal GCD
	beq $v1 125 TEST3
	
TEST3:
	li $a0 125 # a
	li $a1 625 # b
	jal GCD
	beq $v1 125 TEST4

TEST4:
	li $a0 125 # a
	li $a1 625 # b
	jal GCD
	beq $v1 125 QUIT
	li $v1 -1
	j QUIT