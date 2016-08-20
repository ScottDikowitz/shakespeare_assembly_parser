.data

dialog	:.asciiz "BEDFORD
Coward of France! how much he wrongs his fame,
Despairing of his own arm's fortitude,
To join with witches and the help of hell!

BURGUNDY
Traitors have never other company.
But what's that Pucelle whom they term so pure?

TALBOT
A maid, they say.

BEDFORD
A maid! and be so martial!

BURGUNDY
Pray God she prove not masculine ere long,
If underneath the standard of the French
She carry armour as she hath begun.

TALBOT
Well, let them practise and converse with spirits:
God is our fortress, in whose conquering name
Let us resolve to scale their flinty bulwarks.

BEDFORD
Ascend, brave Talbot; we will follow thee.

TALBOT
Not all together: better far, I guess,
That we do make our entrance several ways;
That, if it chance the one of us do fail,
The other yet may rise against their force.

BEDFORD
Agreed: I'll to yond corner.

BURGUNDY
And I to this.

TALBOT
And here will Talbot mount, or make his grave.
Now, Salisbury, for thee, and for the right
Of English Henry, shall this night appear
How much in duty I am bound to both.

Sentinels
Arm! arm! the enemy doth make assault!

ALENCON
How now, my lords! what, all unready so?

BASTARD OF ORLEANS
Unready! ay, and glad we 'scaped so well.

REIGNIER
'Twas time, I trow, to wake and leave our beds,
Hearing alarums at our chamber-doors.

ALENCON
Of all exploits since first I follow'd arms,
Ne'er heard I of a warlike enterprise
More venturous or desperate than this.

BASTARD OF ORLEANS
I think this Talbot be a fiend of hell.

REIGNIER
If not of hell, the heavens, sure, favour him.

ALENCON
Here cometh Charles: I marvel how he sped.

BASTARD OF ORLEANS
Tut, holy Joan was his defensive guard.

Enter CHARLES and JOAN LA PUCELLE

CHARLES
Is this thy cunning, thou deceitful dame?
Didst thou at first, to flatter us withal,
Make us partakers of a little gain,
That now our loss might be ten times so much?

JOAN LA PUCELLE
Wherefore is Charles impatient with his friend!
At all times will you have my power alike?
Sleeping or waking must I still prevail,
Or will you blame and lay the fault on me?
Improvident soldiers! had your watch been good,
This sudden mischief never could have fall'n.

CHARLES
Duke of Alencon, this was your default,
That, being captain of the watch to-night,
Did look no better to that weighty charge.

ALENCON
Had all your quarters been as safely kept
As that whereof I had the government,
We had not been thus shamefully surprised.

BASTARD OF ORLEANS
Mine was secure.

REIGNIER
And so was mine, my lord.

CHARLES
And, for myself, most part of all this night,
Within her quarter and mine own precinct
I was employ'd in passing to and fro,
About relieving of the sentinels:
Then how or which way should they first break in?

JOAN LA PUCELLE
Question, my lords, no further of the case,
How or which way: 'tis sure they found some place
But weakly guarded, where the breach was made.
And now there rests no other shift but this;
To gather our soldiers, scatter'd and dispersed,
And lay new platforms to endamage them.

Soldier
I'll be so bold to take what they have left.
The cry of Talbot serves me for a sword;
For I have loaden me with many spoils,
Using no other weapon but his name.

Exit

SCENE II. Orleans. Within the town.

Enter TALBOT, BEDFORD, BURGUNDY, a Captain, and others

BEDFORD
The day begins to break, and night is fled,
Whose pitchy mantle over-veil'd the earth.
Here sound retreat, and cease our hot pursuit.

Retreat sounded

TALBOT
Bring forth the body of old Salisbury,
And here advance it in the market-place,
The middle centre of this cursed town.
Now have I paid my vow unto his soul;
For every drop of blood was drawn from him,
There hath at least five Frenchmen died tonight.
And that hereafter ages may behold
What ruin happen'd in revenge of him,
Within their chiefest temple I'll erect
A tomb, wherein his corpse shall be interr'd:
Upon the which, that every one may read,
Shall be engraved the sack of Orleans,
The treacherous manner of his mournful death
And what a terror he had been to France.
But, lords, in all our bloody massacre,
I muse we met not with the Dauphin's grace,
His new-come champion, virtuous Joan of Arc,
Nor any of his false confederates.

