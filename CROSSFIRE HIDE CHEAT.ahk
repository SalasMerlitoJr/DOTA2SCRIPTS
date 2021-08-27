#SingleInstance, Force
Gui, Add, Picture, x-30 y-40 w450 h250 ,  C:\Users\Administrator\Downloads\DOTA 2 NEW HACKS (updated)\Crossfire Vip Hack.png

Scrolling_Text := "****Crossfire Hack****"
X1 := -100

Scrolling_Text2 := "Press G Show hack"
X2 := -100

Gui, Font, s14 Verdana c0AFA2A
Gui, Add, Text, x10, Wallhack (Hack #1)
Gui, Font, s14 Verdana cYellow
Gui, Add, Text, x10, AutoHead (Hack #2)
Gui, Font, s14 Verdana cRed
Gui, Add, Text, x10, Fast Kinfe (Hack #3)
Gui, Font, s14 Verdana cBlue
Gui, Add, Text, x10, Aimbot (Hack #4) 
Gui, Font, s14 Verdana cA104FA
Gui, Add, Text, x10, No Fog (Hack #5)
Gui, Font, s14 Verdana c04FAEF
Gui, Add, Text, x10, No Smoke (Hack #6)
Gui, Font, s14 Verdana cFA04CD
Gui, Add, Text, x10, Bunny Hop (Hack #7)

Gui, +AlwaysonTop
Gui, Color, Red
Gui, Show, w400 h900, Spell List for Crossfire hack 2020

Gui, Font, s20
Gui, Add, Text,c4BFA04 x%X1% x1 y1 vMoving_Text, %Scrolling_Text%
Gui, Add, Text,cRed x%X2% x100 y420 vMoving_Text2, %Scrolling_Text2%


Gui,Color,Red
Gui, Add,Button, x1 y450 w400 h50 gStart_Moving,Click Here to Activate the Hack

Gui, +AlwaysOnTop
Gui,Color,Black

Gui,Show, x20 y100 w400 h500,EZ CROSSFIRE HACK
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




;create a GUI
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Gui, New

Gui, Font, s14 Verdana cRED
Gui, Add, Text, x10, Press "l" AUTOBUY ITEMS(Skywrath Mage)
Gui, Add, Text, x10, ITEM# 1 (Rod of Atoz)
Gui, Add, Text, x10, ITEM# 1 (Veil of Discord)
Gui, Add, Text, x10, ITEM# 1 (Ethereal Blade)
Gui, Add, Text, x10, ITEM# 1 (Scythe of Vyse)
Gui, Add, Text, x10, ITEM# 1 (Dagon Level 5)
Gui, Add, Text, x10, ITEM# 1 (Shiva'S Guard)
Gui, Add, Text, x10, ITEM# 1 (Aghanim's Blessing)

Gui, +AlwaysOnTop
Gui, Color, Black
Gui, Show, w400 h300, AUTOBUY ITEMS (Skywrath Mage)
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;TO GET POSITIONS USE THE CLICKTEST.AHK SCRIPT ON MY MEDIAFIRE AND PRESS X 
;WHILE YOUR MOUSE IS IN THE SPOT YOU NEED IT TO BE! 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
CoordMode, Mouse

SetDefaultMouseSpeed, 2

;THIS IS A DEMO FOR OMNIKNIGHT WHERE I REMOVE AN AGS AND USE MANA BOOTS INSTANTLY
Home::
send, {Ins}
MouseGetPos, xpos, ypos
Click down 59, 70
loop, 1
{
Send, {LButton}
Sleep, 10
}
MouseGetPos, xpos, ypos
Click down 48,90
loop, 1
{
Send, {LButton}
Sleep, 10
}
MouseGetPos, xpos, ypos
Click down 38, 408
loop, 2
{
Send, {LButton}
Sleep, 10
}
MouseGetPos, xpos, ypos
Click down 56, 470
loop, 1
{
Send, {LButton}
Sleep, 10
}
MouseGetPos, xpos, ypos
Click down 59, 70
loop, 2
{
Send, {LButton}
Sleep, 10
}
Send, {Ins}
return




Del::
send, {Ins}
MouseGetPos, xpos, ypos
Click down 59, 70
loop, 1
{
Send, {RButton}
Sleep, 10
}
MouseGetPos, xpos, ypos
Click down 48,90
loop, 10
{
Send, {RButton}
Sleep, 10
}
MouseGetPos, xpos, ypos
Click down 38, 408
loop, 2
{
Send, {RButton}
Sleep, 10
}
MouseGetPos, xpos, ypos
Click down 56, 470
loop, 1
{
Send, {RButton}
Sleep, 10
}
MouseGetPos, xpos, ypos
Click down 59, 70
loop, 2
{
Send, {RButton}
Sleep, 10
}
Send, {Ins}
return


End::exitapp