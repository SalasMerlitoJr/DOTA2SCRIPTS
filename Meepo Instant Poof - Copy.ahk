#SingleInstance, Force
Gui, Add, Picture, x-10 y-20 w430 h200,  C:\Users\User\Downloads\DOTA 2 NEW HACKS (updated)\meepo.png

Scrolling_Text := "****Meepo Combo + Item Hack****"
X1 := -100

Scrolling_Text2 := "Press G"
X2 := -100

Gui, Font, s14 Verdana c0AFA2A
Gui, Add, Text, x10, Item Slot 1 (Diffusal Blade)
Gui, Font, s14 Verdana cYellow
Gui, Add, Text, x10, Item Slot 2 (Ethereal Blade)
Gui, Font, s14 Verdana cRed
Gui, Add, Text, x10, Item Slot 3 (Scythe of Vyse)
Gui, Font, s14 Verdana cBlue
Gui, Add, Text, x10, Skill 1 Poof
Gui, Font, s14 Verdana cA104FA
Gui, Add, Text, x10, Skill 2 Net
Gui, Font, s14 Verdana c04FAEF
Gui, Add, Text, x10, Skill 3 Meepo Clone
Gui, Font, s14 Verdana cFA04CD
Gui, Add, Text, x10, Ultimate KillinG Cheat

Gui, +AlwaysonTop
Gui, Color, Red
Gui, Show, w400 h900, Spell List for Meepo Geomancer #1

Gui, Font, s20
Gui, Add, Text,c4BFA04 x%X1% x1 y1 vMoving_Text, %Scrolling_Text%
Gui, Add, Text,cRed x%X2% x170 y150 vMoving_Text2, %Scrolling_Text2%


Gui,Color,Red
Gui, Add,Button, x1 y400 w400 h50 gStart_Moving,Click Here to Activate the Hack

Gui, +AlwaysOnTop
Gui,Color,Black

Gui,Show, x20 y100 w400 h450,EZ Meepo Geomancer Combo Hack
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




~g:: ;keypress for 4 meepos poof, u can edit that "g" to what you want.
send, !q ; Item Slot1 , u can change "1" to your key.
send, !w ; Item Slot2 , u can change "2" to your key.
send, {tab}
send, {f}
send, {e}
send, {tab}
send, {f}
send, {e}
send, {tab}
send, {f}
send, {e}
send, {tab}
send, {f}
send, {e}
send, {tab}
send, {f}
send, {e}
send, {F1}
send, {F11}
return

End::exitapp