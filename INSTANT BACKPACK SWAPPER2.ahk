#SingleInstance, Force
Gui, Add, Picture, x-50 y-10 w400 h205 ,  C:\Users\User\Downloads\DOTA 2 NEW HACKS (updated)\ward.png


I_Icon = C:\Users\User\Downloads\DOTA 2 NEW HACKS (updated)\download (1).ico
IfExist, %I_Icon%
	Menu, Tray, Icon, %I_Icon%
;return









Scrolling_Text := "****Backpack Swapper****"
X1 := -100

Scrolling_Text2:= "**Press V**"
X2 := -100


Gui, Font, s20
Gui, Add, Text,cc0AFA2A x-1 y100 x%X1% x10 y10 vMoving_Text, %Scrolling_Text%
Gui, Add, Text,cRed x-70 y120 x%X1% x90 y145 vMoving_Text2, %Scrolling_Text2%


Gui,Color,Blue
Gui, Add,Button, x1 y200 w350 h50 gStart_Moving,Click Here to Activate the Hack

Gui, +AlwaysOnTop
Gui,Color,Black

Gui,Show, x10 y150 w330 h250,Backpack Swapper
return






GuiClose:
	ExitApp
	return


Start_Moving:
	Loop
	{
			X1 ++
			if(X1>=100)
			{
				X1:= -200
				GuiControl,Move,Moving_Text,x%X1%
			}
		else
			{
				GuiControl,Move,Moving_Text,x%X1%
			}
		Sleep, 10
	}
	return
	


CoordMode, Mouse

SetDefaultMouseSpeed, 2

var = 1

;COLUMNS
;1 X 1138
;2 X 1205
;3 X 1270

;ROWS
;1 y 964
;2 y 1013

;3backpack y 1053


slot1(){
Click down 1138, 964 
Click up 1138, 1053
return
}

returnSlot1(){ 
Click down 1138, 1053
Click up 1138, 964
return
}

slot2(){ 
Click down 1205, 964 
Click up 1205, 1053
return
}

returnSlot2(){ 
Click down 1205, 1053
Click up 1205, 964 
return
}

slot3(){ 
Click down 1270, 964 
Click up 1270, 1053
return
}

returnSlot3(){ 
Click down 1270, 1053
Click up 1270, 964 
return
}

slot4(){ 
Click down 1138, 1013 
Click up 1138, 1053
return
}

returnSlot4(){ 
Click down 1138, 1053
Click up 1138, 1013 
return
}

slot5(){ 
Click down 1205, 1013 
Click up 1205, 1053
return
}

returnSlot5(){ 
Click down 1205, 1053
Click up 1205, 1013 
return
}

slot6(){ 
Click down 1270, 1013
Click up 1270, 1053
return
}

returnSlot6(){ 
Click down 1270, 1053
Click up 1270, 1013
return
}




v::
MouseGetPos, xpos, ypos
if(var == 1){
	slot4()
	var = 0
}
else {
	returnSlot4()
	var = 1
}
MouseMove, %xpos%, %ypos%
return


End::exitapp