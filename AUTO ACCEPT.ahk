#SingleInstance, Force
Gui, Add, Picture, x10 y-40 w330 h350 ,  C:\Users\User\Downloads\DOTA 2 NEW HACKS (updated)\aegis.png



I_Icon = C:\Users\User\Downloads\DOTA 2 NEW HACKS (updated)\download (1).ico
IfExist, %I_Icon%
	Menu, Tray, Icon, %I_Icon%
;return







Scrolling_Text := "****AUTO ACCEPT Hack****"
X1 := -100

Scrolling_Text2:= "****Press H****"
X2 := -100


Gui, Font, s20
Gui, Add, Text,c4BFA04 x-1 y100 x%X1% x10 y10 vMoving_Text, %Scrolling_Text%
Gui, Add, Text,cBlue x-2 y100 x%X1% x60 y250 vMoving_Text2, %Scrolling_Text2%



Gui, Add,Button, x1 y300 w350 h50 gStart_Moving,Click Here to Activate the Hack

Gui, +AlwaysOnTop
Gui,Color,Black

Gui,Show, x10 y150 w350 h350,AUTO ACCEPT Hack
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

~h:: ;
loop, 100000000000000000000000000000000000000
{
Send {Lbutton}
Sleep 1
}
return


	
End::exitapp