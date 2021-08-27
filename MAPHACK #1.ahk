#SingleInstance, Force
Gui, Add, Picture, x-110 y-30 w550 h280 ,  C:\Users\User\Downloads\DOTA 2 NEW HACKS (updated)\dotati.png
I_Icon = C:\Users\User\Downloads\DOTA 2 NEW HACKS (updated)\download (1).ico
IfExist, %I_Icon%
	Menu, Tray, Icon, %I_Icon%
;return


Scrolling_Text := "****MAPHACK #1****"
X1 := -10



Scrolling_Text2 := "****BEWARE OF MAPHACKERS****"
X2 := -100


Gui, Font, s15
Gui, Add, Text,c4BFA04 x-1 y100 x%X1% x10 y10 vMoving_Text, %Scrolling_Text%
Gui, Add, Text,cyellow x-2 y100 x%X2% x1 y220 vMoving_Text2, %Scrolling_Text2%


Gui,Color,Blue
Gui, Add,Button, x1 y250 w350 h50 gStart_Moving,Click Here to Activate the Hack


Gui, +AlwaysOnTop
Gui,Color,Black

Gui,Show, x10 y150 w330 h300,MAP HACK #1
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
	





End::exitapp