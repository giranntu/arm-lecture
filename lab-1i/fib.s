	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	@ ADD/MODIFY CODE BELOW
	@ PROLOG
	push {r3, r4, r5, lr}
	mov r3, #1			@Head=-1
	mov r4, #-1		@Tail=-1
	mov r5,#0 			@sum=0
	cmp r0,#0 			@if (x<=0) then except
	ble except

Loop:
	
	add r5,r3, r4	@sum = Head+Tail
	mov r4, r3 		@Tail=Head
	mov r3, r5 		@Head=sum
	subs r0, r0,#1	@x--
	cmp r0, #0		@while (x>=0) go repeat
	bge Loop

	mov r0, r5 		@r0=return value
	pop {r3, r4, r5, pc}		@EPILOG

except:
	mov r0,#0		@return 0
	pop {r3, r4, r5, pc}
     @  ddd

	@ END CODE MODIFICATION

	.size fibonacci, .-fibonacci
	.end
