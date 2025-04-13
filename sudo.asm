[org 0x0100]
jmp start
	
	; here all the LABEL declarations
	top_row: db '/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\ '  , 0
	welcome: db ' -- Welcome To -- ' ,0
	S_row1 db '  #####  ', 0
    S_row2 db ' ##   ## ', 0
    S_row3 db ' ##       ', 0
    S_row4 db '  ##      ', 0
    S_row5 db '    ##    ', 0
    S_row6 db '#    ##   ', 0
    S_row7 db ' #####    ', 0

    U_row1 db '##    ## ', 0
    U_row2 db '##    ## ', 0
    U_row3 db '##    ## ', 0
    U_row4 db '##    ## ', 0
    U_row5 db '##    ## ', 0
    U_row6 db ' ##  ##  ', 0
    U_row7 db '  ####    ', 0

    D_row1 db '######   ', 0
    D_row2 db '##    ## ', 0
    D_row3 db '##     ##', 0
    D_row4 db '##     ##', 0
    D_row5 db '##     ## ', 0
    D_row6 db '##    ## ', 0
    D_row7 db '######   ', 0

    O_row1 db ' ######  ', 0
    O_row2 db '##    ## ', 0
    O_row3 db '##    ## ', 0
    O_row4 db '##    ## ', 0
    O_row5 db '##    ## ', 0
    O_row6 db '##    ## ', 0
    O_row7 db ' ######  ', 0

    K_row1 db '##    ## ', 0
    K_row2 db '##   ##  ', 0
    K_row3 db '##  ##   ', 0
    K_row4 db '#####    ', 0
    K_row5 db '##  ##   ', 0
    K_row6 db '##   ##  ', 0
    K_row7 db '##    ## ', 0

	press: db "Press Space To Start..." , 0
	
	menu_msg db '- Main Menu - ', 0
    title_msg db 'Welcome to Project Sudoku', 0 
    timerEnabled: db 1        ; 1 = Timer running, 0 = Timer stopped	
    timer_which_grid: db -1   ;initialized for none (0 for 4x4 and 1 for 9x9)
	
	ten: db 10
	grid_choice db 'Grids Opts:',0
	grid_msg4 db '4x4 Grid',0
	grid_Or db 'Or',0
	grid_msg9 db '9x9 Grid',0
	
	difficult_choice db 'Difficulty:',0
	easy_msg db 'Easy',0
	medium_msg db 'Medium',0
	hard_msg db 'Hard',0
	
    start_msg db 'Press any key to start...', 0
	
	title_horizontal db '+===+===+===+===+===+===+===+',0
	grid_horizontal db '+========+',0
	
	input_msggrid db 'Enter Choice for Grid (4/9) : ',0
	input_msglvl db 'Enter Choice for Level (E/M/H) : ',0
	input_grid db 0,0
	input_lvl dw 0,0
	notes: db "[n] notes"
	
	invalidinput db '- Invalid Input -',0
	title_box db "4  x  4  G R I D", 0
	mistake db "Mistakes:  /3 ", 0
	mistake_count: dw 0
	time db "Time: ", 0
	score: db "Score: ",0
	score_count: dw 000
	easy_msg_9top db '--------',0
	easy_msg_9bottom db '--------',0
	
	current_row: db 0
	current_col: db 0
	inputgiven: db ' '
	previous_col: db 0
	
	MAX_ROWS:db 12
	MAX_COLS: db 15
	
	note_mode: db 0
	page_num: db 0
	
	mistake_lost: db 0
	
	; here all the LABEL declarations
    title_msglose db ' - GAME OVER - ', 0
	
	grid_pun db 'You have made so many mistakes, it is',0
	grid_pun2 db 'no longer SuDOku, its SuDONTku',0
	
	title_boxlose db '+===+===+===+===+===+===+===+===+===+===+===+===+',0
	
	input_msgtry db 'Try Again (Y/N):',0
	input_try db 0
	
	; here all the LABEL declarations
    title_msgwin db ' - CONGRATULATIONS YOU WON - ', 0

	grid_punwin db 'Try A Different Level Perhaps?',0
	grid_timewin db 'Time Taken: ', 0
	grid_scorewin db 'Score: ', 0

	title_boxwin db '+===+===+===+===+===+===+===+===+===+===+===+===+===+===+===+',0
	
	row1     db "+===+===+===+===+===+===+===+===+===+", 0
row2     db "=   |   |   =   |   |   =   |   |   =", 0
row3     db "= 5 | 3 |   =   | 7 |   =   |   |   =   |", 0
row4     db "=   |   |   =   |   |   =   |   |   =   |", 0
row5     db "+===+===+===+===+===+===+===+===+===+", 0
row6     db "=   |   |   =   |   |   =   |   |   =   |", 0
row7     db "= 6 |   |   = 1 | 9 | 5 =   |   |   =   |", 0
row8     db "=   |   |   =   |   |   =   |   |   =   |", 0
row9     db "+===+===+===+===+===+===+===+===+===+", 0
row10    db "=   |   |   =   |   |   =   |   |   =   |", 0
row11    db "=   | 9 | 8 =   |   |   =   | 6 |   =  |", 0
row12    db "=   |   |   =   |   |   =   |   |   =   |", 0
row13    db "+===+===+===+===+===+===+===+===+===+", 0
row14    db "=   |   |   =   |   |   =   |   |   =   |", 0
row15    db "= 8 |   |   =   | 6 |   =   |   | 3 =   |", 0
row16    db "=   |   |   =   |   |   =   |   |   =   |", 0
row17    db "+===+===+===+===+===+===+===+===+===+", 0
row18    db "=   |   |   =   |   |   =   |   |   =   |", 0
row19    db "= 4 |   |   = 8 |   | 3 =   |   |   = 1 |", 0
row20    db "=   |   |   =   |   |   =   |   |   =   |", 0
row21    db "+===+===+===+===+===+===+===+===+===+", 0
row22    db "=   |   |   =   |   |   =   |   |   =   |", 0
row23    db "= 7 |   |   =   | 2 |   =   |   |   = 6 |", 0
row24    db "=   |   |   =   |   |   =   |   |   =   |", 0
row25    db "+===+===+===+===+===+===+===+===+===+", 0
row26    db "=   |   |   =   |   |   =   |   |   =   |", 0
row27    db "=   | 6 |   =   |   |   = 2 | 8 |   =   |", 0
row28    db "=   |   |   =   |   |   =   |   |   =   |", 0
row29    db "+===+===+===+===+===+===+===+===+===+", 0
row30    db "=   |   |   =   |   |   =   |   |   =   |", 0
row31    db "=   |   |   = 4 | 1 | 9 =   |   |   = 5 |", 0
row32    db "=   |   |   =   |   |   =   |   |   =   |", 0
row33    db "+===+===+===+===+===+===+===+===+===+", 0
row34    db "=   |   |   =   |   |   =   |   |   =   |", 0
row35    db "=   |   |   =   | 8 |   =   | 7 | 9 =   |", 0
row36    db "=   |   |   =   |   |   =   |   |   =   |", 0
row37    db "+===+===+===+===+===+===+===+===+===+", 0

solution_grid_9x9_easy: db 5,3,2,6,7,8,4,9,1
                        db 6,7,4,1,9,5,8,3,2
                        db 1,9,8,3,4,2,7,6,5
                        db 8,1,9,7,6,4,5,2,3
                        db 4,2,6,8,5,3,9,1,7
                        db 7,5,3,9,2,1,6,4,8
                        db 9,6,1,5,3,7,2,8,4
                        db 2,8,7,4,1,9,3,5,6
                        db 3,4,5,2,8,6,1,7,9
						
col1_e_9: db 5
col2_e_9: db 3
col3_e_9: db 1
col4_e_9: db 3
col5_e_9: db 6
col6_e_9: db 3
col7_e_9: db 1
col8_e_9: db 3
col9_e_9: db 2

row7_e_9: db 3
row8_e_9: db 3
row9_e_9: db 3


page_num1: db 0
note_mode1: db 0
orig_dh1: db 0
orig_dl1: db 0
fazooldl1: db 0
fazooldh1: db 0

medrow1     db "+===+===+===+===+===+===+===+===+===+", 0
medrow2     db "=   |   |   =   |   |   =   |   |   =", 0
medrow3     db "=   | 2 |   = 6 |   | 8 =   |   |   =", 0
medrow4     db "=   |   |   =   |   |   =   |   |   =", 0
medrow5     db "+===+===+===+===+===+===+===+===+===+", 0
medrow6     db "=   |   |   =   |   |   =   |   |   =", 0
medrow7     db "= 5 | 8 |   =   |   | 9 = 7 |   |   =", 0
medrow8     db "=   |   |   =   |   |   =   |   |   =", 0
medrow9     db "+===+===+===+===+===+===+===+===+===+", 0
medrow10    db "=   |   |   =   |   |   =   |   |   =", 0
medrow11    db "=   |   |   =   | 4 |   =   |   |   =", 0
medrow12    db "=   |   |   =   |   |   =   |   |   =", 0
medrow13    db "+===+===+===+===+===+===+===+===+===+", 0
medrow14    db "=   |   |   =   |   |   =   |   |   =", 0
medrow15    db "= 3 | 7 |   =   |   |   = 5 |   |   =", 0
medrow16    db "=   |   |   =   |   |   =   |   |   =", 0
medrow17    db "+===+===+===+===+===+===+===+===+===+", 0
medrow18    db "=   |   |   =   |   |   =   |   |   =", 0
medrow19    db "= 6 |   |   =   |   |   =   |   | 4 =", 0
medrow20    db "=   |   |   =   |   |   =   |   |   =", 0
medrow21    db "+===+===+===+===+===+===+===+===+===+", 0
medrow22    db "=   |   |   =   |   |   =   |   |   =", 0
medrow23    db "=   |   | 8 =   |   |   =   | 1 | 3 =", 0
medrow24    db "=   |   |   =   |   |   =   |   |   =", 0
medrow25    db "+===+===+===+===+===+===+===+===+===+", 0
medrow26    db "=   |   |   =   |   |   =   |   |   =", 0
medrow27    db "=   |   |   =   | 2 |   =   |   |   =", 0
medrow28    db "=   |   |   =   |   |   =   |   |   =", 0
medrow29    db "+===+===+===+===+===+===+===+===+===+", 0
medrow30    db "=   |   |   =   |   |   =   |   |   =", 0
medrow31    db "=   |   | 9 = 8 |   |   =   | 3 | 6 =", 0
medrow32    db "=   |   |   =   |   |   =   |   |   =", 0
medrow33    db "+===+===+===+===+===+===+===+===+===+", 0
medrow34    db "=   |   |   =   |   |   =   |   |   =", 0
medrow35    db "=   |   |   = 3 |   | 6 =   | 9 |   =", 0
medrow36    db "=   |   |   =   |   |   =   |   |   =", 0
medrow37    db "+===+===+===+===+===+===+===+===+===+", 0

solution_grid_9x9_med: db 1,2,3,6,7,8,9,4,5
                       db 5,8,4,2,3,9,7,6,1
                       db 9,6,7,1,4,5,3,2,8
                       db 3,7,2,4,6,1,5,8,9
                       db 6,9,1,5,8,3,2,7,4
                       db 4,5,8,7,9,2,6,1,3
                       db 8,3,6,9,2,4,1,5,7
                       db 2,1,9,8,5,7,4,3,6
                       db 7,4,5,3,1,6,8,9,2
					   
col1_med_9: db 3
col2_med_9: db 3
col3_med_9: db 2
col4_med_9: db 3
col5_med_9: db 2
col6_med_9: db 3
col7_med_9: db 2
col8_med_9: db 3
col9_med_9: db 3

row7_med_9: db 1
row8_med_9: db 4
row9_med_9: db 3

					   
page_num2: db 0
note_mode2: db 0
orig_dh2: db 0
orig_dl2: db 0
fazooldl2: db 0
fazooldh2: db 0

hardrow1     db "+===+===+===+===+===+===+===+===+===+", 0
hardrow2     db "=   |   |   =   |   |   =   |   |   =", 0
hardrow3     db "=   | 6 | 5 =   |   | 2 =   |   |   =", 0
hardrow4     db "=   |   |   =   |   |   =   |   |   =", 0
hardrow5     db "+===+=======+===+===+===+===+===+===+", 0
hardrow6     db "=   |   |   =   |   |   =   |   |   =", 0
hardrow7     db "= 8 |   |   = 3 | 9 |   = 5 |   |   =", 0
hardrow8     db "=   |   |   =   |   |   =   |   |   =", 0
hardrow9     db "+===+===+===+===+===+===+===+===+===+", 0
hardrow10    db "=   |   |   =   |   |   =   |   |   =", 0
hardrow11    db "= 2 | 7 | 9 =   |   |   = 3 | 8 | 4 =", 0
hardrow12    db "=   |   |   =   |   |   =   |   |   =", 0
hardrow13    db "+===+===+===+===+===+===+===+===+===+", 0
hardrow14    db "=   |   |   =   |   |   =   |   |   =", 0
hardrow15    db "=   | 2 |   = 8 |   |   =   | 5 |   =", 0
hardrow16    db "=   |   |   =   |   |   =   |   |   =", 0
hardrow17    db "+===+===+===+===+===+===+===+===+===+", 0
hardrow18    db "=   |   |   =   |   |   =   |   |   =", 0
hardrow19    db "= 1 | 9 | 6 =   | 2 |   =   |   |   =", 0
hardrow20    db "=   |   |   =   |   |   =   |   |   =", 0
hardrow21    db "+===+===+===+===+===+===+===+===+===+", 0
hardrow22    db "=   |   |   =   |   |   =   |   |   =", 0
hardrow23    db "=   |   | 8 = 6 |   | 9 = 1 |   |   =", 0
hardrow24    db "=   |   |   =   |   |   =   |   |   =", 0
hardrow25    db "+===+===+===+===+===+===+===+===+===+", 0
hardrow26    db "=   |   |   =   |   |   =   |   |   =", 0
hardrow27    db "= 5 | 1 |   =   |   | 8 = 2 | 9 | 6 =", 0
hardrow28    db "=   |   |   =   |   |   =   |   |   =", 0
hardrow29    db "+===+===+===+===+===+===+===+===+===+", 0
hardrow30    db "=   |   |   =   |   |   =   |   |   =", 0
hardrow31    db "=   |   | 2 =   |   | 1 = 8 |   |   =", 0
hardrow32    db "=   |   |   =   |   |   =   |   |   =", 0
hardrow33    db "+===+===+===+===+===+===+===+===+===+", 0
hardrow34    db "=   |   |   =   |   |   =   |   |   =", 0
hardrow35    db "=   | 8 |   = 2 |   | 5 = 4 |   | 1 =", 0
hardrow36    db "=   |   |   =   |   |   =   |   |   =", 0
hardrow37    db "+===+===+===+===+===+===+===+===+===+", 0

solution_grid_9x9_hard: db 3,6,5,4,8,2,9,1,7
                        db 8,4,1,3,9,7,5,6,2
                        db 2,7,9,1,5,6,3,8,4
                        db 7,2,3,8,1,4,6,5,9
                        db 1,9,6,5,2,3,7,4,8
                        db 4,5,8,6,7,9,1,2,3
						db 5,1,4,7,3,8,2,9,6
                        db 6,3,2,9,4,1,8,7,5
                        db 9,8,7,2,6,5,4,3,1
col1_hard_9: db 4
col2_hard_9: db 6
col3_hard_9: db 5
col4_hard_9: db 4
col5_hard_9: db 2
col6_hard_9: db 5
col7_hard_9: db 6
col8_hard_9: db 3
col9_hard_9: db 3

row7_hard_9: db 6
row8_hard_9: db 3
row9_hard_9: db 5

page_num3: db 0
note_mode3: db 0
orig_dh3: db 0
orig_dl3: db 0
fazooldl3: db 0
fazooldh3: db 0

space: db'   '

row1_4x4_e     db "+===+===+===+", 0
row2_4x4_e     db "|  |  +  |  |", 0
row3_4x4_e     db "| 1|  +  | 4|", 0
row4_4x4_e     db "+===+===+===+", 0
row5_4x4_e     db "|  |  +  |  |", 0
row6_4x4_e     db "|  | 4+ 3|  |", 0
row7_4x4_e     db "+===+===+===+", 0
row8_4x4_e     db "|  |  +  |  |", 0
row9_4x4_e     db "|  | 1+ 4|  |", 0
row10_4x4_e    db "+===+===+===+", 0
row11_4x4_e    db "|  |  +  |  |", 0
row12_4x4_e    db "| 4|  +  | 3|", 0
row13_4x4_e    db "+===+===+===+", 0


solution_grid  db 1, 3, 2, 4  ; Row 1 solution
               db 2, 4, 3, 1  ; Row 2 solution
               db 3, 1, 4, 2  ; Row 3 solution
               db 4, 2, 1, 3  ; Row 4 solution

;strings for 4x4 grid MED
row1_4x4_m     db "+==+==+==+==+", 0
row2_4x4_m     db "|  |  +  |  |", 0
row3_4x4_m     db "| 4| 3+  | 1|", 0
row4_4x4_m     db "+==+==+==+==+", 0
row5_4x4_m     db "|  |  +  |  |", 0
row6_4x4_m     db "| 1|  + 4|  |", 0
row7_4x4_m     db "+++++++++++++", 0
row8_4x4_m     db "|  |  +  |  |", 0
row9_4x4_m     db "|  |  +  | 4|", 0
row10_4x4_m    db "+==+==+==+==+", 0
row11_4x4_m    db "|  |  +  |  |", 0
row12_4x4_m    db "|  |  +  |  |", 0
row13_4x4_m    db "+==+==+==+==+", 0

solution_grid_med db 4,3,2,1
                   db 1,2,4,3
				   db 2,1,3,4
				   db 3,4,1,2

;strings for 4x4 grid HARD
row1_4x4_h     db "+==+==+==+==+", 0
row2_4x4_h     db "|  |  +  |  |", 0
row3_4x4_h     db "| 3| 4+  |  |", 0
row4_4x4_h     db "+==+==+==+==+", 0
row5_4x4_h     db "|  |  +  |  |", 0
row6_4x4_h     db "|  |  +  |  |", 0
row7_4x4_h     db "+++++++++++++", 0
row8_4x4_h     db "|  |  +  |  |", 0
row9_4x4_h     db "|  | 3+  |  |", 0
row10_4x4_h    db "+==+==+==+==+", 0
row11_4x4_h    db "|  |  +  |  |", 0
row12_4x4_h    db "|  | 1+  |  |", 0
row13_4x4_h    db "+==+==+==+==+", 0

solution_grid_hard db 3,4,2,1
                   db 1,2,4,3
				   db 2,3,1,4
				   db 4,1,3,2


number_box db "*-----*-----*",0
box_row1   db "|  1  |  2  | ",0
box_row2   db "|  3  |  4  | ",0
box_row3   db "|  5  |  6  | ",0
box_row4   db "|  7  |  8  | ",0
box_row5   db "|  9  | ",0

restart_game db "[r] restart ",0
end_game db "[q] quit ",0
remove: db "[e] erase ",0
tickcount: dw 0
seconds: dw 0
minutes: dw 0
colon: db ":"
score10: db "+10"
score2: db "-2"
correctinputs: db 0
col1_easy: db 2
col2_easy: db 2
col3_easy: db 2
col4_easy: db 2
col1_med:db 2
col2_med: db 1
col3_med: db 1
col4_med: db 2
col1_hard: db 1
col2_hard: db 3
col3_hard: db 0
col4_hard: db 0


correct:

	mov [input_lvl],al
	
continue:
	
	mov ah, 00h   ; BIOS keyboard interrupt
	int 16h       ; Wait for any key press

	call clrscr
	
		;======================== GRID INPUT KAR RAHAY ======================================
	
	cmp byte[input_grid],'4'
	jne grid9input
	
grid4:

	cmp word[input_lvl],'e'
	je grid4_easy
	
	cmp word[input_lvl],'m'
	je grid4_medium

	
	call draw_grid4_h
	jmp endgame
	
	
grid4_medium:

	call draw_grid4_m
	jmp endgame
	
grid4_easy:

	call draw_grid4_e
	jmp endgame
	
grid9input:

	cmp word[input_lvl],'e'
	je easygrid9
	
	cmp word[input_lvl],'m'
	je grid9_medium
	
	call drawgrid9_hard
	jmp endgame
	
grid9_medium:

	call drawgrid9_medium
	jmp endgame
	
	easygrid9:
	call drawgrid9
	jmp endgame
	
		;======================== INPUT CHECKING KA CODE & RESTART ======================================

restart:

	mov word[cs:timerEnabled],0
	mov word[cs:tickcount],0
	mov word[cs:minutes],0
	mov word[cs:seconds],0
	mov byte[mistake_count],0
	mov byte[score_count],0
	call start
	ret
	
incorrectinput:

	call clrscr

	mov ah, 00h  ; Set video mode function
	mov al, 03h  ; 80x25 text mode
	int 10h      ; Call BIOS interrupt
	
	mov ah, 02h    ; Set cursor position function
	mov bh, 0      
	mov dh, 3   ; Row 3
	mov dl, 32 ; Column 32
	int 10h  

	mov si, invalidinput  ; Load address of title_msg into SI
	call print_colored_menu 
	
	;displays the title of "Enter Choice of Grid"
	mov ah, 02h    
	mov bh, 0      
	mov dh, 6   ; Row 20
	mov dl, 10   ; Column 0
	int 10h      
	
	mov si, input_msggrid 
	call print_string
	
	again:
	call get_input
	
	cmp al,'4'
	je corr_
	
	cmp al,'9'
	je corr_
	
	jmp again
	
	corr_:
	mov byte[input_grid],al
	
	;displays the title of "Enter Choice of Level"
	mov ah, 02h   
	mov bh, 0     
	mov dh, 8   ; Row 21
	mov dl, 10  ; Column 0
	int 10h    
	
	;------------------------------------------------------------  
	; It takes the input for which difficulty to choose (Easy/Med/Hard)
	mov si, input_msglvl
	call print_string
	
	;------------------------------------------------------------  
	
	call get_input
	
	again1:
	cmp al,'e'
	je corr1
	
	cmp al,'m'
	je corr1
	
	cmp al,'h'
	je corr1
	
	 jmp again1
	
	corr1:
	mov [input_lvl],al
	
	ret

clrscr:

	mov ax,0xb800
	mov es,ax
	mov di,0
		
nextloc:

	mov word[es:di],0x0720
	add di,2
	cmp di,4000
	jne nextloc
	
	ret
	
	;======================== 4x4 EASY KA CODE ======================================

draw_grid4_EASY:

    call print4x4_details
	
	mov ah, 0x13    
    mov al, 1      
    mov bh, 0       
    mov bl, 02h    
    mov dx, 0x0227  
    mov cx, 5      
    push cs
    pop es        
    mov bp, easy_msg
    int 0x10         
	
	mov ah, 0x13    
    mov al, 1        
    mov bh, 0        
    mov bl, 03h     
    mov dx, 0x0205  
    mov cx, 11    
    push cs
    pop es          
    mov bp, restart_game
    int 0x10        
	
	mov ah, 0x13     
    mov al, 1       
    mov bh, 0       
    mov bl, 0Fh      
    mov dx, 0x0324  
    mov cx, 11      
    push cs
    pop es          
    mov bp, grid_horizontal
    int 0x10         
	
    mov ah, 0x13
    mov al, 1
    mov bh, 0
    mov bl, 0Eh
    mov dx, 0x0620
    mov cx, 14
    push cs
    pop es
    mov bp, row1_4x4_e
    int 0x10

    mov dx, 0x0720
    mov bp, row2_4x4_e
    int 0x10

    mov dx, 0x0820
    mov bp, row3_4x4_e
    int 0x10

    mov dx, 0x0920
    mov bp, row4_4x4_e
    int 0x10

    mov dx, 0x0A20
    mov bp, row5_4x4_e
    int 0x10

    mov dx, 0x0B20
    mov bp, row6_4x4_e
    int 0x10

    mov dx, 0x0C20
    mov bp, row7_4x4_e
    int 0x10

    mov dx, 0x0D20
    mov bp, row8_4x4_e
    int 0x10

    mov dx, 0x0E20
    mov bp, row9_4x4_e
    int 0x10

    mov dx, 0x0F20
    mov bp, row10_4x4_e
    int 0x10

    mov dx, 0x1020
    mov bp, row11_4x4_e
    int 0x10

    mov dx, 0x1120
    mov bp, row12_4x4_e
    int 0x10

    mov dx, 0x1220
    mov bp, row13_4x4_e
    int 0x10

cursor:

    mov dh, 8         
    mov dl, 34       
    mov bh, 0         
    mov ah, 2         
    int 0x10
	
	cursor_update:
    mov ah, 2
    mov bh, 0
    int 0x10
    ret
	
	
; Toggle Note Mode
toggle_note_mode:
    mov al, [note_mode]
    cmp  al, 1      ;-----------------------------------
    jne enable_note_mode
    call disable_note_mode
    ret
enable_note_mode:
    mov byte [note_mode], 1   ; Enable note mode
    xor al, al                ; Reset AL to clear any leftover inputs
    xor ah, ah                ; Reset AH
    mov dh, 7                 ; Move cursor to the top-left corner
    mov dl, 33
    call cursor_update
    ret

disable_note_mode:
    mov byte [note_mode], 0   ; Disable note mode
    xor al, al                ; Reset AL to prevent leftover input
    xor ah, ah                ; Reset AH
    mov dh, 8                 ; Move cursor to the default position
    mov dl, 34
    call cursor_update
    ret

handle_input:
    mov ah, 0
    int 16h
    cmp al, 'n'                ; Toggle note mode
    je toggle_note_mode

    mov al, [note_mode]
    cmp al, 1
    je handle_notes
	
	cmp ah, 0x13
	je restart
	cmp ah,0x10
	je endgame
	cmp ah,0x12
	je remove_number
	

    cmp ah, 0x02               ; '1'
    je insert_number_1
    cmp ah, 0x03               ; '2'
    je insert_number_2
    cmp ah, 0x04               ; '3'
    je insert_number_3
    cmp ah, 0x05               ; '4'
    je insert_number_4
    cmp ah, 0x48               ; Up arrow
    je move_up
    cmp ah, 0x4B               ; Left arrow
    je move_left
    cmp ah, 0x4D               ; Right arrow
    je move_right
    cmp ah, 0x50               ; Down arrow
    je move_down
	
	
    jmp handle_input

; Handle Notes
handle_notes:
    cmp ah, 0x02               ; '1'
    je insert_note_1
    cmp ah, 0x03               ; '2'
    je insert_note_2
    cmp ah, 0x04               ; '3'
    je insert_note_3
    cmp ah, 0x05               ; '4'
    je insert_note_4
    cmp ah, 0x48               ; Up arrow
    je note_move_up
    cmp ah, 0x4B               ; Left arrow
    je note_move_left
    cmp ah, 0x4D               ; Right arrow
    je note_move_right
    cmp ah, 0x50               ; Down arrow
    je note_move_down
    jmp handle_input

; Note-Specific Movements
note_move_up:
    cmp dh, 7                 ; Check if at the topmost row of the grid
    jbe handle_input          ; If yes, don't move further up
    sub dh, 3                 ; Move to the upper corner of the previous 2x2 box
    call cursor_update
    jmp handle_input

note_move_down:
    cmp dh, 16                ; Check if at the bottommost row of the grid
    jae handle_input          ; If yes, don't move further down
    add dh, 3                 ; Move to the upper corner of the next 2x2 box
    call cursor_update
    jmp handle_input

note_move_left:
    cmp dl, 33                ; Check if at the leftmost column of the grid
    jbe handle_input          ; If yes, don't move further left
    sub dl, 3                 ; Move to the left corner of the previous 2x2 box
    call cursor_update
    jmp handle_input

note_move_right:
    cmp dl, 40                ; Check if at the rightmost column of the grid
    jae handle_input          ; If yes, don't move further right
    add dl, 3                 ; Move to the left corner of the next 2x2 box
    call cursor_update
    jmp handle_input

; Insert Notes
insert_note_1:
    call check_number_below_right ; Check for number with 0x4F attribute
    cmp al, 1                     ; If a number is found, skip inserting the note
    jne handle_input

    mov ah, 0x09
    mov al, '1'
    mov bh, 0x00
    mov bl, 0x0A
    mov cx, 1
    int 0x10
    jmp handle_input

insert_note_2:
    call check_number_below_right
    cmp al, 1
    jne handle_input

    mov ah, 0x09
    mov al, '2'
    mov bh, 0x00
    mov bl, 0x0A
    mov cx, 1
    int 0x10
    jmp handle_input

insert_note_3:
    call check_number_below_right
    cmp al, 1
    jne handle_input

    mov ah, 0x09
    mov al, '3'
    mov bh, 0x00
    mov bl, 0x0A
    mov cx, 1
    int 0x10
    jmp handle_input

insert_note_4:
    call check_number_below_right
    cmp al, 1
    jne handle_input

    mov ah, 0x09
    mov al, '4'
    mov bh, 0x00
    mov bl, 0x0A
    mov cx, 1
    int 0x10
    jmp handle_input
check_number_below_right:
    ; Save current cursor position in memory
    mov byte [fazooldh], dh    ; Save current row
    mov byte [fazooldl], dl    ; Save current column

    ; Calculate the position one row below and one column to the right
    add dh, 1                  ; Move to the row below
    add dl, 1                  ; Move to the column to the right

    ; Ensure the position is within the grid bounds
    cmp dh, 19                 ; Check if row exceeds grid bounds
    ja invalid_position
    cmp dl, 44                 ; Check if column exceeds grid bounds
    ja invalid_position

    ; Calculate video memory address for (row, column)
    mov ax, 0xB800             ; Base address of video memory
    mov es, ax                 ; Set ES to point to video memory

    ; Compute offset in memory for (dh, dl)
    xor bx, bx                 ; Clear BX
    mov al, dh                 ; Row number into AL
    mov ah, 0                  ; Clear upper byte of AX
    mov si, ax                 ; SI = row number
    shl si, 6                  ; Multiply row by 64 (2^6 = 64)
    mov di, ax                 ; DI = row number
    shl di, 4                  ; Multiply row by 16 (2^4 = 16)
    add si, di                 ; SI = row * 80 (64 + 16)
	xor dh,dh
    add si, dx                 ; Add column number to SI
    shl si, 1                  ; Multiply by 2 (character + attribute)

    ; Read character and attribute from video memory
    mov al, byte [es:si]       ; Read character at the position
    cmp al, 0x20               ; Is the character a space (' ')?
    jne no_attribute_found

    mov ah, byte [es:si+1]     ; Read attribute at the position
    cmp ah, 0x0E               ; Does the attribute match 0x0E?
    jne no_attribute_found

attribute_found:
    mov al, 1                  ; Indicate valid space with 0x0E attribute found
    jmp restore_position       ; Restore cursor position and return

no_attribute_found:
    xor al, al                 ; Indicate no valid space with 0x0E attribute
    jmp restore_position       ; Restore cursor position and return

invalid_position:
    xor al, al                 ; Treat invalid positions as no valid space

restore_position:
    ; Restore original cursor position
    mov dh, [fazooldh]
    mov dl, [fazooldl]
    ret                        ; Return with AL = 1 (valid) or 0 (not valid)

move_up:
    cmp dh, 8
    je handle_input
    sub dh, 3
    call cursor_update
    jmp handle_input

move_down:
    cmp dh, 17
    je handle_input
    add dh, 3
    call cursor_update
    jmp handle_input

move_left:
    cmp dl, 34
    je handle_input
    sub dl, 3
    call cursor_update
    jmp handle_input

move_right:
    cmp dl, 43
    je handle_input
    add dl, 3
    call cursor_update
    jmp handle_input
; Memory locations to store cursor position
orig_dh: db 0
orig_dl: db 0
fazooldl: db 0
fazooldh: db 0

; Clear Notes for Current 2x2 Box
clear_notes:
   ; Save the current cursor position
    mov [orig_dh], dh
    mov [orig_dl], dl

   mov[fazooldl],dl
   dec byte[fazooldl]
   mov dl,[fazooldl]
   
    mov[fazooldh],dh
   dec byte[fazooldh]
   mov dh,[fazooldh]
   
   call cursor_update

    ; Clear the note in the top-left corner of the 2x2 box
    mov ah, 0x09
    mov al, ' '            ; Clear note with a space
    mov bh, 0x00
    mov bl, 0x07           ; Normal white text attribute
    mov cx, 1              ; Print one character
    int 0x10               ; BIOS interrupt to print character

    ; Restore the original cursor position
    mov dh, [orig_dh]
    mov dl, [orig_dl]
    call cursor_update      ; Update the cursor visually
    ret
	
check_attribute:

    push bx
    push dx

    mov ah, 0x08             ; BIOS function to read character and attribute
    int 0x10                 ; Perform the interrupt
    cmp al, ' '              ; Check if character is empty (space)
    je allow_input           ; If empty, allow input
    cmp ah, 0x0E             ; Compare attribute with yellow on black
    je deny_input            ; If true, deny input
	cmp ah, 0x4F
	je deny_input

allow_input:

    xor ax, ax               ; Clear AL to ensure clean input
    mov al, 1                ; Mark input as allowed
    pop dx                   ; Restore registers
    pop bx
    ret

deny_input:

    xor ax, ax               ; Clear AL to ensure no input
    pop dx                   ; Restore registers
    pop bx
    jmp handle_input         ; Return control to input handler

compute_grid_index:

	cmp dh,8
	je solution_row1
	cmp dh,11
	je solution_row2
	cmp dh,14
	je solution_row3
	cmp dh,17
	je solution_row4
	
solution_row1:

	mov si,0
	jmp move_forward
	
solution_row2:

	mov si,4
	jmp move_forward

solution_row3:

	mov si,8
	jmp move_forward
	
solution_row4:

	mov si,12

move_forward:       ;calculate the column

	cmp dl,34
	je solution_col1
	cmp dl,37
	je solution_col2
	cmp dl,40
	je solution_col3
	cmp dl,43
	je solution_col4
	
solution_col1:

	mov bx,0
	jmp donewithit
	
solution_col2:

	mov bx,1
	jmp donewithit
	
solution_col3:

	mov bx,2
	jmp donewithit
	
solution_col4:

	mov bx,3
	
donewithit:

	ret


validate_input:

    call compute_grid_index     ; Compute the index in AX
    mov al, [solution_grid + si+bx]  ; Load the solution value
    cmp al, 0                   ; Check if the cell is editable (0 means not editable)
    je invalid_input
    mov bl, al                  ; Store the solution value in BL
    ret                         ; Return with BL containing the solution value

invalid_input:

    xor bl, bl                  ; BL = 0 indicates invalid input
    ret

; Insert number 1 with validation
insert_number_1:

    call validate_input         ; Validate input
    cmp bl, 1                   ; Check if the solution matches 1
    jne invalid_number          ; If not, handle invalid input
    call clear_notes            ; Clear notes in the current 2x2 box
    mov ah, 0x09
    mov al, '1'
    mov bh, 0x00
    mov bl, 0x4F                ; Attribute for correct cell
    mov cx, 1
    int 0x10                    ; Display the number
	call insertion_sound
	call display_score_increase
	call update_cursor_position10
	inc byte[correctinputs]
	cmp dl,34
	je inc_col1
	cmp dl,37
	je inc_col2
	cmp dl,40
	je inc_col3
	cmp dl,43
	je inc_col4
	
	inc_col1:
	inc byte[col1_easy]
	cmp byte[col1_easy],4
	je sound_col
	jmp maz
	
	inc_col2:
	inc byte[col2_easy]
	cmp byte[col2_easy],4
	je sound_col
	jmp maz
	
	inc_col3:
	inc byte[col3_easy]
	cmp byte[col3_easy],4
	je sound_col
	jmp maz
	
	inc_col4:
	inc byte[col4_easy]
	cmp byte[col4_easy],4
	je sound_col
	jmp maz
	
	
	sound_col:
	call completion_sound
	call print_smiley_face
	call update_cursor_position10
	
	
	maz:
	call checkrow_completion_4x4
	call update_cursor_position10
	;call checkcol_completion_4x4
	; call update_cursor_position10
	call checkwin_4x4_easy
    jmp handle_input