BEDFORD
'Tis thought, Lord Talbot, when the fight began,
Roused on the sudden from their drowsy beds,
They did amongst the troops of armed men
Leap o'er the walls for refuge in the field.

BURGUNDY
Myself, as far as I could well discern
For smoke and dusky vapours of the night,
Am sure I scared the Dauphin and his trull,
When arm in arm they both came swiftly running,
Like to a pair of loving turtle-doves
That could not live asunder day or night.
After that things are set in order here,
We'll follow them with all the power we have.

Enter a Messenger

Messenger
All hail, my lords! which of this princely train
Call ye the warlike Talbot, for his acts
So much applauded through the realm of France?

TALBOT
Here is the Talbot: who would speak with him?

Messenger
The virtuous lady, Countess of Auvergne,
With modesty admiring thy renown,
By me entreats, great lord, thou wouldst vouchsafe
To visit her poor castle where she lies,
That she may boast she hath beheld the man
Whose glory fills the world with loud report.

BURGUNDY
Is it even so? Nay, then, I see our wars
Will turn unto a peaceful comic sport,
When ladies crave to be encounter'd with.
You may not, my lord, despise her gentle suit.

TALBOT
Ne'er trust me then; for when a world of men
Could not prevail with all their oratory,
Yet hath a woman's kindness over-ruled:
And therefore tell her I return great thanks,
And in submission will attend on her.
Will not your honours bear me company?

BEDFORD
No, truly; it is more than manners will:
And I have heard it said, unbidden guests
Are often welcomest when they are gone.

TALBOT
Well then, alone, since there's no remedy,
I mean to prove this lady's courtesy.
Come hither, captain.

\n\n"




opening:.asciiz "BEDFORD"

	.text
	.globl main

main:	la $a0, dialog
	li $v0, 4
	syscall
Loop:
	la $a0, dialog
	la $a1, opening
	jal cov_longest
	beq $v0, $0, done
	la $a0, dialog
	li $v0, 4
	syscall

done:	li $v0, 10		# Exit
	syscall


#------------------------------------------------
cov_longest:
	addi $sp, $sp, -4			# store into heap
	sw $ra, 0($sp)
	addi $sp, $sp, -4
	sw $a0, 0($sp)

	li $s2, 1					# counter

	jal find_next_sentence
	beq $v0, $zero, Exit4		# if no match found, exits
	add $a0, $zero, $v0
	addi $sp, $sp, -4			# stores initial address and char length into stack of first match
	sw $v0, 0($sp)
	jal get_to_end
	addi $sp, $sp, -4
	sw $v0, 0($sp)
	add $a0, $a0, $v0

StackStore:
	jal find_next_sentence
	beq $v0, $zero, Finish
	add $s5, $zero, $v0			# temp address storage
	add $a0, $zero, $v0
	jal get_to_end
	add $t2, $zero, $v0			# temp val storage
	lw $t3, 0($sp)
	slt $t4, $t3, $t2
	add $a0, $a0, $v0			# increments address to get to next place
	beq $t4, 1, Swap
	j StackStore


Swap:
	addi $sp, $sp, -4
	sw $s5, 0($sp)				# stores address into stack
	addi $sp, $sp, -4
	sw $t2, 0($sp)				# stores val into stack
	addi $s2, $s2, 1			# increments counter

	j StackStore



Finish:
	addi $sp, $sp, 4			# value not needed, adds 4 to stack to get the address
	lw $s3, 0($sp)				# grabs address
	addi $sp, $sp, 4			# restores stack by 4 so next restoring function can work properly
	add $a0, $zero, $s3			# loads address with longest text
	jal cov_str					# converts to all caps
	addi $sp, $sp, -8


	li $t6, 0					# restore stack loop variable
