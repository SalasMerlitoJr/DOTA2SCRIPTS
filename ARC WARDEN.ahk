#SingleInstance, Force
Gui, Add, Picture, x-10 y-20 w430 h250,  C:\Users\User\Downloads\DOTA 2 NEW HACKS (updated)\arc warden.png



I_Icon = C:\Users\User\Downloads\DOTA 2 NEW HACKS (updated)\download (1).ico
IfExist, %I_Icon%
	Menu, Tray, Icon, %I_Icon%
;return









Scrolling_Text := "****ARC WARDEN Combo Wombo Skills + Item Hack****"
X1 := -100

Scrolling_Text2 := "Press G"
X2 := -100

Gui, Font, s14 Verdana c0AFA2A
Gui, Add, Text, x10, Item Slot 1 (Atoz Rod)
Gui, Font, s14 Verdana cYellow
Gui, Add, Text, x10, Item Slot 2 (Veil of Discord)
Gui, Font, s14 Verdana cRed
Gui, Add, Text, x10, Item Slot 3 (Scythe of Vyse)
Gui, Font, s14 Verdana cBlue
Gui, Add, Text, x10, Skill 1-FLUX 
Gui, Font, s14 Verdana cA104FA
Gui, Add, Text, x10, Skill 2-MAGENTIC FIELD
Gui, Font, s14 Verdana c04FAEF
Gui, Add, Text, x10, Skill 3-SPARK WRAITH

Gui, +AlwaysonTop
Gui, Color, Red
Gui, Show, w400 h1300, Spell List for ARC WARDEN #1

Gui, Font, s20
Gui, Add, Text,c4BFA04 x%X1% x1 y1 vMoving_Text, %Scrolling_Text%
Gui, Add, Text,cRed x%X2% x170 y200 vMoving_Text2, %Scrolling_Text2%


Gui,Color,Red
Gui, Add,Button, x1 y450 w400 h50 gStart_Moving,Click Here to Activate the Hack

Gui, +AlwaysOnTop
Gui,Color,Black

Gui,Show, x20 y150 w400 h500,EZ Skywrath Mage Hack
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

	
	
	~g:: ;
#MaxThreadsPerHotkey 200
Send, !q ; Item Slot1 , u can change "1" to your key.
Send, !w ; Item Slot2 , u can change "2" to your key.
send, {c}
send, {f}
Send, !e ; Item Slot2 , u can change "3" to your key.
send, {r}

return
	
	
End::exitapp