insert_number_2:
    call validate_input         ; Validate input
    cmp bl, 2                   ; Check if the solution matches 2
    jne invalid_number          ; If not, handle invalid input
    call clear_notes
    mov ah, 0x09
    mov al, '2'
    mov bh, 0x00
    mov bl, 0x4F
    mov cx, 1
    int 0x10
	call insertion_sound
	call display_score_increase
	call update_cursor_position10
	inc byte[correctinputs]
	cmp dl,34
	je inc_col1_1
	cmp dl,37
	je inc_col2_1
	cmp dl,40
	je inc_col3_1
	cmp dl,43
	je inc_col4_1
	
	inc_col1_1:
	inc byte[col1_easy]
	cmp byte[col1_easy],4
	je sound_col1
	jmp maz1
	
	inc_col2_1:
	inc byte[col2_easy]
	cmp byte[col2_easy],4
	je sound_col1
	jmp maz1
	
	inc_col3_1:
	inc byte[col3_easy]
	cmp byte[col3_easy],4
	je sound_col1
	jmp maz1
	
	inc_col4_1:
	inc byte[col4_easy]
	cmp byte[col4_easy],4
	je sound_col1
	jmp maz1
	
	
	
	sound_col1:
	call completion_sound
	call print_smiley_face
	call update_cursor_position10
	
	
	maz1:
	call checkrow_completion_4x4
	call update_cursor_position10
	;call checkcol_completion_4x4
	;call update_cursor_position10
	call checkwin_4x4_easy
    jmp handle_input

insert_number_3:
    call validate_input         ; Validate input
    cmp bl, 3                   ; Check if the solution matches 3
    jne invalid_number
    call clear_notes
    mov ah, 0x09
    mov al, '3'
    mov bh, 0x00
    mov bl, 0x4F
    mov cx, 1
    int 0x10
	call insertion_sound
	call display_score_increase
   call update_cursor_position10
   inc byte[correctinputs]
   cmp dl,34
	je inc_col1_2
	cmp dl,37
	je inc_col2_2
	cmp dl,40
	je inc_col3_2
	cmp dl,43
	je inc_col4_2
	
	inc_col1_2:
	inc byte[col1_easy]
	cmp byte[col1_easy],4
	je sound_col2
	jmp maz2
	
	inc_col2_2:
	inc byte[col2_easy]
	cmp byte[col2_easy],4
	je sound_col2
	jmp maz2
	
	inc_col3_2:
	inc byte[col3_easy]
	cmp byte[col3_easy],4
	je sound_col2
	jmp maz2
	
	inc_col4_2:
	inc byte[col4_easy]
	cmp byte[col4_easy],4
	je sound_col2
	jmp maz2
	
	sound_col2:
	call completion_sound
	call print_smiley_face
	call update_cursor_position10
	
	
	maz2:
   call checkrow_completion_4x4
	call update_cursor_position10
	 ;call checkcol_completion_4x4
	; call update_cursor_position10
   	call checkwin_4x4_easy
    jmp handle_input

insert_number_4:
    call validate_input         ; Validate input
    cmp bl, 4                   ; Check if the solution matches 4
    jne invalid_number
    call clear_notes
    mov ah, 0x09
    mov al, '4'
    mov bh, 0x00
    mov bl, 0x4F
    mov cx, 1
    int 0x10
	call insertion_sound
	call display_score_increase
	call update_cursor_position10
	inc byte[correctinputs]
	cmp dl,34
	je inc_col1_3
	cmp dl,37
	je inc_col2_3
	cmp dl,40
	je inc_col3_3
	cmp dl,43
	je inc_col4_3
	
	inc_col1_3:
	inc byte[col1_easy]
	cmp byte[col1_easy],4
	je sound_col3
	
	jmp maz3
	
	inc_col2_3:
	inc byte[col2_easy]
	cmp byte[col2_easy],4
	je sound_col3
	jmp maz3
	
	inc_col3_3:
	inc byte[col3_easy]
	cmp byte[col3_easy],4
	je sound_col3
	jmp maz3
	
	inc_col4_3:
	inc byte[col4_easy]
	cmp byte[col4_easy],4
	je sound_col3
	jmp maz3
	
	
		sound_col3:
	call completion_sound
	call print_smiley_face
	call update_cursor_position10
	
	
	maz3:
	call checkrow_completion_4x4
	call update_cursor_position10
	 ;call checkcol_completion_4x4
	; call update_cursor_position10	
		call checkwin_4x4_easy
    jmp handle_input

invalid_number:
    ; Highlight cell in red to indicate error
    mov ah, 0x09
    mov al, ' '                 ; Display a space to clear the cell
    mov bh, 0x00
    mov bl, 0x0E                ; Red background
    mov cx, 1
    int 0x10
	
	inc byte[mistake_count]
	call mistake_sound
	
	mov ax,0x05
	push ax
	mov ax,0x40
	push ax
	mov ax,[mistake_count]
	push ax
	call printnum1
	
	
	cmp byte[mistake_count],3
	je lostbymistake
	
	call score_mistake
	call update_cursor_position10
	
    jmp handle_input

lostbymistake: 
    mov byte[mistake_lost],1
	jmp endgame
	
	remove_number:
   
   call check_attribute
    cmp al, 0
    je handle_input
    mov ah, 0x09      
    mov al, ' '       
    mov bh, 0x00      
    mov bl, 0x0E       
    mov cx, 1          
    int 0x10          

    jmp handle_input
	
	checkwin_4x4_easy:
	cmp byte[correctinputs],8
	je game_won
	
	ret




draw_grid4_e:
    call clrscr
    call draw_grid4_EASY
    call cursor
    jmp main_loop

main_loop:
    call handle_input
    jmp main_loop
	
	;====================================row completion for 4====================================;
	checkrow_completion_4x4:

	push bx
	
    ; Save current row and column
    mov byte [fazooldh1], dh    ; Save current row
    mov byte [fazooldl1], dl    ; Save current column

    ; Start checking from column 21
    mov dl, 34                 ; Set starting column

    ; Set up video memory base
    mov ax, 0xB800              ; Base address of video memory
    mov es, ax                  ; Set ES to video memory segment

keep_checking_1:

	mov dh,[fazooldh1]
    xor bx, bx                  ; Clear BX
    mov al, dh                  ; Row number into AL (from DH directly)
    mov ah, 0                   ; Clear upper byte of AX
    mov si, ax                  ; SI = row number
    shl si, 6                   ; Multiply row by 64 (2^6 = 64)
    mov di, ax                  ; DI = row number
    shl di, 4                   ; Multiply row by 16 (2^4 = 16)
    add si, di                  ; SI = row * 80 (64 + 16)
    xor dh, dh                  ; Clear DH
    add si, dx                  ; Add column number to SI
    shl si, 1                   ; Multiply by 2 (character + attribute)

 
    ; Read character and attribute at position
    mov al, byte [es:si]        ; Read character from video memory
    cmp al, ' '                ; Is the character a space (' ')? If not, move to next column
    jne next_column_1

    ; If it's a space, check its attribute
    mov ah, byte [es:si+1]      ; Read attribute from video memory
    cmp ah, 0x0E                ; Is the attribute 0x0E?
    je not_completed_1           ; If space with 0x0E is found, row is not completed

next_column_1:
    add dl, 3                   ; Move to the next column (increment by 4)
    cmp dl, 43                ; Check if we've reached the last column (53)
    jle keep_checking_1          ; If not, continue checking

    ; If no spaces with 0x0E are found, row is completed
    jmp completed_1


not_completed_1:
     
    ; Restore original cursor position
    mov dh, [fazooldh1]
    mov dl, [fazooldl1]
	pop bx
    ret

completed_1:
    ; Restore original cursor position
	
	call completion_sound
		
; Set cursor position (row and column)
mov ah, 0x02        ; Function to set cursor position
mov bh, 0x00        ; Video page (0 for default)
mov dh, [fazooldh1]          ; Row (0-based, e.g., row 10)
mov dl, 46         ; Column (0-based, e.g., column 20)
int 0x10            ; Call BIOS interrupt

; Print character with attribute
mov ah, 0x09        ; Function to write character and attribute
mov al, 1           ; Black smiley face (☻)
mov bl, 0x1E       ; Attribute byte (e.g., bright yellow on blue)
mov bh, 0x00        ; Video page (0 for default)
mov cx, 1           ; Number of times to print the character
int 0x10            ; Call BIOS interrupt
	
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	
	mov ah, 0x13     ; service 13h - print string
    mov al, 1        ; subservice 01 - update cursor
    mov bh, 0        ; output on page 0
    mov bl, 01h      ; normal white on black attribute
    mov dh, [fazooldh1]   ; row 4, column 31 (centered title position)
	mov dl,46
    mov cx, 1     ; length of the string
    push cs
    pop es           ; set ES to code segment
    mov bp, space
    int 0x10         ; call BIOS video interrupt to print string
	
			
    mov dh, [fazooldh1]
    mov dl, [fazooldl1]
	pop bx
    ret
	
	;==========================================col completion========================================;
	;checkcol_completion_4x4:
checkcol_completion_4x4:

    ; push ax
    ; push bx
    ; push cx
    ; push dx

    ; ; Save current cursor position
    ; mov byte [fazooldh1], dh    ; Save current row
    ; mov byte [fazooldl1], dl    ; Save current column

    ; ; Start checking from the current column
    ; mov cx, 4                   ; Number of rows to check
    ; mov dh, 8                   ; Starting row

; check_next_row:
    ; ; Set up video memory base
    ; mov ax, 0xB800              ; Base address of video memory
    ; mov es, ax                  ; Set ES to video memory segment

    ; ; Compute memory offset for (row, column)
    ; xor bx, bx                  ; Clear BX
    ; mov al, dh                  ; Row number into AL
    ; mov ah, 0                   ; Clear upper byte of AX
    ; mov si, ax                  ; SI = row number
    ; shl si, 6                   ; Multiply row by 64 (2^6 = 64)
    ; mov di, ax                  ; DI = row number
    ; shl di, 4                   ; Multiply row by 16 (2^4 = 16)
    ; add si, di                  ; SI = row * 80
    ; add si, dx                  ; Add column number (DL) to SI
    ; shl si, 1                   ; Multiply by 2 (character + attribute)

    ; ; Read character at position
    ; mov al, byte [es:si]        ; Read character from video memory
    ; cmp al, ' '                 ; Is the cell empty (space)?
    ; jne not_completed_col        ; If empty, column is not completed

    ; ; Read attribute
    ; mov ah, byte [es:si+1]
    ; cmp ah, 0x0E                ; Is the cell still yellow?
    ; je not_completed_col        ; If yes, column is not completed

    ; ; Move to the next row
    ; add dh, 3                   ; Increment row by 3 (to move to the next grid row)
    ; loop check_next_row         ; Repeat for all rows

    ; ; If we checked all rows and found no empty or yellow spaces:
    ; jmp completed_col

; not_completed_col:
    ; ; Restore original cursor position
    ; mov dh, [fazooldh1]
    ; mov dl, [fazooldl1]
    ; pop dx
    ; pop cx
    ; pop bx
    ; pop ax
    ; ret

; completed_col:
    ; ; Restore original cursor position
	; call completion_sound
    ; mov dh, [fazooldh1]
    ; mov dl, [fazooldl1]
    ; pop dx
    ; pop cx
    ; pop bx
    ; pop ax
    ; ret
	ret
	

	;======================== 4x4 MED KA CODE ======================================
	
draw_grid4_MED:  
  
	call clrscr
    call print4x4_details
	
	mov ah, 0x13    
    mov al, 1        
    mov bh, 0        
    mov bl, 03h     
    mov dx, 0x0205  
    mov cx, 11    
    push cs
    pop es          
    mov bp, restart_game
    int 0x10    
	
	mov ah, 0x13     ; service 13h - print string
    mov al, 1        ; subservice 01 - update cursor
    mov bh, 0        ; output on page 0
    mov bl, 01h      ; normal white on black attribute
    mov dx, 0x0226   ; row 4, column 31 (centered title position)
    mov cx, 6     ; length of the string
    push cs
    pop es           ; set ES to code segment
    mov bp, medium_msg
    int 0x10         ; call BIOS video interrupt to print string
	
	mov ah, 0x13     ; service 13h - print string
    mov al, 1        ; subservice 01 - update cursor
    mov bh, 0        ; output on page 0
    mov bl, 0Fh      ; normal white on black attribute
    mov dx, 0x0324  ; row 4, column 31 (centered title position)
    mov cx, 11      ; length of the string
    push cs
    pop es           ; set ES to code segment
    mov bp, grid_horizontal
    int 0x10         ; call BIOS video interrupt to print string
	
	mov ah, 0x13     ; service 13h - print string
    mov al, 1        ; subservice 01 - update cursor
    mov bh, 0        ; output on page 0
    mov bl, 0Eh      ; normal white on black attribute
    mov dx, 0x0620   ; row 4, column 31 (centered title position)
    mov cx, 14      ; length of the string
    push cs
    pop es           ; set ES to code segment
    mov bp, row1_4x4_m
    int 0x10         ; call BIOS video interrupt to print string

    ; Print row2
    mov dx, 0x0720   ; row 9, column 31
    mov bp, row2_4x4_m
    int 0x10

    ; Print row3
    mov dx, 0x0820   ; row 10, column 31
    mov bp, row3_4x4_m
    int 0x10

    ; Print row4 (middle border)
    mov dx, 0x0920   ; row 11, column 31
    mov bp, row4_4x4_m
    int 0x10

    ; Print row5
    mov dx, 0x0A20   ; row 12, column 31
    mov bp, row5_4x4_m
    int 0x10

    ; Print row6
    mov dx, 0x0B20   ; row 13, column 31
    mov bp, row6_4x4_m
    int 0x10

    ; Print row7 (middle border)
    mov dx, 0x0C20   ; row 14, column 31
    mov bp, row7_4x4_m
    int 0x10

    ; Print row8
    mov dx, 0x0D20   ; row 15, column 31
    mov bp, row8_4x4_m
    int 0x10

    ; Print row9
    mov dx, 0x0E20   ; row 16, column 31
    mov bp, row9_4x4_m
    int 0x10

    ; Print row10 (bottom border)
    mov dx, 0x0F20   ; row 17, column 31
    mov bp, row10_4x4_m
    int 0x10
	
	mov dx, 0x1020   ; row 17, column 31
    mov bp, row11_4x4_m
    int 0x10

    mov dx, 0x1120   ; row 17, column 31
    mov bp, row12_4x4_m
    int 0x10

    mov dx, 0x1220   ; row 17, column 31
    mov bp, row13_4x4_m
    int 0x10
	
	ret
	
cursor1:

    mov dh, 8         
    mov dl, 34       
    mov bh, 0         
    mov ah, 2         
    int 0x10
	
	ret
handle_input1:
    mov ah, 0
    int 16h
    cmp al, 'n'                ; Toggle note mode
    je toggle_note_mode

    mov al, [note_mode]
    cmp al, 1
    je handle_notes
	
	cmp ah, 0x13
	je restart
	cmp ah,0x10
	je endgame
	cmp ah,0x12
	je remove_number
	

    cmp ah, 0x02               ; '1'
    je insert_number1_1
    cmp ah, 0x03               ; '2'
    je insert_number1_2
    cmp ah, 0x04               ; '3'
    je insert_number1_3
    cmp ah, 0x05               ; '4'
    je insert_number1_4
    cmp ah, 0x48               ; Up arrow
    je move1_up
    cmp ah, 0x4B               ; Left arrow
    je move1_left
    cmp ah, 0x4D               ; Right arrow
    je move1_right
    cmp ah, 0x50               ; Down arrow
    je move1_down
	
	
    jmp handle_input1

; Handle Notes
handle_notes1:
    cmp ah, 0x02               ; '1'
    je insert_note1_1
    cmp ah, 0x03               ; '2'
    je insert_note1_2
    cmp ah, 0x04               ; '3'
    je insert_note1_3
    cmp ah, 0x05               ; '4'
    je insert_note1_4
    cmp ah, 0x48               ; Up arrow
    je note_move1_up
    cmp ah, 0x4B               ; Left arrow
    je note_move1_left
    cmp ah, 0x4D               ; Right arrow
    je note_move1_right
    cmp ah, 0x50               ; Down arrow
    je note_move1_down
    jmp handle_input1
	
	
move1_up:
    cmp dh, 8
    je handle_input1
    sub dh, 3
    call cursor_update
    jmp handle_input1

move1_down:
    cmp dh, 17
    je handle_input1
    add dh, 3
    call cursor_update
    jmp handle_input1

move1_left:
    cmp dl, 34
    je handle_input1
    sub dl, 3
    call cursor_update
    jmp handle_input1

move1_right:
    cmp dl, 43
    je handle_input1
    add dl, 3
    call cursor_update
    jmp handle_input1

; Note-Specific Movements
note_move1_up:
    cmp dh, 7                 ; Check if at the topmost row of the grid
    jbe handle_input1         ; If yes, don't move further up
    sub dh, 3                 ; Move to the upper corner of the previous 2x2 box
    call cursor_update
    jmp handle_input1

note_move1_down:
    cmp dh, 16                ; Check if at the bottommost row of the grid
    jae handle_input1          ; If yes, don't move further down
    add dh, 3                 ; Move to the upper corner of the next 2x2 box
    call cursor_update
    jmp handle_input1

note_move1_left:
    cmp dl, 33                ; Check if at the leftmost column of the grid
    jbe handle_input1          ; If yes, don't move further left
    sub dl, 3                 ; Move to the left corner of the previous 2x2 box
    call cursor_update
    jmp handle_input1

note_move1_right:
    cmp dl, 40                ; Check if at the rightmost column of the grid
    jae handle_input1          ; If yes, don't move further right
    add dl, 3                 ; Move to the left corner of the next 2x2 box
    call cursor_update
    jmp handle_input1

; Insert Notes
insert_note1_1:
    call check_number_below_right ; Check for number with 0x4F attribute
    cmp al, 1                     ; If a number is found, skip inserting the note
    jne handle_input1

    mov ah, 0x09
    mov al, '1'
    mov bh, 0x00
    mov bl, 0x0A
    mov cx, 1
    int 0x10
    jmp handle_input1

insert_note1_2:
    call check_number_below_right
    cmp al, 1
    jne handle_input1

    mov ah, 0x09
    mov al, '2'
    mov bh, 0x00
    mov bl, 0x0A
    mov cx, 1
    int 0x10
    jmp handle_input1

insert_note1_3:
    call check_number_below_right
    cmp al, 1
    jne handle_input1

    mov ah, 0x09
    mov al, '3'
    mov bh, 0x00
    mov bl, 0x0A
    mov cx, 1
    int 0x10
    jmp handle_input1

insert_note1_4:
    call check_number_below_right
    cmp al, 1
    jne handle_input1

    mov ah, 0x09
    mov al, '4'
    mov bh, 0x00
    mov bl, 0x0A
    mov cx, 1
    int 0x10
    jmp handle_input1	
	
; Function to validate user input against the solution grid
validate_input_med:
    call compute_grid_index     ; Compute the index in AX
    mov al, [solution_grid_med + si+bx]; Load the solution value
    cmp al, 0                   ; Check if the cell is editable (0 means not editable)
    je invalid_input_med
    mov bl, al                  ; Store the solution value in BL
    ret                         ; Return with BL containing the solution value

invalid_input_med:
    xor bl, bl                  ; BL = 0 indicates invalid input
    ret

; Insert number 1 with validation
insert_number1_1:

    call validate_input_med         ; Validate input
    cmp bl, 1                   ; Check if the solution matches 1
    jne invalid_number1         ; If not, handle invalid input
    call clear_notes            ; Clear notes in the current 2x2 box
    mov ah, 0x09
    mov al, '1'
    mov bh, 0x00
    mov bl, 0x4F                ; Attribute for correct cell
    mov cx, 1
    int 0x10                    ; Display the number
	call insertion_sound
	call display_score_increase
	call update_cursor_position10
	inc byte[correctinputs]
		call checkcol_comp_med
	call checkrow_completion_4x4
	call update_cursor_position10
	call checkwin_4x4_med
    jmp handle_input1

insert_number1_2:
    call validate_input_med         ; Validate input
    cmp bl, 2                   ; Check if the solution matches 2
    jne invalid_number1          ; If not, handle invalid input
    call clear_notes
    mov ah, 0x09
    mov al, '2'
    mov bh, 0x00
    mov bl, 0x4F
    mov cx, 1
    int 0x10
	call insertion_sound
	call display_score_increase
	call update_cursor_position10
	inc byte[correctinputs]
	call checkcol_comp_med
	call checkrow_completion_4x4
	call update_cursor_position10
	call checkwin_4x4_med
	
    jmp handle_input1

insert_number1_3:
    call validate_input_med         ; Validate input
    cmp bl, 3                   ; Check if the solution matches 3
    jne invalid_number1
    call clear_notes
    mov ah, 0x09
    mov al, '3'
    mov bh, 0x00
    mov bl, 0x4F
    mov cx, 1
    int 0x10
	call insertion_sound
	call display_score_increase
	call update_cursor_position10
	inc byte[correctinputs]
    call checkcol_comp_med
	call checkrow_completion_4x4
	call update_cursor_position10
	call checkwin_4x4_med
    jmp handle_input1

insert_number1_4:
    call validate_input_med         ; Validate input
    cmp bl, 4                   ; Check if the solution matches 4
    jne invalid_number1
    call clear_notes
    mov ah, 0x09
    mov al, '4'
    mov bh, 0x00
    mov bl, 0x4F
    mov cx, 1
    int 0x10
	call insertion_sound
	call display_score_increase
	call update_cursor_position10
	inc byte[correctinputs]
	call checkcol_comp_med
	call checkrow_completion_4x4
	call update_cursor_position10
	call checkwin_4x4_med
    jmp handle_input1
	
	checkcol_comp_med:
	
	cmp dl,34
	je inc_col1_med
	cmp dl,37
	je inc_col2_med
	cmp dl,40
	je inc_col3_med
	cmp dl,43
	je inc_col4_med
	
	inc_col1_med:
	inc byte[col1_med]
	cmp byte[col1_med],4
	je sound_col_med
	jmp no_complete_med
	
	inc_col2_med:
	inc byte[col2_med]
	cmp byte[col2_med],4
	je sound_col_med
	jmp no_complete_med
	
	inc_col3_med:
	inc byte[col3_med]
	cmp byte[col3_med],4
	je sound_col_med
	jmp no_complete_med
	
	inc_col4_med:
	inc byte[col4_med]
	cmp byte[col4_med],4
	je sound_col_med
jmp no_complete_med

sound_col_med:
call print_smiley_face
call completion_sound

no_complete_med:
ret
	invalid_number1:
    ; Highlight cell in red to indicate error
    mov ah, 0x09
    mov al, ' '                 ; Display a space to clear the cell
    mov bh, 0x00
    mov bl, 0x0E                ; Red background
    mov cx, 1
    int 0x10
	
	inc byte[mistake_count]
	call mistake_sound
	
	mov ax,0x05
	push ax
	mov ax,0x40
	push ax
	mov ax,[mistake_count]
	push ax
	call printnum1
	
	cmp byte[mistake_count],3
	je lostbymistakemed
	
	call score_mistake
	call update_cursor_position10
    jmp handle_input1

lostbymistakemed: 

    mov byte[mistake_lost],1
	jmp endgame
    
checkwin_4x4_med:

	cmp byte[correctinputs],10
	je game_won
	
	ret
	
draw_grid4_m:
    call clrscr
    call draw_grid4_MED
    call cursor
    jmp main_loopM

main_loopM:
    call handle_input1
    jmp main_loopM
    
	;======================== 4x4 HARD KA CODE ======================================

draw_grid4_HARD: 
   
	call clrscr
    call print4x4_details
   
	mov ah, 0x13     ; service 13h - print string
    mov al, 1        ; subservice 01 - update cursor
    mov bh, 0        ; output on page 0
    mov bl, 04h      ; normal white on black attribute
    mov dx, 0x0227   ; row 4, column 31 (centered title position)
    mov cx, 4        ; length of the string
    push cs
    pop es           ; set ES to code segment
    mov bp, hard_msg
    int 0x10         ; call BIOS video interrupt to print string
	
	mov ah, 0x13     ; service 13h - print string
    mov al, 1        ; subservice 01 - update cursor
    mov bh, 0        ; output on page 0
    mov bl, 0Fh      ; normal white on black attribute
    mov dx, 0x0324  ; row 4, column 31 (centered title position)
    mov cx, 11      ; length of the string
    push cs
    pop es           ; set ES to code segment
    mov bp, grid_horizontal
    int 0x10         ; call BIOS video interrupt to print string
	
	mov ah, 0x13    
    mov al, 1        
    mov bh, 0        
    mov bl, 03h     
    mov dx, 0x0205  
    mov cx, 11    
    push cs
    pop es          
    mov bp, restart_game
    int 0x10    
	
	mov ah, 0x13     ; service 13h - print string
    mov al, 1        ; subservice 01 - update cursor
    mov bh, 0        ; output on page 0
    mov bl, 0Eh      ; normal white on black attribute
    mov dx, 0x0620   ; row 4, column 31 (centered title position)
    mov cx, 14       ; length of the string
    push cs
    pop es          
    mov bp, row1_4x4_h
    int 0x10         ; call BIOS video interrupt to print string

    ; Print row2
    mov dx, 0x0720   ; row 9, column 20
    mov bp, row2_4x4_h
    int 0x10

    ; Print row3
    mov dx, 0x0820   ; row 10, column 20
    mov bp, row3_4x4_h
    int 0x10

    ; Print row4 (middle border)
    mov dx, 0x0920   ; row 11, column 20
    mov bp, row4_4x4_h
    int 0x10

    ; Print row5
    mov dx, 0x0A20   ; row 12, column 20
    mov bp, row5_4x4_h
    int 0x10

    ; Print row6
    mov dx, 0x0B20   ; row 13, column 20
    mov bp, row6_4x4_h
    int 0x10

    ; Print row7 
    mov dx, 0x0C20   ; row 14, column 20
    mov bp, row7_4x4_h
    int 0x10

    ; Print row8
    mov dx, 0x0D20   ; row 15, column 20
    mov bp, row8_4x4_h
    int 0x10

    ; Print row9
    mov dx, 0x0E20   ; row 16, column 20
    mov bp, row9_4x4_h
    int 0x10

    ; Print row10 (bottom border)
    mov dx, 0x0F20   ; row 17, column 20
    mov bp, row10_4x4_h
    int 0x10
	
	mov dx, 0x1020   ; row 17, column 20
    mov bp, row11_4x4_h
    int 0x10

    mov dx, 0x1120   ; row 17, column 20
    mov bp, row12_4x4_h
    int 0x10

    mov dx, 0x1220   ; row 17, column 20
    mov bp, row13_4x4_h
    int 0x10
	
	ret
	
cursor2:

    mov dh, 8         
    mov dl, 34       
    mov bh, 0         
    mov ah, 2         
    int 0x10

handle_input2:
    mov ah, 0
    int 16h
    cmp al, 'n'                ; Toggle note mode
    je toggle_note_mode

    mov al, [note_mode]
    cmp al, 1
    je handle_notes
	
	cmp ah, 0x13
	je restart
	cmp ah,0x10
	je endgame
	cmp ah,0x12
	je remove_number
	

    cmp ah, 0x02               ; '1'
    je insert_number2_1
    cmp ah, 0x03               ; '2'
    je insert_number2_2
    cmp ah, 0x04               ; '3'
    je insert_number2_3
    cmp ah, 0x05               ; '4'
    je insert_number2_4
    cmp ah, 0x48               ; Up arrow
    je move2_up
    cmp ah, 0x4B               ; Left arrow
    je move2_left
    cmp ah, 0x4D               ; Right arrow
    je move2_right
    cmp ah, 0x50               ; Down arrow
    je move2_down
	
	
    jmp handle_input2

; Handle Notes
handle_notes2:
    cmp ah, 0x02               ; '1'
    je insert_note2_1
    cmp ah, 0x03               ; '2'
    je insert_note2_2
    cmp ah, 0x04               ; '3'
    je insert_note2_3
    cmp ah, 0x05               ; '4'
    je insert_note2_4
    cmp ah, 0x48               ; Up arrow
    je note_move2_up
    cmp ah, 0x4B               ; Left arrow
    je note_move2_left
    cmp ah, 0x4D               ; Right arrow
    je note_move2_right
    cmp ah, 0x50               ; Down arrow
    je note_move2_down
    jmp handle_input2
	
	
move2_up:
    cmp dh, 8
    je handle_input2
    sub dh, 3
    call cursor_update
    jmp handle_input2

move2_down:
    cmp dh, 17
    je handle_input2
    add dh, 3
    call cursor_update
    jmp handle_input2

move2_left:
    cmp dl, 34
    je handle_input2
    sub dl, 3
    call cursor_update
    jmp handle_input2

move2_right:
    cmp dl, 43
    je handle_input2
    add dl, 3
    call cursor_update
    jmp handle_input2

; Note-Specific Movements
note_move2_up:
    cmp dh, 7                 ; Check if at the topmost row of the grid
    jbe handle_input2         ; If yes, don't move further up
    sub dh, 3                 ; Move to the upper corner of the previous 2x2 box
    call cursor_update
    jmp handle_input2

note_move2_down:
    cmp dh, 16                ; Check if at the bottommost row of the grid
    jae handle_input2          ; If yes, don't move further down
    add dh, 3                 ; Move to the upper corner of the next 2x2 box
    call cursor_update
    jmp handle_input2

note_move2_left:
    cmp dl, 33                ; Check if at the leftmost column of the grid
    jbe handle_input2          ; If yes, don't move further left
    sub dl, 3                 ; Move to the left corner of the previous 2x2 box
    call cursor_update
    jmp handle_input2

note_move2_right:
    cmp dl, 40                ; Check if at the rightmost column of the grid
    jae handle_input2          ; If yes, don't move further right
    add dl, 3                 ; Move to the left corner of the next 2x2 box
    call cursor_update
    jmp handle_input2

; Insert Notes
insert_note2_1:
    call check_number_below_right ; Check for number with 0x4F attribute
    cmp al, 1                     ; If a number is found, skip inserting the note
    jne handle_input2

    mov ah, 0x09
    mov al, '1'
    mov bh, 0x00
    mov bl, 0x0A
    mov cx, 1
    int 0x10
    jmp handle_input2

insert_note2_2:
    call check_number_below_right
    cmp al, 1
    jne handle_input2

    mov ah, 0x09
    mov al, '2'
    mov bh, 0x00
    mov bl, 0x0A
    mov cx, 1
    int 0x10
    jmp handle_input2

insert_note2_3:
    call check_number_below_right
    cmp al, 1
    jne handle_input2

    mov ah, 0x09
    mov al, '3'
    mov bh, 0x00
    mov bl, 0x0A
    mov cx, 1
    int 0x10
    jmp handle_input2

insert_note2_4:
    call check_number_below_right
    cmp al, 1
    jne handle_input2

    mov ah, 0x09
    mov al, '4'
    mov bh, 0x00
    mov bl, 0x0A
    mov cx, 1
    int 0x10
    jmp handle_input2
	
;te user input against the solution grid
validate_input_hard:
    call compute_grid_index     ; Compute the index in AX
   ; mov si, ax                  ; Store index in SI
    mov al, [solution_grid_hard + si+bx]; Load the solution value
    cmp al, 0                   ; Check if the cell is editable (0 means not editable)
    je invalid_input_hard
    mov bl, al                  ; Store the solution value in BL
    ret                         ; Return with BL containing the solution value

invalid_input_hard:
    xor bl, bl                  ; BL = 0 indicates invalid input
    ret

; Insert number 1 with validation
insert_number2_1:
    call validate_input_hard       ; Validate input
    cmp bl, 1                   ; Check if the solution matches 1
    jne invalid_number2         ; If not, handle invalid input
    call clear_notes            ; Clear notes in the current 2x2 box
    mov ah, 0x09
    mov al, '1'
    mov bh, 0x00
    mov bl, 0x4F                ; Attribute for correct cell
    mov cx, 1
    int 0x10                    ; Display the number
	call insertion_sound
	call display_score_increase
	call update_cursor_position10
	inc byte[correctinputs]
	call checkrow_completion_4x4
	call update_cursor_position10
    call checkcol_comp_hard
	call update_cursor_position10
	call checkwin_4x4_hard
    jmp handle_input2

insert_number2_2:
    call validate_input_hard        ; Validate input
    cmp bl, 2                   ; Check if the solution matches 2
    jne invalid_number2         ; If not, handle invalid input
    call clear_notes
    mov ah, 0x09
    mov al, '2'
    mov bh, 0x00
    mov bl, 0x4F
    mov cx, 1
    int 0x10
	call insertion_sound
	call display_score_increase
	call update_cursor_position10
	inc byte[correctinputs]
	call checkrow_completion_4x4
	call update_cursor_position10
		 call checkcol_comp_hard
		 call update_cursor_position10
	call checkwin_4x4_hard
    jmp handle_input2

insert_number2_3:
    call validate_input_hard        ; Validate input
    cmp bl, 3                   ; Check if the solution matches 3
    jne invalid_number2
    call clear_notes
    mov ah, 0x09
    mov al, '3'
    mov bh, 0x00
    mov bl, 0x4F
    mov cx, 1
    int 0x10
	call insertion_sound
	call display_score_increase
	call update_cursor_position10
	inc byte[correctinputs]
	call checkrow_completion_4x4
	call update_cursor_position10
		 call checkcol_comp_hard
		 call update_cursor_position10
	call checkwin_4x4_hard
    jmp handle_input2

insert_number2_4:
    call validate_input_hard        ; Validate input
    cmp bl, 4                   ; Check if the solution matches 4
    jne invalid_number2
    call clear_notes
    mov ah, 0x09
    mov al, '4'
    mov bh, 0x00
    mov bl, 0x4F
    mov cx, 1
    int 0x10
	call insertion_sound
	call display_score_increase
	call update_cursor_position10
	inc byte[correctinputs]
	call checkrow_completion_4x4
	call update_cursor_position10
	 call checkcol_comp_hard
	 call update_cursor_position10
	call checkwin_4x4_hard
    jmp handle_input2
	
	checkcol_comp_hard:
	
	cmp dl,34
	je inc_col1_hard
	cmp dl,37
	je inc_col2_hard
	cmp dl,40
	je inc_col3_hard
	cmp dl,43
	je inc_col4_hard
	
	inc_col1_hard:
	inc byte[col1_hard]
	cmp byte[col1_hard],4
	je sound_col_hard
	jmp no_complete_hard
	
	inc_col2_hard:
	inc byte[col2_hard]
	cmp byte[col2_hard],4
	je sound_col_hard
	jmp no_complete_hard
	
	inc_col3_hard:
	inc byte[col3_hard]
	cmp byte[col3_hard],4
	je sound_col_hard
	jmp no_complete_hard
	
	inc_col4_hard:
	inc byte[col4_hard]
	cmp byte[col4_hard],4
	je sound_col_hard
jmp no_complete_hard

sound_col_hard:
call completion_sound
call print_smiley_face


no_complete_hard:
ret

	print_smiley_face:
	pusha 
	push es
	
	
; Set cursor position (row and column)
mov ah, 0x02        ; Function to set cursor position
mov bh, 0x00        ; Video page (0 for default)
mov dh, 17          ; Row (0-based, e.g., row 10)
mov dl, 30         ; Column (0-based, e.g., column 20)
int 0x10            ; Call BIOS interrupt

; Print character with attribute
mov ah, 0x09        ; Function to write character and attribute
mov al, 1           ; Black smiley face (☻)
mov bl, 0x0B       ; Attribute byte (e.g., bright yellow on blue)
mov bh, 0x00        ; Video page (0 for default)
mov cx, 1           ; Number of times to print the character
int 0x10            ; Call BIOS interrupt


	
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	
	mov ah, 0x13     ; service 13h - print string
    mov al, 1        ; subservice 01 - update cursor
    mov bh, 0        ; output on page 0
    mov bl, 01h      ; normal white on black attribute
    mov dx, 0x111E   ; row 4, column 31 (centered title position)
    mov cx, 1     ; length of the string
    push cs
    pop es           ; set ES to code segment
    mov bp, space
    int 0x10         ; call BIOS video interrupt to print string
	
	
	
	pop es
	popa
	ret
	
	
	invalid_number2:
    ; Highlight cell in red to indicate error
    mov ah, 0x09
    mov al, ' '                 ; Display a space to clear the cell
    mov bh, 0x00
    mov bl, 0x0E                ; Red background
    mov cx, 1
    int 0x10
	
	inc byte[mistake_count]
	
	mov ax,0x05
	push ax
	mov ax,0x40
	push ax
	mov ax,[mistake_count]
	push ax
	call printnum1
	
	call mistake_sound
	
	cmp byte[mistake_count],3
	je lostbymistakehard
	
	call score_mistake
	call update_cursor_position10
	
	
    jmp handle_input2