RestoreStack:					# restores the stack
	addi $sp, $sp, 8			# since stack is incremented twice for each swap, 8 is restored for each loop
	addi $t6, $t6, 1
	bne $t6, $s2, RestoreStack

	li $v0, 1					# so it prints edited message

Exit4:
	lw $a0, 0($sp)				# restores variables
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra


#------------------------------------------------
#------------------------------------------------
find_next_sentence:

	add $t4, $a1, $zero
	addi $sp, $sp, -4			# stores variables into stack so they can be recalled
	sw $ra, 0($sp)
	addi $sp, $sp, -4
	sw $a0, 0($sp)
	addi $sp, $sp, -4
	sw $a1, 0($sp)
	add $t3, $zero, $a0			# temp initial address storage

	beq $a0, 0, Exit3

	FindName:
	lb $t1, 0($a0)
	addi $a0, $a0, 1			# checks if first characters match, in both strings
	lb $t0, 0($a1)
	addi $a1, $a1, 1

	beq $t0, 0, NameMatch		# if done checking, there's a match, jumps here
	beq $t1, $t0, FindName		# checks next character for a match

	add $a1, $zero, $t4

	FindNewLine:

	lb $t1, 0($a0)
	addi $a0, $a0, 1
	beq $t1, 0, Exit3			# indicates no match
	bne $t1, 10, FindNewLine
	lb $t1, 0($a0)
	bne $t1, 10, FindNewLine
	addi $a0, $a0, 1
	lb $t1, 0($a0)

	beq $t1, 10, Exit3			# if it reaches the end of the line
	add $t3, $a0, $zero
	j FindName

	NameMatch:					# name match exit
	add $v0, $zero, $t3			# returns address of first char of name
    lw $a1, 0($sp)
	addi $sp, $sp, 4
	lw $a0, 0($sp)
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra

	Exit3:						# no match exit
	li $v0, 0					# returns a zero
	lw $a1, 0($sp)
	addi $sp, $sp, 4			# restores variables from stack
	lw $a0, 0($sp)
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	addi $sp, $sp, 4
jr $ra
#------------------------------------------------
#------------------------------------------------
get_to_end:
	addi $sp, $sp, -4			# stores variables into stack
	sw $ra, 0($sp)
	addi $sp, $sp, -4
	sw $a0, 0($sp)

	li $t2, 10					# newline
	add $t4, $zero, $a0			# temp storage of starting address

	CountLoop:
	lb $t1, 0($a0)				# loads byte
	addi $a0, $a0, 1

	bne $t1, $t2, CountLoop		# if reaches end of line,
	lb $t1, 0($a0)				# if the next one is an end of line, exits loop
	beq $t1, $t2, End2
	j CountLoop

	End2:
	addi $a0, 1
	sub $v0, $a0, $t4			# length
	add $t7, $v0, $zero
	lw $a0, 0($sp)				# restores stack
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	addi $sp, $sp, 4
jr $ra
#------------------------------------------------
#------------------------------------------------
cov_str:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $sp, $sp, -4
	sw $a0, 0($sp)
	li $t3, 91  					# end of caps chars

LoopTemp2:
	lb $t1, 0($a0)
	slt $t0, $t1, $t3				# 1 if a capital letter
	beq $t1, 10, ExitCheck2
	bne $t0, 1, LowConv
	addi $a0, $a0, 1
	j LoopTemp2

LowConv:
	addi $t1, $t1, -32
	sb $t1, 0($a0)
	addi $a0, $a0, 1
	lb $t1, 0($a0)
	bne $t1, 10, LoopTemp2

ExitCheck2:
	addi $a0, $a0, 1				# if reaches end of paragraph, exits
	lb $t1, 0($a0)
	bne $t1, 10, LoopTemp2
	addi $a0, $a0, 1

lw $a0, 0($sp)						# restores variables
addi $sp, $sp, 4
lw $ra, 0($sp)
addi $sp, $sp, 4
jr $ra

#------------------------------------------------
