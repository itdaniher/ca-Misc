li $a0, 4
jal fact
j quit

fact:
	#if(N<=1) return 1
	ble $a0, 1, end 

	#Push $ra, $a0
	sub $sp, $sp, 12
	sw $ra, 8($sp)
	sw $a0, 4($sp)
	sw $a1, 0($sp)

	#Argument N-1
	sub $a0, $a0, 1

	jal fact

	#Pop $ra, $a0
	lw $ra, 4($sp)
	lw $a0, 0($sp)
	add $sp, $sp, 8 

#Return N*Fact(N-1)
	mul $v1, $v1, $a0
	jr $ra

end:
	#Return 1
	li $v1, 1
	jr $ra

quit:
	li $v0, 10
	syscall