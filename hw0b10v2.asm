test0:
	li $a0, 323
	li $a1, 17
	j gcd
	beq $v1, 17, pass
	j fail

#test1:
#	li $a0, 1000
#	li $a1, 100
#	j gcd
##	j fail

#test2:
#	li $a0, 144
#	li $a1, 12
#	j gcd
#	beq $v1, 12, pass
#	j fail

gcd:
 	beqz $a1 endCase # if $a0 is zero, go to "endCase" 
	sub $sp, $sp, 12 # reduce stackpointer by 12
	sw $ra, 8($sp) # ra in top four
	sw $a0, 4($sp) #a
	sw $a1, 0($sp) #b
                                                                        
	div $a0, $a1 # divide a by b                                                                                                                                                                 
	mfhi $t1 # pull remainder out of 'hi' into temp1
	move $a0 $a1 # move contents of b to a
	move $a1, $t1 # move contents of temp1 into b
	
	jal gcd #switch back to top

	# pop $ra, $a1, $a0
	lw $ra, 8($sp) # as part of return, load $ra, $a0 from stack
	lw $a0, 4($sp)
	lw $a1, 0($sp)
	add $sp, $sp, 12

	jr $ra

endCase:
	# return contents of $a0 in $v1
	move $v1, $a0
	jr $ra

fail:
	li $v1, 0
	j quit
	
pass:
	li $v1, 1
	j quit

quit:
	li $v0, 10
	syscall