lostbymistakehard: 
    mov byte[mistake_lost],1
	jmp endgame
	
	checkwin_4x4_hard:
	cmp byte[correctinputs],12
	je game_won
	
	ret
	
	
draw_grid4_h:
    call clrscr
    call draw_grid4_HARD
    call cursor
    jmp main_loopH

main_loopH:
    call handle_input2
    jmp main_loopH



	;======================== MENU KI PRINTING ======================================

print_colored_sudoko:

	mov bx, 0xB800  ; Base address of video memory
	mov es, bx    ; Set ES to point to video memory segment
	mov di, [row_col_offset] ; Set DI to the starting offset in video memory for the given row and column

print_loop:

	lodsb  ; Load the byte from string into AL
	or al, al   ; Check if the byte is zero (null terminator)
	jz done_printing ; If zero, jump to done_printing
	
	; Write the character to video memory
	mov es:[di], al  ; Write the character at current position
	inc di  ; Move to the attribute byte (next position)
	
	; Set the color attribute (yellow on black background)
	mov byte [es:di], 0x8E  ; (use 0x0E for only yellow without blink)
	inc di 
	
	jmp print_loop   ; Repeat for the next character

;------------------------------------------------------------	

done_printing:

	ret
;------------------------------------------------------------	
; This calculates the offset in video memory for TITLE
row_col_offset:

	dw (80 * 6 + 26) * 2 ; offset (row 6, column 26, two bytes per character cell - Formula [(80 * ypos + xpos) * 2])
;------------------------------------------------------------	

print_colored_menu:

	mov bx, 0xB800     
	mov es, bx         
	mov di, [row_col_offset_menu] 

print_loop1:

	lodsb          
	or al, al        
	jz done_printing 
	
	mov es:[di], al   
	inc di            
	
	; Set the color attribute (Red on black background)
	mov byte [es:di], 0x03 
	inc di 
	
	call sleep
	jmp print_loop1  

;------------------------------------------------------------	

row_col_offset_menu:

	dw (80 * 3 + 32) * 2 ; offset (row 3, column 32 - Formula [(80 * ypos + xpos) * 2])
;------------------------------------------------------------	

print_colored_4x4:

	mov bx, 0xB800     
	mov es, bx         
	mov di, [row_col_offset_4x4] ;

print_loop2:

	lodsb          
	or al, al        
	jz done_printing 
	
	mov es:[di], al   
	inc di            
	
	; Set the color attribute (White on black background)
	mov byte [es:di], 0x0F  ; 
	inc di 
	
	call sleep
	jmp print_loop2  

;------------------------------------------------------------	
row_col_offset_4x4:
	
	dw (80 * 11 + 23) * 2 ; offset (row 11, column 23 - Formula [(80 * ypos + xpos) * 2])
;------------------------------------------------------------	

print_colored_9x9:

	mov bx, 0xB800   
	mov es, bx          
	mov di, [row_col_offset_9x9] 

print_loop3:

	lodsb          
	or al, al        
	jz done_printing 
	
	mov es:[di], al  
	inc di            
	
	; Set the color attribute (White on black background)
	mov byte [es:di], 0x0F  ; 
	inc di 
	
	call sleep
	jmp print_loop3   

;------------------------------------------------------------	
row_col_offset_9x9:
	
	dw (80 * 11 + 44) * 2 ; offset (row 11, column 44 - Formula [(80 * ypos + xpos) * 2])
	
;------------------------------------------------------------	
; this is done specifically for the EASY to COLOR it in GREEN
print_colored_easy:

	mov bx, 0xB800     
	mov es, bx     
	mov di, [row_col_offset_easy] 

print_loop4:

	lodsb            
	or al, al       
	jz done_printing 
	
	mov es:[di], al   
	inc di            
	
	; Set the color attribute (Green on black background)
	mov byte [es:di], 0x0A  
	inc di 
	
	call sleep
	jmp print_loop4  

;------------------------------------------------------------	
	row_col_offset_easy:
	dw (80 * 15 + 22) * 2 ; offset (row 15, column 22 - Formula [(80 * ypos + xpos) * 2])
;------------------------------------------------------------	
; this is done specifically for the MEDIUM to COLOR it in BLUE
print_colored_med:

	mov bx, 0xB800     
	mov es, bx          
	mov di, [row_col_offset_med] 

print_loop5:

	lodsb          
	or al, al       
	jz done_printing
	
	mov es:[di], al   
	inc di           
	
	; Set the color attribute (Blue on black background)
	mov byte [es:di], 0x01
	inc di 
	
	call sleep
	jmp print_loop5   ; Repeat for the next character

;------------------------------------------------------------	
row_col_offset_med:
	
	dw (80 * 15 + 35) * 2 ; offset (row 15, column 35 - Formula [(80 * ypos + xpos) * 2])
;------------------------------------------------------------	
; this is done specifically for the HARD to COLOR it in RED
print_colored_hard:

	mov bx, 0xB800     
	mov es, bx          
	mov di, [row_col_offset_hard] 

print_loop6:

	lodsb          
	or al, al       
	jz done_printing
	
	mov es:[di], al   
	inc di           
	
	; Set the color attribute (Red on black background)
	mov byte [es:di], 0x04
	inc di 
	
	call sleep
	jmp print_loop6  

;------------------------------------------------------------	
row_col_offset_hard:

	dw (80 * 15 + 49) * 2 ; offset (row 15, column 49 - Formula [(80 * ypos + xpos) * 2])
;------------------------------------------------------------	
; this is done specifically for the Difficulty to COLOR it in White
print_colored_diff:

	mov bx, 0xB800     
	mov es, bx          
	mov di, [row_col_offset_diff] 

print_loop7:

	lodsb          
	or al, al       
	jz done_printing
	
	mov es:[di], al   
	inc di           
	
	; Set the color attribute (White on black background)
	mov byte [es:di], 0x0F
	inc di 
	
	call sleep
	jmp print_loop7  

;------------------------------------------------------------	
row_col_offset_diff:

	dw (80 * 15 + 5) * 2 ; offset (row 15, column 5 - Formula [(80 * ypos + xpos) * 2])
;------------------------------------------------------------	
; this is done specifically for the Grids Opts to COLOR it in White
print_colored_grid:

	mov bx, 0xB800     
	mov es, bx          
	mov di, [row_col_offset_grid] 

print_loop8:

	lodsb          
	or al, al       
	jz done_printing
	
	mov es:[di], al   
	inc di           
	
	; Set the color attribute (White on black background)
	mov byte [es:di], 0x0F
	inc di 
	
	call sleep
	jmp print_loop8   

;------------------------------------------------------------	
row_col_offset_grid:

	dw (80 * 11 + 5) * 2 ; offset (row 11, column 5 - Formula [(80 * ypos + xpos) * 2])
	
; this is used for all other printing as NO COLOR is used abhi tak atleast

print_string:

	lodsb  
	or al, al        
	jz done_printing 
	mov ah, 0Eh     
	int 10h          
	call sleep		 
	jmp print_string 

	;======================== SLEEP KA CODE ======================================
	
sleep:

	push cx
	mov cx, 0xffff

delay: 

	loop delay
	pop cx
	ret
	
	get_input:
	
	mov ah, 00h   ; bios keyboard interrupt
	int 16h  ; wait for key press
	ret
		
	;======================== 9x9 EASY KA CODE ======================================

compute_grid_index_9e:
	cmp byte[page_num1] , 1
	je compute_grid_index_9e_page2
	
	cmp dh, 2
	je solution_row1_9e
	cmp dh,6
	je solution_row2_9e
	cmp dh,10
	je solution_row3_9e
	cmp dh,14
	je solution_row4_9e
	cmp dh,18
	je solution_row5_9e
	cmp dh,22
	je solution_row6_9e
	cmp dh,26
	je solution_row7_9e
	cmp dh,30
	je solution_row8_9e
	cmp dh,34
	je solution_row9_9e

compute_grid_index_9e_page2:
	
	cmp dh, 1
	je solution_row7_9e
	cmp dh, 5
	je solution_row8_9e
	cmp dh, 9
	je solution_row9_9e
	
solution_row1_9e:

	mov si,0
	jmp move_forward_9e       ;calculate the column

solution_row2_9e:

	mov si,9
	jmp move_forward_9e       ;calculate the column

solution_row3_9e:

	mov si,18
	jmp move_forward_9e       ;calculate the column
	
solution_row4_9e:

	mov si,27
	jmp move_forward_9e       ;calculate the column

solution_row5_9e:

	mov si,36
	jmp move_forward_9e       ;calculate the column

solution_row6_9e:

	mov si,45
	jmp move_forward_9e       ;calculate the column

solution_row7_9e:

	mov si,54
	jmp move_forward_9e       ;calculate the column
	
solution_row8_9e:

	mov si,63
	jmp move_forward_9e       ;calculate the column

solution_row9_9e:

	mov si,72
	jmp move_forward_9e

move_forward_9e:       

	cmp dl,21
	je solution_col1_9e
	cmp dl,25
	je solution_col2_9e
	cmp dl,29
	je solution_col3_9e
	cmp dl,33
	je solution_col4_9e
	cmp dl,37
	je solution_col5_9e
	cmp dl,41
	je solution_col6_9e
	cmp dl,45
	je solution_col7_9e
	cmp dl,49
	je solution_col8_9e
	cmp dl,53
	je solution_col9_9e
	
solution_col1_9e:

	mov bx,0
	jmp donewithit_9e
	
solution_col2_9e:

	mov bx,1
	jmp donewithit_9e
	
solution_col3_9e:

	mov bx,2
	jmp donewithit_9e
	
solution_col4_9e:

	mov bx,3
	jmp donewithit_9e
	
solution_col5_9e:

	mov bx,4
	jmp donewithit_9e
	
solution_col6_9e:

	mov bx,5
	jmp donewithit_9e
	
solution_col7_9e:

	mov bx,6
	jmp donewithit_9e
	
solution_col8_9e:

	mov bx,7
	jmp donewithit_9e

solution_col9_9e:

	mov bx,8
	
donewithit_9e:

	ret

validate_input_9e:

    call compute_grid_index_9e     ; Compute the index in AX
    mov al, [solution_grid_9x9_easy + si + bx]  ; Load the solution value
    cmp al, 0                   ; Check if the cell is editable (0 means not editable)
    je invalid_input
    mov bl, al                  ; Store the solution value in BL
    ret                         ; Return with BL containing the solution value

cursor3: ; changed
    mov dh, 2
    mov dl, 21
    mov bh, 0
    mov ah, 2
    int 0x10
    ret
	
update_cursor_position10:

    mov ah, 2              ; Function to set cursor position
    int 0x10               ; BIOS interrupt to set cursor position
    ret

toggle_note_mode_1:

    mov al, [note_mode1]
    cmp  al, 1      
    jne enable_note_mode_1
    call disable_note_mode_1
    ret
	
enable_note_mode_1:

	cmp byte[page_num1], 1
	je enable_note_mode_2_1
    mov byte [note_mode1], 1   ; Enable note mode
    xor al, al                ; Reset AL to clear any leftover inputs
    xor ah, ah                ; Reset AH
    mov dh, 1                 ; Move cursor to the top-left corner
    mov dl, 20
    call update_cursor_position10
    ret
	
enable_note_mode_2_1:
    mov byte [note_mode1], 1   ; Enable note mode
    xor al, al                ; Reset AL to clear any leftover inputs
    xor ah, ah                ; Reset AH
    mov dh, 0                 ; Move cursor to the top-left corner
    mov dl, 20
    call update_cursor_position10
    ret

disable_note_mode_1:

	cmp byte[page_num1], 1
	je disable_note_mode_2_1
	
    mov byte [note_mode1], 0   ; Disable note mode
    xor al, al                ; Reset AL to prevent leftover input
    xor ah, ah                ; Reset AH
    mov dh, 2                 ; Move cursor to the default position
    mov dl, 21
    call update_cursor_position10
    ret

disable_note_mode_2_1:
    mov byte [note_mode1], 0   ; Disable note mode
    xor al, al                ; Reset AL to prevent leftover input
    xor ah, ah                ; Reset AH
    mov dh, 1                 ; Move cursor to the default position
    mov dl, 21
    call update_cursor_position10
    ret

handle_input9:

    mov ah, 0
    int 16h
    cmp al, 'n'                ; Toggle note mode
    je toggle_note_mode_1

    mov al, [note_mode1]
    cmp al, 1
    je handle_notes_1

    cmp ah, 0x48      ; Up
    je move_up9
    cmp ah, 0x4B      ; Left
    je move_left9
    cmp ah, 0x4D      ; Right
    je move_right9
    cmp ah, 0x50      ; Down
    je move_down9
	cmp ah, 0x13
	je restart
	cmp ah,0x10
	je endgame
	cmp ah,0x12
	je remove_number

    cmp ah, 0x02      ;'1'
    je insert_number9_1_9e
    cmp ah, 0x03      ; '2'
    je insert_number9_2_9e
    cmp ah, 0x04      ; '3'
    je insert_number9_3_9e
    cmp ah, 0x05      ; '4'
    je insert_number9_4_9e
	cmp ah, 0x06      ;'5'
    je insert_number9_5_9e
    cmp ah, 0x07      ; '6'
    je insert_number9_6_9e
    cmp ah, 0x08      ; '7'
    je insert_number9_7_9e
    cmp ah, 0x09     ; '8'
    je insert_number9_8_9e
	cmp ah, 0x0A     ; '9'
    je insert_number9_9_9e

	ret

handle_notes_1:
    cmp ah, 0x02               ; '1'
    je insert_note_1_9e
    cmp ah, 0x03               ; '2'
    je insert_note_2_9e
    cmp ah, 0x04               ; '3'
    je insert_note_3_9e
    cmp ah, 0x05               ; '4'
    je insert_note_4_9e
	cmp ah, 0x06               ; '5'
    je insert_note_5_9e
    cmp ah, 0x07               ; '6'
    je insert_note_6_9e
    cmp ah, 0x08               ; '7'
    je insert_note_7_9e
    cmp ah, 0x09               ; '8'
    je insert_note_8_9e
	cmp ah, 0x0A               ; '9'
    je insert_note_9_9e
	
    cmp ah, 0x48               ; Up arrow
    je note_move_up_9e
    cmp ah, 0x4B               ; Left arrow
    je note_move_left_9e
    cmp ah, 0x4D               ; Right arrow
    je note_move_right_9e
    cmp ah, 0x50               ; Down arrow
    je note_move_down_9e
    jmp handle_input9

note_move_up_9e:

    cmp byte [page_num1], 0        ; Check if we are on Page 1
    je check_top_row_note_page1_9e       ; If true, check if at the topmost row of Page 1

    cmp byte [page_num1], 1       ; Check if we are on Page 2
    je check_top_row_note_page2_9e        ; If true, check if at the topmost row of Page 2

    ret                           ; If not on Page 1 or Page 2, do nothing

check_top_row_note_page1_9e:

    cmp dh, 1                     ; Check if at the topmost row of Page 1
    je handle_wrap_up_note_page1_9e      ; If true, handle wrap-around to Page 2

    sub dh, 4                     ; Move up one row
    call update_cursor_position10
    ret

check_top_row_note_page2_9e:

    cmp dh, 0               ; Check if at the topmost row of Page 2
    je handle_wrap_up_note_page2_9e       ; If true, handle wrap-around to Page 1

    sub dh, 4                     ; Move up one row
    call update_cursor_position10
    ret

handle_wrap_up_note_page1_9e:
     
    call move_page_note_down9_9e         
    mov dh, 8                    
    mov dl, 20                 
    call update_cursor_position10
    ret

handle_wrap_up_note_page2_9e:

    call move_page_note_up9_9e            ; Switch to Page 1
    mov dh, 21                    ; Set to the last row of Page 1
    mov dl, 20                    ; Stay in the same column
    call update_cursor_position10
    ret

move_page_note_up9_9e:

    mov byte [page_num1], 0  ; Switch to Page 1
	mov al, [page_num1]
    mov ah, 5               ; BIOS: Set Active Display Page
    int 10h
	mov dh,1
	mov dl,20
	mov bh,0
	call update_cursor_position10
    ret

move_page_note_down9_9e:

    mov byte [page_num1], 1  ; Switch to Page 2
	mov al, [page_num1]
    mov ah, 5               ; BIOS: Set Active Display Page
    int 10h
	
	mov dh,1
	mov dl,20
	mov bh,1
	call update_cursor_position10
    ret
	
note_move_down_9e:
 
    cmp byte [page_num1], 0        ; Check if we are on Page 1
    je check_bottom_row_note_page1_9e     ; If true, check if at the bottommost row of Page 1

    cmp byte [page_num1], 1        ; Check if we are on Page 2
    je check_bottom_row_note_page2_9e     ; If true, check if at the bottommost row of Page 2

    ret                           ; If not on Page 1 or Page 2, do nothing

check_bottom_row_note_page1_9e:

    cmp dh, 21                    ; Check if at the bottommost row of Page 1
    je handle_wrap_down_note_1_9e     ; If true, handle wrap-around to Page 2

    add dh, 4                     ; Move down one row
    call update_cursor_position10
    ret

check_bottom_row_note_page2_9e:

    cmp dh, 8                    ; Check if at the bottommost row of Page 2
    je handle_wrap_down_note_2_9e     ; If true, handle wrap-around to Page 1

    add dh, 4                     ; Move down one row
    call update_cursor_position10
    ret

handle_wrap_down_note_1_9e:

    call move_page_note_down9_9e           ; Switch to Page 2
    mov dh, 0                     
    mov dl, 20                  
    call update_cursor_position10
    ret

handle_wrap_down_note_2_9e:

    call move_page_note_up9_9e             ; Switch to Page 1
    mov dh, 1                     
    mov dl, 20                    
    call update_cursor_position10
    ret

note_move_left_9e:

    cmp dl, 21                ; Check if at the leftmost column of the grid
    jbe handle_input9          ; If yes, don't move further left
    sub dl, 4                 ; Move to the left corner of the previous 2x2 box
    call update_cursor_position10
    jmp handle_input9

note_move_right_9e:

    cmp dl, 52                ; Check if at the rightmost column of the grid
    jae handle_input9          ; If yes, don't move further right
    add dl, 4                 ; Move to the left corner of the next 2x2 box
    call update_cursor_position10
    jmp handle_input9
	
insert_note_1_9e:

	cmp byte [page_num1] , 1
	je insert_note_1_pg2_9e
	
    call check_number_below_right_9e ; Check for number with 0x4F attribute
    cmp al, 1                     ; If a number is found, skip inserting the note
    jne handle_input9

    mov ah, 0x09
    mov al, '1'
    mov bh, 0x00
    mov bl, 0x0A
    mov cx, 1
    int 0x10

    jmp handle_input9

insert_note_2_9e:

	cmp byte [page_num1] , 1
	je insert_note_2_pg2_9e
	
    call check_number_below_right_9e
    cmp al, 1
    jne handle_input9

    mov ah, 0x09
    mov al, '2'
    mov bh, 0x00
    mov bl, 0x0A
    mov cx, 1
    int 0x10
    jmp handle_input9

insert_note_3_9e:

	cmp byte [page_num1] , 1
	je insert_note_3_pg2_9e
	
    call check_number_below_right_9e
    cmp al, 1
    jne handle_input9

    mov ah, 0x09
    mov al, '3'
    mov bh, 0x00
    mov bl, 0x0A
    mov cx, 1
    int 0x10
    jmp handle_input9

insert_note_4_9e:

	cmp byte [page_num1] , 1
	je insert_note_4_pg2_9e
	
    call check_number_below_right_9e
    cmp al, 1
    jne handle_input9

    mov ah, 0x09
    mov al, '4'
    mov bh, 0x00
    mov bl, 0x0A
    mov cx, 1
    int 0x10
    jmp handle_input9

insert_note_5_9e:

	cmp byte [page_num1] , 1
	je insert_note_5_pg2_9e
	
    call check_number_below_right_9e ; Check for number with 0x4F attribute
    cmp al, 1                     ; If a number is found, skip inserting the note
    jne handle_input9

    mov ah, 0x09
    mov al, '5'
    mov bh, 0x00
    mov bl, 0x0A
    mov cx, 1
    int 0x10
    jmp handle_input9

insert_note_6_9e:

	cmp byte [page_num1] , 1
	je insert_note_6_pg2_9e
	
    call check_number_below_right_9e
    cmp al, 1
    jne handle_input9

    mov ah, 0x09
    mov al, '6'
    mov bh, 0x00
    mov bl, 0x0A
    mov cx, 1
    int 0x10
    jmp handle_input9

insert_note_7_9e:

	cmp byte [page_num1] , 1
	je insert_note_7_pg2_9e
	
    call check_number_below_right_9e
    cmp al, 1
    jne handle_input9

    mov ah, 0x09
    mov al, '7'
    mov bh, 0x00
    mov bl, 0x0A
    mov cx, 1
    int 0x10
    jmp handle_input9

insert_note_8_9e:

	cmp byte [page_num1] , 1
	je insert_note_8_pg2_9e
	
    call check_number_below_right_9e
    cmp al, 1
    jne handle_input9

    mov ah, 0x09
    mov al, '8'
    mov bh, 0x00
    mov bl, 0x0A
    mov cx, 1
    int 0x10
    jmp handle_input9

insert_note_9_9e:

	cmp byte [page_num1] , 1
	je insert_note_9_pg2_9e
	
    call check_number_below_right_9e
    cmp al, 1
    jne handle_input9

    mov ah, 0x09
    mov al, '9'
    mov bh, 0x00
    mov bl, 0x0A
    mov cx, 1
    int 0x10
    jmp handle_input9

;=================================================

insert_note_1_pg2_9e:

	call check_number_below_right_2_9e

    mov ah, 0x09
    mov al, '1'
    mov bh, 0x01
    mov bl, 0x0A
    mov cx, 1
    int 0x10
    jmp handle_input9

insert_note_2_pg2_9e:

    call check_number_below_right_2_9e

    mov ah, 0x09
    mov al, '2'
    mov bh, 0x01
    mov bl, 0x0A
    mov cx, 1
    int 0x10
    jmp handle_input9

insert_note_3_pg2_9e:

	call check_number_below_right_2_9e

    mov ah, 0x09
    mov al, '3'
    mov bh, 0x01
    mov bl, 0x0A
    mov cx, 1
    int 0x10
    jmp handle_input9

insert_note_4_pg2_9e:

	call check_number_below_right_2_9e

    mov ah, 0x09
    mov al, '4'
    mov bh, 0x01
    mov bl, 0x0A
    mov cx, 1
    int 0x10
    jmp handle_input9

insert_note_5_pg2_9e:

	call check_number_below_right_2_9e

    mov ah, 0x09
    mov al, '5'
    mov bh, 0x01
    mov bl, 0x0A
    mov cx, 1
    int 0x10
    jmp handle_input9

insert_note_6_pg2_9e:

	call check_number_below_right_2_9e

    mov ah, 0x09
    mov al, '6'
    mov bh, 0x01
    mov bl, 0x0A
    mov cx, 1
    int 0x10
    jmp handle_input9

insert_note_7_pg2_9e:

	call check_number_below_right_2_9e

    mov ah, 0x09
    mov al, '7'
    mov bh, 0x01
    mov bl, 0x0A
    mov cx, 1
    int 0x10
    jmp handle_input9

insert_note_8_pg2_9e:

	call check_number_below_right_2_9e

    mov ah, 0x09
    mov al, '8'
    mov bh, 0x01
    mov bl, 0x0A
    mov cx, 1
    int 0x10
    jmp handle_input9

insert_note_9_pg2_9e:

	call check_number_below_right_2_9e

    mov ah, 0x09
    mov al, '9'
    mov bh, 0x01
    mov bl, 0x0A
    mov cx, 1
    int 0x10
    jmp handle_input9
	
check_number_below_right_9e:
	
    mov byte [fazooldh1], dh    ; Save current row
    mov byte [fazooldl1], dl    ; Save current column

    add dh, 1                  ; Move to the row below
    add dl, 1                  ; Move to the column to the right
	
    cmp dh, 23               ; Check if row exceeds grid bounds
    ja invalid_position_9e
    cmp dl, 68                 ; Check if column exceeds grid bounds
    ja invalid_position_9e

    ; Calculate video memory address for (row, column)
    mov ax, 0xB800             ; Base address of video memory
    mov es, ax                 ; Set ES to point to video memory

    ; Compute offset in memory for (dh, dl)
    xor bx, bx                 ; Clear BX
    mov al, dh                 ; Row number into AL
    mov ah, 0                  ; Clear upper byte of AX
    mov si, ax                 ; SI = row number
    shl si, 6                  ; Multiply row by 64 (2^6 = 64)
    mov di, ax                 ; DI = row number
    shl di, 4                  ; Multiply row by 16 (2^4 = 16)
    add si, di                 ; SI = row * 80 (64 + 16)
	xor dh,dh
    add si, dx                 ; Add column number to SI
    shl si, 1                  ; Multiply by 2 (character + attribute)

    ; Read character and attribute from video memory
    mov al, byte [es:si]       ; Read character at the position
    cmp al, 0x20               ; Is the character a space (' ')?
    jne no_attribute_found_9e

    mov ah, byte [es:si+1]     ; Read attribute at the position
    cmp ah, 0x0E               ; Does the attribute match 0x0E?
    jne no_attribute_found_9e
	

attribute_found_9e:

    mov al, 1                  ; Indicate valid space with 0x0E attribute found
    jmp restore_position_9e       ; Restore cursor position and return

no_attribute_found_9e:

    xor al, al                 ; Indicate no valid space with 0x0E attribute
    jmp restore_position_9e       ; Restore cursor position and return

invalid_position_9e:

    xor al, al                 ; Treat invalid positions as no valid space

restore_position_9e:

    ; Restore original cursor position
    mov dh, [fazooldh1]
    mov dl, [fazooldl1]
    ret                        ; Return with AL = 1 (valid) or 0 (not valid)
	
check_number_below_right_2_9e:

    mov byte [fazooldh1], dh    ; Save current row
    mov byte [fazooldl1], dl    ; Save current column

    ; Adjust for Page 2 boundaries
    add dh, 1                  ; Move to the row below
    add dl, 1                  ; Move to the column to the right

    cmp dh, 10                 ; Adjusted row boundary for Page 2 (0–9)
    ja invalid_position_9e
    cmp dl, 68                 ; Column boundary
    ja invalid_position_9e

    ; Calculate video memory address for (row, column)
    mov ax, 0xB800             ; Base address of video memory
    mov es, ax                 ; Set ES to point to video memory
	mov bh, 0x01

    ; Compute offset in memory for (dh, dl)
    mov al, dh                 ; Row number into AL
    mov ah, 0                  ; Clear upper byte of AX
    mov si, ax                 ; SI = row number
    shl si, 6                  ; Multiply row by 64 (2^6 = 64)
    mov di, ax                 ; DI = row number
    shl di, 4                  ; Multiply row by 16 (2^4 = 16)
    add si, di                 ; SI = row * 80 (64 + 16)
    add si, dx                 ; Add column number to SI
    shl si, 1                  ; Multiply by 2 (character + attribute)

    ; Read character and attribute from video memory
    mov al, byte [es:si]       ; Read character at the position
    cmp al, 0x20               ; Is the character a space (' ')? 
    jne no_attribute_found_9e

    mov ah, byte [es:si+1]     ; Read attribute at the position
    cmp ah, 0x4F               ; Does the attribute match 0x4F?
    jne no_attribute_found_9e

move_up9:

    cmp byte [page_num1], 0        ; Check if we are on Page 1
    je check_top_row_page1        ; If true, check if at the topmost row of Page 1

    cmp byte [page_num1], 1       ; Check if we are on Page 2
    je check_top_row_page2        ; If true, check if at the topmost row of Page 2

    ret                           ; If not on Page 1 or Page 2, do nothing

check_top_row_page1:

    cmp dh, 2                     ; Check if at the topmost row of Page 1
    je handle_wrap_up_page1      ; If true, handle wrap-around to Page 2

    sub dh, 4                     ; Move up one row
    call update_cursor_position10
    ret

check_top_row_page2:

    cmp dh, 1               ; Check if at the topmost row of Page 2
    je handle_wrap_up_page2       ; If true, handle wrap-around to Page 1

    sub dh, 4                     ; Move up one row
    call update_cursor_position10
    ret

handle_wrap_up_page1:
     
    call move_page_down9         
    mov dh, 9                    
    mov dl, 21                   
    call update_cursor_position10
    ret

handle_wrap_up_page2:

    call move_page_up9            ; Switch to Page 1
    mov dh, 22                    ; Set to the last row of Page 1
    mov dl, 21                    ; Stay in the same column
    call update_cursor_position10
    ret
	
move_down9:

    cmp byte [page_num1], 0        ; Check if we are on Page 1
    je check_bottom_row_page1     ; If true, check if at the bottommost row of Page 1

    cmp byte [page_num1], 1        ; Check if we are on Page 2
    je check_bottom_row_page2     ; If true, check if at the bottommost row of Page 2

    ret                           ; If not on Page 1 or Page 2, do nothing

check_bottom_row_page1:

    cmp dh, 22                    ; Check if at the bottommost row of Page 1
    je handle_wrap_down_page1     ; If true, handle wrap-around to Page 2

    add dh, 4                     ; Move down one row
    call update_cursor_position10
    ret

check_bottom_row_page2:

    cmp dh, 9                    ; Check if at the bottommost row of Page 2
    je handle_wrap_down_page2     ; If true, handle wrap-around to Page 1

    add dh, 4                     ; Move down one row
    call update_cursor_position10
    ret

handle_wrap_down_page1:

    call move_page_down9           ; Switch to Page 2
    mov dh, 1                     
    mov dl, 21                   
    call update_cursor_position10
    ret

handle_wrap_down_page2:

    call move_page_up9             ; Switch to Page 1
    mov dh, 2                     
    mov dl, 21                    
    call update_cursor_position10
    ret
	
; Move left with wrap-around
move_left9:

    cmp dl, 21              ; Check if at the leftmost column
    je handle_wrap_left9
    sub dl, 4               ; Move left one column
    call update_cursor_position10
    ret

handle_wrap_left9:

    mov dl, 53              ; Wrap to the rightmost column
    call update_cursor_position10
    ret

move_right9:

    cmp dl, 53              ; Check if at the rightmost column
    je handle_wrap_right9
    add dl, 4               ; Move right one column
    call update_cursor_position10
    ret

handle_wrap_right9:

    mov dl, 21              ; Wrap to the leftmost column
    call update_cursor_position10
    ret

move_page_up9:

    mov byte [page_num1], 0  ; Switch to Page 1
	mov al, [page_num1]
    mov ah, 5               ; BIOS: Set Active Display Page
    int 10h
	mov dh,2
	mov dl,21
	mov bh,0
	call update_cursor_position10
    ret

move_page_down9:

    mov byte [page_num1], 1  ; Switch to Page 2
	mov al, [page_num1]
    mov ah, 5               ; BIOS: Set Active Display Page
    int 10h
	
	mov dh,2
	mov dl,21
	mov bh,1
	call update_cursor_position10
    ret

invalid_number_9e:

    mov ah, 0x09
    mov al, ' '                 ; Display a space to clear the cell
    mov bh, 0x00
    mov bl, 0x0E                ; Red background
    mov cx, 1
    int 0x10
	
	inc byte[mistake_count]
	call mistake_sound
	
	mov ax,0x09
	push ax
	mov ax,0x47
	push ax
	mov ax,[mistake_count]
	push ax
	call printnum1
	
	cmp byte[mistake_count],3
	je lostbymistake
	
	call score_mistake_9e
	call update_cursor_position10
	
    jmp handle_input9
	
checkwin_9x9_easy:

	cmp byte[correctinputs],52
	je game_won
	
	ret

insert_number9_1_9e:

	cmp byte[page_num1] , 1
	je insert_number9_1_9e_p2
	
	call validate_input_9e
	cmp bl, 1 
	jne invalid_number_9e
	call clear_notes           
    mov ah, 0x09     
    mov al, '1'       
    mov bl, 0x4F       
    mov cx, 1         
    int 0x10 
	call insertion_sound
	call display_score_increase_9e
	call update_cursor_position10
	inc byte[correctinputs]
	call checkrow_completion_9x9_p1
		call update_cursor_position10
	call checkcol_completion_9x9_e
	call checkwin_9x9_easy
    jmp handle_input9

insert_number9_1_9e_p2:

    call validate_input_9e
	cmp bl, 1
	jne invalid_number_9e
	call clear_notes           
    mov ah, 0x09     
    mov al, '1'       
    mov bl, 0x4F  
	mov bh, 0x01
    mov cx, 1         
    int 0x10 
	call insertion_sound
	call display_score_increase_9e
	call update_cursor_position10
	inc byte[correctinputs]
	call checkrow_completion_9x9_p2
	call update_cursor_position10
	call checkcol_completion_9x9_e
	;call update_cursor_position10
	call checkwin_9x9_easy
    jmp handle_input9	

insert_number9_2_9e:

	cmp byte[page_num1] , 1
	je insert_number9_2_9e_p2
	
    call validate_input_9e
	cmp bl, 2 
	jne invalid_number_9e
	call clear_notes           
    mov ah, 0x09     
    mov al, '2'       
    mov bl, 0x4F       
    mov cx, 1         
    int 0x10 
	call insertion_sound
	call display_score_increase_9e
	call update_cursor_position10
	inc byte[correctinputs]
	call checkrow_completion_9x9_p1
	call update_cursor_position10
	call checkcol_completion_9x9_e
	;call update_cursor_position10

	call checkwin_9x9_easy
    jmp handle_input9

insert_number9_2_9e_p2:

    call validate_input_9e
	cmp bl, 2
	jne invalid_number_9e
	call clear_notes           
    mov ah, 0x09     
    mov al, '2'       
    mov bl, 0x4F  
	mov bh, 0x01
    mov cx, 1         
    int 0x10 
	call insertion_sound
	call display_score_increase_9e
	call update_cursor_position10
	inc byte[correctinputs]
	call checkrow_completion_9x9_p2
	call update_cursor_position10
	call checkcol_completion_9x9_e
	;	call update_cursor_position10
	call checkwin_9x9_easy
    jmp handle_input9	

insert_number9_3_9e:  

	cmp byte[page_num1] , 1
	je insert_number9_3_9e_p2
	
    call validate_input_9e
	cmp bl, 3 
	jne invalid_number_9e
	call clear_notes           
    mov ah, 0x09     
    mov al, '3'       
    mov bl, 0x4F       
    mov cx, 1         
    int 0x10 
	call insertion_sound
	call display_score_increase_9e
	call update_cursor_position10
	inc byte[correctinputs]
	call checkrow_completion_9x9_p1
	call update_cursor_position10
	call checkcol_completion_9x9_e
	;	call update_cursor_position10

	call checkwin_9x9_easy
    jmp handle_input9

insert_number9_3_9e_p2:

    call validate_input_9e
	cmp bl, 3
	jne invalid_number_9e
	call clear_notes           
    mov ah, 0x09     
    mov al, '3'       
    mov bl, 0x4F  
	mov bh, 0x01
    mov cx, 1         
    int 0x10 
	call insertion_sound
	call display_score_increase_9e
	call update_cursor_position10
	inc byte[correctinputs]
	call checkrow_completion_9x9_p2
	call update_cursor_position10
	call checkcol_completion_9x9_e
	;	call update_cursor_position10

	call checkwin_9x9_easy
    jmp handle_input9	

insert_number9_4_9e:

	cmp byte[page_num1] , 1
	je insert_number9_4_9e_p2
	
    call validate_input_9e
	cmp bl, 4 
	jne invalid_number_9e
	call clear_notes           
    mov ah, 0x09     
    mov al, '4'       
    mov bl, 0x4F       
    mov cx, 1         
    int 0x10 
	call insertion_sound
	call display_score_increase_9e
	call update_cursor_position10
	inc byte[correctinputs]
	call checkrow_completion_9x9_p1
	call update_cursor_position10
	call checkcol_completion_9x9_e
	;	call update_cursor_position10

	call checkwin_9x9_easy
    jmp handle_input9

