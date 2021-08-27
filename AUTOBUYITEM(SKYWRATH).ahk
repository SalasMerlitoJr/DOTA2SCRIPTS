#SingleInstance, Force
Gui, Add, Picture, x-90 y-40 w500 h280 ,  C:\Users\User\Downloads\2.png




I_Icon = C:\Users\User\Downloads\DOTA 2 NEW HACKS (updated)\download (1).ico
IfExist, %I_Icon%
	Menu, Tray, Icon, %I_Icon%
;return








Gui, Font, s20 Verdana cRed
Gui, Add, Text, x10, y100 w250 h30 +BackgroundTrans, Press "L" AutoBuy Item

Scrolling_Text := "****AutoBuy Items****"
X1 := -100

Scrolling_Text2:= "****Press L****"
X2 := -100


Gui, Font, s20
Gui, Add, Text,cBlue x-1 y100 x%X1% x10 y10 vMoving_Text, %Scrolling_Text%
Gui, Add, Text,cRed x-2 y100 x%X1% x60 y170 vMoving_Text2, %Scrolling_Text2%


Gui,Color,Blue
Gui, Add,Button, x1 y200 w350 h50 gStart_Moving,Click Here to Activate the Hack

Gui, +AlwaysOnTop
Gui,Color,Black

Gui,Show, x10 y150 w330 h250,Skywrath Autobuy items
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
Click down 1388, 397
loop, 1
{
Send, {RButton}
Sleep, 200
}
MouseGetPos, xpos, ypos
Click down 1346, 568
loop, 1
{
Send, {RButton}
Sleep, 200
}
MouseGetPos, xpos, ypos
Click down 1440, 606
loop, 2
{
Send, +{LButton}
Sleep, 200
}
MouseGetPos, xpos, ypos
Click down 1724, 822
loop, 1
{
Send, {RButton}
Sleep, 200
}
MouseGetPos, xpos, ypos
Click down 1443, 464
loop, 2
{
Send, +{LButton}
Sleep, 200
}
MouseGetPos, xpos, ypos
Click down 1725, 798
loop, 1
{
Send, {RButton}
Sleep, 200
}
MouseGetPos, xpos, ypos
Click down 1676, 129
loop, 2
{
Send, {LButton}
Sleep, 200
}
MouseGetPos, xpos, ypos
Click down 1598, 407
loop, 1
{
Send, +{LButton}
Sleep, 200
}
MouseGetPos, xpos, ypos
Click down 1723, 797
loop, 2
{
Send, +{LButton}
Sleep, 200
}
MouseGetPos, xpos, ypos
Click down 1717, 757
loop, 2
{
Send, +{LButton}
Sleep, 200
}
MouseGetPos, xpos, ypos
Click down 1714, 775
loop, 1
{
Send, {RButton}
Sleep, 200
}
MouseGetPos, xpos, ypos
Click down 1595, 473
loop, 1
{
Send, {RButton}
Sleep, 200
}
MouseGetPos, xpos, ypos
Click down 1800, 440
loop, 1
{
Send, {RButton}
Sleep, 200
}MouseGetPos, xpos, ypos
Click down 75, 350
loop, 2
{
Send, {LButton}
Sleep, 200
}
MouseMove, %xpos%, %ypos%
Send, {LButton}
Sleep, 1
Send, {escape}
return


End::exitapp