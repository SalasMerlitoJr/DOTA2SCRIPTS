#SingleInstance, Force
Gui, Add, Picture, x-10 y-10 w430 h250,  C:\Users\Gamer\Downloads\DOTA 2 NEW HACKS (updated)\invoker.png



I_Icon = C:\Users\User\Downloads\DOTA 2 NEW HACKS (updated)\download (1).ico
IfExist, %I_Icon%
	Menu, Tray, Icon, %I_Icon%
;return









Scrolling_Text := "****INVOKER Combo Skills + Item Hack****"
X1 := -100

Scrolling_Text2 := "Press hotkeys"
X2 := -100

Gui, Font, s14 Verdana c0AFA2A
Gui, Add, Text, x10, Cold Snap (Press "C")
Gui, Font, s14 Verdana cYellow
Gui, Add, Text, x10, Tornado (Press "1")
Gui, Font, s14 Verdana cRed
Gui, Add, Text, x10, Meteor Stone (Press "2")
Gui, Font, s14 Verdana cBlue
Gui, Add, Text, x10, Deafining Blast (Press "3")
Gui, Font, s14 Verdana cA104FA
Gui, Add, Text, x10, Sunstrike (Press "U")
Gui, Font, s14 Verdana c04FAEF
Gui, Add, Text, x10, Ghost Walk (Press "G")
Gui, Font, s14 Verdana cFFFF33
Gui, Add, Text, x10, Forge Spirit (Press "O")
Gui, Font, s14 Verdana cFF3300
Gui, Add, Text, x10, EMP (Press "M")
Gui, Font, s14 Verdana c00FFFF
Gui, Add, Text, x10, ICE WALL (Press "K")
Gui, Font, s14 Verdana cFFCC99
Gui, Add, Text, x10, ALACRITY (Press "L")

Gui, +AlwaysonTop
Gui, Color, Red
Gui, Show, w400 h1300, Spell List for INJOKER #1

Gui, Font, s20
Gui, Add, Text,c4BFA04 x%X1% x1 y1 vMoving_Text, %Scrolling_Text%
Gui, Add, Text,cRed x%X2% x170 y200 vMoving_Text2, %Scrolling_Text2%


Gui,Color,Red
Gui, Add,Button, x1 y545 w400 h50 gStart_Moving,Click Here to Activate the Hack

Gui, +AlwaysOnTop
Gui,Color,Black

Gui,Show, x20 y150 w400 h600,EZ COMBO INJOKER Hack
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


~c::
coldsnap:
SendInput, qqqrc
Sleep, 50
return


~g::
instantInvis:
SendInput, qqwrv
Sleep, 50
return


~k::
iceWall:
SendInput, qqerg
Sleep, 50
return

~m::
EMP:
SendInput, wwwrc
Sleep, 50
return

~1::
tornado: 
SendInput, wwqrx
Sleep, 50
return


~l::
alacrity:
SendInput, wwerz
Sleep, 50
return


~3::
sonicWave:
SendInput, qwerb
Sleep, 50
return


~u::
sunstrike:
SendInput, eeert
Sleep, 50
return


~o::
forgedSpirits:
SendInput, eeqrf
Sleep, 50
return


~2::
meatball:
SendInput, eewrd
Sleep, 50
return

End::exitapp