insert_number9_4_9e_p2:

    call validate_input_9e
	cmp bl, 4
	jne invalid_number_9e
	call clear_notes           
    mov ah, 0x09     
    mov al, '4'       
    mov bl, 0x4F  
	mov bh, 0x01
    mov cx, 1         
    int 0x10 
	call insertion_sound
	call display_score_increase_9e
	call update_cursor_position10
	inc byte[correctinputs]
	call checkrow_completion_9x9_p2
	call update_cursor_position10
	call checkcol_completion_9x9_e
	;	call update_cursor_position10

	call checkwin_9x9_easy
    jmp handle_input9	
	
insert_number9_5_9e:

	cmp byte[page_num1] , 1
	je insert_number9_5_9e_p2
	
    call validate_input_9e
	cmp bl, 5 
	jne invalid_number_9e
	call clear_notes           
    mov ah, 0x09     
    mov al, '5'       
    mov bl, 0x4F       
    mov cx, 1         
    int 0x10 
	call insertion_sound
	call display_score_increase_9e
	call update_cursor_position10
	inc byte[correctinputs]
	call checkrow_completion_9x9_p1
	call update_cursor_position10
	call checkcol_completion_9x9_e
	;call update_cursor_position10
	call checkwin_9x9_easy
    jmp handle_input9

insert_number9_5_9e_p2:

    call validate_input_9e
	cmp bl, 5
	jne invalid_number_9e
	call clear_notes           
    mov ah, 0x09     
    mov al, '5'       
    mov bl, 0x4F  
	mov bh, 0x01
    mov cx, 1         
    int 0x10 
	call insertion_sound
	call display_score_increase_9e
	call update_cursor_position10
	inc byte[correctinputs]
	call checkrow_completion_9x9_p2
	call update_cursor_position10
	call checkcol_completion_9x9_e
	;	call update_cursor_position10

	call checkwin_9x9_easy
    jmp handle_input9	

insert_number9_6_9e:

	cmp byte[page_num1] , 1
	je insert_number9_6_9e_p2
	
    call validate_input_9e
	cmp bl,6 
	jne invalid_number_9e
	call clear_notes           
    mov ah, 0x09     
    mov al, '6'       
    mov bl, 0x4F       
    mov cx, 1         
    int 0x10 
	call insertion_sound
	call display_score_increase_9e
	call update_cursor_position10
	inc byte[correctinputs]
	call checkrow_completion_9x9_p1
	call update_cursor_position10
	call checkcol_completion_9x9_e
	;	call update_cursor_position10

	call checkwin_9x9_easy
    jmp handle_input9

insert_number9_6_9e_p2:

    call validate_input_9e
	cmp bl, 6
	jne invalid_number_9e
	call clear_notes           
    mov ah, 0x09     
    mov al, '6'       
    mov bl, 0x4F  
	mov bh, 0x01
    mov cx, 1         
    int 0x10 
	call insertion_sound
	call display_score_increase_9e
	call update_cursor_position10
	inc byte[correctinputs]
	call checkrow_completion_9x9_p2
	call update_cursor_position10
	call checkcol_completion_9x9_e
	;	call update_cursor_position10
	call checkwin_9x9_easy
    jmp handle_input9	

insert_number9_7_9e:

	cmp byte[page_num1] , 1
	je insert_number9_7_9e_p2
	
    call validate_input_9e
	cmp bl, 7 
	jne invalid_number_9e
	call clear_notes           
    mov ah, 0x09     
    mov al, '7'       
    mov bl, 0x4F       
    mov cx, 1         
    int 0x10 
	call insertion_sound
	call display_score_increase_9e
	call update_cursor_position10
	inc byte[correctinputs]
	call checkrow_completion_9x9_p1
	call update_cursor_position10
	call checkcol_completion_9x9_e
	;	call update_cursor_position10

	call checkwin_9x9_easy
    jmp handle_input9

insert_number9_7_9e_p2:

    call validate_input_9e
	cmp bl, 7
	jne invalid_number_9e
	call clear_notes           
    mov ah, 0x09     
    mov al, '7'       
    mov bl, 0x4F  
	mov bh, 0x01
    mov cx, 1         
    int 0x10 
	call insertion_sound
	call display_score_increase_9e
	call update_cursor_position10
	inc byte[correctinputs]
	call checkrow_completion_9x9_p2
	call update_cursor_position10
	call checkcol_completion_9x9_e
	;	call update_cursor_position10

	call checkwin_9x9_easy
    jmp handle_input9	

insert_number9_8_9e:

	cmp byte[page_num1] , 1
	je insert_number9_8_9e_p2

    call validate_input_9e
	cmp bl, 8
	jne invalid_number_9e
	call clear_notes           
    mov ah, 0x09     
    mov al, '8'       
    mov bl, 0x4F       
    mov cx, 1         
    int 0x10 
	call insertion_sound
	call display_score_increase_9e
	call update_cursor_position10
	inc byte[correctinputs]
	call checkrow_completion_9x9_p1
	call update_cursor_position10
	call checkcol_completion_9x9_e
	;	call update_cursor_position10

	call checkwin_9x9_easy
    jmp handle_input9
	
insert_number9_8_9e_p2:

    call validate_input_9e
	cmp bl, 8
	jne invalid_number_9e
	call clear_notes           
    mov ah, 0x09     
    mov al, '8'       
    mov bl, 0x4F  
	mov bh, 0x01
    mov cx, 1         
    int 0x10 
	call insertion_sound
	call display_score_increase_9e
	call update_cursor_position10
	inc byte[correctinputs]
	call checkrow_completion_9x9_p2
	call update_cursor_position10
	call checkcol_completion_9x9_e
	;	call update_cursor_position10

	call checkwin_9x9_easy
    jmp handle_input9	

insert_number9_9_9e:

	cmp byte[page_num1] , 1
	je insert_number9_9_9e_p2
	
    call validate_input_9e
	cmp bl, 9
	jne invalid_number_9e
	call clear_notes           
    mov ah, 0x09     
    mov al, '9'       
    mov bl, 0x4F       
    mov cx, 1         
    int 0x10 
	call insertion_sound
	call display_score_increase_9e
	call update_cursor_position10
	inc byte[correctinputs]
	call checkrow_completion_9x9_p1
	call update_cursor_position10
	call checkcol_completion_9x9_e
	;	call update_cursor_position10

	call checkwin_9x9_easy
    jmp handle_input9

insert_number9_9_9e_p2:

    call validate_input_9e
	cmp bl, 9
	jne invalid_number_9e
	call clear_notes           
    mov ah, 0x09     
    mov al, '9'       
    mov bl, 0x4F 
	mov bh, 0x01
    mov cx, 1         
    int 0x10 
	call insertion_sound
	call display_score_increase_9e
	call update_cursor_position10
	inc byte[correctinputs]
	call checkrow_completion_9x9_p2
	call update_cursor_position10
	call checkcol_completion_9x9_e
	;	call update_cursor_position10

	call checkwin_9x9_easy
    jmp handle_input9
	
	;======================================================================================;
	checkcol_completion_9x9_e:
	 cmp dl,21
	je col_1_e
	
	cmp dl,25
	je col_2_e
	
	cmp dl,29
	je col_3_e
	
	cmp dl,33
	je col_4_e
	
	cmp dl,37
	je col_5_e
	
	cmp dl,41
	je col_6_e
	
	cmp dl,45
	je col_7_e
	
	cmp dl,49
	je col_8_e
	
	cmp dl,53
	je col_9_e
	
	
	col_1_e:
	inc byte[col1_e_9]
	cmp byte[col1_e_9],9
	je completed_col_e_9
		jmp not_completed_9_e
	
	col_2_e:
	inc byte[col2_e_9]
	cmp byte[col2_e_9],9
	je completed_col_e_9
		jmp not_completed_9_e
	
	col_3_e:
	inc byte[col3_e_9]
	cmp byte[col3_e_9],9
	je completed_col_e_9
		jmp not_completed_9_e
	
	col_4_e:
	inc byte[col4_e_9]
	cmp byte[col4_e_9],9
	je completed_col_e_9
		jmp not_completed_9_e
	
	col_5_e:
	inc byte[col5_e_9]
	cmp byte[col5_e_9],9
	je completed_col_e_9
		jmp not_completed_9_e
	
	col_6_e:
	inc byte[col6_e_9]
	cmp byte[col6_e_9],9
	je completed_col_e_9
		jmp not_completed_9_e
	
	col_7_e:
	inc byte[col7_e_9]
	cmp byte[col7_e_9],9
	je completed_col_e_9
	jmp not_completed_9_e
	
	col_8_e:
	inc byte[col8_e_9]
	cmp byte[col8_e_9],9
	je completed_col_e_9
		jmp not_completed_9_e
	
	col_9_e:
	inc byte[col9_e_9]
	cmp byte[col9_e_9],9
	je completed_col_e_9
	jmp not_completed_9_e
	

completed_col_e_9:
call completion_sound


not_completed_9_e:
ret
;============================================================================================================;
	
	clear_3x3_grid:
	
	mov byte[orig_dh],dh
	mov byte[orig_dl],dl
	
	mov byte[fazooldh],dh
	mov byte[fazooldl],dl
	
	dec byte[fazooldh]
	dec byte[fazooldl]
	
	mov dh,[fazooldh]
	mov dl,[fazooldl]
	
	 call update_cursor_position10

    mov ah, 0x09
    mov al, ' '            ; Clear note with a space
    ;mov bh, 0x00
    mov bl, 0x07           ; Normal white text attribute
    mov cx, 1            
    int 0x10              

    mov dh, [orig_dh]
    mov dl, [orig_dl]
    call update_cursor_position10	; Update the cursor visually
    ret
	
check_attribute9x9_easy_9e:

    push bx
    push dx

    mov ah, 0x08             ; BIOS function to read character and attribute
    int 0x10                 ; Perform the interrupt
    cmp al, ' '              ; Check if character is empty (space)
    je allow_input           ; If empty, allow input
    cmp ah, 0x0E             ; Compare attribute with yellow on black
    je deny_input            ; If true, deny input
	

save_column_position_9e:
    mov al, dl         ; Save the current column position to al
    ret

; Restore the saved column position
restore_column_position_9e:
    mov dl, al         ; Restore the saved column position from al
    ret
	
	;=======================================================Sound for row completion==============================================;
	completion_sound:
	pusha
	push es
	push dx
	
	
	; Set up PIT for square wave sound
mov al, 0xB6          ; 0xB6 = binary 1011 0110
                      ; Set up channel 2 in mode 3 (square wave)
out 0x43, al          ; Send command to PIT control register

; Calculate divisor for 500 Hz tone
mov ax, 1193180 / 2000 ; Divide PIT frequency by desired frequency (500 Hz)
out 0x42, al          ; Low byte of divisor
mov al, ah            ; Get high byte of divisor
out 0x42, al          ; Send high byte of divisor

; Main loop for on-and-off sound effect
mov cx, 5           ; Repeat 150 cycles (adjust to control total duration)
main_loopsoundcomp:
    ; Enable PC speaker to start sound
    in al, 0x61       ; Read current value of port 0x61
    or al, 0x03       ; Set bits 0 and 1 to enable speaker
    out 0x61, al      ; Write back to port 0x61 to turn on speaker

    ; Longer delay while sound is ON
    mov dx, 0xFFFF    ; Adjust value for desired ON duration (longer delay)
on_delaycomp:
    dec dx
    jnz on_delaycomp

    ; Disable PC speaker to stop sound
    in al, 0x61       ; Read current value of port 0x61
    and al, 0xFC      ; Clear bits 0 and 1 to disable speaker
    out 0x61, al      ; Write back to port 0x61 to turn off speaker

    ; Longer delay while sound is OFF
    mov dx, 0xFFFF    ; Adjust value for desired OFF duration (longer delay)
off_delaycomp:
    dec dx
    jnz off_delaycomp

    ; Decrement loop counter
    loop main_loopsoundcomp
    
	pop dx
	pop es
	popa
    ret
	
	
	;===================================================ROW COL COMPLETION FUNCS========================================================;
	checkrow_completion_9x9_p2:
	
   cmp dh,1
   je p2_row7
   
   cmp dh,5
   je p2_row8
   
   cmp dh,9
   je p2_row9
   
   p2_row7:
   inc byte[row7_e_9]
   cmp byte[row7_e_9],9
   je comp_p2
   jmp not_comp_p2
   
   p2_row8: 
   inc byte[row8_e_9]
   cmp byte[row8_e_9],9
   je comp_p2
   jmp not_comp_p2
   
   p2_row9:
   inc byte[row9_e_9]
   cmp byte[row9_e_9],9
   je comp_p2
   jmp not_comp_p2
   
  
   
   comp_p2:
    mov byte[fazooldh1],dh
   mov byte[fazooldl1],dl
   call animation_row
   call completion_sound
   
   not_comp_p2:
   ret

	checkrow_completion_9x9_p1:
	push bx
	
    ; Save current row and column
    mov byte [fazooldh1], dh    ; Save current row
    mov byte [fazooldl1], dl    ; Save current column

    ; Start checking from column 21
    mov dl, 21                  ; Set starting column

    ; Set up video memory base
    mov ax, 0xB800              ; Base address of video memory
    mov es, ax                  ; Set ES to video memory segment

keep_checking:
    ; Compute memory offset for (row, column)
	mov dh,[fazooldh1]
    xor bx, bx                  ; Clear BX
    mov al, dh                  ; Row number into AL (from DH directly)
    mov ah, 0                   ; Clear upper byte of AX
    mov si, ax                  ; SI = row number
    shl si, 6                   ; Multiply row by 64 (2^6 = 64)
    mov di, ax                  ; DI = row number
    shl di, 4                   ; Multiply row by 16 (2^4 = 16)
    add si, di                  ; SI = row * 80 (64 + 16)
    xor dh, dh                  ; Clear DH
    add si, dx                  ; Add column number to SI
    shl si, 1                   ; Multiply by 2 (character + attribute)

 
    ; Read character and attribute at position
    mov al, byte [es:si]        ; Read character from video memory
    cmp al, ' '                ; Is the character a space (' ')? If not, move to next column
    jne next_column

    ; If it's a space, check its attribute
    mov ah, byte [es:si+1]      ; Read attribute from video memory
    cmp ah, 0x0E                ; Is the attribute 0x0E?
    je not_completed            ; If space with 0x0E is found, row is not completed


next_column:
    add dl, 4                   ; Move to the next column (increment by 4)
    cmp dl, 57                  ; Check if we've reached the last column (53)
    jle keep_checking           ; If not, continue checking

    ; If no spaces with 0x0E are found, row is completed
    jmp completed


not_completed:
     
    ; Restore original cursor position
    mov dh, [fazooldh1]
    mov dl, [fazooldl1]
	pop bx
    ret

completed:
    ; Restore original cursor position
	call completion_sound
	call animation_row
    mov dh, [fazooldh1]
    mov dl, [fazooldl1]
	pop bx
    ret
	;============================================================================================================;
	
animation_row:
  pusha 
	push es
	
	
; Set cursor position (row and column)
mov ah, 0x02        ; Function to set cursor position
;mov bh, 0x00        ; Video page (0 for default)
mov dh, [fazooldh1]          ; Row (0-based, e.g., row 10)
mov dl, 58         ; Column (0-based, e.g., column 20)
int 0x10            ; Call BIOS interrupt

; Print character with attribute
mov ah, 0x09        ; Function to write character and attribute
mov al, 1           ; Black smiley face (☻)
mov bl, 0x0B       ; Attribute byte (e.g., bright yellow on blue)
;mov bh, 0x00        ; Video page (0 for default)
mov cx, 1           ; Number of times to print the character
int 0x10            ; Call BIOS interrupt
	
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	
	mov ah, 0x13     ; service 13h - print string
    mov al, 1        ; subservice 01 - update cursor
   ; mov bh, 0        ; output on page 0
    mov bl, 01h      ; normal white on black attribute
      mov dh, [fazooldh1]          ; Row (0-based, e.g., row 10)
mov dl, 58         ; Column (0-based, e.g., column 20)
 ; row 4, column 31 (centered title position)
    mov cx, 1     ; length of the string
    push cs
    pop es           ; set ES to code segment
    mov bp, space
    int 0x10         ; call BIOS video interrupt to print string
	
	
	
	pop es
	popa
	ret
	
	
	
	
	
	
	
	
	
	
	
	
	;=============================================================================================================;
     
	checkcol_completion_9x9_p1:
	
    cmp dl,21
	je col_1
	
	cmp dl,25
	je col_2
	
	cmp dl,29
	je col_3
	
	cmp dl,33
	je col_4
	
	cmp dl,37
	je col_5
	
	cmp dl,41
	je col_6
	
	cmp dl,45
	je col_7
	
	cmp dl,49
	je col_8
	
	cmp dl,53
	je col_9
	
	
	col_1:
	inc byte[col1_hard_9]
	cmp byte[col1_hard_9],9
	je completed_col_hard_9
		jmp not_completed_9_hard
	
	col_2:
	inc byte[col2_hard_9]
	cmp byte[col2_hard_9],9
	je completed_col_hard_9
		jmp not_completed_9_hard
	
	col_3:
	inc byte[col3_hard_9]
	cmp byte[col3_hard_9],9
	je completed_col_hard_9
		jmp not_completed_9_hard
	
	col_4:
	inc byte[col4_hard_9]
	cmp byte[col4_hard_9],9
	je completed_col_hard_9
		jmp not_completed_9_hard
	
	col_5:
	inc byte[col5_hard_9]
	cmp byte[col5_hard_9],9
	je completed_col_hard_9
		jmp not_completed_9_hard
	
	col_6:
	inc byte[col6_hard_9]
	cmp byte[col6_hard_9],9
	je completed_col_hard_9
		jmp not_completed_9_hard
	
	col_7:
	inc byte[col7_hard_9]
	cmp byte[col7_hard_9],9
	je completed_col_hard_9
		jmp not_completed_9_hard
	
	col_8:
	inc byte[col8_hard_9]
	cmp byte[col8_hard_9],9
	je completed_col_hard_9
		jmp not_completed_9_hard
	
	col_9:
	inc byte[col9_hard_9]
	cmp byte[col9_hard_9],9
	je completed_col_hard_9
	jmp not_completed_9_hard
	

completed_col_hard_9:
call completion_sound


not_completed_9_hard:
ret

	
	
	
	
	
	
	;===================================================================================================================================;
	
drawgrid99:

	mov ah, 0x13     ; service 13h - print string
    mov al, 1        ; subservice 01 - update cursor
    mov bh, 0        ; output on page 0
    mov bl, 0Ah      ; normal white on black attribute
    mov dx, 0x0090  ; row 4, column 31 (centered title position)
    mov cx, 6      ; length of the string
    push cs
    pop es           ; set ES to code segment
    mov bp, easy_msg_9top
    int 0x10         ; call BIOS video interrupt to print string
	
	mov ah, 0x13     ; service 13h - print string
    mov al, 1        ; subservice 01 - update cursor
    mov bh, 0        ; output on page 0
    mov bl, 0Ah      ; normal white on black attribute
    mov dx, 0x0290 ; row 4, column 31 (centered title position)
    mov cx, 6     ; length of the string
    push cs
    pop es           ; set ES to code segment
    mov bp, easy_msg_9bottom
    int 0x10         ; call BIOS video interrupt to print string

	mov ah, 0x13     ; service 13h - print string
    mov al, 1        ; subservice 01 - update cursor
    mov bh, 0        ; output on page 0
    mov bl, 0Ah      ; normal white on black attribute
    mov dx, 0x0191 ; row 4, column 31 (centered title position)
    mov cx, 5      ; length of the string
    push cs
    pop es           ; set ES to code segment
    mov bp, easy_msg
    int 0x10         ; call BIOS video interrupt to print string
	
	call print9x9_details
		
	mov ah, 0x13    
    mov al, 1        
    mov bh, 0        
    mov bl, 03h     
    mov dx, 0x0204  
    mov cx, 11    
    push cs
    pop es          
    mov bp, restart_game
    int 0x10
	
    mov ah, 0x13
    mov al, 1
    mov bh, 0
    mov bl, 0x05
    mov dx, 0x0013
    mov cx, 37
    push cs
    pop es
    mov bp, row1
    int 0x10
	
	mov bl, 0x0E
    mov dx, 0x0113
    mov bp, row2
    int 0x10

    mov dx, 0x0213
    mov bp, row3
    int 0x10

    mov dx, 0x0313
    mov bp, row4
    int 0x10

    mov bl, 0x05
    mov dx, 0x0413
    mov bp, row5
    int 0x10

    mov bl, 0x0E
    mov dx, 0x0513
    mov bp, row6
    int 0x10

    mov dx, 0x0613
    mov bp, row7
    int 0x10

    mov dx, 0x0713
    mov bp, row8
    int 0x10

    mov bl, 0x05
    mov dx, 0x0813
    mov bp, row9
    int 0x10

    mov bl, 0x0E
    mov dx, 0x0913
    mov bp, row10
    int 0x10

    mov dx, 0x0A13
    mov bp, row11
    int 0x10

    mov dx, 0x0B13
    mov bp, row12
    int 0x10

    mov bl, 0x05
    mov dx, 0x0C13
    mov bp, row13
    int 0x10

    mov bl, 0x0E
    mov dx, 0x0D13
    mov bp, row14
    int 0x10

    mov dx, 0x0E13
    mov bp, row15
    int 0x10

    mov dx, 0x0F13
    mov bp, row16
    int 0x10

    mov bl, 0x05
    mov dx, 0x1013
    mov bp, row17
    int 0x10

    mov bl, 0x0E
    mov dx, 0x1113
    mov bp, row18
    int 0x10

    mov dx, 0x1213
    mov bp, row19
    int 0x10

    mov dx, 0x1313
    mov bp, row20
    int 0x10

    mov bl, 0x05
    mov dx, 0x1413
    mov bp, row21
    int 0x10

    mov bl, 0x0E
    mov dx, 0x1513
    mov bp, row22
    int 0x10

    mov dx, 0x1613
    mov bp, row23
    int 0x10

    mov dx, 0x1713
    mov bp, row24
    int 0x10

    mov bl, 0x05
    mov dx, 0x1813
    mov bp, row25
    int 0x10
	
    ret

drawgrid_next:

    mov ah, 0x13
    mov al, 1
    mov bh, 1
    mov bl, 0x0E
    mov dx, 0x0013
    mov cx, 37
    push cs
    pop es
    mov bp, row26
    int 0x10
    
	mov dx, 0x0113
    mov cx, 37
    mov bp, row27
    int 0x10

    mov dx, 0x0213
    mov cx, 37
    mov bp, row28
    int 0x10

    mov bl, 05h
    mov dx, 0x0313
    mov cx, 37
    mov bp, row29
    int 0x10

    mov bl, 0Eh
    mov dx, 0x0413
    mov cx, 37
    mov bp, row30
    int 0x10

    mov dx, 0x0513
    mov cx, 37
    mov bp, row31
    int 0x10

    mov dx, 0x0613
    mov cx, 37
    mov bp, row32
    int 0x10

    mov bl, 05h
    mov dx, 0x0713
    mov cx, 37
    mov bp, row33
    int 0x10

    mov bl, 0Eh
    mov dx, 0x0813
    mov cx, 37
    mov bp, row34
    int 0x10

    mov dx, 0x0913
    mov cx, 37
    mov bp, row35
    int 0x10

    mov dx, 0x0A13
    mov cx, 37
    mov bp, row36
    int 0x10

    mov bl, 05h
    mov dx, 0x0B13
    mov cx, 37
    mov bp, row37
    int 0x10
	
    ret
	
drawgrid9:

	call clrscr
	call drawgrid_next
	call drawgrid99
	   
    mov dh, 2          ; Start cursor row
    mov dl, 21         ; Start cursor column
    call update_cursor_position10
	
loopp:

	call handle_input9
    jmp loopp
	
	ret
	
	;========================9x9 MED KA CODE ======================================
	
drawgrid99med:

	mov ah, 0x13    
    mov al, 1        
    mov bh, 0        
    mov bl, 03h     
    mov dx, 0x0204  
    mov cx, 11    
    push cs
    pop es          
    mov bp, restart_game
    int 0x10
		
	mov ah, 0x13     ; service 13h - print string
    mov al, 1        ; subservice 01 - update cursor
    mov bh, 0        ; output on page 0
    mov bl, 0x1     ; normal white on black attribute
    mov dx, 0x0090  ; row 4, column 31 (centered title position)
    mov cx, 8      ; length of the string
    push cs
    pop es           ; set ES to code segment
    mov bp, easy_msg_9top
    int 0x10         ; call BIOS video interrupt to print string
	
	mov ah, 0x13     ; service 13h - print string
    mov al, 1        ; subservice 01 - update cursor
    mov bh, 0        ; output on page 0
    mov bl, 0x1      ; normal white on black attribute
    mov dx, 0x0290 ; row 4, column 31 (centered title position)
    mov cx, 8     ; length of the string
    push cs
    pop es           ; set ES to code segment
    mov bp, easy_msg_9bottom
    int 0x10         ; call BIOS video interrupt to print string

	mov ah, 0x13     ; service 13h - print string
    mov al, 1        ; subservice 01 - update cursor
    mov bh, 0        ; output on page 0
    mov bl, 0x1   ; normal white on black attribute
    mov dx, 0x0191 ; row 4, column 31 (centered title position)
    mov cx, 6      ; length of the string
    push cs
    pop es           ; set ES to code segment
    mov bp, medium_msg
    int 0x10         ; call BIOS video interrupt to print string
	
	call print9x9_details
	
    ; Print on page 0(row1)
    mov ah, 0x13     ; service 13h - print string
    mov al, 1        ; subservice 01 - update cursor
    mov bh, 0        ; output on page 0
    mov bl, 0x05       ; normal white on black attribute
    mov dx, 0x0013     ; row 0, column  (cursor position)
    mov cx, 37       ; length of the string

    push cs
    pop es           ; set ES to code segment
    mov bp,medrow1  ; offset of the string
    int 0x10         ; call BIOS video interrupt to print string
	
	 ; Print on page 0 (row 2)
    mov bl, 0Eh       ; normal white on black attribute
    mov dx, 0x0113    ; row 2, column (cursor position)
    mov bp, medrow2      ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
	
 ; Print on page 0 (row 3)
    mov dx, 0x0213    ; row 3, column (cursor position)
    mov bp, medrow3      ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
	
 ; Print on page 0 (row 4)
    mov dx, 0x0313    ; row 4, column (cursor position)
    mov bp, medrow4      ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
	
 ; Print on page 0 (row 5, different color)
    mov bl, 0x05       ; change to new color (example: dark red)
    mov dx, 0x0413    ; row 5, column (cursor position)
    mov bp, medrow5      ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
	
 ; Print on page 0 (row 6)
    mov bl, 0Eh       ; back to normal white on black attribute
    mov dx, 0x0513    ; row 6, column (cursor position)
    mov bp, medrow6      ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
	
 ; Print on page 0 (row 7)
    mov dx, 0x0613    ; row 7, column (cursor position)
    mov bp, medrow7      ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
	
 ; Print on page 0 (row 8, different color)
    mov dx, 0x0713    ; row 8, column (cursor position)
    mov bp, medrow8      ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
	
 ; Print on page 0 (row 9)
    mov bl, 0x05       ; back to normal white on black attribute
    mov dx, 0x0813    ; row 9, column (cursor position)
    mov bp, medrow9      ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
	
 ; Print on page 0 (row 10)
    mov bl,0Eh        ; back to normal colour
    mov dx, 0x0913    ; row 10, column (cursor position)
    mov bp, medrow10     ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
	
 ; Print on page 0 (row 11)
    mov dx, 0x0A13    ; row 11, column (cursor position)
    mov bp, medrow11     ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
	
 ; Print on page 0 (row 12)
    mov dx, 0x0B13    ; row 12, column (cursor position)
    mov bp, medrow12     ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
	
 ; Print on page 0 (row 13, different color)
    mov bl, 0x05       ; change to new color (example: cyan)
    mov dx, 0x0C13    ; row 13, column (cursor position)
    mov bp, medrow13     ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
	
 ; Print on page 0 (row 14)
    mov bl, 0Eh       ; back to normal white on black attribute
    mov dx, 0x0D13    ; row 14, column (cursor position)
    mov bp, medrow14     ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
	
 ; Print on page 0 (row 15)
    mov dx, 0x0E13    ; row 15, column (cursor position)
    mov bp, medrow15     ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
	
 ; Print on page 0 (row 16, different color)
    mov dx, 0x0F13    ; row 16, column (cursor position)
    mov bp, medrow16     ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
	
 ; Print on page 0 (row 17)
    mov bl, 0x05       ; different colour
    mov dx, 0x1013    ; row 17, column (cursor position)
    mov bp, medrow17     ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
	
 ; Print on page 0 (row 18)
    mov bl,0x0E        ;back to normal colour
    mov dx, 0x1113    ; row 18, column (cursor position)
    mov bp, medrow18     ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
	
 ; Print on page 0 (row 19)
    mov dx, 0x1213    ; row 19, column (cursor position)
    mov bp, medrow19     ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
	
 ; Print on page 0 (row 20)
    mov dx, 0x1313    ; row 20, column (cursor position)
    mov bp, medrow20     ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
	
 ; Print on page 0 (row 21)
    mov bl, 0x05       ; different colour
    mov dx, 0x1413    ; row 21, column (cursor position)
    mov bp, medrow21     ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
	
 ; Print on page 0 (row 22)
     mov bl,0x0E        ;back to normal colour
    mov dx, 0x1513    ; row 22, column (cursor position)
    mov bp, medrow22     ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
	
 ; Print on page 0 (row 23)
    mov dx, 0x1613    ; row 23, column (cursor position)
    mov bp, medrow23     ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
	
	 ; Print on page 0 (row 23)
    mov dx, 0x1713    ; row 23, column (cursor position)
    mov bp, medrow24     ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
	
	 ; Print on page 0 (row 23)
	 mov bl,0x05
    mov dx, 0x1813    ; row 23, column (cursor position)
    mov bp, medrow25     ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
	
	ret
	
drawgrid_nextMed:

    mov ah, 0x13
    mov al, 1
    mov bh, 1
    mov bl, 0x0E
    mov dx, 0x0013
    mov cx, 37
    push cs
    pop es
    mov bp, medrow26
    int 0x10
    
	mov dx, 0x0113
    mov cx, 37
    mov bp, medrow27
    int 0x10

    mov dx, 0x0213
    mov cx, 37
    mov bp, medrow28
    int 0x10

    mov bl, 05h
    mov dx, 0x0313
    mov cx, 37
    mov bp, medrow29
    int 0x10

    mov bl, 0Eh
    mov dx, 0x0413
    mov cx, 37
    mov bp, medrow30
    int 0x10

    mov dx, 0x0513
    mov cx, 37
    mov bp, medrow31
    int 0x10

    mov dx, 0x0613
    mov cx, 37
    mov bp, medrow32
    int 0x10

    mov bl, 05h
    mov dx, 0x0713
    mov cx, 37
    mov bp, medrow33
    int 0x10

    mov bl, 0Eh
    mov dx, 0x0813
    mov cx, 37
    mov bp, medrow34
    int 0x10

    mov dx, 0x0913
    mov cx, 37
    mov bp, medrow35
    int 0x10

    mov dx, 0x0A13
    mov cx, 37
    mov bp, medrow36
    int 0x10

    mov bl, 05h
    mov dx, 0x0B13
    mov cx, 37
    mov bp, medrow37
    int 0x10
	
    ret

compute_grid_index_9m:
	cmp byte[page_num1] , 1
	je compute_grid_index_9m_page2
	
	cmp dh, 2
	je solution_row1_9m
	cmp dh,6
	je solution_row2_9m
	cmp dh,10
	je solution_row3_9m
	cmp dh,14
	je solution_row4_9m
	cmp dh,18
	je solution_row5_9m
	cmp dh,22
	je solution_row6_9m
	cmp dh,26
	je solution_row7_9m
	cmp dh,30
	je solution_row8_9m
	cmp dh,34
	je solution_row9_9m

compute_grid_index_9m_page2:
	
	cmp dh, 1
	je solution_row7_9m
	cmp dh, 5
	je solution_row8_9m
	cmp dh, 9
	je solution_row9_9m
	
solution_row1_9m:

	mov si,0
	jmp move_forward_9m       ;calculate the column

solution_row2_9m:

	mov si,9
	jmp move_forward_9m       ;calculate the column

solution_row3_9m:

	mov si,18
	jmp move_forward_9m       ;calculate the column
	
solution_row4_9m:

	mov si,27
	jmp move_forward_9m       ;calculate the column

solution_row5_9m:

	mov si,36
	jmp move_forward_9m       ;calculate the column

solution_row6_9m:

	mov si,45
	jmp move_forward_9m       ;calculate the column

solution_row7_9m:

	mov si,54
	jmp move_forward_9m       ;calculate the column
	
solution_row8_9m:

	mov si,63
	jmp move_forward_9m       ;calculate the column

solution_row9_9m:

	mov si,72
	jmp move_forward_9m

move_forward_9m:       

	cmp dl,21
	je solution_col1_9m
	cmp dl,25
	je solution_col2_9m
	cmp dl,29
	je solution_col3_9m
	cmp dl,33
	je solution_col4_9m
	cmp dl,37
	je solution_col5_9m
	cmp dl,41
	je solution_col6_9m
	cmp dl,45
	je solution_col7_9m
	cmp dl,49
	je solution_col8_9m
	cmp dl,53
	je solution_col9_9m
	
solution_col1_9m:

	mov bx,0
	jmp donewithit_9m
	
solution_col2_9m:

	mov bx,1
	jmp donewithit_9m
	
solution_col3_9m:

	mov bx,2
	jmp donewithit_9m
	
solution_col4_9m:

	mov bx,3
	jmp donewithit_9m
	
solution_col5_9m:

	mov bx,4
	jmp donewithit_9m
	
solution_col6_9m:

	mov bx,5
	jmp donewithit_9m
	
solution_col7_9m:

	mov bx,6
	jmp donewithit_9m
	
solution_col8_9m:

	mov bx,7
	jmp donewithit_9m

solution_col9_9m:

	mov bx,8
	
donewithit_9m:

	ret

validate_input_9m:

    call compute_grid_index_9m     ; Compute the index in AX
    mov al, [solution_grid_9x9_med + si + bx]  ; Load the solution value
    cmp al, 0                   ; Check if the cell is editable (0 means not editable)
    je invalid_input
    mov bl, al                  ; Store the solution value in BL
    ret                         ; Return with BL containing the solution value

	
cursor4: ; changed
    mov dh, 2
    mov dl, 21
    mov bh, 0
    mov ah, 2
    int 0x10
    ret
	
update_cursor_position11:

    mov ah, 2              ; Function to set cursor position
    int 0x10               ; BIOS interrupt to set cursor position
    ret

toggle_note_mode_2:

    mov al, [note_mode2]
    cmp  al, 1      
    jne enable_note_mode_2
    call disable_note_mode_2
    ret
	
enable_note_mode_2:

	cmp byte[page_num2], 1
	je enable_note_mode_2_2
    mov byte [note_mode2], 1   ; Enable note mode
    xor al, al                ; Reset AL to clear any leftover inputs
    xor ah, ah                ; Reset AH
    mov dh, 1                 ; Move cursor to the top-left corner
    mov dl, 20
    call update_cursor_position11
    ret
	
enable_note_mode_2_2:
    mov byte [note_mode2], 1   ; Enable note mode
    xor al, al                ; Reset AL to clear any leftover inputs
    xor ah, ah                ; Reset AH
    mov dh, 0                 ; Move cursor to the top-left corner
    mov dl, 20
    call update_cursor_position11
    ret

disable_note_mode_2:

	cmp byte[page_num2], 1
	je disable_note_mode_2_2
	
    mov byte [note_mode2], 0   ; Disable note mode
    xor al, al                ; Reset AL to prevent leftover input
    xor ah, ah                ; Reset AH
    mov dh, 2                 ; Move cursor to the default position
    mov dl, 21
    call update_cursor_position11
    ret

disable_note_mode_2_2:
    mov byte [note_mode2], 0   ; Disable note mode
    xor al, al                ; Reset AL to prevent leftover input
    xor ah, ah                ; Reset AH
    mov dh, 1                 ; Move cursor to the default position
    mov dl, 21
    call update_cursor_position11
    ret

