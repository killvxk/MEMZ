frameTickCounter db 0
noteTickCounter  db 0
nyanTickCounter  db 0

%macro onTimer 3
	inc byte %1
	cmp byte %1, %2
	jne %%checkNext

	mov byte %1, 0
	
	call %3
	
	%%checkNext:
%endmacro

timerHandler:
	startInterrupt
	
	onTimer [cs:frameTickCounter],  8, displayFrame
	onTimer [cs:noteTickCounter],  12, playNote
	onTimer [cs:nyanTickCounter],  10, countNyan
	
	finishInterrupt