handle_input9_1:

    mov ah, 0
    int 16h
    cmp al, 'n'                ; Toggle note mode
    je toggle_note_mode_2

    mov al, [note_mode2]
    cmp al, 1
    je handle_notes_2

    cmp ah, 0x48      ; Up
    je move_up9_2
    cmp ah, 0x4B      ; Left
    je move_left9_2
    cmp ah, 0x4D      ; Right
    je move_right9_2
    cmp ah, 0x50      ; Down
    je move_down9_2

    cmp ah, 0x02      ;'1'
    je insert_number9_1_9m
    cmp ah, 0x03      ; '2'
    je insert_number9_2_9m
    cmp ah, 0x04      ; '3'
    je insert_number9_3_9m
    cmp ah, 0x05      ; '4'
    je insert_number9_4_9m
	cmp ah, 0x06      ;'5'
    je insert_number9_5_9m
    cmp ah, 0x07      ; '6'
    je insert_number9_6_9m
    cmp ah, 0x08      ; '7'
    je insert_number9_7_9m
    cmp ah, 0x09     ; '8'
    je insert_number9_8_9m
	cmp ah, 0x0A     ; '9'
    je insert_number9_9_9m
	
	cmp ah, 0x13
	je restart
	cmp ah,0x10
	je endgame
	cmp ah,0x12
	je remove_number
	
	ret

handle_notes_2:
    cmp ah, 0x02               ; '1'
    je insert_note_1_9m
    cmp ah, 0x03               ; '2'
    je insert_note_2_9m
    cmp ah, 0x04               ; '3'
    je insert_note_3_9m
    cmp ah, 0x05               ; '4'
    je insert_note_4_9m
	cmp ah, 0x06               ; '5'
    je insert_note_5_9m
    cmp ah, 0x07               ; '6'
    je insert_note_6_9m
    cmp ah, 0x08               ; '7'
    je insert_note_7_9m
    cmp ah, 0x09               ; '8'
    je insert_note_8_9m
	cmp ah, 0x0A               ; '9'
    je insert_note_9_9m
	
    cmp ah, 0x48               ; Up arrow
    je note_move_up_9m
    cmp ah, 0x4B               ; Left arrow
    je note_move_left_9m
    cmp ah, 0x4D               ; Right arrow
    je note_move_right_9m
    cmp ah, 0x50               ; Down arrow
    je note_move_down_9m
    jmp handle_input9_1
	


note_move_up_9m:

    cmp byte [page_num2], 0        ; Check if we are on Page 1
    je check_top_row_note_page1_9m       ; If true, check if at the topmost row of Page 1

    cmp byte [page_num2], 1       ;_9m Check if we are on Page 2
    je check_top_row_note_page2_9m        ; If true, check if at the topmost row of Page 2

    ret                           ; If not on Page 1 or Page 2, do nothing

check_top_row_note_page1_9m:

    cmp dh, 1                     ; Check if at the topmost row of Page 1
    je handle_wrap_up_note_page1_9m      ; If true, handle wrap-around to Page 2

    sub dh, 4                     ; Move up one row
    call update_cursor_position11
    ret

check_top_row_note_page2_9m:

    cmp dh, 0               ; Check if at the topmost row of Page 2
    je handle_wrap_up_note_page2_9m       ; If true, handle wrap-around to Page 1

    sub dh, 4                     ; Move up one row
    call update_cursor_position11
    ret

handle_wrap_up_note_page1_9m:
     
    call move_page_note_down9_9m        
    mov dh, 8                    
    mov dl, 20                 
    call update_cursor_position11
    ret

handle_wrap_up_note_page2_9m:

    call move_page_note_up9_9m            ; Switch to Page 1
    mov dh, 21                    ; Set to the last row of Page 1
    mov dl, 20                    ; Stay in the same column
    call update_cursor_position11
    ret

move_page_note_up9_9m:

    mov byte [page_num2], 0  ; Switch to Page 1
	mov al, [page_num2]
    mov ah, 5               ; BIOS: Set Active Display Page
    int 10h
	mov dh,1
	mov dl,20
	mov bh,0
	call update_cursor_position11
    ret

move_page_note_down9_9m:

    mov byte [page_num2], 1  ; Switch to Page 2
	mov al, [page_num2]
    mov ah, 5               ; BIOS: Set Active Display Page
    int 10h
	
	mov dh,1
	mov dl,20
	mov bh,1
	call update_cursor_position11
    ret
	
note_move_down_9m:
 
    cmp byte [page_num2], 0        ; Check if we are on Page 1
    je check_bottom_row_note_page1_9m     ; If true, check if at the bottommost row of Page 1

    cmp byte [page_num2], 1        ; Check if we are on Page 2
    je check_bottom_row_note_page2_9m    ; If true, check if at the bottommost row of Page 2

    ret                           ; If not on Page 1 or Page 2, do nothing

check_bottom_row_note_page1_9m:

    cmp dh, 21                    ; Check if at the bottommost row of Page 1
    je handle_wrap_down_note_1_9m     ; If true, handle wrap-around to Page 2

    add dh, 4                     ; Move down one row
    call update_cursor_position11
    ret

check_bottom_row_note_page2_9m:

    cmp dh, 8                    ; Check if at the bottommost row of Page 2
    je handle_wrap_down_note_2_9m     ; If true, handle wrap-around to Page 1

    add dh, 4                     ; Move down one row
    call update_cursor_position11
    ret

handle_wrap_down_note_1_9m:

    call move_page_note_down9_9m           ; Switch to Page 2
    mov dh, 0                     
    mov dl, 20                  
    call update_cursor_position11
    ret

handle_wrap_down_note_2_9m:

    call move_page_note_up9_9m             ; Switch to Page 1
    mov dh, 1                     
    mov dl, 20                    
    call update_cursor_position11
    ret

note_move_left_9m:

    cmp dl, 21                ; Check if at the leftmost column of the grid
    jbe handle_input9_1          ; If yes, don't move further left
    sub dl, 4                 ; Move to the left corner of the previous 2x2 box
    call update_cursor_position11
    jmp handle_input9_1

note_move_right_9m:

    cmp dl, 52                ; Check if at the rightmost column of the grid
    jae handle_input9_1         ; If yes, don't move further right
    add dl, 4                 ; Move to the left corner of the next 2x2 box
    call update_cursor_position11
    jmp handle_input9_1
	
insert_note_1_9m:

	cmp byte [page_num2] , 1
	je insert_note_1_pg2_9m
	
    call check_number_below_right_9m ; Check for number with 0x4F attribute
    cmp al, 1                     ; If a number is found, skip inserting the note
    jne handle_input9_1

    mov ah, 0x09
    mov al, '1'
    mov bh, 0x00
    mov bl, 0x0A
    mov cx, 1
    int 0x10
    jmp handle_input9_1

insert_note_2_9m:
	cmp byte [page_num2] , 1
	je insert_note_2_pg2_9m
	
    call check_number_below_right_9m
    cmp al, 1
    jne handle_input9_1

    mov ah, 0x09
    mov al, '2'
    mov bh, 0x00
    mov bl, 0x0A
    mov cx, 1
    int 0x10
    jmp handle_input9_1

insert_note_3_9m:
	cmp byte [page_num2] , 1
	je insert_note_3_pg2_9m
	
    call check_number_below_right_9m
    cmp al, 1
    jne handle_input9_1

    mov ah, 0x09
    mov al, '3'
    mov bh, 0x00
    mov bl, 0x0A
    mov cx, 1
    int 0x10
    jmp handle_input9_1

insert_note_4_9m:
	cmp byte [page_num2] , 1
	je insert_note_4_pg2_9m
	
    call check_number_below_right_9m
    cmp al, 1
    jne handle_input9_1

    mov ah, 0x09
    mov al, '4'
    mov bh, 0x00
    mov bl, 0x0A
    mov cx, 1
    int 0x10
    jmp handle_input9_1

insert_note_5_9m:
	cmp byte [page_num2] , 1
	je insert_note_5_pg2_9m
	
    call check_number_below_right_9m ; Check for number with 0x4F attribute
    cmp al, 1                     ; If a number is found, skip inserting the note
    jne handle_input9_1

    mov ah, 0x09
    mov al, '5'
    mov bh, 0x00
    mov bl, 0x0A
    mov cx, 1
    int 0x10
    jmp handle_input9_1

insert_note_6_9m:
	cmp byte [page_num2] , 1
	je insert_note_6_pg2_9m
	
    call check_number_below_right_9m
    cmp al, 1
    jne handle_input9_1

    mov ah, 0x09
    mov al, '6'
    mov bh, 0x00
    mov bl, 0x0A
    mov cx, 1
    int 0x10
    jmp handle_input9_1

insert_note_7_9m:
	cmp byte [page_num2] , 1
	je insert_note_7_pg2_9m
	
    call check_number_below_right_9m
    cmp al, 1
    jne handle_input9_1

    mov ah, 0x09
    mov al, '7'
    mov bh, 0x00
    mov bl, 0x0A
    mov cx, 1
    int 0x10
    jmp handle_input9_1

insert_note_8_9m:
	cmp byte [page_num2] , 1
	je insert_note_8_pg2_9m
	
    call check_number_below_right_9m
    cmp al, 1
    jne handle_input9_1

    mov ah, 0x09
    mov al, '8'
    mov bh, 0x00
    mov bl, 0x0A
    mov cx, 1
    int 0x10
    jmp handle_input9_1

insert_note_9_9m:
	cmp byte [page_num2] , 1
	je insert_note_9_pg2_9m
	
    call check_number_below_right_9m
    cmp al, 1
    jne handle_input9_1

    mov ah, 0x09
    mov al, '9'
    mov bh, 0x00
    mov bl, 0x0A
    mov cx, 1
    int 0x10
    jmp handle_input9_1

;=================================================

insert_note_1_pg2_9m:

	call check_number_below_right_2_9m

    mov ah, 0x09
    mov al, '1'
    mov bh, 0x01
    mov bl, 0x0A
    mov cx, 1
    int 0x10
    jmp handle_input9_1

insert_note_2_pg2_9m:

    call check_number_below_right_2_9m

    mov ah, 0x09
    mov al, '2'
    mov bh, 0x01
    mov bl, 0x0A
    mov cx, 1
    int 0x10
    jmp handle_input9_1

insert_note_3_pg2_9m:
	call check_number_below_right_2_9m

    mov ah, 0x09
    mov al, '3'
    mov bh, 0x01
    mov bl, 0x0A
    mov cx, 1
    int 0x10
    jmp handle_input9_1

insert_note_4_pg2_9m:
	call check_number_below_right_2_9m

    mov ah, 0x09
    mov al, '4'
    mov bh, 0x01
    mov bl, 0x0A
    mov cx, 1
    int 0x10
    jmp handle_input9_1

insert_note_5_pg2_9m:
	call check_number_below_right_2_9m

    mov ah, 0x09
    mov al, '5'
    mov bh, 0x01
    mov bl, 0x0A
    mov cx, 1
    int 0x10
    jmp handle_input9_1

insert_note_6_pg2_9m:
	call check_number_below_right_2_9m

    mov ah, 0x09
    mov al, '6'
    mov bh, 0x01
    mov bl, 0x0A
    mov cx, 1
    int 0x10
    jmp handle_input9_1

insert_note_7_pg2_9m:
	call check_number_below_right_2_9m

    mov ah, 0x09
    mov al, '7'
    mov bh, 0x01
    mov bl, 0x0A
    mov cx, 1
    int 0x10
    jmp handle_input9_1

insert_note_8_pg2_9m:
	call check_number_below_right_2_9m

    mov ah, 0x09
    mov al, '8'
    mov bh, 0x01
    mov bl, 0x0A
    mov cx, 1
    int 0x10
    jmp handle_input9_1

insert_note_9_pg2_9m:

	call check_number_below_right_2_9m

    mov ah, 0x09
    mov al, '9'
    mov bh, 0x01
    mov bl, 0x0A
    mov cx, 1
    int 0x10
    jmp handle_input9_1
	
check_number_below_right_9m:
	
    mov byte [fazooldh2], dh    ; Save current row
    mov byte [fazooldl2], dl    ; Save current column

    add dh, 1                  ; Move to the row below
    add dl, 1                  ; Move to the column to the right
	
    cmp dh, 23               ; Check if row exceeds grid bounds
    ja invalid_position_9m
    cmp dl, 68                ; Check if column exceeds grid bounds
    ja invalid_position_9m

    ; Calculate video memory address for (row, column)
    mov ax, 0xB800             ; Base address of video memory
    mov es, ax                 ; Set ES to point to video memory

    ; Compute offset in memory for (dh, dl)
    xor bx, bx                 ; Clear BX
    mov al, dh                 ; Row number into AL
    mov ah, 0                  ; Clear upper byte of AX
    mov si, ax                 ; SI = row number
    shl si, 6                  ; Multiply row by 64 (2^6 = 64)
    mov di, ax                 ; DI = row number
    shl di, 4                  ; Multiply row by 16 (2^4 = 16)
    add si, di                 ; SI = row * 80 (64 + 16)
	xor dh,dh
    add si, dx                 ; Add column number to SI
    shl si, 1                  ; Multiply by 2 (character + attribute)

    ; Read character and attribute from video memory
    mov al, byte [es:si]       ; Read character at the position
    cmp al, 0x20               ; Is the character a space (' ')?
    jne no_attribute_found_9m

    mov ah, byte [es:si+1]     ; Read attribute at the position
    cmp ah, 0x0E               ; Does the attribute match 0x0E?
    jne no_attribute_found_9m
	

attribute_found_9m:

    mov al, 1                  ; Indicate valid space with 0x0E attribute found
    jmp restore_position_9m       ; Restore cursor position and return

no_attribute_found_9m:

    xor al, al                 ; Indicate no valid space with 0x0E attribute
    jmp restore_position_9m       ; Restore cursor position and return

invalid_position_9m:

    xor al, al                 ; Treat invalid positions as no valid space

restore_position_9m:

    ; Restore original cursor position
    mov dh, [fazooldh2]
    mov dl, [fazooldl2]
    ret                        ; Return with AL = 1 (valid) or 0 (not valid)
	
check_number_below_right_2_9m:

    mov byte [fazooldh2], dh    ; Save current row
    mov byte [fazooldl2], dl    ; Save current column

    ; Adjust for Page 2 boundaries
    add dh, 1                  ; Move to the row below
    add dl, 1                  ; Move to the column to the right

    cmp dh, 10                 ; Adjusted row boundary for Page 2 (0–9)
    ja invalid_position_9m
    cmp dl, 68                 ; Column boundary
    ja invalid_position_9m

    ; Calculate video memory address for (row, column)
    mov ax, 0xB800             ; Base address of video memory
    mov es, ax                 ; Set ES to point to video memory
	mov bh, 0x01

    ; Compute offset in memory for (dh, dl)
    mov al, dh                 ; Row number into AL
    mov ah, 0                  ; Clear upper byte of AX
    mov si, ax                 ; SI = row number
    shl si, 6                  ; Multiply row by 64 (2^6 = 64)
    mov di, ax                 ; DI = row number
    shl di, 4                  ; Multiply row by 16 (2^4 = 16)
    add si, di                 ; SI = row * 80 (64 + 16)
    add si, dx                 ; Add column number to SI
    shl si, 1                  ; Multiply by 2 (character + attribute)

    ; Read character and attribute from video memory
    mov al, byte [es:si]       ; Read character at the position
    cmp al, 0x20               ; Is the character a space (' ')? 
    jne no_attribute_found_9m

    mov ah, byte [es:si+1]     ; Read attribute at the position
    cmp ah, 0x4F               ; Does the attribute match 0x4F?
    jne no_attribute_found_9m

move_up9_2:

    cmp byte [page_num2], 0        ; Check if we are on Page 1
    je check_top_row_page1_9m        ; If true, check if at the topmost row of Page 1

    cmp byte [page_num2], 1       ; Check if we are on Page 2
    je check_top_row_page2_9m        ; If true, check if at the topmost row of Page 2

    ret                           ; If not on Page 1 or Page 2, do nothing

check_top_row_page1_9m:

    cmp dh, 2                     ; Check if at the topmost row of Page 1
    je handle_wrap_up_page1_9m      ; If true, handle wrap-around to Page 2

    sub dh, 4                     ; Move up one row
    call update_cursor_position11
    ret

check_top_row_page2_9m:

    cmp dh, 1               ; Check if at the topmost row of Page 2
    je handle_wrap_up_page2_9m      ; If true, handle wrap-around to Page 1

    sub dh, 4                     ; Move up one row
    call update_cursor_position11
    ret

handle_wrap_up_page1_9m:
     
    call move_page_down9_9m         
    mov dh, 9                    
    mov dl, 21                   
    call update_cursor_position11
    ret

handle_wrap_up_page2_9m:

    call move_page_up9_9m            ; Switch to Page 1
    mov dh, 22                    ; Set to the last row of Page 1
    mov dl, 21                    ; Stay in the same column
    call update_cursor_position11
    ret
	
move_down9_2:

    cmp byte [page_num2], 0        ; Check if we are on Page 1
    je check_bottom_row_page1_9m    ; If true, check if at the bottommost row of Page 1

    cmp byte [page_num2], 1        ; Check if we are on Page 2
    je check_bottom_row_page2_9m     ; If true, check if at the bottommost row of Page 2

    ret                           ; If not on Page 1 or Page 2, do nothing

check_bottom_row_page1_9m:

    cmp dh, 22                    ; Check if at the bottommost row of Page 1
    je handle_wrap_down_page1_9m     ; If true, handle wrap-around to Page 2

    add dh, 4                     ; Move down one row
    call update_cursor_position11
    ret

check_bottom_row_page2_9m:

    cmp dh, 9                    ; Check if at the bottommost row of Page 2
    je handle_wrap_down_page2_9m     ; If true, handle wrap-around to Page 1

    add dh, 4                     ; Move down one row
    call update_cursor_position11
    ret

handle_wrap_down_page1_9m:

    call move_page_down9_9m           ; Switch to Page 2
    mov dh, 1                     
    mov dl, 21                   
    call update_cursor_position11
    ret

handle_wrap_down_page2_9m:

    call move_page_up9_9m            ; Switch to Page 1
    mov dh, 2                     
    mov dl, 21                    
    call update_cursor_position11
    ret
	
; Move left with wrap-around
move_left9_2:

    cmp dl, 21              ; Check if at the leftmost column
    je handle_wrap_left9_9m
    sub dl, 4               ; Move left one column
    call update_cursor_position11
    ret

handle_wrap_left9_9m:

    mov dl, 53              ; Wrap to the rightmost column
    call update_cursor_position11
    ret

move_right9_2:

    cmp dl, 53              ; Check if at the rightmost column
    je handle_wrap_right9_9m
    add dl, 4               ; Move right one column
    call update_cursor_position11
    ret

handle_wrap_right9_9m:

    mov dl, 21              ; Wrap to the leftmost column
    call update_cursor_position11
    ret

move_page_up9_9m:

    mov byte [page_num2], 0  ; Switch to Page 1
	mov al, [page_num2]
    mov ah, 5               ; BIOS: Set Active Display Page
    int 10h
	mov dh,2
	mov dl,21
	mov bh,0
	call update_cursor_position11
    ret

move_page_down9_9m:

    mov byte [page_num2], 1  ; Switch to Page 2
	mov al, [page_num2]
    mov ah, 5               ; BIOS: Set Active Display Page
    int 10h
	
	mov dh,2
	mov dl,21
	mov bh,1
	call update_cursor_position11
    ret

invalid_number_9m:

    mov ah, 0x09
    mov al, ' '                 ; Display a space to clear the cell
    mov bh, 0x00
    mov bl, 0x0E                ; Red background
    mov cx, 1
    int 0x10
	
	inc byte[mistake_count]
	call mistake_sound
	
	mov ax,0x09
	push ax
	mov ax,0x47
	push ax
	mov ax,[mistake_count]
	push ax
	call printnum1
	
	cmp byte[mistake_count],3
	je lostbymistake
	
	call score_mistake_9e
	call update_cursor_position11
	
    jmp handle_input9_1
	
checkwin_9x9_med:

	cmp byte[correctinputs],57
	je game_won
	
	ret

insert_number9_1_9m:

	cmp byte[page_num2] , 1
	je insert_number9_1_9m_p2
	
	call validate_input_9m
	cmp bl, 1 
	jne invalid_number_9m
	call clear_notes           
    mov ah, 0x09     
    mov al, '1'       
    mov bl, 0x4F       
    mov cx, 1         
    int 0x10 
	call insertion_sound
	call display_score_increase_9e
	call update_cursor_position11
	inc byte[correctinputs]
	call checkrow_completion_9x9_p1
	call update_cursor_position10
	call checkcol_completion_9x9_med
	call checkwin_9x9_med
    jmp handle_input9_1

insert_number9_1_9m_p2:

    call validate_input_9m
	cmp bl, 1
	jne invalid_number_9m
	call clear_notes           
    mov ah, 0x09     
    mov al, '1'       
    mov bl, 0x4F  
	mov bh, 0x01
    mov cx, 1         
    int 0x10 
	call insertion_sound
	call display_score_increase_9e
	call update_cursor_position11
	inc byte[correctinputs]
	call checkrow_completion_9x9_p2_med
	call update_cursor_position10
	call checkcol_completion_9x9_med
	call checkwin_9x9_med
    jmp handle_input9_1	

insert_number9_2_9m:

	cmp byte[page_num2] , 1
	je insert_number9_2_9m_p2
	
    call validate_input_9m
	cmp bl, 2 
	jne invalid_number_9m
	call clear_notes           
    mov ah, 0x09     
    mov al, '2'       
    mov bl, 0x4F       
    mov cx, 1         
    int 0x10 
	call insertion_sound
	call display_score_increase_9e
	call update_cursor_position11
	inc byte[correctinputs]
	call checkrow_completion_9x9_p1
	call update_cursor_position10
	call checkcol_completion_9x9_med
	call checkwin_9x9_med
    jmp handle_input9_1

insert_number9_2_9m_p2:

    call validate_input_9m
	cmp bl, 2
	jne invalid_number_9m
	call clear_notes           
    mov ah, 0x09     
    mov al, '2'       
    mov bl, 0x4F  
	mov bh, 0x01
    mov cx, 1         
    int 0x10 
	call insertion_sound
	call display_score_increase_9e
	call update_cursor_position11
	inc byte[correctinputs]
	call checkrow_completion_9x9_p2_med
	call update_cursor_position10
	call checkcol_completion_9x9_med
	call checkwin_9x9_med
    jmp handle_input9_1	

insert_number9_3_9m:  

	cmp byte[page_num2] , 1
	je insert_number9_3_9m_p2
	
    call validate_input_9m
	cmp bl, 3 
	jne invalid_number_9m
	call clear_notes           
    mov ah, 0x09     
    mov al, '3'       
    mov bl, 0x4F       
    mov cx, 1         
    int 0x10 
	call insertion_sound
	call display_score_increase_9e
	call update_cursor_position11
	inc byte[correctinputs]
	call checkrow_completion_9x9_p1
	call update_cursor_position10
	call checkcol_completion_9x9_med
	call checkwin_9x9_med
    jmp handle_input9_1

insert_number9_3_9m_p2:

    call validate_input_9m
	cmp bl, 3
	jne invalid_number_9m
	call clear_notes           
    mov ah, 0x09     
    mov al, '3'       
    mov bl, 0x4F  
	mov bh, 0x01
    mov cx, 1         
    int 0x10 
	call insertion_sound
	call display_score_increase_9e
	call update_cursor_position11
	inc byte[correctinputs]
	call checkrow_completion_9x9_p2_med
	call update_cursor_position10
	call checkcol_completion_9x9_med
	call checkwin_9x9_med
    jmp handle_input9_1	

insert_number9_4_9m:

	cmp byte[page_num2] , 1
	je insert_number9_4_9m_p2
	
    call validate_input_9m
	cmp bl, 4 
	jne invalid_number_9m
	call clear_notes           
    mov ah, 0x09     
    mov al, '4'       
    mov bl, 0x4F       
    mov cx, 1         
    int 0x10 
	call insertion_sound
	call display_score_increase_9e
	call update_cursor_position11
	inc byte[correctinputs]
	call checkrow_completion_9x9_p1
	call update_cursor_position10
	call checkcol_completion_9x9_med
	call checkwin_9x9_med
    jmp handle_input9_1

insert_number9_4_9m_p2:

    call validate_input_9m
	cmp bl, 4
	jne invalid_number_9m
	call clear_notes           
    mov ah, 0x09     
    mov al, '4'       
    mov bl, 0x4F  
	mov bh, 0x01
    mov cx, 1         
    int 0x10 
	call insertion_sound
	call display_score_increase_9e
	call update_cursor_position11
	inc byte[correctinputs]
	call checkrow_completion_9x9_p2_med
	call update_cursor_position10
	call checkcol_completion_9x9_med
	call checkwin_9x9_med
    jmp handle_input9_1	
	
insert_number9_5_9m:

	cmp byte[page_num2] , 1
	je insert_number9_5_9m_p2
	
    call validate_input_9m
	cmp bl, 5 
	jne invalid_number_9m
	call clear_notes           
    mov ah, 0x09     
    mov al, '5'       
    mov bl, 0x4F       
    mov cx, 1         
    int 0x10 
	call insertion_sound
	call display_score_increase_9e
	call update_cursor_position11
	inc byte[correctinputs]
	call checkrow_completion_9x9_p1
	call update_cursor_position10
	call checkcol_completion_9x9_med
	call checkwin_9x9_med
    jmp handle_input9_1

insert_number9_5_9m_p2:

    call validate_input_9m
	cmp bl, 5
	jne invalid_number_9m
	call clear_notes           
    mov ah, 0x09     
    mov al, '5'       
    mov bl, 0x4F  
	mov bh, 0x01
    mov cx, 1         
    int 0x10 
	call insertion_sound
	call display_score_increase_9e
	call update_cursor_position11
	inc byte[correctinputs]
	call checkrow_completion_9x9_p2_med
	call update_cursor_position10
	call checkcol_completion_9x9_med
	call checkwin_9x9_med
    jmp handle_input9_1	

insert_number9_6_9m:

	cmp byte[page_num2] , 1
	je insert_number9_6_9m_p2
	
    call validate_input_9m
	cmp bl,6 
	jne invalid_number_9m
	call clear_notes           
    mov ah, 0x09     
    mov al, '6'       
    mov bl, 0x4F       
    mov cx, 1         
    int 0x10 
	call insertion_sound
	call display_score_increase_9e
	call update_cursor_position11
	inc byte[correctinputs]
	call checkrow_completion_9x9_p1
	call update_cursor_position10
	call checkcol_completion_9x9_med
	call checkwin_9x9_med
    jmp handle_input9_1

insert_number9_6_9m_p2:

    call validate_input_9m
	cmp bl, 6
	jne invalid_number_9m
	call clear_notes           
    mov ah, 0x09     
    mov al, '6'       
    mov bl, 0x4F  
	mov bh, 0x01
    mov cx, 1         
    int 0x10 
	call insertion_sound
	call display_score_increase_9e
	call update_cursor_position11
	inc byte[correctinputs]
	call checkrow_completion_9x9_p2_med
	call update_cursor_position10
	call checkcol_completion_9x9_med
	call checkwin_9x9_med
    jmp handle_input9_1	

insert_number9_7_9m:

	cmp byte[page_num2] , 1
	je insert_number9_7_9m_p2
	
    call validate_input_9m
	cmp bl, 7 
	jne invalid_number_9m
	call clear_notes           
    mov ah, 0x09     
    mov al, '7'       
    mov bl, 0x4F       
    mov cx, 1         
    int 0x10 
	call insertion_sound
	call display_score_increase_9e
	call update_cursor_position11
	inc byte[correctinputs]
	call checkrow_completion_9x9_p1
	call update_cursor_position10
	call checkcol_completion_9x9_med
	call checkwin_9x9_med
    jmp handle_input9_1

insert_number9_7_9m_p2:

    call validate_input_9m
	cmp bl, 7
	jne invalid_number_9m
	call clear_notes           
    mov ah, 0x09     
    mov al, '7'       
    mov bl, 0x4F  
	mov bh, 0x01
    mov cx, 1         
    int 0x10 
	call insertion_sound
	call display_score_increase_9e
	call update_cursor_position11
	inc byte[correctinputs]
	call checkrow_completion_9x9_p2_med
	call update_cursor_position10
	call checkcol_completion_9x9_med
	call checkwin_9x9_med
    jmp handle_input9_1	

insert_number9_8_9m:

	cmp byte[page_num2] , 1
	je insert_number9_8_9m_p2

    call validate_input_9m
	cmp bl, 8
	jne invalid_number_9m
	call clear_notes           
    mov ah, 0x09     
    mov al, '8'       
    mov bl, 0x4F       
    mov cx, 1         
    int 0x10 
	call insertion_sound
	call display_score_increase_9e
	call update_cursor_position11
	inc byte[correctinputs]
	call checkrow_completion_9x9_p1
	call update_cursor_position10
	call checkcol_completion_9x9_med
	call checkwin_9x9_med
    jmp handle_input9_1
	
insert_number9_8_9m_p2:

    call validate_input_9m
	cmp bl, 8
	jne invalid_number_9m
	call clear_notes           
    mov ah, 0x09     
    mov al, '8'       
    mov bl, 0x4F  
	mov bh, 0x01
    mov cx, 1         
    int 0x10 
	call insertion_sound
	call display_score_increase_9e
	call update_cursor_position11
	inc byte[correctinputs]
	call checkrow_completion_9x9_p2_med
	call update_cursor_position10
	call checkcol_completion_9x9_med
	call checkwin_9x9_med
    jmp handle_input9_1	

insert_number9_9_9m:

	cmp byte[page_num2] , 1
	je insert_number9_9_9m_p2
	
    call validate_input_9m
	cmp bl, 9
	jne invalid_number_9m
	call clear_notes           
    mov ah, 0x09     
    mov al, '9'       
    mov bl, 0x4F       
    mov cx, 1         
    int 0x10 
	call insertion_sound
	call display_score_increase_9e
	call update_cursor_position11
	inc byte[correctinputs]
	call checkrow_completion_9x9_p1
	call update_cursor_position10
	call checkcol_completion_9x9_med
	call checkwin_9x9_med
    jmp handle_input9_1

insert_number9_9_9m_p2:

    call validate_input_9m
	cmp bl, 9
	jne invalid_number_9m
	call clear_notes           
    mov ah, 0x09     
    mov al, '9'       
    mov bl, 0x4F 
	mov bh, 0x01
    mov cx, 1         
    int 0x10 
	call insertion_sound
	call display_score_increase_9e
	call update_cursor_position11
	inc byte[correctinputs]
	call checkrow_completion_9x9_p2_med
	call update_cursor_position10
	call checkcol_completion_9x9_med
	call checkwin_9x9_med
    jmp handle_input9_1
	
	;========================================================================;
	checkcol_completion_9x9_med:
	 cmp dl,21
	je col_1_m
	
	cmp dl,25
	je col_2_m
	
	cmp dl,29
	je col_3_m
	
	cmp dl,33
	je col_4_m
	
	cmp dl,37
	je col_5_m
	
	cmp dl,41
	je col_6_m
	
	cmp dl,45
	je col_7_m
	
	cmp dl,49
	je col_8_m
	
	cmp dl,53
	je col_9_m
	
	
	col_1_m:
	inc byte[col1_med_9]
	cmp byte[col1_med_9],9
	je completed_col_med_9
		jmp not_completed_9_med
	
	col_2_m:
	inc byte[col2_med_9]
	cmp byte[col2_med_9],9
	je completed_col_med_9
		jmp not_completed_9_med
	
	col_3_m:
	inc byte[col3_med_9]
	cmp byte[col3_med_9],9
	je completed_col_med_9
		jmp not_completed_9_med
	
	col_4_m:
	inc byte[col4_med_9]
	cmp byte[col4_med_9],9
	je completed_col_med_9
		jmp not_completed_9_med
	
	col_5_m:
	inc byte[col5_med_9]
	cmp byte[col5_med_9],9
	je completed_col_med_9
		jmp not_completed_9_med
	
	col_6_m:
	inc byte[col6_med_9]
	cmp byte[col6_med_9],9
	je completed_col_med_9
		jmp not_completed_9_med
	
	col_7_m:
	inc byte[col7_med_9]
	cmp byte[col7_med_9],9
	je completed_col_med_9
	jmp not_completed_9_med
	
	col_8_m:
	inc byte[col8_med_9]
	cmp byte[col8_med_9],9
	je completed_col_med_9
		jmp not_completed_9_med
	
	col_9_m:
	inc byte[col9_med_9]
	cmp byte[col9_med_9],9
	je completed_col_med_9
	jmp not_completed_9_med
	

completed_col_med_9:
call completion_sound


not_completed_9_med:
ret


checkrow_completion_9x9_p2_med:
	
   cmp dh,1
   je p2_row7_m
   
   cmp dh,5
   je p2_row8_m
   
   cmp dh,9
   je p2_row9_m
   
   p2_row7_m:
   inc byte[row7_med_9]
   cmp byte[row7_med_9],9
   je comp_p2_m
   jmp not_comp_p2_m
   
   p2_row8_m: 
   inc byte[row8_med_9]
   cmp byte[row8_med_9],9
   je comp_p2_m
   jmp not_comp_p2_m
   
   p2_row9_m:
   inc byte[row9_med_9]
   cmp byte[row9_med_9],9
   je comp_p2_m
   jmp not_comp_p2_m
   
   
   comp_p2_m:
   call completion_sound
   
   not_comp_p2_m:
   ret

;========================================================================;
	
; Check if a number is already present at the cursor position
check_attribute9x9_med_9e:

    push bx
    push dx

    mov ah, 0x08             ; BIOS function to read character and attribute
    int 0x10                 ; Perform the interrupt
    cmp al, ' '              ; Check if character is empty (space)
    je allow_input           ; If empty, allow input
    cmp ah, 0x0E             ; Compare attribute with yellow on black
    je deny_input            ; If true, deny input

save_column_position_9m:
    mov al, dl         ; Save the current column position to al
    ret

; Restore the saved column position
restore_column_position_9m:
    mov dl, al         ; Restore the saved column position from al
    ret
	
drawgrid99_9m:

	mov ah, 0x13    
    mov al, 1        
    mov bh, 0        
    mov bl, 03h     
    mov dx, 0x0204  
    mov cx, 11    
    push cs
    pop es          
    mov bp, restart_game
    int 0x10
		
	mov ah, 0x13     ; service 13h - print string
    mov al, 1        ; subservice 01 - update cursor
    mov bh, 0        ; output on page 0
    mov bl, 0x1     ; normal white on black attribute
    mov dx, 0x0090  ; row 4, column 31 (centered title position)
    mov cx, 8      ; length of the string
    push cs
    pop es           ; set ES to code segment
    mov bp, easy_msg_9top
    int 0x10         ; call BIOS video interrupt to print string
	
	mov ah, 0x13     ; service 13h - print string
    mov al, 1        ; subservice 01 - update cursor
    mov bh, 0        ; output on page 0
    mov bl, 0x1      ; normal white on black attribute
    mov dx, 0x0290 ; row 4, column 31 (centered title position)
    mov cx, 8     ; length of the string
    push cs
    pop es           ; set ES to code segment
    mov bp, easy_msg_9bottom
    int 0x10         ; call BIOS video interrupt to print string

	mov ah, 0x13     ; service 13h - print string
    mov al, 1        ; subservice 01 - update cursor
    mov bh, 0        ; output on page 0
    mov bl, 0x1   ; normal white on black attribute
    mov dx, 0x0191 ; row 4, column 31 (centered title position)
    mov cx, 6      ; length of the string
    push cs
    pop es           ; set ES to code segment
    mov bp, medium_msg
    int 0x10         ; call BIOS video interrupt to print string
	
	call print9x9_details
	
    ; Print on page 0(row1)
    mov ah, 0x13     ; service 13h - print string
    mov al, 1        ; subservice 01 - update cursor
    mov bh, 0        ; output on page 0
    mov bl, 0x05       ; normal white on black attribute
    mov dx, 0x0013     ; row 0, column  (cursor position)
    mov cx, 37       ; length of the string

    push cs
    pop es           ; set ES to code segment
    mov bp,medrow1  ; offset of the string
    int 0x10         ; call BIOS video interrupt to print string
	
	 ; Print on page 0 (row 2)
    mov bl, 0Eh       ; normal white on black attribute
    mov dx, 0x0113    ; row 2, column (cursor position)
    mov bp, medrow2      ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
	
 ; Print on page 0 (row 3)
    mov dx, 0x0213    ; row 3, column (cursor position)
    mov bp, medrow3      ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
	
 ; Print on page 0 (row 4)
    mov dx, 0x0313    ; row 4, column (cursor position)
    mov bp, medrow4      ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
	
 ; Print on page 0 (row 5, different color)
    mov bl, 0x05       ; change to new color (example: dark red)
    mov dx, 0x0413    ; row 5, column (cursor position)
    mov bp, medrow5      ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
	
 ; Print on page 0 (row 6)
    mov bl, 0Eh       ; back to normal white on black attribute
    mov dx, 0x0513    ; row 6, column (cursor position)
    mov bp, medrow6      ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
	
 ; Print on page 0 (row 7)
    mov dx, 0x0613    ; row 7, column (cursor position)
    mov bp, medrow7      ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
	
 ; Print on page 0 (row 8, different color)
    mov dx, 0x0713    ; row 8, column (cursor position)
    mov bp, medrow8      ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
	
 ; Print on page 0 (row 9)
    mov bl, 0x05       ; back to normal white on black attribute
    mov dx, 0x0813    ; row 9, column (cursor position)
    mov bp, medrow9      ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
	
 ; Print on page 0 (row 10)
    mov bl,0Eh        ; back to normal colour
    mov dx, 0x0913    ; row 10, column (cursor position)
    mov bp, medrow10     ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
	
 ; Print on page 0 (row 11)
    mov dx, 0x0A13    ; row 11, column (cursor position)
    mov bp, medrow11     ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
	
 ; Print on page 0 (row 12)
    mov dx, 0x0B13    ; row 12, column (cursor position)
    mov bp, medrow12     ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
	
 ; Print on page 0 (row 13, different color)
    mov bl, 0x05       ; change to new color (example: cyan)
    mov dx, 0x0C13    ; row 13, column (cursor position)
    mov bp, medrow13     ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
	
 ; Print on page 0 (row 14)
    mov bl, 0Eh       ; back to normal white on black attribute
    mov dx, 0x0D13    ; row 14, column (cursor position)
    mov bp, medrow14     ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
	
 ; Print on page 0 (row 15)
    mov dx, 0x0E13    ; row 15, column (cursor position)
    mov bp, medrow15     ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
	
 ; Print on page 0 (row 16, different color)
    mov dx, 0x0F13    ; row 16, column (cursor position)
    mov bp, medrow16     ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
	
 ; Print on page 0 (row 17)
    mov bl, 0x05       ; different colour
    mov dx, 0x1013    ; row 17, column (cursor position)
    mov bp, medrow17     ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
	
 ; Print on page 0 (row 18)
    mov bl,0x0E        ;back to normal colour
    mov dx, 0x1113    ; row 18, column (cursor position)
    mov bp, medrow18     ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
	
 ; Print on page 0 (row 19)
    mov dx, 0x1213    ; row 19, column (cursor position)
    mov bp, medrow19     ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
	
 ; Print on page 0 (row 20)
    mov dx, 0x1313    ; row 20, column (cursor position)
    mov bp, medrow20     ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
	
 ; Print on page 0 (row 21)
    mov bl, 0x05       ; different colour
    mov dx, 0x1413    ; row 21, column (cursor position)
    mov bp, medrow21     ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
	
 ; Print on page 0 (row 22)
     mov bl,0x0E        ;back to normal colour
    mov dx, 0x1513    ; row 22, column (cursor position)
    mov bp, medrow22     ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
	
 ; Print on page 0 (row 23)
    mov dx, 0x1613    ; row 23, column (cursor position)
    mov bp, medrow23     ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
	
	 ; Print on page 0 (row 23)
    mov dx, 0x1713    ; row 23, column (cursor position)
    mov bp, medrow24     ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
	
	 ; Print on page 0 (row 23)
	mov bl,0x05
    mov dx, 0x1813    ; row 23, column (cursor position)
    mov bp, medrow25     ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
	
	ret
	
drawgrid_nextMed_9m:

    mov ah, 0x13
    mov al, 1
    mov bh, 1
    mov bl, 0x0E
    mov dx, 0x0013
    mov cx, 37
    push cs
    pop es
    mov bp, medrow26
    int 0x10
    
	mov dx, 0x0113
    mov cx, 37
    mov bp, medrow27
    int 0x10

    mov dx, 0x0213
    mov cx, 37
    mov bp, medrow28
    int 0x10

    mov bl, 05h
    mov dx, 0x0313
    mov cx, 37
    mov bp, medrow29
    int 0x10

    mov bl, 0Eh
    mov dx, 0x0413
    mov cx, 37
    mov bp, medrow30
    int 0x10

    mov dx, 0x0513
    mov cx, 37
    mov bp, medrow31
    int 0x10

    mov dx, 0x0613
    mov cx, 37
    mov bp, medrow32
    int 0x10

    mov bl, 05h
    mov dx, 0x0713
    mov cx, 37
    mov bp, medrow33
    int 0x10

    mov bl, 0Eh
    mov dx, 0x0813
    mov cx, 37
    mov bp, medrow34
    int 0x10

    mov dx, 0x0913
    mov cx, 37
    mov bp, medrow35
    int 0x10

    mov dx, 0x0A13
    mov cx, 37
    mov bp, medrow36
    int 0x10

    mov bl, 05h
    mov dx, 0x0B13
    mov cx, 37
    mov bp, medrow37
    int 0x10
	
    ret
	
drawgrid9_medium:

	call clrscr
	call drawgrid_nextMed_9m
	call drawgrid99_9m
	   
    mov dh, 2          ; Start cursor row
    mov dl, 21         ; Start cursor column
    call update_cursor_position11
	
loopp2:

	call handle_input9_1
    jmp loopp2
	
	ret

	;======================== 9x9 HARD KA CODE ======================================

drawgrid99hard:
		
	mov ah, 0x13    
    mov al, 1        
    mov bh, 0        
    mov bl, 03h     
    mov dx, 0x0204  
    mov cx, 11    
    push cs
    pop es          
    mov bp, restart_game
    int 0x10

	mov ah, 0x13     ; service 13h - print string
    mov al, 1        ; subservice 01 - update cursor
    mov bh, 0        ; output on page 0
    mov bl, 0x4     ; normal white on black attribute
    mov dx, 0x0090  ; row 4, column 31 (centered title position)
    mov cx, 6     ; length of the string
    push cs
    pop es           ; set ES to code segment
    mov bp, easy_msg_9top
    int 0x10         ; call BIOS video interrupt to print string
	
	mov ah, 0x13     ; service 13h - print string
    mov al, 1        ; subservice 01 - update cursor
    mov bh, 0        ; output on page 0
    mov bl, 0x4      ; normal white on black attribute
    mov dx, 0x0290 ; row 4, column 31 (centered title position)
    mov cx, 6     ; length of the string
    push cs
    pop es           ; set ES to code segment
    mov bp, easy_msg_9bottom
    int 0x10         ; call BIOS video interrupt to print string

	mov ah, 0x13     ; service 13h - print string
    mov al, 1        ; subservice 01 - update cursor
    mov bh, 0        ; output on page 0
    mov bl, 0x4   ; normal white on black attribute
    mov dx, 0x0191 ; row 4, column 31 (centered title position)
    mov cx, 4     ; length of the string
    push cs
    pop es           ; set ES to code segment
    mov bp, hard_msg
    int 0x10         ; call BIOS video interrupt to print string
	
		
    call print9x9_details
	
    ; Print on page 0(row1)
    mov ah, 0x13     ; service 13h - print string
    mov al, 1        ; subservice 01 - update cursor
    mov bh, 0        ; output on page 0
    mov bl, 0x05       ; normal white on black attribute
    mov dx, 0x0013     ; row 0, column  (cursor position)
    mov cx, 37       ; length of the string

    push cs
    pop es           ; set ES to code segment
    mov bp,hardrow1  ; offset of the string
    int 0x10         ; call BIOS video interrupt to print string
	
	 ; Print on page 0 (row 2)
    mov bl, 0Eh       ; normal white on black attribute
    mov dx, 0x0113    ; row 2, column (cursor position)
    mov bp, hardrow2      ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
	
 ; Print on page 0 (row 3)
    mov dx, 0x0213    ; row 3, column (cursor position)
    mov bp, hardrow3      ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
	
 ; Print on page 0 (row 4)
    mov dx, 0x0313    ; row 4, column (cursor position)
    mov bp, hardrow4      ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
	
 ; Print on page 0 (row 5, different color)
    mov bl, 0x05       ; change to new color (example: dark red)
    mov dx, 0x0413    ; row 5, column (cursor position)
    mov bp,hardrow5      ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
	
 ; Print on page 0 (row 6)
    mov bl, 0Eh       ; back to normal white on black attribute
    mov dx, 0x0513    ; row 6, column (cursor position)
    mov bp, hardrow6      ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
	
 ; Print on page 0 (row 7)
    mov dx, 0x0613    ; row 7, column (cursor position)
    mov bp, hardrow7      ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
	
 ; Print on page 0 (row 8, different color)
    mov dx, 0x0713    ; row 8, column (cursor position)
    mov bp, hardrow8      ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
	
 ; Print on page 0 (row 9)
    mov bl, 0x05       ; back to normal white on black attribute
    mov dx, 0x0813    ; row 9, column (cursor position)
    mov bp, hardrow9      ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
	
 ; Print on page 0 (row 10)
    mov bl,0Eh        ; back to normal colour
    mov dx, 0x0913    ; row 10, column (cursor position)
    mov bp, hardrow10     ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
	
 ; Print on page 0 (row 11)
    mov dx, 0x0A13    ; row 11, column (cursor position)
    mov bp, hardrow11     ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
	
 ; Print on page 0 (row 12)
    mov dx, 0x0B13    ; row 12, column (cursor position)
    mov bp, hardrow12     ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
	
 ; Print on page 0 (row 13, different color)
    mov bl, 0x05       ; change to new color (example: cyan)
    mov dx, 0x0C13    ; row 13, column (cursor position)
    mov bp, hardrow13     ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
	
 ; Print on page 0 (row 14)
    mov bl, 0Eh       ; back to normal white on black attribute
    mov dx, 0x0D13    ; row 14, column (cursor position)
    mov bp, hardrow14     ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
	
 ; Print on page 0 (row 15)
    mov dx, 0x0E13    ; row 15, column (cursor position)
    mov bp, hardrow15     ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
	
 ; Print on page 0 (row 16, different color)
    mov dx, 0x0F13    ; row 16, column (cursor position)
    mov bp, hardrow16     ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
	
 ; Print on page 0 (row 17)
    mov bl, 0x05       ; different colour
    mov dx, 0x1013    ; row 17, column (cursor position)
    mov bp, hardrow17     ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
	
 ; Print on page 0 (row 18)
    mov bl,0x0E        ;back to normal colour
    mov dx, 0x1113    ; row 18, column (cursor position)
    mov bp, hardrow18     ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
	
 ; Print on page 0 (row 19)
    mov dx, 0x1213    ; row 19, column (cursor position)
    mov bp, hardrow19     ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
	
 ; Print on page 0 (row 20)
    mov dx, 0x1313    ; row 20, column (cursor position)
    mov bp, hardrow20     ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
	
 ; Print on page 0 (row 21)
    mov bl, 0x05       ; different colour
    mov dx, 0x1413    ; row 21, column (cursor position)
    mov bp, hardrow21     ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
	
 ; Print on page 0 (row 22)
     mov bl,0x0E        ;back to normal colour
    mov dx, 0x1513    ; row 22, column (cursor position)
    mov bp, hardrow22     ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
	
 ; Print on page 0 (row 23)
    mov dx, 0x1613    ; row 23, column (cursor position)
    mov bp, hardrow23     ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
	
	 ; Print on page 0 (row 23)
    mov dx, 0x1713    ; row 23, column (cursor position)
    mov bp, hardrow24     ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
	
	 ; Print on page 0 (row 23)
	mov bl,0x05
    mov dx, 0x1813    ; row 23, column (cursor position)
    mov bp, hardrow25     ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
    ret

drawgrid_nextHard:
		
	mov ah, 0x13     ; service 13h - print string
	mov al, 1        ; subservice 01 - update cursor
	mov bh, 1        ; output on page 0
	mov bl, 0Eh       ; normal white on black attribute
	mov dx, 0x0013    ; row 0, column  (cursor position)
	mov cx, 37       ; length of the string

	push cs
	pop es           ; set ES to code segment
	mov bp,hardrow26  ; offset of the string
	int 0x10         ; call BIOS video interrupt to print string
		
	mov dx, 0x0113    ; row 0, column  (cursor position)
	mov cx, 37       ; length of the string
	mov bp,hardrow27  ; offset of the string
	int 0x10         ; call BIOS video interrupt to print string
		
	mov dx, 0x0213    ; row 0, column  (cursor position)
	mov cx, 37       ; length of the string
	mov bp,hardrow28  ; offset of the string
	int 0x10         ; call BIOS video interrupt to print string
		
	mov bl, 05h       ; purple attribute
	mov dx, 0x0313    ; row 0, column  (cursor position)
	mov cx, 37       ; length of the string
	mov bp,hardrow29  ; offset of the string
	int 0x10         ; call BIOS video interrupt to print string
		
	mov bl, 0Eh       ; normal white on black attribute
	mov dx, 0x0413    ; row 0, column  (cursor position)
	mov cx, 37       ; length of the string
	mov bp,hardrow30  ; offset of the string
	int 0x10         ; call BIOS video interrupt to print string

	mov dx, 0x0513    ; row 0, column  (cursor position)
	mov cx, 37       ; length of the string
	mov bp,hardrow31  ; offset of the string
	int 0x10         ; call BIOS video interrupt to print string
		
	mov dx, 0x0613    ; row 0, column  (cursor position)
	mov cx, 37       ; length of the string
	mov bp,hardrow32  ; offset of the string
	int 0x10         ; call BIOS video interrupt to print string
		
	mov bl, 05h       ;  purple attribute
	mov dx, 0x0713    ; row 0, column  (cursor position)
	mov cx, 37       ; length of the string
	mov bp,hardrow33  ; offset of the string
	int 0x10         ; call BIOS video interrupt to print string
		
	mov bl, 0Eh       ; normal white on black attribute
	mov dx, 0x0813    ; row 0, column  (cursor position)
	mov cx, 37       ; length of the string
	mov bp,hardrow34  ; offset of the string
	int 0x10         ; call BIOS video interrupt to print string
		
	mov dx, 0x0913    ; row 0, column  (cursor position)
	mov cx, 37       ; length of the string
	mov bp,hardrow35  ; offset of the string
	int 0x10         ; call BIOS video interrupt to print string
		
	mov dx, 0x0A13    ; row 0, column  (cursor position)
	mov cx, 37       ; length of the string
	mov bp,hardrow36  ; offset of the string
	int 0x10         ; call BIOS video interrupt to print string
		
		;last row   
	mov bl, 05h      ; normal white on black attribute
	mov dx, 0x0B13    ; row 0, column  (cursor position)
	mov cx, 37       ; length of the string
	mov bp,hardrow37  ; offset of the string
	int 0x10         ; call BIOS video interrupt to print string

    ret

compute_grid_index_9h:

	cmp byte[page_num3] , 1
	je compute_grid_index_9h_page2
	
	cmp dh, 2
	je solution_row1_9h
	cmp dh,6
	je solution_row2_9h
	cmp dh,10
	je solution_row3_9h
	cmp dh,14
	je solution_row4_9h
	cmp dh,18
	je solution_row5_9h
	cmp dh,22
	je solution_row6_9h
	cmp dh,26
	je solution_row7_9h
	cmp dh,30
	je solution_row8_9h
	cmp dh,34
	je solution_row9_9h

compute_grid_index_9h_page2:
	
	cmp dh, 1
	je solution_row7_9h
	cmp dh, 5
	je solution_row8_9h
	cmp dh, 9
	je solution_row9_9h
	
solution_row1_9h:

	mov si,0
	jmp move_forward_9h       ;calculate the column

solution_row2_9h:

	mov si,9
	jmp move_forward_9h       ;calculate the column

solution_row3_9h:

	mov si,18
	jmp move_forward_9h       ;calculate the column
	
solution_row4_9h:

	mov si,27
	jmp move_forward_9h       ;calculate the column

solution_row5_9h:

	mov si,36
	jmp move_forward_9h       ;calculate the column

solution_row6_9h:

	mov si,45
	jmp move_forward_9h       ;calculate the column

solution_row7_9h:

	mov si,54
	jmp move_forward_9h       ;calculate the column
	
solution_row8_9h:

	mov si,63
	jmp move_forward_9h       ;calculate the column

solution_row9_9h:

	mov si,72
	jmp move_forward_9h

move_forward_9h:       

	cmp dl,21
	je solution_col1_9h
	cmp dl,25
	je solution_col2_9h
	cmp dl,29
	je solution_col3_9h
	cmp dl,33
	je solution_col4_9h
	cmp dl,37
	je solution_col5_9h
	cmp dl,41
	je solution_col6_9h
	cmp dl,45
	je solution_col7_9h
	cmp dl,49
	je solution_col8_9h
	cmp dl,53
	je solution_col9_9h
	
solution_col1_9h:

	mov bx,0
	jmp donewithit_9h
	
solution_col2_9h:

	mov bx,1
	jmp donewithit_9h
	
solution_col3_9h:

	mov bx,2
	jmp donewithit_9h
	
solution_col4_9h:

	mov bx,3
	jmp donewithit_9h
	
solution_col5_9h:

	mov bx,4
	jmp donewithit_9h
	
solution_col6_9h:

	mov bx,5
	jmp donewithit_9h
	
solution_col7_9h:

	mov bx,6
	jmp donewithit_9h
	
solution_col8_9h:

	mov bx,7
	jmp donewithit_9h

solution_col9_9h:

	mov bx,8
	
donewithit_9h:

	ret

validate_input_9h:

    call compute_grid_index_9h     ; Compute the index in AX
    mov al, [solution_grid_9x9_hard+ si + bx]  ; Load the solution value
    cmp al, 0                   ; Check if the cell is editable (0 means not editable)
    je invalid_input
    mov bl, al                  ; Store the solution value in BL
    ret                         ; Return with BL containing the solution value
	
cursor5: ; changed
    mov dh, 2
    mov dl, 21
    mov bh, 0
    mov ah, 2
    int 0x10
    ret
	
update_cursor_position12:

    mov ah, 2              ; Function to set cursor position
    int 0x10               ; BIOS interrupt to set cursor position
    ret

toggle_note_mode_3:

    mov al, [note_mode3]
    cmp  al, 1      
    jne enable_note_mode_3
    call disable_note_mode_3
    ret
	
enable_note_mode_3:

	cmp byte[page_num3], 1
	je enable_note_mode_2_3
    mov byte [note_mode3], 1   ; Enable note mode
    xor al, al                ; Reset AL to clear any leftover inputs
    xor ah, ah                ; Reset AH
    mov dh, 1                 ; Move cursor to the top-left corner
    mov dl, 20
    call update_cursor_position12
    ret
	
enable_note_mode_2_3:
    mov byte [note_mode3], 1   ; Enable note mode
    xor al, al                ; Reset AL to clear any leftover inputs
    xor ah, ah                ; Reset AH
    mov dh, 0                 ; Move cursor to the top-left corner
    mov dl, 20
    call update_cursor_position12
    ret

disable_note_mode_3:

	cmp byte[page_num3], 1
	je disable_note_mode_2_3
	
    mov byte [note_mode3], 0   ; Disable note mode
    xor al, al                ; Reset AL to prevent leftover input
    xor ah, ah                ; Reset AH
    mov dh, 2                 ; Move cursor to the default position
    mov dl, 21
    call update_cursor_position12
    ret

disable_note_mode_2_3:
    mov byte [note_mode3], 0   ; Disable note mode
    xor al, al                ; Reset AL to prevent leftover input
    xor ah, ah                ; Reset AH
    mov dh, 1                ; Move cursor to the default position
    mov dl, 21
    call update_cursor_position12
    ret

handle_input9_2:

    mov ah, 0
    int 16h
    cmp al, 'n'                ; Toggle note mode
    je toggle_note_mode_3

    mov al, [note_mode3]
    cmp al, 1
    je handle_notes_3

    cmp ah, 0x48      ; Up
    je move_up9_3
    cmp ah, 0x4B      ; Left
    je move_left9_3
    cmp ah, 0x4D      ; Right
    je move_right9_3
    cmp ah, 0x50      ; Down
    je move_down9_3

    cmp ah, 0x02      ;'1'
    je insert_number9_1_9h
    cmp ah, 0x03      ; '2'
    je insert_number9_2_9h
    cmp ah, 0x04      ; '3'
    je insert_number9_3_9h
    cmp ah, 0x05      ; '4'
    je insert_number9_4_9h
	cmp ah, 0x06      ;'5'
    je insert_number9_5_9h
    cmp ah, 0x07      ; '6'
    je insert_number9_6_9h
    cmp ah, 0x08      ; '7'
    je insert_number9_7_9h
    cmp ah, 0x09     ; '8'
    je insert_number9_8_9h
	cmp ah, 0x0A     ; '9'
    je insert_number9_9_9h
	
	cmp ah, 0x13
	je restart
	cmp ah,0x10
	je endgame
	cmp ah,0x12
	je remove_number
	
	ret

handle_notes_3:
    cmp ah, 0x02               ; '1'
    je insert_note_1_9h
    cmp ah, 0x03               ; '2'
    je insert_note_2_9h
    cmp ah, 0x04               ; '3'
    je insert_note_3_9h
    cmp ah, 0x05               ; '4'
    je insert_note_4_9h
	cmp ah, 0x06               ; '5'
    je insert_note_5_9h
    cmp ah, 0x07               ; '6'
    je insert_note_6_9h
    cmp ah, 0x08               ; '7'
    je insert_note_7_9h
    cmp ah, 0x09               ; '8'
    je insert_note_8_9h
	cmp ah, 0x0A               ; '9'
    je insert_note_9_9h
	
    cmp ah, 0x48               ; Up arrow
    je note_move_up_9h
    cmp ah, 0x4B               ; Left arrow
    je note_move_left_9h
    cmp ah, 0x4D               ; Right arrow
    je note_move_right_9h
    cmp ah, 0x50               ; Down arrow
    je note_move_down_9h
    jmp handle_input9_2
	


note_move_up_9h:

    cmp byte [page_num3], 0        ; Check if we are on Page 1
    je check_top_row_note_page1_9h       ; If true, check if at the topmost row of Page 1

    cmp byte [page_num3], 1       ;_9h Check if we are on Page 2
    je check_top_row_note_page2_9h        ; If true, check if at the topmost row of Page 2

    ret                           ; If not on Page 1 or Page 2, do nothing

check_top_row_note_page1_9h:

    cmp dh, 1                     ; Check if at the topmost row of Page 1
    je handle_wrap_up_note_page1_9h      ; If true, handle wrap-around to Page 2

    sub dh, 4                     ; Move up one row
    call update_cursor_position12
    ret

check_top_row_note_page2_9h:

    cmp dh, 0               ; Check if at the topmost row of Page 2
    je handle_wrap_up_note_page2_9h       ; If true, handle wrap-around to Page 1

    sub dh, 4                     ; Move up one row
    call update_cursor_position12
    ret

handle_wrap_up_note_page1_9h:
     
    call move_page_note_down9_9h        
    mov dh, 8                    
    mov dl, 20                 
    call update_cursor_position12
    ret

handle_wrap_up_note_page2_9h:

    call move_page_note_up9_9h            ; Switch to Page 1
    mov dh, 21                    ; Set to the last row of Page 1
    mov dl, 20                    ; Stay in the same column
    call update_cursor_position12
    ret

move_page_note_up9_9h:

    mov byte [page_num3], 0  ; Switch to Page 1
	mov al, [page_num3]
    mov ah, 5               ; BIOS: Set Active Display Page
    int 10h
	mov dh,1
	mov dl,20
	mov bh,0
	call update_cursor_position12
    ret

move_page_note_down9_9h:

    mov byte [page_num3], 1  ; Switch to Page 2
	mov al, [page_num3]
    mov ah, 5               ; BIOS: Set Active Display Page
    int 10h
	
	mov dh,1
	mov dl,20
	mov bh,1
	call update_cursor_position12
    ret
	
note_move_down_9h:
 
    cmp byte [page_num3], 0        ; Check if we are on Page 1
    je check_bottom_row_note_page1_9h     ; If true, check if at the bottommost row of Page 1

    cmp byte [page_num3], 1        ; Check if we are on Page 2
    je check_bottom_row_note_page2_9h    ; If true, check if at the bottommost row of Page 2

    ret                           ; If not on Page 1 or Page 2, do nothing

check_bottom_row_note_page1_9h:

    cmp dh, 21                    ; Check if at the bottommost row of Page 1
    je handle_wrap_down_note_1_9h     ; If true, handle wrap-around to Page 2

    add dh, 4                     ; Move down one row
    call update_cursor_position12
    ret

check_bottom_row_note_page2_9h:

    cmp dh, 8                    ; Check if at the bottommost row of Page 2
    je handle_wrap_down_note_2_9h     ; If true, handle wrap-around to Page 1

    add dh, 4                     ; Move down one row
    call update_cursor_position12
    ret

handle_wrap_down_note_1_9h:

    call move_page_note_down9_9h           ; Switch to Page 2
    mov dh, 0                     
    mov dl, 20                  
    call update_cursor_position12
    ret

handle_wrap_down_note_2_9h:

    call move_page_note_up9_9h             ; Switch to Page 1
    mov dh, 1                     
    mov dl, 20                    
    call update_cursor_position12
    ret

note_move_left_9h:

    cmp dl, 21                ; Check if at the leftmost column of the grid
    jbe handle_input9_2          ; If yes, don't move further left
    sub dl, 4                 ; Move to the left corner of the previous 2x2 box
    call update_cursor_position12
    jmp handle_input9_2

note_move_right_9h:

    cmp dl, 52                ; Check if at the rightmost column of the grid
    jae handle_input9_2         ; If yes, don't move further right
    add dl, 4                 ; Move to the left corner of the next 2x2 box
    call update_cursor_position12
    jmp handle_input9_2
	
insert_note_1_9h:

	cmp byte [page_num2] , 1
	je insert_note_1_pg2_9h
	
    call check_number_below_right_9h ; Check for number with 0x4F attribute
    cmp al, 1                     ; If a number is found, skip inserting the note
    jne handle_input9_2

    mov ah, 0x09
    mov al, '1'
    mov bh, 0x00
    mov bl, 0x0A
    mov cx, 1
    int 0x10
    jmp handle_input9_2

insert_note_2_9h:
	cmp byte [page_num3] , 1
	je insert_note_2_pg2_9h
	
    call check_number_below_right_9h
    cmp al, 1
    jne handle_input9_2

    mov ah, 0x09
    mov al, '2'
    mov bh, 0x00
    mov bl, 0x0A
    mov cx, 1
    int 0x10
    jmp handle_input9_2

insert_note_3_9h:
	cmp byte [page_num3] , 1
	je insert_note_3_pg2_9h
	
    call check_number_below_right_9h
    cmp al, 1
    jne handle_input9_2

    mov ah, 0x09
    mov al, '3'
    mov bh, 0x00
    mov bl, 0x0A
    mov cx, 1
    int 0x10
    jmp handle_input9_2

insert_note_4_9h:
	cmp byte [page_num3] , 1
	je insert_note_4_pg2_9h
	
    call check_number_below_right_9h
    cmp al, 1
    jne handle_input9_2

    mov ah, 0x09
    mov al, '4'
    mov bh, 0x00
    mov bl, 0x0A
    mov cx, 1
    int 0x10
    jmp handle_input9_2

insert_note_5_9h:
	cmp byte [page_num3] , 1
	je insert_note_5_pg2_9h
	
    call check_number_below_right_9h ; Check for number with 0x4F attribute
    cmp al, 1                     ; If a number is found, skip inserting the note
    jne handle_input9_2

    mov ah, 0x09
    mov al, '5'
    mov bh, 0x00
    mov bl, 0x0A
    mov cx, 1
    int 0x10
    jmp handle_input9_2

insert_note_6_9h:
	cmp byte [page_num3] , 1
	je insert_note_6_pg2_9h
	
    call check_number_below_right_9h
    cmp al, 1
    jne handle_input9_2

    mov ah, 0x09
    mov al, '6'
    mov bh, 0x00
    mov bl, 0x0A
    mov cx, 1
    int 0x10
    jmp handle_input9_2

insert_note_7_9h:
	cmp byte [page_num3] , 1
	je insert_note_7_pg2_9h
	
    call check_number_below_right_9h
    cmp al, 1
    jne handle_input9_2

    mov ah, 0x09
    mov al, '7'
    mov bh, 0x00
    mov bl, 0x0A
    mov cx, 1
    int 0x10
    jmp handle_input9_2

insert_note_8_9h:
	cmp byte [page_num3] , 1
	je insert_note_8_pg2_9h
	
    call check_number_below_right_9h
    cmp al, 1
    jne handle_input9_2

    mov ah, 0x09
    mov al, '8'
    mov bh, 0x00
    mov bl, 0x0A
    mov cx, 1
    int 0x10
    jmp handle_input9_2

insert_note_9_9h:
	cmp byte [page_num3] , 1
	je insert_note_9_pg2_9h
	
    call check_number_below_right_9h
    cmp al, 1
    jne handle_input9_2

    mov ah, 0x09
    mov al, '9'
    mov bh, 0x00
    mov bl, 0x0A
    mov cx, 1
    int 0x10
    jmp handle_input9_2

;=================================================

insert_note_1_pg2_9h:

	call check_number_below_right_2_9h

    mov ah, 0x09
    mov al, '1'
    mov bh, 0x01
    mov bl, 0x0A
    mov cx, 1
    int 0x10
    jmp handle_input9_2

insert_note_2_pg2_9h:

    call check_number_below_right_2_9h

    mov ah, 0x09
    mov al, '2'
    mov bh, 0x01
    mov bl, 0x0A
    mov cx, 1
    int 0x10
    jmp handle_input9_2

insert_note_3_pg2_9h:
	call check_number_below_right_2_9h

    mov ah, 0x09
    mov al, '3'
    mov bh, 0x01
    mov bl, 0x0A
    mov cx, 1
    int 0x10
    jmp handle_input9_2

insert_note_4_pg2_9h:
	call check_number_below_right_2_9h

    mov ah, 0x09
    mov al, '4'
    mov bh, 0x01
    mov bl, 0x0A
    mov cx, 1
    int 0x10
    jmp handle_input9_2

insert_note_5_pg2_9h:
	call check_number_below_right_2_9h

    mov ah, 0x09
    mov al, '5'
    mov bh, 0x01
    mov bl, 0x0A
    mov cx, 1
    int 0x10
    jmp handle_input9_2

insert_note_6_pg2_9h:
	call check_number_below_right_2_9h

    mov ah, 0x09
    mov al, '6'
    mov bh, 0x01
    mov bl, 0x0A
    mov cx, 1
    int 0x10
    jmp handle_input9_2

insert_note_7_pg2_9h:
	call check_number_below_right_2_9h

    mov ah, 0x09
    mov al, '7'
    mov bh, 0x01
    mov bl, 0x0A
    mov cx, 1
    int 0x10
    jmp handle_input9_2

insert_note_8_pg2_9h:
	call check_number_below_right_2_9h

    mov ah, 0x09
    mov al, '8'
    mov bh, 0x01
    mov bl, 0x0A
    mov cx, 1
    int 0x10
    jmp handle_input9_2

insert_note_9_pg2_9h:

	call check_number_below_right_2_9h

    mov ah, 0x09
    mov al, '9'
    mov bh, 0x01
    mov bl, 0x0A
    mov cx, 1
    int 0x10
    jmp handle_input9_2
	
check_number_below_right_9h:
	
    mov byte [fazooldh3], dh    ; Save current row
    mov byte [fazooldl3], dl    ; Save current column

    add dh, 1                  ; Move to the row below
    add dl, 1                  ; Move to the column to the right
	
    cmp dh, 23               ; Check if row exceeds grid bounds
    ja invalid_position_9h
    cmp dl, 68                 ; Check if column exceeds grid bounds
    ja invalid_position_9h

    ; Calculate video memory address for (row, column)
    mov ax, 0xB800             ; Base address of video memory
    mov es, ax                 ; Set ES to point to video memory

    ; Compute offset in memory for (dh, dl)
    xor bx, bx                 ; Clear BX
    mov al, dh                 ; Row number into AL
    mov ah, 0                  ; Clear upper byte of AX
    mov si, ax                 ; SI = row number
    shl si, 6                  ; Multiply row by 64 (2^6 = 64)
    mov di, ax                 ; DI = row number
    shl di, 4                  ; Multiply row by 16 (2^4 = 16)
    add si, di                 ; SI = row * 80 (64 + 16)
	xor dh,dh
    add si, dx                 ; Add column number to SI
    shl si, 1                  ; Multiply by 2 (character + attribute)

    ; Read character and attribute from video memory
    mov al, byte [es:si]       ; Read character at the position
    cmp al, 0x20               ; Is the character a space (' ')?
    jne no_attribute_found_9h

    mov ah, byte [es:si+1]     ; Read attribute at the position
    cmp ah, 0x0E               ; Does the attribute match 0x0E?
    jne no_attribute_found_9h
	

attribute_found_9h:

    mov al, 1                  ; Indicate valid space with 0x0E attribute found
    jmp restore_position_9h       ; Restore cursor position and return

no_attribute_found_9h:

    xor al, al                 ; Indicate no valid space with 0x0E attribute
    jmp restore_position_9h       ; Restore cursor position and return

invalid_position_9h:

    xor al, al                 ; Treat invalid positions as no valid space

restore_position_9h:

    ; Restore original cursor position
    mov dh, [fazooldh3]
    mov dl, [fazooldl3]
    ret                        ; Return with AL = 1 (valid) or 0 (not valid)
	
check_number_below_right_2_9h:

    mov byte [fazooldh3], dh    ; Save current row
    mov byte [fazooldl3], dl    ; Save current column

    ; Adjust for Page 2 boundaries
    add dh, 1                  ; Move to the row below
    add dl, 1                  ; Move to the column to the right

    cmp dh, 10                 ; Adjusted row boundary for Page 2 (0–9)
    ja invalid_position_9h
    cmp dl, 68                 ; Column boundary
    ja invalid_position_9h

    ; Calculate video memory address for (row, column)
    mov ax, 0xB800             ; Base address of video memory
    mov es, ax                 ; Set ES to point to video memory
	mov bh, 0x01

    ; Compute offset in memory for (dh, dl)
    mov al, dh                 ; Row number into AL
    mov ah, 0                  ; Clear upper byte of AX
    mov si, ax                 ; SI = row number
    shl si, 6                  ; Multiply row by 64 (2^6 = 64)
    mov di, ax                 ; DI = row number
    shl di, 4                  ; Multiply row by 16 (2^4 = 16)
    add si, di                 ; SI = row * 80 (64 + 16)
    add si, dx                 ; Add column number to SI
    shl si, 1                  ; Multiply by 2 (character + attribute)

    ; Read character and attribute from video memory
    mov al, byte [es:si]       ; Read character at the position
    cmp al, 0x20               ; Is the character a space (' ')? 
    jne no_attribute_found_9h

    mov ah, byte [es:si+1]     ; Read attribute at the position
    cmp ah, 0x4F               ; Does the attribute match 0x4F?
    jne no_attribute_found_9h
	
	;jmp attribute_found_9h

move_up9_3:

    cmp byte [page_num3], 0        ; Check if we are on Page 1
    je check_top_row_page1_9h        ; If true, check if at the topmost row of Page 1

    cmp byte [page_num3], 1       ; Check if we are on Page 2
    je check_top_row_page2_9h        ; If true, check if at the topmost row of Page 2

    ret                           ; If not on Page 1 or Page 2, do nothing

check_top_row_page1_9h:

    cmp dh, 2                     ; Check if at the topmost row of Page 1
    je handle_wrap_up_page1_9h      ; If true, handle wrap-around to Page 2

    sub dh, 4                     ; Move up one row
    call update_cursor_position12
    ret

check_top_row_page2_9h:

    cmp dh, 1               ; Check if at the topmost row of Page 2
    je handle_wrap_up_page2_9h      ; If true, handle wrap-around to Page 1

    sub dh, 4                     ; Move up one row
    call update_cursor_position12
    ret

handle_wrap_up_page1_9h:
     
    call move_page_down9_9h         
    mov dh, 9                    
    mov dl, 21                   
    call update_cursor_position12
    ret

handle_wrap_up_page2_9h:

    call move_page_up9_9h            ; Switch to Page 1
    mov dh, 22                    ; Set to the last row of Page 1
    mov dl, 21                    ; Stay in the same column
    call update_cursor_position12
    ret
	
move_down9_3:

    cmp byte [page_num3], 0        ; Check if we are on Page 1
    je check_bottom_row_page1_9h    ; If true, check if at the bottommost row of Page 1

    cmp byte [page_num3], 1        ; Check if we are on Page 2
    je check_bottom_row_page2_9h     ; If true, check if at the bottommost row of Page 2

    ret                           ; If not on Page 1 or Page 2, do nothing

check_bottom_row_page1_9h:

    cmp dh, 22                    ; Check if at the bottommost row of Page 1
    je handle_wrap_down_page1_9h     ; If true, handle wrap-around to Page 2

    add dh, 4                     ; Move down one row
    call update_cursor_position12
    ret

check_bottom_row_page2_9h:

    cmp dh, 9                    ; Check if at the bottommost row of Page 2
    je handle_wrap_down_page2_9h     ; If true, handle wrap-around to Page 1

    add dh, 4                     ; Move down one row
    call update_cursor_position12
    ret

handle_wrap_down_page1_9h:

    call move_page_down9_9h           ; Switch to Page 2
    mov dh, 1                     
    mov dl, 21                   
    call update_cursor_position12
    ret

handle_wrap_down_page2_9h:

    call move_page_up9_9h            ; Switch to Page 1
    mov dh, 2                     
    mov dl, 21                    
    call update_cursor_position12
    ret
	
; Move left with wrap-around
move_left9_3:

    cmp dl, 21              ; Check if at the leftmost column
    je handle_wrap_left9_9h
    sub dl, 4               ; Move left one column
    call update_cursor_position12
    ret

handle_wrap_left9_9h:

    mov dl, 53              ; Wrap to the rightmost column
    call update_cursor_position12
    ret

move_right9_3:

    cmp dl, 53              ; Check if at the rightmost column
    je handle_wrap_right9_9h
    add dl, 4               ; Move right one column
    call update_cursor_position12
    ret

handle_wrap_right9_9h:

    mov dl, 21              ; Wrap to the leftmost column
    call update_cursor_position12
    ret

move_page_up9_9h:

    mov byte [page_num3], 0  ; Switch to Page 1
	mov al, [page_num3]
    mov ah, 5               ; BIOS: Set Active Display Page
    int 10h
	mov dh,2
	mov dl,21
	mov bh,0
	call update_cursor_position12
    ret

move_page_down9_9h:

    mov byte [page_num3], 1  ; Switch to Page 2
	mov al, [page_num3]
    mov ah, 5               ; BIOS: Set Active Display Page
    int 10h
	
	mov dh,2
	mov dl,21
	mov bh,1
	call update_cursor_position12
    ret

invalid_number_9h:



    mov ah, 0x09
    mov al, ' '                 ; Display a space to clear the cell
    mov bh, 0x00
    mov bl, 0x0E                ; Red background
    mov cx, 1
    int 0x10
	
	inc byte[mistake_count]
	call mistake_sound
	
	mov ax,0x09
	push ax
	mov ax,0x47
	push ax
	mov ax,[mistake_count]
	push ax
	call printnum1
	
	cmp byte[mistake_count],3
	je lostbymistake
	
	call score_mistake_9e
	call update_cursor_position11
	
    jmp handle_input9_2
	
checkwin_9x9_hard:

	cmp byte[correctinputs],43
	je game_won
	
	ret

insert_number9_1_9h:

	cmp byte[page_num3] , 1
	je insert_number9_1_9h_p2
	
	call validate_input_9h
	cmp bl, 1 
	jne invalid_number_9h
	call clear_notes           
    mov ah, 0x09     
    mov al, '1'       
    mov bl, 0x4F       
    mov cx, 1         
    int 0x10 
	call insertion_sound
	call display_score_increase_9e
	call update_cursor_position11
	inc byte[correctinputs]
	call checkrow_completion_9x9_p1
	call update_cursor_position10
	call checkcol_completion_9x9_p1
	call checkwin_9x9_hard
    jmp handle_input9_2

insert_number9_1_9h_p2:

    call validate_input_9h
	cmp bl, 1
	jne invalid_number_9h
	call clear_notes           
    mov ah, 0x09     
    mov al, '1'       
    mov bl, 0x4F  
	mov bh, 0x01
    mov cx, 1         
    int 0x10 
	call insertion_sound
	call display_score_increase_9e
	call update_cursor_position11
	inc byte[correctinputs]
	call checkrow_completion_9x9_p2_h
	call update_cursor_position10
	call checkcol_completion_9x9_p1
	call checkwin_9x9_hard
    jmp handle_input9_2	

insert_number9_2_9h:

	cmp byte[page_num3] , 1
	je insert_number9_2_9h_p2
	
    call validate_input_9h
	cmp bl, 2 
	jne invalid_number_9h
	call clear_notes           
    mov ah, 0x09     
    mov al, '2'       
    mov bl, 0x4F       
    mov cx, 1         
    int 0x10 
	call insertion_sound
	call display_score_increase_9e
	call update_cursor_position11
	inc byte[correctinputs]
	call checkrow_completion_9x9_p1
	call update_cursor_position10
		call checkcol_completion_9x9_p1
	call checkwin_9x9_hard
    jmp handle_input9_2

insert_number9_2_9h_p2:

    call validate_input_9h
	cmp bl, 2
	jne invalid_number_9h
	call clear_notes           
    mov ah, 0x09     
    mov al, '2'       
    mov bl, 0x4F  
	mov bh, 0x01
    mov cx, 1         
    int 0x10 
	call insertion_sound
	call display_score_increase_9e
	call update_cursor_position11
	inc byte[correctinputs]
	call checkrow_completion_9x9_p2_h
	call update_cursor_position10
	call checkcol_completion_9x9_p1

	call checkwin_9x9_hard
    jmp handle_input9_2	

insert_number9_3_9h:  

	cmp byte[page_num3] , 1
	je insert_number9_3_9h_p2
	
    call validate_input_9h
	cmp bl, 3 
	jne invalid_number_9h
	call clear_notes           
    mov ah, 0x09     
    mov al, '3'       
    mov bl, 0x4F       
    mov cx, 1         
    int 0x10 
	call insertion_sound
	call display_score_increase_9e
	call update_cursor_position11
	inc byte[correctinputs]
	call checkrow_completion_9x9_p1
	call update_cursor_position10	
	call checkcol_completion_9x9_p1

	call checkwin_9x9_hard
    jmp handle_input9_2

insert_number9_3_9h_p2:

    call validate_input_9h
	cmp bl, 3
	jne invalid_number_9h
	call clear_notes           
    mov ah, 0x09     
    mov al, '3'       
    mov bl, 0x4F  
	mov bh, 0x01
    mov cx, 1         
    int 0x10 
	call insertion_sound
	call display_score_increase_9e
	call update_cursor_position11
	inc byte[correctinputs]
	call checkrow_completion_9x9_p2_h
	call update_cursor_position10
		call checkcol_completion_9x9_p1
	call checkwin_9x9_hard
    jmp handle_input9_2	

insert_number9_4_9h:

	cmp byte[page_num3] , 1
	je insert_number9_4_9h_p2
	
    call validate_input_9h
	cmp bl, 4 
	jne invalid_number_9h
	call clear_notes           
    mov ah, 0x09     
    mov al, '4'       
    mov bl, 0x4F       
    mov cx, 1         
    int 0x10 
	call insertion_sound
	call display_score_increase_9e
	call update_cursor_position11
	inc byte[correctinputs]
	call checkrow_completion_9x9_p1
	call update_cursor_position10
		call checkcol_completion_9x9_p1
	call checkwin_9x9_hard
    jmp handle_input9_2

insert_number9_4_9h_p2:

    call validate_input_9h
	cmp bl, 4
	jne invalid_number_9h
	call clear_notes           
    mov ah, 0x09     
    mov al, '4'       
    mov bl, 0x4F  
	mov bh, 0x01
    mov cx, 1         
    int 0x10 
	call insertion_sound
	call display_score_increase_9e
	call update_cursor_position11
	inc byte[correctinputs]
	call checkrow_completion_9x9_p2_h
	call update_cursor_position10
		call checkcol_completion_9x9_p1
	call checkwin_9x9_hard
    jmp handle_input9_2	
	
insert_number9_5_9h:

	cmp byte[page_num3] , 1
	je insert_number9_5_9h_p2
	
    call validate_input_9h
	cmp bl, 5 
	jne invalid_number_9h
	call clear_notes           
    mov ah, 0x09     
    mov al, '5'       
    mov bl, 0x4F       
    mov cx, 1         
    int 0x10 
	call insertion_sound
	call display_score_increase_9e
	call update_cursor_position11
	inc byte[correctinputs]
	call checkrow_completion_9x9_p1
	call update_cursor_position10
		call checkcol_completion_9x9_p1
	call checkwin_9x9_hard
    jmp handle_input9_2

insert_number9_5_9h_p2:

    call validate_input_9h
	cmp bl, 5
	jne invalid_number_9h
	call clear_notes           
    mov ah, 0x09     
    mov al, '5'       
    mov bl, 0x4F  
	mov bh, 0x01
    mov cx, 1         
    int 0x10 
	call insertion_sound
	call display_score_increase_9e
	call update_cursor_position11
	inc byte[correctinputs]
	call checkrow_completion_9x9_p2_h
	call update_cursor_position10
		call checkcol_completion_9x9_p1
	call checkwin_9x9_hard
    jmp handle_input9_2	

insert_number9_6_9h:

	cmp byte[page_num3] , 1
	je insert_number9_6_9h_p2
	
    call validate_input_9h
	cmp bl,6 
	jne invalid_number_9h
	call clear_notes           
    mov ah, 0x09     
    mov al, '6'       
    mov bl, 0x4F       
    mov cx, 1         
    int 0x10 
	call insertion_sound
	call display_score_increase_9e
	call update_cursor_position11
	inc byte[correctinputs]
	call checkrow_completion_9x9_p1
	call update_cursor_position10
		call checkcol_completion_9x9_p1
	call checkwin_9x9_hard
    jmp handle_input9_2

insert_number9_6_9h_p2:

    call validate_input_9h
	cmp bl, 6
	jne invalid_number_9h
	call clear_notes           
    mov ah, 0x09     
    mov al, '6'       
    mov bl, 0x4F  
	mov bh, 0x01
    mov cx, 1         
    int 0x10 
	call insertion_sound
	call display_score_increase_9e
	call update_cursor_position11
	inc byte[correctinputs]
	call checkrow_completion_9x9_p2_h
	call update_cursor_position10
		call checkcol_completion_9x9_p1
	call checkwin_9x9_hard
    jmp handle_input9_2	

insert_number9_7_9h:

	cmp byte[page_num3] , 1
	je insert_number9_7_9h_p2
	
    call validate_input_9h
	cmp bl, 7 
	jne invalid_number_9h
	call clear_notes           
    mov ah, 0x09     
    mov al, '7'       
    mov bl, 0x4F       
    mov cx, 1         
    int 0x10 
	call insertion_sound
	call display_score_increase_9e
	call update_cursor_position11
	inc byte[correctinputs]
	call checkrow_completion_9x9_p1
	call update_cursor_position10
		call checkcol_completion_9x9_p1
	call checkwin_9x9_hard
    jmp handle_input9_2

insert_number9_7_9h_p2:

    call validate_input_9h
	cmp bl, 7
	jne invalid_number_9h
	call clear_notes           
    mov ah, 0x09     
    mov al, '7'       
    mov bl, 0x4F  
	mov bh, 0x01
    mov cx, 1         
    int 0x10 
	call insertion_sound
	call display_score_increase_9e
	call update_cursor_position11
	inc byte[correctinputs]
	call checkrow_completion_9x9_p2_h
	call update_cursor_position10
		call checkcol_completion_9x9_p1
	call checkwin_9x9_hard
    jmp handle_input9_2	

insert_number9_8_9h:

	cmp byte[page_num3] , 1
	je insert_number9_8_9h_p2

    call validate_input_9h
	cmp bl, 8
	jne invalid_number_9h
	call clear_notes           
    mov ah, 0x09     
    mov al, '8'       
    mov bl, 0x4F       
    mov cx, 1         
    int 0x10 
	call insertion_sound
	call display_score_increase_9e
	call update_cursor_position11
	inc byte[correctinputs]
	call checkrow_completion_9x9_p1
	call update_cursor_position10
		call checkcol_completion_9x9_p1
	call checkwin_9x9_hard
    jmp handle_input9_2
	
insert_number9_8_9h_p2:

    call validate_input_9h
	cmp bl, 8
	jne invalid_number_9h
	call clear_notes           
    mov ah, 0x09     
    mov al, '8'       
    mov bl, 0x4F  
	mov bh, 0x01
    mov cx, 1         
    int 0x10 
	call insertion_sound
	call display_score_increase_9e
	call update_cursor_position11
	inc byte[correctinputs]
	call checkrow_completion_9x9_p2_h
	call update_cursor_position10
		call checkcol_completion_9x9_p1
	call checkwin_9x9_hard
    jmp handle_input9_2	

insert_number9_9_9h:

	cmp byte[page_num3] , 1
	je insert_number9_9_9h_p2
	
    call validate_input_9h
	cmp bl, 9
	jne invalid_number_9h
	call clear_notes           
    mov ah, 0x09     
    mov al, '9'       
    mov bl, 0x4F       
    mov cx, 1         
    int 0x10 
	call insertion_sound
	call display_score_increase_9e
	call update_cursor_position11
	inc byte[correctinputs]
	call checkrow_completion_9x9_p1
	call update_cursor_position10
		call checkcol_completion_9x9_p1
	call checkwin_9x9_hard
    jmp handle_input9_2

insert_number9_9_9h_p2:

    call validate_input_9h
	cmp bl, 9
	jne invalid_number_9h
	call clear_notes           
    mov ah, 0x09     
    mov al, '9'       
    mov bl, 0x4F 
	mov bh, 0x01
    mov cx, 1         
    int 0x10 
	call insertion_sound
	call display_score_increase_9e
	call update_cursor_position12
	inc byte[correctinputs]
	call checkrow_completion_9x9_p2
	call update_cursor_position10
		call checkcol_completion_9x9_p1
	call checkwin_9x9_hard
    jmp handle_input9_2
	
	
	;====================================================================================;
	checkrow_completion_9x9_p2_h:
	
   cmp dh,1
   je p2_row7_h
   
   cmp dh,5
   je p2_row8_h
   
   cmp dh,9
   je p2_row9_h
   
   p2_row7_h:
   inc byte[row7_hard_9]
   cmp byte[row7_hard_9],9
   je comp_p2_h
   jmp not_comp_p2_h
   
   p2_row8_h: 
   inc byte[row8_hard_9]
   cmp byte[row8_hard_9],9
   je comp_p2_h
   jmp not_comp_p2_h
   
   p2_row9_h:
   inc byte[row9_hard_9]
   cmp byte[row9_hard_9],9
   je comp_p2_h
   jmp not_comp_p2_h
   
   
   comp_p2_h:
   call completion_sound
   
   not_comp_p2_h:
   ret
   
   ;============================================================================
	
; Check if a number is already present at the cursor position
check_attribute9x9_hard_9e:

    push bx
    push dx

    mov ah, 0x08             ; BIOS function to read character and attribute
    int 0x10                 ; Perform the interrupt
    cmp al, ' '              ; Check if character is empty (space)
    je allow_input           ; If empty, allow input
    cmp ah, 0x0E             ; Compare attribute with yellow on black
    je deny_input            ; If true, deny input

save_column_position_9h:
    mov al, dl         ; Save the current column position to al
    ret

; Restore the saved column position
restore_column_position_9h:
    mov dl, al         ; Restore the saved column position from al
    ret
	
drawgrid9_hard:

	call clrscr
	call drawgrid_nextHard
	call drawgrid99hard
		
	mov dh, 2          ; Start cursor row
    mov dl, 21         ; Start cursor column
    call update_cursor_position12
	
	looppHard:
	call handle_input9_2
    jmp looppHard
	
	ret	
		
	;======================== TIME PRINT KA CODE ======================================
	
printnum:

    push bp
    mov bp, sp
    push es
    push ax
    push bx
    push cx
    push dx
    push di

    ; Set up ES to point to video memory
    mov ax, 0xb800
    mov es, ax

    ; Print minutes
    mov ax, [bp+6]   ; Load minutes into AX
	cmp byte[cs:timer_which_grid],1
	jne timer_4x4
	
	timer_9x9:
    mov di, 0x04F0      ; Start position for minutes (column 70)
	jmp cont
	
	timer_4x4:
	mov di,0x0360
	
	cont:
    call printvalue  ; Call helper to print value

    ; Print colon (:)
    mov word [es:di], 0x0F3A ; ASCII for ':', attribute 0x07
    add di, 2                ; Move to the next position

    ; Print seconds
    mov ax, [bp+4]   ; Load seconds into AX
    call printvalue  ; Call helper to print value

    pop di
    pop dx
    pop cx
    pop bx
    pop ax
    pop es
    pop bp
    ret 4            ; Clean up both seconds and minutes from stack

printvalue:

    mov bx, 10       ; Use base 10 for division

    ; Get tens digit
    xor dx, dx       ; Clear DX
    div bx           ; AX = quotient, DX = remainder
    add al, 0x30     ; Convert tens digit to ASCII
    mov ah, 0x0F     ; Attribute: white on black
    mov [es:di], ax  ; Write to screen
    add di, 2        ; Move to next screen position

    ; Get ones digit
    mov al, dl       ; Remainder is the ones digit
    add al, 0x30     ; Convert ones digit to ASCII
    mov [es:di], ax  ; Write to screen
    add di, 2        ; Move to next screen position

    ret
	
		;==================== TIMER KA CODE ==============================
		
timer:

    push ax
    push cx

    cmp byte[timerEnabled],0
	je endtimer
	
    inc word [cs:tickcount] ; Increment tick count
    cmp word [cs:tickcount], 18 ; Check if 18 ticks have passed
    jne endtimer ; If not, continue

    mov word [cs:tickcount], 0 ; Reset tick count
    inc word [cs:seconds]      ; Increment seconds counter
	
	cmp word[cs:seconds],60
	jne printtime
	
	mov word[cs:seconds],0
	inc word[cs:minutes]


printtime:

    push word[cs:minutes]
    push word [cs:seconds]     ; Push seconds to the stack
    call printnum              ; Print the seconds value

endtimer:

    mov al, 0x20
    out 0x20, al               ; End of interrupt
    pop cx
    pop ax
    iret                       ; Return from interrupt
	
		
print9x9_details:

	xor ax, ax
    mov es, ax                 

    mov word[cs:timerEnabled],1
	mov byte[cs:timer_which_grid],1

    cli                        ; Disable interrupts
    mov word [es:8*4], timer   ; Store offset at 8*4
    mov [es:8*4+2], cs         ; Store segment at 8*4+2
	
    sti                        ; Enable interrupts

    mov ah, 0x13     ; service 13h - print string
    mov al, 1        ; subservice 01 - update cursor
    mov bh, 0        ; output on page 0
    mov bl, 0Fh      ; normal white on black attribute
    mov dx, 0x0690   ; row 4, column 31 (centered title position)
    mov cx, 5      ; length of the string
    push cs
    pop es           ; set ES to code segment
    mov bp, time
    int 0x10         ; call BIOS video interrupt to print string
	
	mov ah, 0x13     ; service 13h - print string
    mov al, 1        ; subservice 01 - update cursor
    mov bh, 0        ; output on page 0
    mov bl, 0Fh      ; normal white on black attribute
    mov dx, 0x0890   ; row 4, column 31 (centered title position)
    mov cx, 11     ; length of the string
    push cs
    pop es           ; set ES to code segment
    mov bp, mistake
    int 0x10         ; call BIOS video interrupt to print string
	
		
	
	
	mov ax,0x08
	push ax
	mov ax,0x97
	push ax
	mov ax,[mistake_count]
	push ax
	call printnum1

	mov ah, 0x13     
    mov al, 1        
    mov bh, 0      
    mov bl, 0Fh     
    mov dx, 0x0A90  
    mov cx, 7     
    push cs
    pop es          
    mov bp, score
    int 0x10

	mov ax,0x0A
	push ax
	mov ax,0x97
	push ax
	mov ax,[score_count]
	push ax
	call printnum1
	
	mov ah, 0x13     ; service 13h - print string
    mov al, 1        ; subservice 01 - update cursor
    mov bh, 0        ; output on page 0
    mov bl, 08h      ; normal white on black attribute
    mov dx, 0x0304   ; row 4, column 31 (centered title position)
    mov cx, 9     ; length of the string
    push cs
    pop es           ; set ES to code segment
    mov bp, end_game
    int 0x10         ; call BIOS video interrupt to print string
	
		mov ah, 0x13     ; service 13h - print string
    mov al, 1        ; subservice 01 - update cursor
    mov bh, 0        ; output on page 0
    mov bl, 02h      ; normal white on black attribute
    mov dx, 0x0404   ; row 4, column 31 (centered title position)
    mov cx, 10     ; length of the string
    push cs
    pop es           ; set ES to code segment
    mov bp, remove
    int 0x10         ; call BIOS video interrupt to print string
	
	mov ah, 0x13     ; service 13h - print string
    mov al, 1        ; subservice 01 - update cursor
    mov bh, 0        ; output on page 0
    mov bl, 0Eh      ; normal white on black attribute
    mov dx, 0x0504   ; row 4, column 31 (centered title position)
    mov cx, 9     ; length of the string
    push cs
    pop es           ; set ES to code segment
    mov bp, notes
    int 0x10         ; call BIOS video interrupt to print string
	
	
	
	mov ah, 0x13   
    mov al, 1       
    mov bh, 0        
    mov bl, 0Fh     
    mov dx,0x0602   
    mov cx, 13    
    push cs
    pop es          
    mov bp, number_box
    int 0x10         
	
	mov ah, 0x13     
    mov al, 1      
    mov bh, 0       
    mov bl, 0Fh     
    mov dx, 0x0702   
    mov cx, 13    
    push cs
    pop es          
    mov bp, box_row1
    int 0x10         
	
	mov ah, 0x13     
    mov al, 1        
    mov bh, 0     
    mov bl, 0Fh      
    mov dx, 0x0802   
    mov cx, 13     
    push cs
    pop es          
    mov bp, number_box
    int 0x10       
	
	mov ah, 0x13     
    mov al, 1       
    mov bh, 0       
    mov bl, 0Fh      
    mov dx, 0x0902  
    mov cx, 13     
    push cs
    pop es           
    mov bp, box_row2
    int 0x10        
	
	mov ah, 0x13    
    mov al, 1      
    mov bh, 0        
    mov bl, 0Fh      
    mov dx, 0x0A02   
    mov cx, 13   
    push cs
    pop es          
    mov bp, number_box
    int 0x10         
	
	mov ah, 0x13     
    mov al, 1       
    mov bh, 0       
    mov bl, 0Fh      
    mov dx, 0x0B02  
    mov cx, 13     
    push cs
    pop es           
    mov bp, box_row3
    int 0x10        
	
	mov ah, 0x13    
    mov al, 1      
    mov bh, 0        
    mov bl, 0Fh      
    mov dx, 0x0C02   
    mov cx, 13   
    push cs
    pop es          
    mov bp, number_box
    int 0x10 

    mov ah, 0x13     
    mov al, 1       
    mov bh, 0       
    mov bl, 0Fh      
    mov dx, 0x0D02  
    mov cx, 13     
    push cs
    pop es           
    mov bp, box_row4
    int 0x10        
	
	mov ah, 0x13    
    mov al, 1      
    mov bh, 0        
    mov bl, 0Fh      
    mov dx, 0x0E02   
    mov cx, 13   
    push cs
    pop es          
    mov bp, number_box
    int 0x10 

    mov ah, 0x13     
    mov al, 1       
    mov bh, 0       
    mov bl, 0Fh      
    mov dx, 0x0F02  
    mov cx, 8     
    push cs
    pop es           
    mov bp, box_row5
    int 0x10        
	
	mov ah, 0x13    
    mov al, 1      
    mov bh, 0        
    mov bl, 0Fh      
    mov dx, 0x1002   
    mov cx, 7   
    push cs
    pop es          
    mov bp, number_box
    int 0x10 	

   ret
   
print4x4_details:
   
    xor ax, ax
    mov es, ax                 ; Point ES to IVT base
	
    mov word[cs:timerEnabled],1
	mov word[cs:tickcount],0
	mov word[cs:minutes],0
	mov word[cs:seconds],0
	mov word[cs:timer_which_grid],0

    cli                        ; Disable interrupts
    mov word [es:8*4], timer   ; Store offset at 8*4
    mov [es:8*4+2], cs         ; Store segment at 8*4+2
	
    sti                        ; Enable interrupts
   
    mov ah, 0x13     ; service 13h - print string
    mov al, 1        ; subservice 01 - update cursor
    mov bh, 0        ; output on page 0
    mov bl, 0Fh      ; attribute
    mov dx, 0x051A	; row 5, column 14 
    mov cx, 5     ; length of the string
    push cs
    pop es           ; set ES to code segment
    mov bp, time
    int 0x10         ; call BIOS video interrupt to print string
	
	mov ah, 0x13     ; service 13h - print string
    mov al, 1        ; subservice 01 - update cursor
    mov bh, 0        ; output on page 0
    mov bl, 08h      ; normal white on black attribute
    mov dx, 0x0305   ; row 4, column 31 (centered title position)
    mov cx, 9     ; length of the string
    push cs
    pop es           ; set ES to code segment
    mov bp, end_game
    int 0x10         ; call BIOS video interrupt to print string
	
	mov ah, 0x13     ; service 13h - print string
    mov al, 1        ; subservice 01 - update cursor
    mov bh, 0        ; output on page 0
    mov bl, 02h      ; normal white on black attribute
    mov dx, 0x0405   ; row 4, column 31 (centered title position)
    mov cx, 10     ; length of the string
    push cs
    pop es           ; set ES to code segment
    mov bp, remove
    int 0x10         ; call BIOS video interrupt to print string
	
	mov ah, 0x13     ; service 13h - print string
    mov al, 1        ; subservice 01 - update cursor
    mov bh, 0        ; output on page 0
    mov bl, 0Eh      ; normal white on black attribute
    mov dx, 0x0505   ; row 4, column 31 (centered title position)
    mov cx, 9     ; length of the string
    push cs
    pop es           ; set ES to code segment
    mov bp, notes
    int 0x10         ; call BIOS video interrupt to print string
	
	
	
	mov ah, 0x13     
    mov al, 1        
    mov bh, 0      
    mov bl, 0Fh     
    mov dx, 0x0539  
    mov cx, 11     
    push cs
    pop es          
    mov bp, mistake
    int 0x10   

	mov ax,0x05
	push ax
	mov ax,0x40
	push ax
	mov ax,[mistake_count]
	push ax
	call printnum2

	mov ah, 0x13     
    mov al, 1        
    mov bh, 0      
    mov bl, 0Fh     
    mov dx, 0x052A  
    mov cx, 7     
    push cs
    pop es          
    mov bp, score
    int 0x10

	mov ax,0x05
	push ax
	mov ax,0x2E
	push ax
	mov ax,[score_count]
	push ax
	call printnum1

	mov ah, 0x13   
    mov al, 1       
    mov bh, 0        
    mov bl, 0Fh     
    mov dx, 0x1322   
    mov cx, 13    
    push cs
    pop es          
    mov bp, number_box
    int 0x10         
	
	mov ah, 0x13     
    mov al, 1      
    mov bh, 0       
    mov bl, 0Fh     
    mov dx, 0x1422   
    mov cx, 13    
    push cs
    pop es          
    mov bp, box_row1
    int 0x10         
	
	mov ah, 0x13     
    mov al, 1        
    mov bh, 0     
    mov bl, 0Fh      
    mov dx, 0x1522   
    mov cx, 13     
    push cs
    pop es          
    mov bp, number_box
    int 0x10       
	
	mov ah, 0x13     
    mov al, 1       
    mov bh, 0       
    mov bl, 0Fh      
    mov dx, 0x1622  
    mov cx, 13     
    push cs
    pop es           
    mov bp, box_row2
    int 0x10        
	
	mov ah, 0x13    
    mov al, 1      
    mov bh, 0        
    mov bl, 0Fh      
    mov dx, 0x1722   
    mov cx, 13   
    push cs
    pop es          
    mov bp, number_box
    int 0x10         
   
   ret
   
printnum1:

    push bp
    mov bp, sp
    push es
    push ax
    push bx
    push cx
    push dx
    push di

    mov di, 80          ; Load DI with columns per row
    mov ax, [bp+8]      ; Load AX with row number
    mul di              ; Multiply with columns per row
    mov di, ax          ; Save result in DI
    add di, [bp+6]      ; Add column number
    shl di, 1           ; Turn into byte count
    add di, 8           ; Offset to the desired video memory location

    mov ax, 0xb800      ; Video memory segment
    mov es, ax          ; Point ES to video base

    mov ax, [bp+4]      ; Load number in AX
    mov bx, 10          ; Use base 10 for division
    mov cx, 3           ; Maximum number of digits to process

nextdigit:

    xor dx, dx          ; Clear upper half of dividend
    div bx              ; Divide AX by 10
    add dl, '0'         ; Convert remainder to ASCII
    mov dh, 0x0F        ; Attach normal attribute
    mov [es:di], dx     ; Print character on screen
    sub di, 2           ; Move to previous screen location
    loop nextdigit

    pop di
    pop dx
    pop cx
    pop bx
    pop ax
    pop es
    pop bp
    ret 6               ; Return and clean up the stack
	
	  
printnum2:

    push bp
    mov bp, sp
    push es
    push ax
    push bx
    push cx
    push dx
    push di

    mov di, 80          ; Load DI with columns per row
    mov ax, [bp+8]      ; Load AX with row number
    mul di              ; Multiply with columns per row
    mov di, ax          ; Save result in DI
    add di, [bp+6]      ; Add column number
    shl di, 1           ; Turn into byte count
    add di, 8           ; Offset to the desired video memory location

    mov ax, 0xb800      ; Video memory segment
    mov es, ax          ; Point ES to video base

    mov ax, [bp+4]      ; Load number in AX
    mov bx, 10          ; Use base 10 for division
    mov cx, 3           ; Maximum number of digits to process

nextdigit2:

    xor dx, dx          ; Clear upper half of dividend
    div bx              ; Divide AX by 10
    add dl, '0'         ; Convert remainder to ASCII
    mov dh, 0x0F        ; Attach normal attribute
    mov [es:di], dx     ; Print character on screen
    sub di, 2           ; Move to previous screen location
   test ax,ax
   jnz nextdigit2

    pop di
    pop dx
    pop cx
    pop bx
    pop ax
    pop es
    pop bp
    ret 6               ; Return and clean up the stack
	
	
	;=========================================LOSING SCREEN======================================;
	
	losing_asm:
	
	pusha
	push es
	
	    mov byte[timerEnabled],0

	 ; Set video mode to 80x25 text mode (Mode 3)
        mov ah, 00h  ; Set video mode function
        mov al, 03h  ; 80x25 text mode
        int 10h      ; Call BIOS interrupt
	;------------------------------------------------------------
		; this displays the TOP
		mov ah, 02h   
        mov bh, 0      
        mov dh,4   ; Row 7 (one row lower the the title)
        mov dl,14 ; Column 24
        int 10h  

        mov si, title_boxlose  
        call print_colored_TOP
		
		;------------------------------------------------------------
        ; Display the title: "Game Over"
		mov ah, 02h    ; Set cursor position function
        mov bh, 0      
        mov dh,6   ; Row 6
        mov dl,50;Column 26
        int 10h  

        mov si, title_msglose  ; Load address of title_msg into SI
        call print_colored_ending  
	
		;------------------------------------------------------------
		; this displays the message "You have made so many mistakes, it is " 
		mov ah, 02h    
        mov bh, 0     
        mov dh,9  ; Row 9
        mov dl, 20 ; Column 20
        int 10h 
		
		mov si, grid_pun  
        call print_colored_pun

		;------------------------------------------------------------
		; this displays the lines BELOW the 'no longer Sudoku, its Sudontku'
		mov ah, 02h   
        mov bh, 0     
        mov dh, 10   ; Row 10
        mov dl,23  ; Column 23
        int 10h 
		
		mov si, grid_pun2 
        call print_colored_pun2
		
		;------------------------------------------------------------
		; this displays the Bottom
		mov ah, 02h   
        mov bh, 0      
        mov dh,15   ; Row 7 (one row lower the the title)
        mov dl,14 ; Column 24
        int 10h  

        mov si, title_boxlose
        call print_colored_BOT
		
		;------------------------------------------------------------	
        ;displays the title of "Try Again (Y/N): "
	    mov ah, 02h    
        mov bh, 0      
        mov dh, 13   ; Row 20
        mov dl, 22   ; Column 0
        int 10h      
		
		mov si, input_msgtry
        call print_string
		;------------------------------------------------------------	
		; It takes the input for which grid to choose (4x4 or 9x9)
		call get_input
        mov [input_try],al
		
		;------------------------------------------------------------
        ; Wait for user input (Press any key to start)
        mov ah, 00h   ; BIOS keyboard interrupt
        int 16h       ; Wait for any key press
		
		cmp al,'y'
		je start

        ; Clear the screen (for now, just end the program)
        mov ah, 00h   ; Reset video mode (optional, depending on the next screen)
        mov al, 03h   ; Reset to 80x25 mode
        int 10h
		;------------------------------------------------------------
        mov ax, 0x4c00   ; Terminate program function
        int 21h     
		;------------------------------------------------------------
		; this is done specifically for the heading to COLOR it in yellow
		print_colored_ending:
		
			mov bx, 0xB800  ; Base address of video memory
			mov es, bx    ; Set ES to point to video memory segment
			mov di, [row_col_offset] ; Set DI to the starting offset in video memory for the given row and column

		print_looplose:
		
			lodsb  ; Load the byte from string into AL
			or al, al   ; Check if the byte is zero (null terminator)
			jz done_printinglose ; If zero, jump to done_printing
			
			; Write the character to video memory
			mov es:[di], al  ; Write the character at current position
			inc di  ; Move to the attribute byte (next position)
			
			; Set the color attribute (yellow on black background)
			mov byte [es:di], 0x84  ; (use 0x0E for only yellow without blink)
			inc di 
			
			jmp print_looplose  ; Repeat for the next character

		;------------------------------------------------------------	
		; only returns once all the charcters in the string are printed and '0' is reached.
		done_printinglose:
			ret
		;------------------------------------------------------------	
		; This calculates the offset in video memory for TITLE
		row_col_offsetlose:
			dw (80 * 6 + 50)* 2 ; offset (row 6, column 30, two bytes per character cell - Formula [(80 * ypos + xpos) * 2])
		;------------------------------------------------------------	
		; this is done specifically for the PUN to COLOR it in yellow
		print_colored_pun:
		
			mov bx, 0xB800     
			mov es, bx         
			mov di, [row_col_offset_pun] 

		print_loop1lose:
		
			lodsb          
			or al, al        
			jz done_printinglose 
			
			mov es:[di], al   
			inc di            
			
			; Set the color attribute (Red on black background)
			mov byte [es:di], 0x0E 
			inc di 
			
			call sleep
			jmp print_loop1lose  
		
		;------------------------------------------------------------	
			row_col_offset_pun:
				dw (80 * 9 + 20) * 2 ; offset (row 9, column 20 - Formula [(80 * ypos + xpos) * 2])
		;------------------------------------------------------------	
		; this is done specifically for the MENU to COLOR it in CYAN
		print_colored_pun2:
		
			mov bx, 0xB800     
			mov es, bx         
			mov di, [row_col_offset_pun2] 

		print_loop2lose:
		
			lodsb          
			or al, al        
			jz done_printinglose 
			
			mov es:[di], al   
			inc di            
			
			; Set the color attribute (Red on black background)
			mov byte [es:di], 0x0E
			inc di 
			
			call sleep
			jmp print_loop2lose 
		
		;------------------------------------------------------------	
			row_col_offset_pun2:
				dw (80 * 10 + 23) * 2 ; offset (row 9, column 20 - Formula [(80 * ypos + xpos) * 2])
		;------------------------------------------------------------
		; this is done specifically for the MENU to COLOR it in CYAN
		print_colored_TOP:
		
			mov bx, 0xB800     
			mov es, bx         
			mov di, [row_col_offset_TOP] 

		print_loop3lose:
		
			lodsb          
			or al, al        
			jz done_printinglose 
			
			mov es:[di], al   
			inc di            
			
			; Set the color attribute (Red on black background)
			mov byte [es:di], 0x0F
			inc di 
			
			call sleep
			jmp print_loop3lose 
		
		;------------------------------------------------------------	
			row_col_offset_TOP:
				dw (80 * 4 + 14) * 2 ; offset (row 9, column 20 - Formula [(80 * ypos + xpos) * 2])
		;------------------------------------------------------------			; this is done specifically for the MENU to COLOR it in CYAN
		print_colored_BOT:
		
			mov bx, 0xB800     
			mov es, bx         
			mov di, [row_col_offset_BOT] 

		print_loop4lose:
		
			lodsb          
			or al, al        
			jz done_printinglose
			
			mov es:[di], al   
			inc di            
			
			; Set the color attribute (Red on black background)
			mov byte [es:di], 0x0F
			inc di 
			
			call sleep
			jmp print_loop4lose  
		
		;------------------------------------------------------------	
			row_col_offset_BOT:
				dw (80 * 15 + 14) * 2 ; offset (row 9, column 20 - Formula [(80 * ypos + xpos) * 2])
		;------------------------------------------------------------	
		; this is used for all other printing as NO COLOR is used abhi tak atleast
		print_stringlose:
		
			lodsb  
			or al, al        
			jz done_printinglose 
			mov ah, 0Eh     
			int 10h          
			call sleep		 
			jmp print_stringlose 
			
			pop es
			popa
			
			
			;=============================================winning screeeen==============================================;
			win_asm:
			
			
			
			  ; Set video mode to 80x25 text mode (Mode 3)
        mov ah, 00h  ; Set video mode function
        mov al, 03h  ; 80x25 text mode
        int 10h      ; Call BIOS interrupt
	;------------------------------------------------------------
		; this displays the TOP Line
		mov ah, 02h
        mov bh, 0
        mov dh,4   ; Row 4 (one row lower the the title)
        mov dl,8 ; Column 8
        int 10h

        mov si, title_boxwin
        call print_colored_TOPwin

		;------------------------------------------------------------
        ; Display the title: "WIN"
		mov ah, 02h    ; Set cursor position function
        mov bh, 0
        mov dh, 6   ; Row 6
        mov dl, 23 ;Column 23
        int 10h

        mov si, title_msgwin  ; Load address of title_msg into SI
        call print_colored_endingwin

		;------------------------------------------------------------
		; this displays the message "TIME "
		mov ah, 02h
        mov bh, 0
        mov dh,18 ; Row 9
        mov dl, 17 ; Column 20
        int 10h

		mov si, time
        call print_colored_timewin
		
		mov ax,18
	push ax
	mov ax,20
	push ax
	mov ax,[minutes]
	push ax
	call printnum2
	
	
    mov ah, 0x13     ; service 13h - print string
    mov al, 1        ; subservice 01 - update cursor
    mov bh, 0        ; output on page 0
    mov bl, 0Fh      ; attribute
    mov dx, 0x121A	; row 5, column 14 
    mov cx, 1     ; length of the string
    push cs
    pop es           ; set ES to code segment
    mov bp, colon
    int 0x10         ; call BIOS video interrupt to print string
	
	
	
		mov ax,18
	push ax
	mov ax,25
	push ax
	mov ax,[seconds]
	push ax
	call printnum2
	
		
		

		;------------------------------------------------------------
		; this displays the message "SCORE "
		mov ah, 02h
        mov bh, 0
        mov dh,18  ; Row 
        mov dl, 45 ; Column 20
        int 10h

		mov si, score
        call print_colored_scorewin
		
		mov ax,18
	push ax
	mov ax,50
	push ax
	mov ax,[score_count]
	push ax
	call printnum2
		;------------------------------------------------------------
		; this displays the message "Try New Level Perhaps "
		mov ah, 02h
        mov bh, 0
        mov dh,18  ; Row 20
        mov dl, 18 ; Column 20
        int 10h

		mov si, grid_punwin
        call print_colored_punwin
		

		;------------------------------------------------------------
		; this displays the Bottom Line
		mov ah, 02h
        mov bh, 0
        mov dh,15   ; Row 7 (one row lower the the title)
        mov dl,8 ; Column 24
        int 10h

        mov si, title_boxwin
        call print_colored_BOTwin

		;------------------------------------------------------------
        ;displays the title of "Try Again (Y/N): "
	    mov ah, 02h
        mov bh, 0
        mov dh, 12   ; Row 13
        mov dl, 22   ; Column 0
        int 10h

		mov si, input_msgtry
        call print_string
		;------------------------------------------------------------
		call get_input
        mov [input_try],al

		;------------------------------------------------------------
        ; Wait for user input (Press any key to start)
        mov ah, 00h   ; BIOS keyboard interrupt
        int 16h       ; Wait for any key press
		
		cmp al,'y'
		je start

        ; Clear the screen (for now, just end the program)
        mov ah, 00h   ; Reset video mode (optional, depending on the next screen)
        mov al, 03h   ; Reset to 80x25 mode
        int 10h
		;------------------------------------------------------------
        mov ax, 0x4c00   ; Terminate program function
        int 21h
		;------------------------------------------------------------
		; this is done specifically for the heading to COLOR it in yellow
		print_colored_endingwin:

			mov bx, 0xB800  ; Base address of video memory
			mov es, bx    ; Set ES to point to video memory segment
			mov di, [row_col_offsetwin] ; Set DI to the starting offset in video memory for the given row and column

		print_loopwin:

			lodsb  ; Load the byte from string into AL
			or al, al   ; Check if the byte is zero (null terminator)
			jz done_printingwin ; If zero, jump to done_printing

			; Write the character to video memory
			mov es:[di], al  ; Write the character at current position
			inc di  ; Move to the attribute byte (next position)

			; Set the color attribute (yellow on black background)
			mov byte [es:di], 0x82  ; (use 0x0E for only yellow without blink)
			inc di

			jmp print_loopwin   ; Repeat for the next character

		;------------------------------------------------------------
		; only returns once all the charcters in the string are printed and '0' is reached.
		done_printingwin:
			ret
		;------------------------------------------------------------
		; This calculates the offset in video memory for TITLE
		row_col_offsetwin:
			dw (80 * 6 + 23)* 2 ; offset (row 6, column 30, two bytes per character cell - Formula [(80 * ypos + xpos) * 2])
		;------------------------------------------------------------
		; this is done specifically for the PUN to COLOR it in yellow
		print_colored_punwin:

			mov bx, 0xB800
			mov es, bx
			mov di, [row_col_offset_punwin]

		print_loop1win:

			lodsb
			or al, al
			jz done_printingwin

			mov es:[di], al
			inc di

			; Set the color attribute (Red on black background)
			mov byte [es:di], 0x0F
			inc di

			call sleep
			jmp print_loop1win

		;------------------------------------------------------------
			row_col_offset_punwin:
				dw (80 * 9 + 22) * 2 ; offset (row 9, column 20 - Formula [(80 * ypos + xpos) * 2])
		;------------------------------------------------------------
		; this is done specifically for the MENU to COLOR it in CYAN
		print_colored_pun2win:

			mov bx, 0xB800
			mov es, bx
			mov di, [row_col_offset_pun2win]

		print_loop2win:

			lodsb
			or al, al
			jz done_printingwin

			mov es:[di], al
			inc di

			; Set the color attribute (Red on black background)
			mov byte [es:di], 0x0E
			inc di

			call sleep
			jmp print_loop2win

		;------------------------------------------------------------
			row_col_offset_pun2win:
				dw (80 * 10 + 23) * 2 ; offset (row 10, column 23 - Formula [(80 * ypos + xpos) * 2])
		;------------------------------------------------------------
		; this is done specifically for the MENU to COLOR it in CYAN
		print_colored_TOPwin:

			mov bx, 0xB800
			mov es, bx
			mov di, [row_col_offset_TOPwin]

		print_loop3win:

			lodsb
			or al, al
			jz done_printingwin

			mov es:[di], al
			inc di

			; Set the color attribute (Red on black background)
			mov byte [es:di], 0x09
			inc di

			call sleep
			jmp print_loop3win

		;------------------------------------------------------------
			row_col_offset_TOPwin:
				dw (80 * 4 + 8) * 2 ; offset (row 4, column 8 - Formula [(80 * ypos + xpos) * 2])
		;------------------------------------------------------------			
		; this is done specifically for the MENU to COLOR it in CYAN
		print_colored_BOTwin:

			mov bx, 0xB800
			mov es, bx
			mov di, [row_col_offset_BOTwin]

		print_loop4win:

			lodsb
			or al, al
			jz done_printingwin

			mov es:[di], al
			inc di

			; Set the color attribute (Red on black background)
			mov byte [es:di], 0x09
			inc di

			call sleep
			jmp print_loop4win

		;------------------------------------------------------------
			row_col_offset_BOTwin:
				dw (80 * 15 + 8) * 2 ; offset (row 15, column 8 - Formula [(80 * ypos + xpos) * 2])
		;------------------------------------------------------------
				; this is done specifically for the MENU to COLOR it in CYAN
		print_colored_timewin:

			mov bx, 0xB800
			mov es, bx
			mov di, [row_col_offset_timewin]

		print_loop5win:

			lodsb
			or al, al
			jz done_printingwin

			mov es:[di], al
			inc di

			; Set the color attribute (Red on black background)
			mov byte [es:di], 0x0E
			inc di

			call sleep
			jmp print_loop5win

		;------------------------------------------------------------
			row_col_offset_timewin:
				dw (80 * 18 + 17) * 2 ; offset (row 18, column 17 - Formula [(80 * ypos + xpos) * 2])
		;------------------------------------------------------------	
		; this is done specifically for the MENU to COLOR it in CYAN
		print_colored_scorewin:

			mov bx, 0xB800
			mov es, bx
			mov di, [row_col_offset_scorewin]

		print_loop6win:

			lodsb
			or al, al
			jz done_printingwin

			mov es:[di], al
			inc di

			; Set the color attribute (Red on black background)
			mov byte [es:di], 0x0E
			inc di

			call sleep
			jmp print_loop6win

		;------------------------------------------------------------
			row_col_offset_scorewin:
				dw (80 * 18 + 45) * 2 ; offset (row 18, column 17 - Formula [(80 * ypos + xpos) * 2])
		;------------------------------------------------------------	
		; this is used for all other printing as NO COLOR is used abhi tak atleast
		print_stringwin:

			lodsb
			or al, al
			jz done_printingwin
			mov ah, 0Eh
			int 10h
			call sleep
			jmp print_stringwin
			
	;==============================================score handling=========================================================;
	display_score_increase:

	pusha
	push es
	
	
	mov ah, 0x13     ; service 13h - print string
    mov al, 1        ; subservice 01 - update cursor
    mov bh, 0        ; output on page 0
    mov bl, 0Bh      ; normal white on black attribute
    mov dx, 0x0380   ; row 4, column 31 (centered title position)
    mov cx, 3      ; length of the string
    push cs
    pop es           ; set ES to code segment
    mov bp, score10
    int 0x10         ; call BIOS video interrupt to print string
	
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	
	mov cx, 3      ; length of the string
    push cs
    pop es           ; set ES to code segment
    mov bp, space
    int 0x10         ; call BIOS video interrupt to print string
	
	add word[score_count],10
	
	mov ax,0x05
	push ax
	mov ax,0x2E
	push ax
	mov ax,[score_count]
	push ax
	call printnum1
	
	
	pop es
	popa
	ret
	;=================================for invalid input score handling=======================================;
	score_mistake:
	pusha
	push es
	
	
	mov ah, 0x13     ; service 13h - print string
    mov al, 1        ; subservice 01 - update cursor
    mov bh, 0        ; output on page 0
    mov bl, 1Eh      ; normal white on black attribute
    mov dx, 0x0380   ; row 4, column 31 (centered title position)
    mov cx, 2      ; length of the string
    push cs
    pop es           ; set ES to code segment
    mov bp, score2
    int 0x10         ; call BIOS video interrupt to print string
	
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	
	mov cx, 2      ; length of the string
    push cs
    pop es           ; set ES to code segment
	mov bl, 07h      ; normal white on black attribut
    mov bp, space
    int 0x10         ; call BIOS video interrupt to print string
	
	
	cmp word[score_count],0
	je donothing
	
	
	sub word[score_count],2
	
	
	donothing:
	mov ax,0x05
	push ax
	mov ax,0x2E
	push ax
	mov ax,[score_count]
	push ax
	call printnum1
	
	
	pop es
	popa
	ret
	
	;======================================sound for insertion===========================================================;
	insertion_sound:
	 ; Save all used registers
    pusha               ; Push general-purpose registers onto stack
    push es             ; Save ES register
    push dx             ; Save DX explicitly since it’s used for delay

    ; Set up PIT for square wave sound
    mov al, 0xB6        ; 0xB6 = binary 1011 0110
                        ; Set up channel 2 in mode 3 (square wave)
    out 0x43, al        ; Send command to PIT control register

    ; Calculate divisor for 500 Hz tone
    mov ax, 1193180 / 500 ; Divide PIT frequency by desired frequency (500 Hz)
    out 0x42, al          ; Low byte of divisor
    mov al, ah            ; Get high byte of divisor
    out 0x42, al          ; Send high byte of divisor

    ; Main loop for on-and-off sound effect
    mov cx, 50            ; Repeat 50 cycles (adjust to match 1-second duration)
main_loopsoundinsert:
    ; Enable PC speaker to start sound
    in al, 0x61           ; Read current value of port 0x61
    or al, 0x03           ; Set bits 0 and 1 to enable speaker
    out 0x61, al          ; Write back to port 0x61 to turn on speaker

    ; Short delay while sound is ON
    mov dx, 0x90       ; Adjust value for desired ON duration (approx 10 ms)
on_delayinsert:
    dec dx
    jnz on_delayinsert

    ; Disable PC speaker to stop sound
    in al, 0x61           ; Read current value of port 0x61
    and al, 0xFC          ; Clear bits 0 and 1 to disable speaker
    out 0x61, al          ; Write back to port 0x61 to turn off speaker

    ; Short delay while sound is OFF
    mov dx, 0x90         ; Adjust value for desired OFF duration (approx 10 ms)
off_delayinsert:
    dec dx
    jnz off_delayinsert

    ; Decrement loop counter
    loop main_loopsoundinsert

    ; Restore all saved registers
    pop dx               ; Restore DX explicitly
    pop es               ; Restore ES register
    popa                 ; Restore general-purpose registers

    ret                  ; Return to caller

	;===================================sound for mistakessss================================================================;
mistake_sound:
    ; Save all used registers
    pusha               ; Push general-purpose registers onto stack
    push es             ; Save ES register
    push dx             ; Save DX explicitly since it’s used for delay

    ; Set up PIT for square wave sound
    mov al, 0xB6        ; 0xB6 = binary 1011 0110
                        ; Set up channel 2 in mode 3 (square wave)
    out 0x43, al        ; Send command to PIT control register

    ; Calculate divisor for 500 Hz tone
    mov ax, 1193180 / 500 ; Divide PIT frequency by desired frequency (500 Hz)
    out 0x42, al          ; Low byte of divisor
    mov al, ah            ; Get high byte of divisor
    out 0x42, al          ; Send high byte of divisor

    ; Main loop for on-and-off sound effect
    mov cx, 50            ; Repeat 50 cycles (adjust to match 1-second duration)
main_loopsound:
    ; Enable PC speaker to start sound
    in al, 0x61           ; Read current value of port 0x61
    or al, 0x03           ; Set bits 0 and 1 to enable speaker
    out 0x61, al          ; Write back to port 0x61 to turn on speaker

    ; Short delay while sound is ON
    mov dx, 0x900        ; Adjust value for desired ON duration (approx 10 ms)
on_delay:
    dec dx
    jnz on_delay

    ; Disable PC speaker to stop sound
    in al, 0x61           ; Read current value of port 0x61
    and al, 0xFC          ; Clear bits 0 and 1 to disable speaker
    out 0x61, al          ; Write back to port 0x61 to turn off speaker

    ; Short delay while sound is OFF
    mov dx, 0x900         ; Adjust value for desired OFF duration (approx 10 ms)
off_delay:
    dec dx
    jnz off_delay

    ; Decrement loop counter
    loop main_loopsound

    ; Restore all saved registers
    pop dx               ; Restore DX explicitly
    pop es               ; Restore ES register
    popa                 ; Restore general-purpose registers

    ret                  ; Return to caller

	;=========================================================================================================================;
	
	display_score_increase_9e:

	pusha
	push es
	
	call sleep
	call sleep

	mov ah, 0x13     ; service 13h - print string
    mov al, 1        ; subservice 01 - update cursor
    mov bh, 0        ; output on page 0
    mov bl, 0Bh      ; normal white on black attribute
    mov dx, 0x0999   ; row 4, column 31 (centered title position)
    mov cx, 3      ; length of the string
    push cs
    pop es           ; set ES to code segment
    mov bp, score10
    int 0x10         ; call BIOS video interrupt to print string
	
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	
	mov cx, 3      ; length of the string
    push cs
    pop es           ; set ES to code segment
    mov bp, space
    int 0x10         ; call BIOS video interrupt to print string
	
	add word[score_count],10
	
	mov ax,0x0B
	push ax
	mov ax,0x47
	push ax
	mov ax,[score_count]
	push ax
	call printnum1
	
	
	pop es
	popa
	ret
	;=================================for invalid input score handling=======================================;
	
	score_mistake_9e:
	pusha
	push es
	
	
	mov ah, 0x13     ; service 13h - print string
    mov al, 1        ; subservice 01 - update cursor
    mov bh, 0        ; output on page 0
    mov bl, 1Eh      ; normal white on black attribute
    mov dx, 0x099A   ; row 4, column 31 (centered title position)
    mov cx, 2      ; length of the string
    push cs
    pop es           ; set ES to code segment
    mov bp, score2
    int 0x10         ; call BIOS video interrupt to print string
	
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	call sleep
	
	mov cx, 2      ; length of the string
    push cs
    pop es           ; set ES to code segment
	mov bl, 07h      ; normal white on black attribut
    mov bp, space
    int 0x10         ; call BIOS video interrupt to print string
	
	
	cmp word[score_count],0
	je donothing2
	
	sub word[score_count],2
	
	
	
	donothing2:
	mov ax,0x0B
	push ax
	mov ax,0x46
	push ax
	mov ax,[score_count]
	push ax
	call printnum1
	
	pop es
	popa
	ret

title_sscreen:
	call clrscr
	
print_top:

    mov ah, 0x13     ; service 13h - print string
    mov al, 1        ; subservice 01 - update cursor
    mov bh, 0        ; output on page 0
    mov bl, 0x8A              ; normal white on black attribute
    mov dx, 0x0308     ; row 0, column  (cursor position)
    mov cx,66    ; length of the string

    push cs
    pop es           ; set ES to code segment
    mov bp,top_row  ; offset of the string
    int 0x10         ; call BIOS video interrupt to print string
	
print_welcome:

    mov ah, 0x13     ; service 13h - print string
    mov al, 1        ; subservice 01 - update cursor
    mov bh, 0        ; output on page 0
    mov bl, 0x0F              ; normal white on black attribute
    mov dx, 0x051F     ; row 0, column  (cursor position)
    mov cx,17   ; length of the string

    push cs
    pop es           ; set ES to code segment
    mov bp,welcome  ; offset of the string
    int 0x10         ; call BIOS video interrupt to print string

print_bot:

    mov ah, 0x13     ; service 13h - print string
    mov al, 1        ; subservice 01 - update cursor
    mov bh, 0        ; output on page 0
    mov bl, 0x8A              ; normal white on black attribute
    mov dx, 0x1208     ; row 0, column  (cursor position)
    mov cx,66    ; length of the string

    push cs
    pop es           ; set ES to code segment
    mov bp,top_row  ; offset of the string
    int 0x10   
	
print_s:

    mov ah, 0x13     ; service 13h - print string
    mov al, 1        ; subservice 01 - update cursor
    mov bh, 0        ; output on page 0
    mov bl, 0x0E              ; normal white on black attribute
    mov dx, 0x070B     ; row 0, column  (cursor position)
    mov cx, 8      ; length of the string

    push cs
    pop es           ; set ES to code segment
    mov bp,S_row1  ; offset of the string
    int 0x10         ; call BIOS video interrupt to print string
	 ; Print on page 0 (row 2)
    mov dx, 0x080B   ; row 2, column (cursor position)
    mov bp, S_row2      ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
	
 ; Print on page 0 (row 3)
    mov dx, 0x090B   ; row 3, column (cursor position)
    mov bp, S_row3      ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
	
 ; Print on page 0 (row 4)
    mov dx, 0x0A0B    ; row 4, column (cursor position)
    mov bp, S_row4      ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
	
 ; Print on page 0 (row 5, different color)
    mov dx, 0x0B0B    ; row 5, column (cursor position)
    mov bp,S_row5      ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
	
 ; Print on page 0 (row 6)
    mov dx, 0x0C0B    ; row 6, column (cursor position)
    mov bp, S_row6      ; offset of the string
    int 0x10          ; call BIOS video interrupt to print string
	
    mov dx, 0x0D0B   ; row 6, column (cursor position)
    mov bp, S_row7     ; offset of the string
    int 0x10   

print_u:
    mov ah, 0x13     ; service 13h - print string
    mov al, 1        ; subservice 01 - update cursor
    mov bh, 0        ; output on page 0
    mov bl, 0x0E      ; normal white on black attribute
    mov dx, 0x0715   ; row 7, column (cursor position)
    mov cx, 8        ; length of the string

    push cs
    pop es           ; set ES to code segment
    mov bp, U_row1   ; offset of the string
    int 0x10         ; call BIOS video interrupt to print string

    mov dx, 0x0815   ; row 8, column (cursor position)
    mov bp, U_row2   ; offset of the string
    int 0x10         ; call BIOS video interrupt to print string

    mov dx, 0x0915   ; row 9, column (cursor position)
    mov bp, U_row3   ; offset of the string
    int 0x10         ; call BIOS video interrupt to print string

    mov dx, 0x0A15   ; row 10, column (cursor position)
    mov bp, U_row4   ; offset of the string
    int 0x10         ; call BIOS video interrupt to print string

    mov dx, 0x0B15   ; row 11, column (cursor position)
    mov bp, U_row5   ; offset of the string
    int 0x10         ; call BIOS video interrupt to print string

    mov dx, 0x0C15   ; row 12, column (cursor position)
    mov bp, U_row6   ; offset of the string
    int 0x10         ; call BIOS video interrupt to print string

    mov dx, 0x0D15   ; row 13, column (cursor position)
    mov bp, U_row7   ; offset of the string
    int 0x10   

print_d:
    mov ah, 0x13     ; service 13h - print string
    mov al, 1        ; subservice 01 - update cursor
    mov bh, 0        ; output on page 0
    mov bl, 0x8F     ; normal white on black attribute
    mov dx, 0x071F   ; row 7, column (cursor position)
    mov cx, 10        ; length of the string

    push cs
    pop es           ; set ES to code segment
    mov bp, D_row1   ; offset of the string
    int 0x10         ; call BIOS video interrupt to print string

    mov dx, 0x081F   ; row 8, column (cursor position)
    mov bp, D_row2   ; offset of the string
    int 0x10         ; call BIOS video interrupt to print string

    mov dx, 0x091F   ; row 9, column (cursor position)
    mov bp, D_row3   ; offset of the string
    int 0x10         ; call BIOS video interrupt to print string

    mov dx, 0x0A1F   ; row 10, column (cursor position)
    mov bp, D_row4   ; offset of the string
    int 0x10         ; call BIOS video interrupt to print string

    mov dx, 0x0B1F   ; row 11, column (cursor position)
    mov bp, D_row5   ; offset of the string
    int 0x10         ; call BIOS video interrupt to print string

    mov dx, 0x0C1F   ; row 12, column (cursor position)
    mov bp, D_row6   ; offset of the string
    int 0x10         ; call BIOS video interrupt to print string

    mov dx, 0x0D1F   ; row 13, column (cursor position)
    mov bp, D_row7   ; offset of the string
    int 0x10   

print_o:
    mov ah, 0x13     ; service 13h - print string
    mov al, 1        ; subservice 01 - update cursor
    mov bh, 0        ; output on page 0
    mov bl, 0x8F     ; normal white on black attribute
    mov dx, 0x0729   ; row 7, column (cursor position)
    mov cx, 8        ; length of the string

    push cs
    pop es           ; set ES to code segment
    mov bp, O_row1   ; offset of the string
    int 0x10         ; call BIOS video interrupt to print string

    mov dx, 0x0829   ; row 8, column (cursor position)
    mov bp, O_row2   ; offset of the string
    int 0x10         ; call BIOS video interrupt to print string

    mov dx, 0x0929   ; row 9, column (cursor position)
    mov bp, O_row3   ; offset of the string
    int 0x10         ; call BIOS video interrupt to print string

    mov dx, 0x0A29   ; row 10, column (cursor position)
    mov bp, O_row4   ; offset of the string
    int 0x10         ; call BIOS video interrupt to print string

    mov dx, 0x0B29   ; row 11, column (cursor position)
    mov bp, O_row5   ; offset of the string
    int 0x10         ; call BIOS video interrupt to print string

    mov dx, 0x0C29   ; row 12, column (cursor position)
    mov bp, O_row6   ; offset of the string
    int 0x10         ; call BIOS video interrupt to print string

    mov dx, 0x0D29   ; row 13, column (cursor position)
    mov bp, O_row7   ; offset of the string
    int 0x10   
	
print_k:
    mov ah, 0x13     ; service 13h - print string
    mov al, 1        ; subservice 01 - update cursor
    mov bh, 0        ; output on page 0
    mov bl, 0x0E      ; normal white on black attribute
    mov dx, 0x0733   ; row 7, column (cursor position)
    mov cx, 8        ; length of the string

    push cs
    pop es           ; set ES to code segment
    mov bp, K_row1   ; offset of the string
    int 0x10         ; call BIOS video interrupt to print string

    mov dx, 0x0833   ; row 8, column (cursor position)
    mov bp, K_row2   ; offset of the string
    int 0x10         ; call BIOS video interrupt to print string

    mov dx, 0x0933   ; row 9, column (cursor position)
    mov bp, K_row3   ; offset of the string
    int 0x10         ; call BIOS video interrupt to print string

    mov dx, 0x0A33   ; row 10, column (cursor position)
    mov bp, K_row4   ; offset of the string
    int 0x10         ; call BIOS video interrupt to print string

    mov dx, 0x0B33   ; row 11, column (cursor position)
    mov bp, K_row5   ; offset of the string
    int 0x10         ; call BIOS video interrupt to print string

    mov dx, 0x0C33   ; row 12, column (cursor position)
    mov bp, K_row6   ; offset of the string
    int 0x10         ; call BIOS video interrupt to print string

    mov dx, 0x0D33   ; row 13, column (cursor position)
    mov bp, K_row7   ; offset of the string
    int 0x10   

print_u1:

    mov ah, 0x13     ; service 13h - print string
    mov al, 1        ; subservice 01 - update cursor
    mov bh, 0        ; output on page 0
    mov bl, 0x0E     ; normal white on black attribute
    mov dx, 0x073D   ; row 7, column (cursor position)
    mov cx, 8        ; length of the string

    push cs
    pop es           ; set ES to code segment
    mov bp, U_row1   ; offset of the string
    int 0x10         ; call BIOS video interrupt to print string

    mov dx, 0x083D   ; row 8, column (cursor position)
    mov bp, U_row2   ; offset of the string
    int 0x10         ; call BIOS video interrupt to print string

    mov dx, 0x093D   ; row 9, column (cursor position)
    mov bp, U_row3   ; offset of the string
    int 0x10         ; call BIOS video interrupt to print string

    mov dx, 0x0A3D   ; row 10, column (cursor position)
    mov bp, U_row4   ; offset of the string
    int 0x10         ; call BIOS video interrupt to print string

    mov dx, 0x0B3D   ; row 11, column (cursor position)
    mov bp, U_row5   ; offset of the string
    int 0x10         ; call BIOS video interrupt to print string

    mov dx, 0x0C3D   ; row 12, column (cursor position)
    mov bp, U_row6   ; offset of the string
    int 0x10         ; call BIOS video interrupt to print string

    mov dx, 0x0D3D   ; row 13, column (cursor position)
    mov bp, U_row7   ; offset of the string
    int 0x10   
	
print_enter:
    mov ah, 0x13     ; service 13h - print string
    mov al, 1        ; subservice 01 - update cursor
    mov bh, 0        ; output on page 0
    mov bl, 0x0F    ; normal white on black attribute
    mov dx, 0x101B   ; row 7, column (cursor position)
    mov cx, 23    ; length of the string
	
    mov bp, press   ; offset of the string
    int 0x10         ; call BIOS video interrupt to print string
	
wait_for_space:

        mov ah, 00h       ; BIOS keyboard interrupt function to read a key press
        int 16h           ; Wait for a key press
        cmp al, ' '      ; Check if the scanned key is the Spacebar (scan code 0x39)
        jne wait_for_space ; If not Spacebar, loop back and wait for another key press

    ret
	
title_sscreene:
	call clrscr
	
print_tope:

    mov ah, 0x13     ; service 13h - print string
    mov al, 1        ; subservice 01 - update cursor
    mov bh, 0        ; output on page 0
    mov bl, 0x8A              ; normal white on black attribute
    mov dx, 0x0308     ; row 0, column  (cursor position)
    mov cx,66    ; length of the string

    push cs
    pop es           ; set ES to code segment
    mov bp,top_row  ; offset of the string
    int 0x10         ; call BIOS video interrupt to print string
	
print_welcomee:

    mov ah, 0x13     ; service 13h - print string
    mov al, 1        ; subservice 01 - update cursor
    mov bh, 0        ; output on page 0
    mov bl, 0x0F              ; normal white on black attribute
    mov dx, 0x051F     ; row 0, column  (cursor position)
    mov cx,17   ; length of the string

    push cs
    pop es           ; set ES to code segment
    mov bp,welcome  ; offset of the string
    int 0x10         ; call BIOS video interrupt to print string


	
start:
	
	call title_sscreen
		
	mov byte[mistake_count],0
	mov byte[score_count],0
	mov byte[mistake_lost],0

	
	mov ah, 00h  
	mov al, 03h 
	int 10h      
		
	;=================== MENU DISPLAY ======================================
	
		 ; Display the title: "Main Menu"
	mov ah, 02h    ; Set cursor position function
    mov bh, 0      
    mov dh, 3   ; Row 3
    mov dl, 32 ; Column 32
    int 10h  

    mov si, menu_msg  ; Load address of title_msg into SI
    call print_colored_menu  
		
		;------------------------------------------------------------
        ; Display the title: "Welcome to Sudoku Game"
	mov ah, 02h    ; Set cursor position function
    mov bh, 0      
    mov dh,6   ; Row 6
    mov dl,26  ; Column 26
    int 10h  

    mov si, title_msg  ; Load address of title_msg into SI
    call print_colored_sudoko  
		
	;------------------------------------------------------------
    ; Display the lines ABOVE the title"
	
	mov ah, 02h    
    mov bh, 0     
    mov dh,5   ; row: 5 (one row above the the title)   
    mov dl,24  ; col: 24
    int 10h  
		
    mov si, title_horizontal  
    call print_string
		
    ;------------------------------------------------------------
     ; this displays the lines BELOW the Title
	mov ah, 02h   
    mov bh, 0      
    mov dh,7   ; Row 7 (one row lower the the title)
    mov dl,24  ; Column 24
    int 10h  

    mov si, title_horizontal  
    call print_string
		
	;------------------------------------------------------------
	; this displays the title "Grid" option
    mov ah, 02h   
    mov bh, 0      
    mov dh, 11  ; Row 11
    mov dl, 5   ; Column 5
    int 10h      
		
	mov si, grid_choice  
    call print_colored_grid
		
	;------------------------------------------------------------
	; this displays the message "4 x 4 Grid" 
	mov ah, 02h    
    mov bh, 0     
	
	mov dh,11   ; Row 11
	mov dl,23   ; Column 23
	int 10h 
	
	mov si, grid_msg4  
	call print_colored_4x4
	
	;------------------------------------------------------------
	; this displays the lines BELOW the 4 x 4 Grid
	mov ah, 02h   
	mov bh, 0     
	mov dh,12   ; Row 12
	mov dl,22   ; Column 22
	int 10h 
		
	mov si, grid_horizontal 
	call print_string
	
	;------------------------------------------------------------
	; this displays the text "OR" 
	mov ah, 02h   
	mov bh, 0      
	mov dh, 11   ; Row 11
	mov dl, 37   ; Column 37
	int 10h      
	
	mov si, grid_Or 
	call print_string
	
	;------------------------------------------------------------
	; this displays the text "9 x 9 Grid" 
	mov ah, 02h   
	mov bh, 0      
	mov dh, 11   ; Row 11
	mov dl,44    ; Column 44
	int 10h      
	
	mov si, grid_msg9 
	call print_colored_9x9
	
	;------------------------------------------------------------
	; this displays the lines BELOW the 9 x 9 Title
	mov ah, 02h   
	mov bh, 0      
	mov dh, 12   ; Row 12
	mov dl, 43   ; Column 43
	int 10h 
	
	mov si, grid_horizontal  
	call print_string

	;------------------------------------------------------------
	; this displays the title "Difficulty" option
	mov ah, 02h   
	mov bh, 0      
	mov dh, 15   ; Row 15
	mov dl, 3   ; Column 3
	int 10h      
	
	mov si, difficult_choice  
	call print_colored_diff
	
	;------------------------------------------------------------
	; this displays the title "Easy" option
	mov ah, 02h   
	mov bh, 0      
	mov dh, 15  ; Row 15
	mov dl, 22  ; Column 22
	int 10h      
	
	mov si, easy_msg  
	call print_colored_easy
	
	;------------------------------------------------------------
	; this displays the title "Medium" option
	mov ah, 02h   
	mov bh, 0      
	mov dh, 15   ; Row 15
	mov dl, 35   ; Column 35
	int 10h      
	
	 mov si, medium_msg  
	call print_colored_med

	;------------------------------------------------------------
	; this displays the title "Hard" option
	mov ah, 02h    
	mov bh, 0      
	mov dh, 15    ; Row 15
	mov dl, 49    ; Column 49
	int 10h        
	
	mov si, hard_msg 
	call print_colored_hard
	;------------------------------------------------------------
	;displays the title of "Enter Choice of Grid"
	mov ah, 02h    
	mov bh, 0      
	mov dh, 20   ; Row 20
	mov dl, 5   ; Column 0
	int 10h      
	
	mov si, input_msggrid 
	call print_string
	
	;------------------------------------------------------------	
	; It takes the input for which grid to choose (4x4 or 9x9)
	;------------------------------------------------------------
	
	call get_input
	
	cmp al,'4'
	je correct2
	
	cmp al,'9'
	je correct2
	
	call incorrectinput
	jmp correct 
	
	correct2:
	mov [input_grid],al
	
	mov ah, 02h    
	mov bh, 0      
	mov dh, 20   ; Row 20
	mov dl,28   ; Column 0
	int 10h 
	
	mov si,input_grid		
	call print_string
	
	;------------------------------------------------------------
	;displays the title of "Enter Choice of Level"
	mov ah, 02h   
	mov bh, 0     
	mov dh, 20   ; Row 21
	mov dl, 41   ; Column 0
	int 10h    
	;------------------------------------------------------------  
	; It takes the input for which difficulty to choose (Easy/Med/Hard)
	mov si, input_msglvl
	call print_string
	;------------------------------------------------------------  
	call get_input
	cmp al,'e'
	je correct
	
	cmp al,'m'
	je correct
	
	cmp al,'h'
	je correct
	
	call incorrectinput

endgame:

    mov byte[timerEnabled],0

	mov byte[mistake_count],0
	mov byte[score_count],0
	
	cmp byte[mistake_lost],1
	je losing_asm
	
	mov ax, 0x4c00   ; Terminate program function
	int 21h  

game_won:
	 mov byte[cs:timerEnabled],0

	jmp win_asm