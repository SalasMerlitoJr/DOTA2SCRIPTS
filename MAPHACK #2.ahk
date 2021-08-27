#SingleInstance,Force
pToken:=Gdip_Startup()
global Button:=[]
global X_Position_Edit,Y_Position_Edit,W_Position_Edit,H_Position_Edit,Name_Edit,Options_Edit,Title_Edit,Bitmap_Edit
Main:=New Custom_Window(x:="",y:="",w:=400,h:=250,Name:=1,Options:="+AlwaysOnTop -Caption -DPIScale",Title:="HB Custom Window Maker",Background_Bitmap:=Custom_Window_Maker_Tool_Background())
 
Gui,1:Add,Text,x46 y0 w270 h30 BackgroundTrans gMove_Window 
Gui,1:Add,Text,x360 y5 w15 h15 BackgroundTrans gMin_Window
Gui,1:Add,Text,x380 y5 w15 h15 BackgroundTrans gGuiClose
Gui,1:Color,222222,222222
Gui,1:Font,caaaaaa s8,Segoe Ui 
Gui,1:Add,Edit,x36 y48 w79 h20 -E0x200 Center vX_Position_Edit gSubmit_All ,
Gui,1:Add,Edit,x150 y48 w79 h20 -E0x200 Center vY_Position_Edit gSubmit_All ,
Gui,1:Add,Edit,x36 y88 w79 h20 -E0x200 Center vW_Position_Edit gSubmit_All ,300
Gui,1:Add,Edit,x150 y88 w79 h20 -E0x200 Center vH_Position_Edit gSubmit_All ,200
Gui,1:Add,Edit,x74 y124 w169 h20 -E0x200 Center vName_Edit gSubmit_All ,1
Gui,1:Add,Edit,x74 y154 w169 h20 -E0x200 vOptions_Edit gSubmit_All ,+AlwaysOnTop -Caption -DPIScale
Gui,1:Add,Edit,x74 y184 w169 h20 -E0x200 vTitle_Edit gSubmit_All ,Custom Gui Window
Gui,1:Add,Edit,x74 y214 w169 h20 -E0x200 vBitmap_Edit gSubmit_All ,HB_BITMAP_MAKER()
 
 
 
Button.Push(New Button_Type1(x:=257,y:=35,w:=133,h:=41,text:="Clip New Window",FontSize:=10,name:=Button.Length()+1,label:="Clip_New_Window",Window:=1,Color:="0xFF186498"))
Button.Push(New Button_Type1(x:=257,y+=h,w:=133,h,text:="Clip New Script Partial",FontSize:=10,name:=Button.Length()+1,label:="Clip_New_Script_Partial",Window:=1,Color:="0xFF186498"))
Button.Push(New Button_Type1(x:=257,y+=h,w:=133,h,text:="Clip Custom`nWindow Class",FontSize:=10,name:=Button.Length()+1,label:="Clip_Custom_Window_Class",Window:=1,Color:="0xFF186498"))
Button.Push(New Button_Type1(x:=257,y+=h,w:=133,h,text:="Clip Full New script",FontSize:=10,name:=Button.Length()+1,label:="Clip_Full_New_script",Window:=1,Color:="0xFF186498"))
Button.Push(New Button_Type1(x:=257,y+=h,w:=133,h,text:="Clip Gdip LITE",FontSize:=10,name:=Button.Length()+1,label:="Clip_gdip_lite",Window:=1,Color:="0xFF186498"))
Main.Show_Window()
Submit_All()
SetTimer,Watch_Hover,50
return
GuiClose:
;~ GuiContextMenu:
*ESC::
    ExitApp
 Submit_All(){
    Gui,1:Submit,NoHide
}
Move_Window(){
    PostMessage,0xA1,2
}
 
Min_Window(){
    Gui,1:Minimize
}
 
Watch_Hover(){
    Static Index,lctrl,Hover_On
    MouseGetPos,,,,ctrl,2
    if(!Hover_On&&ctrl){
        loop,% Button.Length()
            if(ctrl=Button[A_Index].hwnd)
                Button[A_Index].Draw_Hover(),lctrl:=ctrl,Index:=A_Index,Hover_On:=1,break
    }else if(Hover_On=1)
        if((!ctrl||lctrl!=ctrl)&&Button[Index].isPressed=0)
            Button[Index].Draw_Default(),Hover_On:=0
}
 
Clip_New_Window(){
    if(!Button[A_GuiControl].Draw_Pressed())
        return
    if(X_Position_Edit&&Y_Position_Edit){
        Clipboard:="Main := New Custom_Window( x:= " X_Position_Edit " , y:= " Y_Position_Edit " , w:= " W_Position_Edit " , h:= " H_Position_Edit  " , Name:= """ Name_Edit """ , Options:= """ Options_Edit """ , Title:= """ Title_Edit """ , Background_Bitmap:= " Bitmap_Edit " )`n`nMain.Show_Window()"
    }else if(X_Position_Edit&&!Y_Position_Edit)
        Clipboard:="Main := New Custom_Window( x:= " X_Position_Edit " , y:= """" , w:= " W_Position_Edit " , h:= " H_Position_Edit  " , Name:= """ Name_Edit """ , Options:= """ Options_Edit """ , Title:= """ Title_Edit """ , Background_Bitmap:= " Bitmap_Edit " )`n`nMain.Show_Window()"
    else if(!X_Position_Edit&&Y_Position_Edit)
        Clipboard:="Main := New Custom_Window( x:= """" , y:= " Y_Position_Edit " , w:= " W_Position_Edit " , h:= " H_Position_Edit  " , Name:= """ Name_Edit """ , Options:= """ Options_Edit """ , Title:= """ Title_Edit """ , Background_Bitmap:= " Bitmap_Edit " )`n`nMain.Show_Window()"
    else 
        Clipboard:="Main := New Custom_Window( x:= """" , y:= """" , w:= " W_Position_Edit " , h:= " H_Position_Edit  " , Name:= """ Name_Edit """ , Options:= """ Options_Edit """ , Title:= """ Title_Edit """ , Background_Bitmap:= " Bitmap_Edit " )`n`nMain.Show_Window()"
    SoundBeep,500
    SoundBeep,600
}
 
Clip_Full_New_script(){
    if(!Button[A_GuiControl].Draw_Pressed())
        return
    temp:=""
    temp.=Set_Partial_Script_Var() "`n`n`n"
    temp.=Set_Custom_Window_Class_Var() "`n`n`n"
    temp.=Set_Gdip_Lite_Var_1() "`n`n`n"
    temp.=Set_Gdip_Lite_Var_2() "`n`n`n"
    Clipboard:=temp
    Sleep,100
    temp:=""
    SoundBeep,500
    SoundBeep,600
}
Clip_Custom_Window_Class(){
    if(!Button[A_GuiControl].Draw_Pressed())
        return
    Clipboard:=Set_Custom_Window_Class_Var() "`n`n`n"
    SoundBeep,500
    SoundBeep,600
}
Clip_gdip_lite(){
    if(!Button[A_GuiControl].Draw_Pressed())
        return
    temp:=""
    Temp.=Set_Gdip_Lite_Var_1() "`n`n`n"
    Temp.=Set_Gdip_Lite_Var_2() "`n`n`n"
    Clipboard:=Temp
    Sleep,100
    Temp:=""
    SoundBeep,500
    SoundBeep,600
}
Clip_New_Script_Partial(){
    if(!Button[A_GuiControl].Draw_Pressed())
        return
    Clipboard:=Set_Partial_Script_Var() "`n`n`n"
    SoundBeep,500
    SoundBeep,600
}
 
class Button_Type1  {
    __New(x,y,w,h,text,FontSize,name,label,Window,Color:="0xFF186498",Set:=0){
        This.X:=X,This.Y:=Y,This.W:=W,This.H:=H,This.FontSize:=FontSize,This.Text:=Text,This.Name:=Name,This.Label:=Label,This.Color:=Color,This.Window:=Window,This.isPressed:=0,This.Set:=Set
        This.Create_Default_Button()
        This.Create_Hover_Button()
        This.Create_Pressed_Button()
        This.Add_Trigger()
        This.Draw_Default()
    }
    Add_Trigger(){
        global
        Gui,% This.Window ":Add",Picture,% "x" This.X " y" This.Y " w" This.W " h" This.H " v" This.Name " g" This.Label " 0xE"
        GuiControlGet,hwnd,% This.Window ":hwnd",% This.Name
        This.Hwnd:=hwnd
    }
    Create_Default_Button(){
        ;Bitmap Created Using: HB Bitmap Maker
        pBitmap:=Gdip_CreateBitmap( This.W , This.H ) 
         G := Gdip_GraphicsFromImage( pBitmap )
        Gdip_SetSmoothingMode( G , 2 )
        Brush := Gdip_BrushCreateSolid( "0xFF1C2125" )
        Gdip_FillRectangle( G , Brush , -1 , -1 , This.W+2 , This.H+2 )
        Gdip_DeleteBrush( Brush )
        Brush := Gdip_BrushCreateSolid( "0xFF060B0F" )
        Gdip_FillRoundedRectangle( G , Brush , 2 , 3 , This.W-5 , This.H-7 , 5 )
        Gdip_DeleteBrush( Brush )
        Brush := Gdip_BrushCreateSolid( "0xFF262B2F" )
        Gdip_FillRoundedRectangle( G , Brush , 3 , 4 , This.W-7 , This.H-9 , 5 )
        Gdip_DeleteBrush( Brush )
        Brush := Gdip_CreateLineBrushFromRect( 0 , 0 , This.W , This.H-10 , "0xFF3F444A" , "0xFF24292D" , 1 , 1 )
        Gdip_FillRoundedRectangle( G , Brush , 4 , 5 , This.W-9 , This.H-11 , 5 )
        Gdip_DeleteBrush( Brush )
        Brush := Gdip_CreateLineBrushFromRect( 0 , 0 , This.W-30 , This.H+21 , "0xFF2D343C" , "0xFF004488" , 1 , 1 )
        Gdip_FillRoundedRectangle( G , Brush , 4 , 7 , This.W-9 , This.H-13 , 5 )
        Gdip_DeleteBrush( Brush )
        Gdip_TextToGraphics( G , This.Text , "s" This.FontSize " Bold Center vcenter caaF0F0F0 x0 y1" , "Segoe UI" , This.W , This.H )
        Gdip_DeleteGraphics( G )
        This.Default_Bitmap := Gdip_CreateHBITMAPFromBitmap(pBitmap)
        Gdip_DisposeImage(pBitmap)
    }
    Create_Hover_Button(){
        ;Bitmap Created Using: HB Bitmap Maker
        pBitmap:=Gdip_CreateBitmap( This.W , This.H ) 
         G := Gdip_GraphicsFromImage( pBitmap )
        Gdip_SetSmoothingMode( G , 2 )
        Brush := Gdip_BrushCreateSolid( "0xFF1C2125" )
        Gdip_FillRectangle( G , Brush , -1 , -1 , This.W+2 , This.H+2 )
        Gdip_DeleteBrush( Brush )
        Brush := Gdip_BrushCreateSolid( "0xFF151A20" )
        Gdip_FillRoundedRectangle( G , Brush , 2 , 3 , This.W-5 , This.H-7 , 5 )
        Gdip_DeleteBrush( Brush )
        Brush := Gdip_BrushCreateSolid( "0xFF2B3036" )
        Gdip_FillRoundedRectangle( G , Brush , 3 , 4 , This.W-7 , This.H-9 , 5 )
        Gdip_DeleteBrush( Brush )
        Brush := Gdip_CreateLineBrushFromRect( 0 , 0 , This.W , This.H-10 , "0xFF464D55" , "0xFF1E2329" , 1 , 1 )
        Gdip_FillRoundedRectangle( G , Brush , 4 , 5 , This.W-9 , This.H-11 , 5 )
        Gdip_DeleteBrush( Brush )
        Brush := Gdip_CreateLineBrushFromRect( 0 , 0 , This.W-30 , This.H+1 , "0xFF2D343C" , This.Color , 1 , 1 )
        Gdip_FillRoundedRectangle( G , Brush , 4 , 7 , This.W-9 , This.H-13 , 5 )
        Gdip_DeleteBrush( Brush )
        Gdip_TextToGraphics( G , This.Text , "s" This.FontSize " Bold Center vcenter cFF000000 x-1 y2" , "Segoe UI" , This.W , This.H )
        Gdip_TextToGraphics( G , This.Text , "s" This.FontSize " Bold Center vcenter cFF000000 x-1 y1" , "Segoe UI" , This.W , This.H )
        Gdip_TextToGraphics( G , This.Text , "s" This.FontSize " Bold Center vcenter cFF000000 x-1 y0" , "Segoe UI" , This.W , This.H )
        Gdip_TextToGraphics( G , This.Text , "s" This.FontSize " Bold Center vcenter cFF000000 x0 y0" , "Segoe UI" , This.W , This.H )
        Gdip_TextToGraphics( G , This.Text , "s" This.FontSize " Bold Center vcenter cFF000000 x1 y2" , "Segoe UI" , This.W , This.H )
        Gdip_TextToGraphics( G , This.Text , "s" This.FontSize " Bold Center vcenter cFF000000 x1 y1" , "Segoe UI" , This.W , This.H )
        Gdip_TextToGraphics( G , This.Text , "s" This.FontSize " Bold Center vcenter caaF0F0F0 x0 y1" , "Segoe UI" , This.W , This.H )
        Gdip_DeleteGraphics( G )
        This.Hover_Bitmap := Gdip_CreateHBITMAPFromBitmap(pBitmap)
        Gdip_DisposeImage(pBitmap)
    }
    Create_Pressed_Button(){
        ;Bitmap Created Using: HB Bitmap Maker
        pBitmap:=Gdip_CreateBitmap( This.W , This.H ) 
         G := Gdip_GraphicsFromImage( pBitmap )
        Gdip_SetSmoothingMode( G , 4 )
        Brush := Gdip_BrushCreateSolid( "0xFF1C2125" )
        Gdip_FillRectangle( G , Brush , -1 , -1 , This.W+2 , This.H+2 )
        Gdip_DeleteBrush( Brush )
        Brush := Gdip_BrushCreateSolid( "0xFF31363B" )
        Gdip_FillRoundedRectangle( G , Brush , 2 , 3 , This.W-5 , This.H-6 , 5 )
        Gdip_DeleteBrush( Brush )
        Brush := Gdip_CreateLineBrushFromRect( 0 , 0 , This.W , This.H , "0xFF151A20" , "0xFF151A20" , 1 , 1 )
        Gdip_FillRoundedRectangle( G , Brush , 2 , 3 , This.W-5 , This.H-8 , 5 )
        Gdip_DeleteBrush( Brush )
        Brush := Gdip_CreateLineBrushFromRect( 0 , 0 , This.W-7 , This.H+10  , "0xFF003366" , "0xFF42474D"  , 1 , 1 )
        Gdip_FillRoundedRectangle( G , Brush , 3 , 4 , This.W-7 , This.H-10 , 5 )
        Gdip_DeleteBrush( Brush )
        Gdip_TextToGraphics( G , This.Text , "s" This.FontSize " Bold Center vcenter caaF0F0F0 x0 y0" , "Segoe UI" , This.W , This.H )
        Gdip_DeleteGraphics( G )
        This.Pressed_Bitmap := Gdip_CreateHBITMAPFromBitmap(pBitmap)
        Gdip_DisposeImage(pBitmap)
    }
    Draw_Default(){
        SetImage(This.Hwnd, This.Default_Bitmap)
    }
    Draw_Hover(){
        SetImage(This.Hwnd, This.Hover_Bitmap)
    }
    Draw_Pressed(){
        SetImage(This.Hwnd, This.Pressed_Bitmap)
        SetTimer,Watch_Hover,Off
        While(GetKeyState("LButton"))
            sleep,10
        SetTimer,Watch_Hover,On
        MouseGetPos,,,,ctrl,2
        if(ctrl!=This.hwnd){
            This.Draw_Default()
            return false
        }else   {
            This.Draw_Hover()
            return true
        }
    }
}
 
Class Custom_Window {
    __New(x:="",y:="",w:=300,h:=200,Name:=1,Options:="+AlwaysOnTop -Caption -DPIScale",Title:="",Background_Bitmap:=""){
        This.X:=x
        This.Y:=y
        This.W:=w 
        This.H:=h 
        This.Name:=Name
        This.Title:=Title
        This.Options:=Options
        This.Background_Bitmap:=Background_Bitmap
        This.Create_Window()
    }
    Create_Window(){
        Gui,% This.Name ":New",%  This.Options " +LastFound"
        This.Hwnd:=WinExist()
        if(This.Background_Bitmap)
            This.Draw_Background_Bitmap()
    }
    Draw_Background_Bitmap(){
        This.Bitmap:=Gdip_CreateHBITMAPFromBitmap(This.Background_Bitmap)
        Gdip_DisposeImage(This.Background_Bitmap)
        Gui,% This.Name ":Add",Picture,% "x0 y0 w" This.W " h" This.H " 0xE" 
        GuiControlGet,hwnd,% This.Name ":hwnd",Static1
        This.Background_Hwnd:=hwnd
        SetImage(This.Background_Hwnd,This.Bitmap)
    }
    Show_Window(){
        if(This.X&&This.Y)
            Gui,% This.Name ":Show",% "x" This.X " y" This.Y " w" This.W " h" This.H,% This.Title
        else if(This.X&&!This.Y)
            Gui,% This.Name ":Show",% "x" This.X  " w" This.W " h" This.H,% This.Title
        else if(!This.X&&This.Y)
            Gui,% This.Name ":Show",% "y" This.Y  " w" This.W " h" This.H,% This.Title
        else 
            Gui,% This.Name ":Show",% " w" This.W " h" This.H,% This.Title
    }
}
 
Custom_Window_Maker_Tool_Background(){
    ;Bitmap Created Using: HB Bitmap Maker
    pBitmap:=Gdip_CreateBitmap( 400 , 250 ) 
     G := Gdip_GraphicsFromImage( pBitmap )
    Gdip_SetSmoothingMode( G , 4 )
    Brush := Gdip_CreateLineBrush( 79 , 39 , 174 , 181 , "0xFF3399FF" , "0xFF000000" , 1 )
    Gdip_FillRectangle( G , Brush , 0 , 0 , 400 , 250 )
    Gdip_DeleteBrush( Brush )
    Brush := Gdip_CreateLineBrush( 43 , -30 , 237 , 269 , "0xFF777777" , "0xFF000000" , 1 )
    Pen := Gdip_CreatePenFromBrush( Brush , 1 )
    Gdip_DeleteBrush( Brush )
    Gdip_DrawRectangle( G , Pen , 0 , 0 , 399 , 249 )
    Gdip_DeletePen( Pen )
    Brush := Gdip_BrushCreateSolid( "0xFF333333" )
    Gdip_FillRectangle( G , Brush , 5 , 30 , 389 , 214 )
    Gdip_DeleteBrush( Brush )
    ;move window
    Brush := Gdip_CreateLineBrushFromRect( 7 , 3 , 188 , 23 , "0xFF777777" , "0xFF222222" , 1 , 1 )
    Gdip_FillRoundedRectangle( G , Brush , 46 , 4 , 270 , 22 , 5 )
    Gdip_DeleteBrush( Brush )
    Pen := Gdip_CreatePen( "0xFF333333" , 1 )
    Gdip_DrawRoundedRectangle( G , Pen , 46 , 4 , 270 , 22 , 5 )
    Gdip_DeletePen( Pen )
    Brush := Gdip_BrushCreateSolid( "0xFF000000" )
    Gdip_TextToGraphics( G , "HB Custom Window Maker" , "s12 Center vCenter Bold c" Brush " x85 y2" , "Segoe UI" , 190 , 24 )
    Gdip_DeleteBrush( Brush )
    Brush := Gdip_BrushCreateSolid( "0xFF000000" )
    Gdip_TextToGraphics( G , "HB Custom Window Maker" , "s12 Center vCenter Bold c" Brush " x87 y2" , "Segoe UI" , 190 , 24 )
    Gdip_DeleteBrush( Brush )
    Brush := Gdip_BrushCreateSolid( "0xFF000000" )
    Gdip_TextToGraphics( G , "HB Custom Window Maker" , "s12 Center vCenter Bold c" Brush " x87 y4" , "Segoe UI" , 190 , 24 )
    Gdip_DeleteBrush( Brush )
    Brush := Gdip_BrushCreateSolid( "0xFF000000" )
    Gdip_TextToGraphics( G , "HB Custom Window Maker" , "s12 Center vCenter Bold c" Brush " x85 y4" , "Segoe UI" , 190 , 24 )
    Gdip_DeleteBrush( Brush )
    Brush := Gdip_BrushCreateSolid( "0xFFF0F0F0" )
    Gdip_TextToGraphics( G , "HB Custom Window Maker" , "s12 Center vCenter Bold c" Brush " x86 y3" , "Segoe UI" , 190 , 24 )
    Gdip_DeleteBrush( Brush )
    ;close window
    Brush := Gdip_CreateLineBrushFromRect( 380 , 3 , 16 , 17 , "0xFF777777" , "0xFF222222" , 1 , 1 )
    Gdip_FillRectangle( G , Brush , 380 , 5 , 15 , 15 )
    Gdip_DeleteBrush( Brush )
    Brush := Gdip_CreateLineBrush( 388 , 21 , 387 , -7 , "0xFF202020" , "0xFFF0F0F0" , 1 )
    Pen := Gdip_CreatePenFromBrush( Brush , 1 )
    Gdip_DeleteBrush( Brush )
    Gdip_DrawRectangle( G , Pen , 380 , 5 , 15 , 15 )
    Gdip_DeletePen( Pen )
    ;min window
    Brush := Gdip_CreateLineBrushFromRect( 380 , 3 , 16 , 17 , "0xFF777777" , "0xFF222222" , 1 , 1 )
    Gdip_FillRectangle( G , Brush , 360 , 5 , 15 , 15 )
    Gdip_DeleteBrush( Brush )
    Brush := Gdip_CreateLineBrush( 388 , 21 , 387 , -7 , "0xFF202020" , "0xFFF0F0F0" , 1 )
    Pen := Gdip_CreatePenFromBrush( Brush , 1 )
    Gdip_DeleteBrush( Brush )
    Gdip_DrawRectangle( G , Pen , 360 , 5 , 15 , 15 )
    Gdip_DeletePen( Pen )
    Brush := Gdip_BrushCreateSolid( "0xFFF0F0F0" )
    Gdip_TextToGraphics( G , "_" , "s16 Center vCenter Bold c" Brush " x343 y-16" , "Segoe UI" , 50 , 50 )
    Gdip_DeleteBrush( Brush )
    Brush := Gdip_BrushCreateSolid( "0xFFF0F0F0" )
    Gdip_TextToGraphics( G , "X" , "s12 Center vCenter c" Brush " x363 y-11" , "Segoe UI" , 50 , 50 )
    Gdip_DeleteBrush( Brush )
    Brush := Gdip_BrushCreateHatch( "0xaa333333" , "0x77000000" , 39 )
    Gdip_FillRectangle( G , Brush , 10 , 35 , 240 , 204 )
    Gdip_DeleteBrush( Brush )
    Pen := Gdip_CreatePen( "0xFF222222" , 1 )
    Gdip_DrawRectangle( G , Pen , 10 , 35 , 241 , 205 )
    Gdip_DeletePen( Pen )
    Brush := Gdip_BrushCreateSolid( "0xFFF0F0F0" )
    Gdip_TextToGraphics( G , "X :" , "s10  vCenter Bold c" Brush " x14 y49" , "Arial" , 50 , 22 )
    Gdip_DeleteBrush( Brush )
    Brush := Gdip_BrushCreateSolid( "0xFFF0F0F0" )
    Gdip_TextToGraphics( G , "Y :" , "s10  vCenter Bold c" Brush " x129 y49" , "Arial" , 50 , 22 )
    Gdip_DeleteBrush( Brush )
    Brush := Gdip_BrushCreateSolid( "0xFFF0F0F0" )
    Gdip_TextToGraphics( G , "W :" , "s10 vCenter Bold c" Brush " x14 y88" , "Arial" , 50 , 22 )
    Gdip_DeleteBrush( Brush )
    Brush := Gdip_BrushCreateSolid( "0xFFF0F0F0" )
    Gdip_TextToGraphics( G , "H :" , "s10  vCenter Bold c" Brush " x129 y88" , "Arial" , 50 , 22 )
    Gdip_DeleteBrush( Brush )
    Brush := Gdip_BrushCreateSolid( "0xFFF0F0F0" )
    Gdip_TextToGraphics( G , "Name :" , "s10 vCenter Bold c" Brush " x14 y124" , "Arial" , 50 , 22 )
    Gdip_DeleteBrush( Brush )
    Brush := Gdip_BrushCreateSolid( "0xFFF0F0F0" )
    Gdip_TextToGraphics( G , "Options :" , "s10 vCenter Bold c" Brush " x14 y154" , "Arial" , 50 , 22 )
    Gdip_DeleteBrush( Brush )
    Brush := Gdip_BrushCreateSolid( "0xFFF0F0F0" )
    Gdip_TextToGraphics( G , "Title :" , "s10 vCenter Bold c" Brush " x14 y185" , "Arial" , 50 , 22 )
    Gdip_DeleteBrush( Brush )
    Brush := Gdip_BrushCreateSolid( "0xFFF0F0F0" )
    Gdip_TextToGraphics( G , "Bitmap :" , "s10 vCenter Bold c" Brush " x14 y216" , "Arial" , 50 , 22 )
    Gdip_DeleteBrush( Brush )
    Brush := Gdip_BrushCreateSolid( "0xFF222222" )
    Gdip_FillRoundedRectangle( G , Brush , 254 , 33 , 137 , 208 , 5 )
    Gdip_DeleteBrush( Brush )
    Brush := Gdip_CreateLineBrushFromRect( 256 , 29 , 136 , 212 , "0xFF666666" , "0xFF000000" , 1 , 1 )
    Pen := Gdip_CreatePenFromBrush( Brush , 1 )
    Gdip_DeleteBrush( Brush )
    Gdip_DrawRoundedRectangle( G , Pen , 255 , 33 , 137 , 208 , 5 )
    Gdip_DeletePen( Pen )
    ;x edit
    Brush := Gdip_CreateLineBrushFromRect( 34 , 48 , 79 , 20 , "0xFF3399FF" , "0xFF1E1E1E" , 1 , 1 )
    Gdip_FillRoundedRectangle( G , Brush , 35 , 47 , 80 , 22 , 0 )
    Gdip_DeleteBrush( Brush )
    Brush := Gdip_CreateLineBrushFromRect( 31 , 44 , 84 , 25 , "0xFFF0F0F0" , "0xFF222222" , 1 , 1 )
    Pen := Gdip_CreatePenFromBrush( Brush , 1 )
    Gdip_DeleteBrush( Brush )
    Gdip_DrawRoundedRectangle( G , Pen , 35 , 47 , 80 , 22 , 0 )
    Gdip_DeletePen( Pen )
    ;y edit
    Brush := Gdip_CreateLineBrushFromRect( 34 , 48 , 79 , 20 , "0xFF3399FF" , "0xFF1E1E1E" , 1 , 1 )
    Gdip_FillRoundedRectangle( G , Brush , 149 , 47 , 80 , 22 , 0 )
    Gdip_DeleteBrush( Brush )
    Brush := Gdip_CreateLineBrushFromRect( 31 , 44 , 84 , 25 , "0xFFF0F0F0" , "0xFF222222" , 1 , 1 )
    Pen := Gdip_CreatePenFromBrush( Brush , 1 )
    Gdip_DeleteBrush( Brush )
    Gdip_DrawRoundedRectangle( G , Pen , 149 , 47 , 80 , 22 , 0 )
    Gdip_DeletePen( Pen )
    ;w edit
    Brush := Gdip_CreateLineBrushFromRect( 34 , 48 , 79 , 20 , "0xFF3399FF" , "0xFF1E1E1E" , 1 , 1 )
    Gdip_FillRoundedRectangle( G , Brush , 35 , 87 , 80 , 22 , 0 )
    Gdip_DeleteBrush( Brush )
    Brush := Gdip_CreateLineBrushFromRect( 34 , 84 , 81 , 24 , "0xFFF0F0F0" , "0xFF222222" , 1 , 1 )
    Pen := Gdip_CreatePenFromBrush( Brush , 1 )
    Gdip_DeleteBrush( Brush )
    Gdip_DrawRoundedRectangle( G , Pen , 35 , 87 , 80 , 22 , 0 )
    Gdip_DeletePen( Pen )
    ;h edit
    Brush := Gdip_CreateLineBrushFromRect( 34 , 48 , 79 , 20 , "0xFF3399FF" , "0xFF1E1E1E" , 1 , 1 )
    Gdip_FillRoundedRectangle( G , Brush , 149 , 87 , 80 , 22 , 0 )
    Gdip_DeleteBrush( Brush )
    Brush := Gdip_CreateLineBrushFromRect( 34 , 84 , 81 , 24 , "0xFFF0F0F0" , "0xFF222222" , 1 , 1 )
    Pen := Gdip_CreatePenFromBrush( Brush , 1 )
    Gdip_DeleteBrush( Brush )
    Gdip_DrawRoundedRectangle( G , Pen , 149 , 87 , 80 , 22 , 0 )
    Gdip_DeletePen( Pen )
    ;name edit
    Brush := Gdip_CreateLineBrushFromRect( 72 , 121 , 170 , 23 , "0xFF3399FF" , "0xFF1E1E1E" , 1 , 1 )
    Gdip_FillRoundedRectangle( G , Brush , 73 , 123 , 170 , 22 , 0 )
    Gdip_DeleteBrush( Brush )
    ;options edit
    Brush := Gdip_CreateLineBrushFromRect( 76 , 148 , 166 , 25 , "0xFF3399FF" , "0xFF1E1E1E" , 1 , 1 )
    Gdip_FillRoundedRectangle( G , Brush , 73 , 153 , 170 , 22 , 0 )
    Gdip_DeleteBrush( Brush )
    ;title edit
    Brush := Gdip_CreateLineBrushFromRect( 75 , 182 , 168 , 23 , "0xFF3399FF" , "0xFF1E1E1E" , 1 , 1 )
    Gdip_FillRoundedRectangle( G , Brush , 73 , 183 , 170 , 22 , 0 )
    Gdip_DeleteBrush( Brush )
    ;bitmap edit
    Brush := Gdip_CreateLineBrushFromRect( 73 , 213 , 170 , 18 , "0xFF3399FF" , "0xFF1E1E1E" , 1 , 1 )
    Gdip_FillRoundedRectangle( G , Brush , 73 , 213 , 170 , 22 , 0 )
    Gdip_DeleteBrush( Brush )
    Brush := Gdip_CreateLineBrushFromRect( 72 , 120 , 172 , 26 , "0xFFF0F0F0" , "0xFF222222" , 1 , 1 )
    Pen := Gdip_CreatePenFromBrush( Brush , 1 )
    Gdip_DeleteBrush( Brush )
    Gdip_DrawRoundedRectangle( G , Pen , 73 , 123 , 170 , 22 , 0 )
    Gdip_DeletePen( Pen )
    Brush := Gdip_CreateLineBrushFromRect( 75 , 149 , 172 , 26 , "0xFFF0F0F0" , "0xFF222222" , 1 , 1 )
    Pen := Gdip_CreatePenFromBrush( Brush , 1 )
    Gdip_DeleteBrush( Brush )
    Gdip_DrawRoundedRectangle( G , Pen , 73 , 153 , 170 , 22 , 0 )
    Gdip_DeletePen( Pen )
    Brush := Gdip_CreateLineBrushFromRect( 72 , 180 , 167 , 25 , "0xFFF0F0F0" , "0xFF222222" , 1 , 1 )
    Pen := Gdip_CreatePenFromBrush( Brush , 1 )
    Gdip_DeleteBrush( Brush )
    Gdip_DrawRoundedRectangle( G , Pen , 73 , 183 , 170 , 22 , 0 )
    Gdip_DeletePen( Pen )
    Brush := Gdip_CreateLineBrushFromRect( 72 , 212 , 167 , 25 , "0xFFF0F0F0" , "0xFF222222" , 1 , 1 )
    Pen := Gdip_CreatePenFromBrush( Brush , 1 )
    Gdip_DeleteBrush( Brush )
    Gdip_DrawRoundedRectangle( G , Pen , 73 , 213 , 170 , 22 , 0 )
    Gdip_DeletePen( Pen )
    Gdip_DeleteGraphics( G )
    return pBitmap
}
 
;######################################################################################################################################
;#####################################################                          #######################################################
;#####################################################        Gdip LITE         #######################################################
;#####################################################                          #######################################################
;######################################################################################################################################
; Gdip standard library v1.45 by tic (Tariq Porter) 07/09/11
; Modifed by Rseding91 using fincs 64 bit compatible Gdip library 5/1/2013
BitBlt(ddc, dx, dy, dw, dh, sdc, sx, sy, Raster=""){
    Ptr := A_PtrSize ? "UPtr" : "UInt"
    return DllCall("gdi32\BitBlt", Ptr, dDC, "int", dx, "int", dy, "int", dw, "int", dh, Ptr, sDC, "int", sx, "int", sy, "uint", Raster ? Raster : 0x00CC0020)
}
Gdip_DrawImage(pGraphics, pBitmap, dx="", dy="", dw="", dh="", sx="", sy="", sw="", sh="", Matrix=1){
    Ptr := A_PtrSize ? "UPtr" : "UInt"
    if (Matrix&1 = "")
        ImageAttr := Gdip_SetImageAttributesColorMatrix(Matrix)
    else if (Matrix != 1)
        ImageAttr := Gdip_SetImageAttributesColorMatrix("1|0|0|0|0|0|1|0|0|0|0|0|1|0|0|0|0|0|" Matrix "|0|0|0|0|0|1")
    if(sx = "" && sy = "" && sw = "" && sh = ""){
        if(dx = "" && dy = "" && dw = "" && dh = ""){
            sx := dx := 0, sy := dy := 0
            sw := dw := Gdip_GetImageWidth(pBitmap)
            sh := dh := Gdip_GetImageHeight(pBitmap)
        }else   {
            sx := sy := 0,sw := Gdip_GetImageWidth(pBitmap),sh := Gdip_GetImageHeight(pBitmap)
        }
    }
    E := DllCall("gdiplus\GdipDrawImageRectRect", Ptr, pGraphics, Ptr, pBitmap, "float", dx, "float", dy, "float", dw, "float", dh, "float", sx, "float", sy, "float", sw, "float", sh, "int", 2, Ptr, ImageAttr, Ptr, 0, Ptr, 0)
    if ImageAttr
        Gdip_DisposeImageAttributes(ImageAttr)
    return E
}
Gdip_SetImageAttributesColorMatrix(Matrix){
    Ptr := A_PtrSize ? "UPtr" : "UInt"
    VarSetCapacity(ColourMatrix, 100, 0)
    Matrix := RegExReplace(RegExReplace(Matrix, "^[^\d-\.]+([\d\.])", "$1", "", 1), "[^\d-\.]+", "|")
    StringSplit, Matrix, Matrix, |
    Loop, 25
    {
        Matrix := (Matrix%A_Index% != "") ? Matrix%A_Index% : Mod(A_Index-1, 6) ? 0 : 1
        NumPut(Matrix, ColourMatrix, (A_Index-1)*4, "float")
    }
    DllCall("gdiplus\GdipCreateImageAttributes", A_PtrSize ? "UPtr*" : "uint*", ImageAttr)
    DllCall("gdiplus\GdipSetImageAttributesColorMatrix", Ptr, ImageAttr, "int", 1, "int", 1, Ptr, &ColourMatrix, Ptr, 0, "int", 0)
    return ImageAttr
}
Gdip_GetImageWidth(pBitmap){
   DllCall("gdiplus\GdipGetImageWidth", A_PtrSize ? "UPtr" : "UInt", pBitmap, "uint*", Width)
   return Width
}
Gdip_GetImageHeight(pBitmap){
   DllCall("gdiplus\GdipGetImageHeight", A_PtrSize ? "UPtr" : "UInt", pBitmap, "uint*", Height)
   return Height
}
Gdip_DeletePen(pPen){
   return DllCall("gdiplus\GdipDeletePen", A_PtrSize ? "UPtr" : "UInt", pPen)
}
Gdip_DeleteBrush(pBrush){
   return DllCall("gdiplus\GdipDeleteBrush", A_PtrSize ? "UPtr" : "UInt", pBrush)
}
Gdip_DisposeImage(pBitmap){
   return DllCall("gdiplus\GdipDisposeImage", A_PtrSize ? "UPtr" : "UInt", pBitmap)
}
Gdip_DeleteGraphics(pGraphics){
   return DllCall("gdiplus\GdipDeleteGraphics", A_PtrSize ? "UPtr" : "UInt", pGraphics)
}
Gdip_DisposeImageAttributes(ImageAttr){
    return DllCall("gdiplus\GdipDisposeImageAttributes", A_PtrSize ? "UPtr" : "UInt", ImageAttr)
}
Gdip_DeleteFont(hFont){
   return DllCall("gdiplus\GdipDeleteFont", A_PtrSize ? "UPtr" : "UInt", hFont)
}
Gdip_DeleteStringFormat(hFormat){
   return DllCall("gdiplus\GdipDeleteStringFormat", A_PtrSize ? "UPtr" : "UInt", hFormat)
}
Gdip_DeleteFontFamily(hFamily){
   return DllCall("gdiplus\GdipDeleteFontFamily", A_PtrSize ? "UPtr" : "UInt", hFamily)
}
CreateCompatibleDC(hdc=0){
   return DllCall("CreateCompatibleDC", A_PtrSize ? "UPtr" : "UInt", hdc)
}
SelectObject(hdc, hgdiobj){
    Ptr := A_PtrSize ? "UPtr" : "UInt"
    return DllCall("SelectObject", Ptr, hdc, Ptr, hgdiobj)
}
DeleteObject(hObject){
   return DllCall("DeleteObject", A_PtrSize ? "UPtr" : "UInt", hObject)
}
GetDC(hwnd=0){
    return DllCall("GetDC", A_PtrSize ? "UPtr" : "UInt", hwnd)
}
GetDCEx(hwnd, flags=0, hrgnClip=0){
    Ptr := A_PtrSize ? "UPtr" : "UInt"
    return DllCall("GetDCEx", Ptr, hwnd, Ptr, hrgnClip, "int", flags)
}
ReleaseDC(hdc, hwnd=0){
    Ptr := A_PtrSize ? "UPtr" : "UInt"
    return DllCall("ReleaseDC", Ptr, hwnd, Ptr, hdc)
}
DeleteDC(hdc){
   return DllCall("DeleteDC", A_PtrSize ? "UPtr" : "UInt", hdc)
}
Gdip_SetClipRegion(pGraphics, Region, CombineMode=0){
    Ptr := A_PtrSize ? "UPtr" : "UInt"
    return DllCall("gdiplus\GdipSetClipRegion", Ptr, pGraphics, Ptr, Region, "int", CombineMode)
}
CreateDIBSection(w, h, hdc="", bpp=32, ByRef ppvBits=0){
    Ptr := A_PtrSize ? "UPtr" : "UInt"
    hdc2 := hdc ? hdc : GetDC()
    VarSetCapacity(bi, 40, 0)
    NumPut(w, bi, 4, "uint"), NumPut(h, bi, 8, "uint"), NumPut(40, bi, 0, "uint"), NumPut(1, bi, 12, "ushort"), NumPut(0, bi, 16, "uInt"), NumPut(bpp, bi, 14, "ushort")
    hbm := DllCall("CreateDIBSection", Ptr, hdc2, Ptr, &bi, "uint", 0, A_PtrSize ? "UPtr*" : "uint*", ppvBits, Ptr, 0, "uint", 0, Ptr)
    if !hdc
        ReleaseDC(hdc2)
    return hbm
}
Gdip_GraphicsFromImage(pBitmap){
    DllCall("gdiplus\GdipGetImageGraphicsContext", A_PtrSize ? "UPtr" : "UInt", pBitmap, A_PtrSize ? "UPtr*" : "UInt*", pGraphics)
    return pGraphics
}
Gdip_GraphicsFromHDC(hdc){
    DllCall("gdiplus\GdipCreateFromHDC", A_PtrSize ? "UPtr" : "UInt", hdc, A_PtrSize ? "UPtr*" : "UInt*", pGraphics)
    return pGraphics
}
Gdip_GetDC(pGraphics){
    DllCall("gdiplus\GdipGetDC", A_PtrSize ? "UPtr" : "UInt", pGraphics, A_PtrSize ? "UPtr*" : "UInt*", hdc)
    return hdc
}
Gdip_Startup(){
    Ptr := A_PtrSize ? "UPtr" : "UInt"
    if !DllCall("GetModuleHandle", "str", "gdiplus", Ptr)
        DllCall("LoadLibrary", "str", "gdiplus")
    VarSetCapacity(si, A_PtrSize = 8 ? 24 : 16, 0), si := Chr(1)
    DllCall("gdiplus\GdiplusStartup", A_PtrSize ? "UPtr*" : "uint*", pToken, Ptr, &si, Ptr, 0)
    return pToken
}
Gdip_TextToGraphics(pGraphics, Text, Options, Font="Arial", Width="", Height="", Measure=0){
    IWidth := Width, IHeight:= Height
    RegExMatch(Options, "i)X([\-\d\.]+)(p*)", xpos)
    RegExMatch(Options, "i)Y([\-\d\.]+)(p*)", ypos)
    RegExMatch(Options, "i)W([\-\d\.]+)(p*)", Width)
    RegExMatch(Options, "i)H([\-\d\.]+)(p*)", Height)
    RegExMatch(Options, "i)C(?!(entre|enter))([a-f\d]+)", Colour)
    RegExMatch(Options, "i)Top|Up|Bottom|Down|vCentre|vCenter", vPos)
    RegExMatch(Options, "i)NoWrap", NoWrap)
    RegExMatch(Options, "i)R(\d)", Rendering)
    RegExMatch(Options, "i)S(\d+)(p*)", Size)
    if !Gdip_DeleteBrush(Gdip_CloneBrush(Colour2))
        PassBrush := 1, pBrush := Colour2
    if !(IWidth && IHeight) && (xpos2 || ypos2 || Width2 || Height2 || Size2)
        return -1
    Style := 0, Styles := "Regular|Bold|Italic|BoldItalic|Underline|Strikeout"
    Loop, Parse, Styles, |
    {
        if RegExMatch(Options, "\b" A_loopField)
        Style |= (A_LoopField != "StrikeOut") ? (A_Index-1) : 8
    }
    Align := 0, Alignments := "Near|Left|Centre|Center|Far|Right"
    Loop, Parse, Alignments, |
    {
        if RegExMatch(Options, "\b" A_loopField)
            Align |= A_Index//2.1      ; 0|0|1|1|2|2
    }
    xpos := (xpos1 != "") ? xpos2 ? IWidth*(xpos1/100) : xpos1 : 0
    ypos := (ypos1 != "") ? ypos2 ? IHeight*(ypos1/100) : ypos1 : 0
    Width := Width1 ? Width2 ? IWidth*(Width1/100) : Width1 : IWidth
    Height := Height1 ? Height2 ? IHeight*(Height1/100) : Height1 : IHeight
    if !PassBrush
        Colour := "0x" (Colour2 ? Colour2 : "ff000000")
    Rendering := ((Rendering1 >= 0) && (Rendering1 <= 5)) ? Rendering1 : 4
    Size := (Size1 > 0) ? Size2 ? IHeight*(Size1/100) : Size1 : 12
    hFamily := Gdip_FontFamilyCreate(Font)
    hFont := Gdip_FontCreate(hFamily, Size, Style)
    FormatStyle := NoWrap ? 0x4000 | 0x1000 : 0x4000
    hFormat := Gdip_StringFormatCreate(FormatStyle)
    pBrush := PassBrush ? pBrush : Gdip_BrushCreateSolid(Colour)
    if !(hFamily && hFont && hFormat && pBrush && pGraphics)
        return !pGraphics ? -2 : !hFamily ? -3 : !hFont ? -4 : !hFormat ? -5 : !pBrush ? -6 : 0
    CreateRectF(RC, xpos, ypos, Width, Height)
    Gdip_SetStringFormatAlign(hFormat, Align)
    Gdip_SetTextRenderingHint(pGraphics, Rendering)
    ReturnRC := Gdip_MeasureString(pGraphics, Text, hFont, hFormat, RC)
    if vPos
    {
        StringSplit, ReturnRC, ReturnRC, |
        if (vPos = "vCentre") || (vPos = "vCenter")
            ypos += (Height-ReturnRC4)//2
        else if (vPos = "Top") || (vPos = "Up")
            ypos := 0
        else if (vPos = "Bottom") || (vPos = "Down")
            ypos := Height-ReturnRC4
        CreateRectF(RC, xpos, ypos, Width, ReturnRC4)
        ReturnRC := Gdip_MeasureString(pGraphics, Text, hFont, hFormat, RC)
    }
    if !Measure
        E := Gdip_DrawString(pGraphics, Text, hFont, hFormat, pBrush, RC)
    if !PassBrush
        Gdip_DeleteBrush(pBrush)
    Gdip_DeleteStringFormat(hFormat)   
    Gdip_DeleteFont(hFont)
    Gdip_DeleteFontFamily(hFamily)
    return E ? E : ReturnRC
}
Gdip_DrawString(pGraphics, sString, hFont, hFormat, pBrush, ByRef RectF){
    Ptr := A_PtrSize ? "UPtr" : "UInt"
    if (!A_IsUnicode)
    {
        nSize := DllCall("MultiByteToWideChar", "uint", 0, "uint", 0, Ptr, &sString, "int", -1, Ptr, 0, "int", 0)
        VarSetCapacity(wString, nSize*2)
        DllCall("MultiByteToWideChar", "uint", 0, "uint", 0, Ptr, &sString, "int", -1, Ptr, &wString, "int", nSize)
    }
    return DllCall("gdiplus\GdipDrawString", Ptr, pGraphics, Ptr, A_IsUnicode ? &sString : &wString, "int", -1, Ptr, hFont, Ptr, &RectF, Ptr, hFormat, Ptr, pBrush)
}
Gdip_CreateLineBrush(x1, y1, x2, y2, ARGB1, ARGB2, WrapMode=1){
    Ptr := A_PtrSize ? "UPtr" : "UInt"
    CreatePointF(PointF1, x1, y1), CreatePointF(PointF2, x2, y2)
    DllCall("gdiplus\GdipCreateLineBrush", Ptr, &PointF1, Ptr, &PointF2, "Uint", ARGB1, "Uint", ARGB2, "int", WrapMode, A_PtrSize ? "UPtr*" : "UInt*", LGpBrush)
    return LGpBrush
}
Gdip_CreateLineBrushFromRect(x, y, w, h, ARGB1, ARGB2, LinearGradientMode=1, WrapMode=1){
    CreateRectF(RectF, x, y, w, h)
    DllCall("gdiplus\GdipCreateLineBrushFromRect", A_PtrSize ? "UPtr" : "UInt", &RectF, "int", ARGB1, "int", ARGB2, "int", LinearGradientMode, "int", WrapMode, A_PtrSize ? "UPtr*" : "UInt*", LGpBrush)
    return LGpBrush
}
Gdip_CloneBrush(pBrush){
    DllCall("gdiplus\GdipCloneBrush", A_PtrSize ? "UPtr" : "UInt", pBrush, A_PtrSize ? "UPtr*" : "UInt*", pBrushClone)
    return pBrushClone
}
Gdip_FontFamilyCreate(Font){
    Ptr := A_PtrSize ? "UPtr" : "UInt"
    if (!A_IsUnicode)
    {
        nSize := DllCall("MultiByteToWideChar", "uint", 0, "uint", 0, Ptr, &Font, "int", -1, "uint", 0, "int", 0)
        VarSetCapacity(wFont, nSize*2)
        DllCall("MultiByteToWideChar", "uint", 0, "uint", 0, Ptr, &Font, "int", -1, Ptr, &wFont, "int", nSize)
    }
    DllCall("gdiplus\GdipCreateFontFamilyFromName", Ptr, A_IsUnicode ? &Font : &wFont, "uint", 0, A_PtrSize ? "UPtr*" : "UInt*", hFamily)
    return hFamily
}
Gdip_SetStringFormatAlign(hFormat, Align){
   return DllCall("gdiplus\GdipSetStringFormatAlign", A_PtrSize ? "UPtr" : "UInt", hFormat, "int", Align)
}
Gdip_StringFormatCreate(Format=0, Lang=0){
   DllCall("gdiplus\GdipCreateStringFormat", "int", Format, "int", Lang, A_PtrSize ? "UPtr*" : "UInt*", hFormat)
   return hFormat
}
Gdip_FontCreate(hFamily, Size, Style=0){
   DllCall("gdiplus\GdipCreateFont", A_PtrSize ? "UPtr" : "UInt", hFamily, "float", Size, "int", Style, "int", 0, A_PtrSize ? "UPtr*" : "UInt*", hFont)
   return hFont
}
Gdip_CreatePen(ARGB, w){
   DllCall("gdiplus\GdipCreatePen1", "UInt", ARGB, "float", w, "int", 2, A_PtrSize ? "UPtr*" : "UInt*", pPen)
   return pPen
}
Gdip_CreatePenFromBrush(pBrush, w){
    DllCall("gdiplus\GdipCreatePen2", A_PtrSize ? "UPtr" : "UInt", pBrush, "float", w, "int", 2, A_PtrSize ? "UPtr*" : "UInt*", pPen)
    return pPen
}
Gdip_BrushCreateSolid(ARGB=0xff000000){
    DllCall("gdiplus\GdipCreateSolidFill", "UInt", ARGB, A_PtrSize ? "UPtr*" : "UInt*", pBrush)
    return pBrush
}
Gdip_BrushCreateHatch(ARGBfront, ARGBback, HatchStyle=0){
    DllCall("gdiplus\GdipCreateHatchBrush", "int", HatchStyle, "UInt", ARGBfront, "UInt", ARGBback, A_PtrSize ? "UPtr*" : "UInt*", pBrush)
    return pBrush
}
CreateRectF(ByRef RectF, x, y, w, h){
   VarSetCapacity(RectF, 16)
   NumPut(x, RectF, 0, "float"), NumPut(y, RectF, 4, "float"), NumPut(w, RectF, 8, "float"), NumPut(h, RectF, 12, "float")
}
Gdip_SetTextRenderingHint(pGraphics, RenderingHint){
    return DllCall("gdiplus\GdipSetTextRenderingHint", A_PtrSize ? "UPtr" : "UInt", pGraphics, "int", RenderingHint)
}
Gdip_MeasureString(pGraphics, sString, hFont, hFormat, ByRef RectF){
    Ptr := A_PtrSize ? "UPtr" : "UInt"
    VarSetCapacity(RC, 16)
    if !A_IsUnicode
    {
        nSize := DllCall("MultiByteToWideChar", "uint", 0, "uint", 0, Ptr, &sString, "int", -1, "uint", 0, "int", 0)
        VarSetCapacity(wString, nSize*2)   
        DllCall("MultiByteToWideChar", "uint", 0, "uint", 0, Ptr, &sString, "int", -1, Ptr, &wString, "int", nSize)
    }
    DllCall("gdiplus\GdipMeasureString", Ptr, pGraphics, Ptr, A_IsUnicode ? &sString : &wString, "int", -1, Ptr, hFont, Ptr, &RectF, Ptr, hFormat, Ptr, &RC, "uint*", Chars, "uint*", Lines)
    return &RC ? NumGet(RC, 0, "float") "|" NumGet(RC, 4, "float") "|" NumGet(RC, 8, "float") "|" NumGet(RC, 12, "float") "|" Chars "|" Lines : 0
}
CreateRect(ByRef Rect, x, y, w, h){
    VarSetCapacity(Rect, 16)
    NumPut(x, Rect, 0, "uint"), NumPut(y, Rect, 4, "uint"), NumPut(w, Rect, 8, "uint"), NumPut(h, Rect, 12, "uint")
}
CreateSizeF(ByRef SizeF, w, h){
   VarSetCapacity(SizeF, 8)
   NumPut(w, SizeF, 0, "float"), NumPut(h, SizeF, 4, "float")     
}
CreatePointF(ByRef PointF, x, y){
   VarSetCapacity(PointF, 8)
   NumPut(x, PointF, 0, "float"), NumPut(y, PointF, 4, "float")     
}
Gdip_DrawArc(pGraphics, pPen, x, y, w, h, StartAngle, SweepAngle){
    Ptr := A_PtrSize ? "UPtr" : "UInt"
    return DllCall("gdiplus\GdipDrawArc", Ptr, pGraphics, Ptr, pPen, "float", x, "float", y, "float", w, "float", h, "float", StartAngle, "float", SweepAngle)
}
Gdip_DrawPie(pGraphics, pPen, x, y, w, h, StartAngle, SweepAngle){
    Ptr := A_PtrSize ? "UPtr" : "UInt"
    return DllCall("gdiplus\GdipDrawPie", Ptr, pGraphics, Ptr, pPen, "float", x, "float", y, "float", w, "float", h, "float", StartAngle, "float", SweepAngle)
}
Gdip_DrawLine(pGraphics, pPen, x1, y1, x2, y2){
    Ptr := A_PtrSize ? "UPtr" : "UInt"
    return DllCall("gdiplus\GdipDrawLine", Ptr, pGraphics, Ptr, pPen, "float", x1, "float", y1, "float", x2, "float", y2)
}
Gdip_DrawLines(pGraphics, pPen, Points){
    Ptr := A_PtrSize ? "UPtr" : "UInt"
    StringSplit, Points, Points, |
    VarSetCapacity(PointF, 8*Points0)   
    Loop, %Points0%
    {
        StringSplit, Coord, Points%A_Index%, `,
        NumPut(Coord1, PointF, 8*(A_Index-1), "float"), NumPut(Coord2, PointF, (8*(A_Index-1))+4, "float")
    }
    return DllCall("gdiplus\GdipDrawLines", Ptr, pGraphics, Ptr, pPen, Ptr, &PointF, "int", Points0)
}
Gdip_FillRectangle(pGraphics, pBrush, x, y, w, h){
    Ptr := A_PtrSize ? "UPtr" : "UInt"
    return DllCall("gdiplus\GdipFillRectangle", Ptr, pGraphics, Ptr, pBrush, "float", x, "float", y, "float", w, "float", h)
}
Gdip_FillRoundedRectangle(pGraphics, pBrush, x, y, w, h, r){
    Region := Gdip_GetClipRegion(pGraphics)
    Gdip_SetClipRect(pGraphics, x-r, y-r, 2*r, 2*r, 4)
    Gdip_SetClipRect(pGraphics, x+w-r, y-r, 2*r, 2*r, 4)
    Gdip_SetClipRect(pGraphics, x-r, y+h-r, 2*r, 2*r, 4)
    Gdip_SetClipRect(pGraphics, x+w-r, y+h-r, 2*r, 2*r, 4)
    E := Gdip_FillRectangle(pGraphics, pBrush, x, y, w, h)
    Gdip_SetClipRegion(pGraphics, Region, 0)
    Gdip_SetClipRect(pGraphics, x-(2*r), y+r, w+(4*r), h-(2*r), 4)
    Gdip_SetClipRect(pGraphics, x+r, y-(2*r), w-(2*r), h+(4*r), 4)
    Gdip_FillEllipse(pGraphics, pBrush, x, y, 2*r, 2*r)
    Gdip_FillEllipse(pGraphics, pBrush, x+w-(2*r), y, 2*r, 2*r)
    Gdip_FillEllipse(pGraphics, pBrush, x, y+h-(2*r), 2*r, 2*r)
    Gdip_FillEllipse(pGraphics, pBrush, x+w-(2*r), y+h-(2*r), 2*r, 2*r)
    Gdip_SetClipRegion(pGraphics, Region, 0)
    Gdip_DeleteRegion(Region)
    return E
}
Gdip_GetClipRegion(pGraphics){
    Region := Gdip_CreateRegion()
    DllCall("gdiplus\GdipGetClip", A_PtrSize ? "UPtr" : "UInt", pGraphics, "UInt*", Region)
    return Region
}
Gdip_SetClipRect(pGraphics, x, y, w, h, CombineMode=0){
   return DllCall("gdiplus\GdipSetClipRect",  A_PtrSize ? "UPtr" : "UInt", pGraphics, "float", x, "float", y, "float", w, "float", h, "int", CombineMode)
}
Gdip_SetClipPath(pGraphics, Path, CombineMode=0){
    Ptr := A_PtrSize ? "UPtr" : "UInt"
    return DllCall("gdiplus\GdipSetClipPath", Ptr, pGraphics, Ptr, Path, "int", CombineMode)
}
Gdip_ResetClip(pGraphics){
   return DllCall("gdiplus\GdipResetClip", A_PtrSize ? "UPtr" : "UInt", pGraphics)
}
Gdip_FillEllipse(pGraphics, pBrush, x, y, w, h){
    Ptr := A_PtrSize ? "UPtr" : "UInt"
    return DllCall("gdiplus\GdipFillEllipse", Ptr, pGraphics, Ptr, pBrush, "float", x, "float", y, "float", w, "float", h)
}
Gdip_FillRegion(pGraphics, pBrush, Region){
    Ptr := A_PtrSize ? "UPtr" : "UInt"
    return DllCall("gdiplus\GdipFillRegion", Ptr, pGraphics, Ptr, pBrush, Ptr, Region)
}
Gdip_FillPath(pGraphics, pBrush, Path){
    Ptr := A_PtrSize ? "UPtr" : "UInt"
    return DllCall("gdiplus\GdipFillPath", Ptr, pGraphics, Ptr, pBrush, Ptr, Path)
}
Gdip_CreateRegion(){
    DllCall("gdiplus\GdipCreateRegion", "UInt*", Region)
    return Region
}
Gdip_DeleteRegion(Region){
    return DllCall("gdiplus\GdipDeleteRegion", A_PtrSize ? "UPtr" : "UInt", Region)
}
Gdip_CreateBitmap(Width, Height, Format=0x26200A){
    DllCall("gdiplus\GdipCreateBitmapFromScan0", "int", Width, "int", Height, "int", 0, "int", Format, A_PtrSize ? "UPtr" : "UInt", 0, A_PtrSize ? "UPtr*" : "uint*", pBitmap)
    Return pBitmap
}
Gdip_SetSmoothingMode(pGraphics, SmoothingMode){
   return DllCall("gdiplus\GdipSetSmoothingMode", A_PtrSize ? "UPtr" : "UInt", pGraphics, "int", SmoothingMode)
}
Gdip_DrawRectangle(pGraphics, pPen, x, y, w, h){
    Ptr := A_PtrSize ? "UPtr" : "UInt"
    return DllCall("gdiplus\GdipDrawRectangle", Ptr, pGraphics, Ptr, pPen, "float", x, "float", y, "float", w, "float", h)
}
Gdip_DrawRoundedRectangle(pGraphics, pPen, x, y, w, h, r){
    Gdip_SetClipRect(pGraphics, x-r, y-r, 2*r, 2*r, 4)
    Gdip_SetClipRect(pGraphics, x+w-r, y-r, 2*r, 2*r, 4)
    Gdip_SetClipRect(pGraphics, x-r, y+h-r, 2*r, 2*r, 4)
    Gdip_SetClipRect(pGraphics, x+w-r, y+h-r, 2*r, 2*r, 4)
    E := Gdip_DrawRectangle(pGraphics, pPen, x, y, w, h)
    Gdip_ResetClip(pGraphics)
    Gdip_SetClipRect(pGraphics, x-(2*r), y+r, w+(4*r), h-(2*r), 4)
    Gdip_SetClipRect(pGraphics, x+r, y-(2*r), w-(2*r), h+(4*r), 4)
    Gdip_DrawEllipse(pGraphics, pPen, x, y, 2*r, 2*r)
    Gdip_DrawEllipse(pGraphics, pPen, x+w-(2*r), y, 2*r, 2*r)
    Gdip_DrawEllipse(pGraphics, pPen, x, y+h-(2*r), 2*r, 2*r)
    Gdip_DrawEllipse(pGraphics, pPen, x+w-(2*r), y+h-(2*r), 2*r, 2*r)
    Gdip_ResetClip(pGraphics)
    return E
}
Gdip_DrawEllipse(pGraphics, pPen, x, y, w, h){
    Ptr := A_PtrSize ? "UPtr" : "UInt"
    return DllCall("gdiplus\GdipDrawEllipse", Ptr, pGraphics, Ptr, pPen, "float", x, "float", y, "float", w, "float", h)
}
Gdip_CreateHBITMAPFromBitmap(pBitmap, Background=0xffffffff){
    DllCall("gdiplus\GdipCreateHBITMAPFromBitmap", A_PtrSize ? "UPtr" : "UInt", pBitmap, A_PtrSize ? "UPtr*" : "uint*", hbm, "int", Background)
    return hbm
}
SetImage(hwnd, hBitmap){
    SendMessage, 0x172, 0x0, hBitmap,, ahk_id %hwnd%
    E := ErrorLevel
    DeleteObject(E)
    return E
}
 
Set_Gdip_Lite_Var_1(){
        Gdip_LITE_Part1 =
    (% ` Join`r`n
;######################################################################################################################################
;#####################################################                          #######################################################
;#####################################################        Gdip LITE         #######################################################
;#####################################################                          #######################################################
;######################################################################################################################################
; Gdip standard library v1.45 by tic (Tariq Porter) 07/09/11
; Modifed by Rseding91 using fincs 64 bit compatible Gdip library 5/1/2013
BitBlt(ddc, dx, dy, dw, dh, sdc, sx, sy, Raster=""){
    Ptr := A_PtrSize ? "UPtr" : "UInt"
    return DllCall("gdi32\BitBlt", Ptr, dDC, "int", dx, "int", dy, "int", dw, "int", dh, Ptr, sDC, "int", sx, "int", sy, "uint", Raster ? Raster : 0x00CC0020)
}
Gdip_DrawImage(pGraphics, pBitmap, dx="", dy="", dw="", dh="", sx="", sy="", sw="", sh="", Matrix=1){
    Ptr := A_PtrSize ? "UPtr" : "UInt"
    if (Matrix&1 = "")
        ImageAttr := Gdip_SetImageAttributesColorMatrix(Matrix)
    else if (Matrix != 1)
        ImageAttr := Gdip_SetImageAttributesColorMatrix("1|0|0|0|0|0|1|0|0|0|0|0|1|0|0|0|0|0|" Matrix "|0|0|0|0|0|1")
    if(sx = "" && sy = "" && sw = "" && sh = ""){
        if(dx = "" && dy = "" && dw = "" && dh = ""){
            sx := dx := 0, sy := dy := 0
            sw := dw := Gdip_GetImageWidth(pBitmap)
            sh := dh := Gdip_GetImageHeight(pBitmap)
        }else   {
            sx := sy := 0,sw := Gdip_GetImageWidth(pBitmap),sh := Gdip_GetImageHeight(pBitmap)
        }
    }
    E := DllCall("gdiplus\GdipDrawImageRectRect", Ptr, pGraphics, Ptr, pBitmap, "float", dx, "float", dy, "float", dw, "float", dh, "float", sx, "float", sy, "float", sw, "float", sh, "int", 2, Ptr, ImageAttr, Ptr, 0, Ptr, 0)
    if ImageAttr
        Gdip_DisposeImageAttributes(ImageAttr)
    return E
}
Gdip_SetImageAttributesColorMatrix(Matrix){
    Ptr := A_PtrSize ? "UPtr" : "UInt"
    VarSetCapacity(ColourMatrix, 100, 0)
    Matrix := RegExReplace(RegExReplace(Matrix, "^[^\d-\.]+([\d\.])", "$1", "", 1), "[^\d-\.]+", "|")
    StringSplit, Matrix, Matrix, |
    Loop, 25
    {
        Matrix := (Matrix%A_Index% != "") ? Matrix%A_Index% : Mod(A_Index-1, 6) ? 0 : 1
        NumPut(Matrix, ColourMatrix, (A_Index-1)*4, "float")
    }
    DllCall("gdiplus\GdipCreateImageAttributes", A_PtrSize ? "UPtr*" : "uint*", ImageAttr)
    DllCall("gdiplus\GdipSetImageAttributesColorMatrix", Ptr, ImageAttr, "int", 1, "int", 1, Ptr, &ColourMatrix, Ptr, 0, "int", 0)
    return ImageAttr
}
Gdip_GetImageWidth(pBitmap){
   DllCall("gdiplus\GdipGetImageWidth", A_PtrSize ? "UPtr" : "UInt", pBitmap, "uint*", Width)
   return Width
}
Gdip_GetImageHeight(pBitmap){
   DllCall("gdiplus\GdipGetImageHeight", A_PtrSize ? "UPtr" : "UInt", pBitmap, "uint*", Height)
   return Height
}
Gdip_DeletePen(pPen){
   return DllCall("gdiplus\GdipDeletePen", A_PtrSize ? "UPtr" : "UInt", pPen)
}
Gdip_DeleteBrush(pBrush){
   return DllCall("gdiplus\GdipDeleteBrush", A_PtrSize ? "UPtr" : "UInt", pBrush)
}
Gdip_DisposeImage(pBitmap){
   return DllCall("gdiplus\GdipDisposeImage", A_PtrSize ? "UPtr" : "UInt", pBitmap)
}
Gdip_DeleteGraphics(pGraphics){
   return DllCall("gdiplus\GdipDeleteGraphics", A_PtrSize ? "UPtr" : "UInt", pGraphics)
}
Gdip_DisposeImageAttributes(ImageAttr){
    return DllCall("gdiplus\GdipDisposeImageAttributes", A_PtrSize ? "UPtr" : "UInt", ImageAttr)
}
Gdip_DeleteFont(hFont){
   return DllCall("gdiplus\GdipDeleteFont", A_PtrSize ? "UPtr" : "UInt", hFont)
}
Gdip_DeleteStringFormat(hFormat){
   return DllCall("gdiplus\GdipDeleteStringFormat", A_PtrSize ? "UPtr" : "UInt", hFormat)
}
Gdip_DeleteFontFamily(hFamily){
   return DllCall("gdiplus\GdipDeleteFontFamily", A_PtrSize ? "UPtr" : "UInt", hFamily)
}
CreateCompatibleDC(hdc=0){
   return DllCall("CreateCompatibleDC", A_PtrSize ? "UPtr" : "UInt", hdc)
}
SelectObject(hdc, hgdiobj){
    Ptr := A_PtrSize ? "UPtr" : "UInt"
    return DllCall("SelectObject", Ptr, hdc, Ptr, hgdiobj)
}
DeleteObject(hObject){
   return DllCall("DeleteObject", A_PtrSize ? "UPtr" : "UInt", hObject)
}
GetDC(hwnd=0){
    return DllCall("GetDC", A_PtrSize ? "UPtr" : "UInt", hwnd)
}
GetDCEx(hwnd, flags=0, hrgnClip=0){
    Ptr := A_PtrSize ? "UPtr" : "UInt"
    return DllCall("GetDCEx", Ptr, hwnd, Ptr, hrgnClip, "int", flags)
}
ReleaseDC(hdc, hwnd=0){
    Ptr := A_PtrSize ? "UPtr" : "UInt"
    return DllCall("ReleaseDC", Ptr, hwnd, Ptr, hdc)
}
DeleteDC(hdc){
   return DllCall("DeleteDC", A_PtrSize ? "UPtr" : "UInt", hdc)
}
Gdip_SetClipRegion(pGraphics, Region, CombineMode=0){
    Ptr := A_PtrSize ? "UPtr" : "UInt"
    return DllCall("gdiplus\GdipSetClipRegion", Ptr, pGraphics, Ptr, Region, "int", CombineMode)
}
CreateDIBSection(w, h, hdc="", bpp=32, ByRef ppvBits=0){
    Ptr := A_PtrSize ? "UPtr" : "UInt"
    hdc2 := hdc ? hdc : GetDC()
    VarSetCapacity(bi, 40, 0)
    NumPut(w, bi, 4, "uint"), NumPut(h, bi, 8, "uint"), NumPut(40, bi, 0, "uint"), NumPut(1, bi, 12, "ushort"), NumPut(0, bi, 16, "uInt"), NumPut(bpp, bi, 14, "ushort")
    hbm := DllCall("CreateDIBSection", Ptr, hdc2, Ptr, &bi, "uint", 0, A_PtrSize ? "UPtr*" : "uint*", ppvBits, Ptr, 0, "uint", 0, Ptr)
    if !hdc
        ReleaseDC(hdc2)
    return hbm
}
Gdip_GraphicsFromImage(pBitmap){
    DllCall("gdiplus\GdipGetImageGraphicsContext", A_PtrSize ? "UPtr" : "UInt", pBitmap, A_PtrSize ? "UPtr*" : "UInt*", pGraphics)
    return pGraphics
}
Gdip_GraphicsFromHDC(hdc){
    DllCall("gdiplus\GdipCreateFromHDC", A_PtrSize ? "UPtr" : "UInt", hdc, A_PtrSize ? "UPtr*" : "UInt*", pGraphics)
    return pGraphics
}
Gdip_GetDC(pGraphics){
    DllCall("gdiplus\GdipGetDC", A_PtrSize ? "UPtr" : "UInt", pGraphics, A_PtrSize ? "UPtr*" : "UInt*", hdc)
    return hdc
}
    )
    return Gdip_LITE_Part1
}
Set_Gdip_Lite_Var_2(){
    Gdip_LITE_Part2 =
    (% ` Join`r`n
Gdip_Startup(){
    Ptr := A_PtrSize ? "UPtr" : "UInt"
    if !DllCall("GetModuleHandle", "str", "gdiplus", Ptr)
        DllCall("LoadLibrary", "str", "gdiplus")
    VarSetCapacity(si, A_PtrSize = 8 ? 24 : 16, 0), si := Chr(1)
    DllCall("gdiplus\GdiplusStartup", A_PtrSize ? "UPtr*" : "uint*", pToken, Ptr, &si, Ptr, 0)
    return pToken
}
Gdip_TextToGraphics(pGraphics, Text, Options, Font="Arial", Width="", Height="", Measure=0){
    IWidth := Width, IHeight:= Height
    RegExMatch(Options, "i)X([\-\d\.]+)(p*)", xpos)
    RegExMatch(Options, "i)Y([\-\d\.]+)(p*)", ypos)
    RegExMatch(Options, "i)W([\-\d\.]+)(p*)", Width)
    RegExMatch(Options, "i)H([\-\d\.]+)(p*)", Height)
    RegExMatch(Options, "i)C(?!(entre|enter))([a-f\d]+)", Colour)
    RegExMatch(Options, "i)Top|Up|Bottom|Down|vCentre|vCenter", vPos)
    RegExMatch(Options, "i)NoWrap", NoWrap)
    RegExMatch(Options, "i)R(\d)", Rendering)
    RegExMatch(Options, "i)S(\d+)(p*)", Size)
    if !Gdip_DeleteBrush(Gdip_CloneBrush(Colour2))
        PassBrush := 1, pBrush := Colour2
    if !(IWidth && IHeight) && (xpos2 || ypos2 || Width2 || Height2 || Size2)
        return -1
    Style := 0, Styles := "Regular|Bold|Italic|BoldItalic|Underline|Strikeout"
    Loop, Parse, Styles, |
    {
        if RegExMatch(Options, "\b" A_loopField)
        Style |= (A_LoopField != "StrikeOut") ? (A_Index-1) : 8
    }
    Align := 0, Alignments := "Near|Left|Centre|Center|Far|Right"
    Loop, Parse, Alignments, |
    {
        if RegExMatch(Options, "\b" A_loopField)
            Align |= A_Index//2.1      ; 0|0|1|1|2|2
    }
    xpos := (xpos1 != "") ? xpos2 ? IWidth*(xpos1/100) : xpos1 : 0
    ypos := (ypos1 != "") ? ypos2 ? IHeight*(ypos1/100) : ypos1 : 0
    Width := Width1 ? Width2 ? IWidth*(Width1/100) : Width1 : IWidth
    Height := Height1 ? Height2 ? IHeight*(Height1/100) : Height1 : IHeight
    if !PassBrush
        Colour := "0x" (Colour2 ? Colour2 : "ff000000")
    Rendering := ((Rendering1 >= 0) && (Rendering1 <= 5)) ? Rendering1 : 4
    Size := (Size1 > 0) ? Size2 ? IHeight*(Size1/100) : Size1 : 12
    hFamily := Gdip_FontFamilyCreate(Font)
    hFont := Gdip_FontCreate(hFamily, Size, Style)
    FormatStyle := NoWrap ? 0x4000 | 0x1000 : 0x4000
    hFormat := Gdip_StringFormatCreate(FormatStyle)
    pBrush := PassBrush ? pBrush : Gdip_BrushCreateSolid(Colour)
    if !(hFamily && hFont && hFormat && pBrush && pGraphics)
        return !pGraphics ? -2 : !hFamily ? -3 : !hFont ? -4 : !hFormat ? -5 : !pBrush ? -6 : 0
    CreateRectF(RC, xpos, ypos, Width, Height)
    Gdip_SetStringFormatAlign(hFormat, Align)
    Gdip_SetTextRenderingHint(pGraphics, Rendering)
    ReturnRC := Gdip_MeasureString(pGraphics, Text, hFont, hFormat, RC)
    if vPos
    {
        StringSplit, ReturnRC, ReturnRC, |
        if (vPos = "vCentre") || (vPos = "vCenter")
            ypos += (Height-ReturnRC4)//2
        else if (vPos = "Top") || (vPos = "Up")
            ypos := 0
        else if (vPos = "Bottom") || (vPos = "Down")
            ypos := Height-ReturnRC4
        CreateRectF(RC, xpos, ypos, Width, ReturnRC4)
        ReturnRC := Gdip_MeasureString(pGraphics, Text, hFont, hFormat, RC)
    }
    if !Measure
        E := Gdip_DrawString(pGraphics, Text, hFont, hFormat, pBrush, RC)
    if !PassBrush
        Gdip_DeleteBrush(pBrush)
    Gdip_DeleteStringFormat(hFormat)   
    Gdip_DeleteFont(hFont)
    Gdip_DeleteFontFamily(hFamily)
    return E ? E : ReturnRC
}
Gdip_DrawString(pGraphics, sString, hFont, hFormat, pBrush, ByRef RectF){
    Ptr := A_PtrSize ? "UPtr" : "UInt"
    if (!A_IsUnicode)
    {
        nSize := DllCall("MultiByteToWideChar", "uint", 0, "uint", 0, Ptr, &sString, "int", -1, Ptr, 0, "int", 0)
        VarSetCapacity(wString, nSize*2)
        DllCall("MultiByteToWideChar", "uint", 0, "uint", 0, Ptr, &sString, "int", -1, Ptr, &wString, "int", nSize)
    }
    return DllCall("gdiplus\GdipDrawString", Ptr, pGraphics, Ptr, A_IsUnicode ? &sString : &wString, "int", -1, Ptr, hFont, Ptr, &RectF, Ptr, hFormat, Ptr, pBrush)
}
Gdip_CreateLineBrush(x1, y1, x2, y2, ARGB1, ARGB2, WrapMode=1){
    Ptr := A_PtrSize ? "UPtr" : "UInt"
    CreatePointF(PointF1, x1, y1), CreatePointF(PointF2, x2, y2)
    DllCall("gdiplus\GdipCreateLineBrush", Ptr, &PointF1, Ptr, &PointF2, "Uint", ARGB1, "Uint", ARGB2, "int", WrapMode, A_PtrSize ? "UPtr*" : "UInt*", LGpBrush)
    return LGpBrush
}
Gdip_CreateLineBrushFromRect(x, y, w, h, ARGB1, ARGB2, LinearGradientMode=1, WrapMode=1){
    CreateRectF(RectF, x, y, w, h)
    DllCall("gdiplus\GdipCreateLineBrushFromRect", A_PtrSize ? "UPtr" : "UInt", &RectF, "int", ARGB1, "int", ARGB2, "int", LinearGradientMode, "int", WrapMode, A_PtrSize ? "UPtr*" : "UInt*", LGpBrush)
    return LGpBrush
}
Gdip_CloneBrush(pBrush){
    DllCall("gdiplus\GdipCloneBrush", A_PtrSize ? "UPtr" : "UInt", pBrush, A_PtrSize ? "UPtr*" : "UInt*", pBrushClone)
    return pBrushClone
}
Gdip_FontFamilyCreate(Font){
    Ptr := A_PtrSize ? "UPtr" : "UInt"
    if (!A_IsUnicode)
    {
        nSize := DllCall("MultiByteToWideChar", "uint", 0, "uint", 0, Ptr, &Font, "int", -1, "uint", 0, "int", 0)
        VarSetCapacity(wFont, nSize*2)
        DllCall("MultiByteToWideChar", "uint", 0, "uint", 0, Ptr, &Font, "int", -1, Ptr, &wFont, "int", nSize)
    }
    DllCall("gdiplus\GdipCreateFontFamilyFromName", Ptr, A_IsUnicode ? &Font : &wFont, "uint", 0, A_PtrSize ? "UPtr*" : "UInt*", hFamily)
    return hFamily
}
Gdip_SetStringFormatAlign(hFormat, Align){
   return DllCall("gdiplus\GdipSetStringFormatAlign", A_PtrSize ? "UPtr" : "UInt", hFormat, "int", Align)
}
Gdip_StringFormatCreate(Format=0, Lang=0){
   DllCall("gdiplus\GdipCreateStringFormat", "int", Format, "int", Lang, A_PtrSize ? "UPtr*" : "UInt*", hFormat)
   return hFormat
}
Gdip_FontCreate(hFamily, Size, Style=0){
   DllCall("gdiplus\GdipCreateFont", A_PtrSize ? "UPtr" : "UInt", hFamily, "float", Size, "int", Style, "int", 0, A_PtrSize ? "UPtr*" : "UInt*", hFont)
   return hFont
}
Gdip_CreatePen(ARGB, w){
   DllCall("gdiplus\GdipCreatePen1", "UInt", ARGB, "float", w, "int", 2, A_PtrSize ? "UPtr*" : "UInt*", pPen)
   return pPen
}
Gdip_CreatePenFromBrush(pBrush, w){
    DllCall("gdiplus\GdipCreatePen2", A_PtrSize ? "UPtr" : "UInt", pBrush, "float", w, "int", 2, A_PtrSize ? "UPtr*" : "UInt*", pPen)
    return pPen
}
Gdip_BrushCreateSolid(ARGB=0xff000000){
    DllCall("gdiplus\GdipCreateSolidFill", "UInt", ARGB, A_PtrSize ? "UPtr*" : "UInt*", pBrush)
    return pBrush
}
Gdip_BrushCreateHatch(ARGBfront, ARGBback, HatchStyle=0){
    DllCall("gdiplus\GdipCreateHatchBrush", "int", HatchStyle, "UInt", ARGBfront, "UInt", ARGBback, A_PtrSize ? "UPtr*" : "UInt*", pBrush)
    return pBrush
}
CreateRectF(ByRef RectF, x, y, w, h){
   VarSetCapacity(RectF, 16)
   NumPut(x, RectF, 0, "float"), NumPut(y, RectF, 4, "float"), NumPut(w, RectF, 8, "float"), NumPut(h, RectF, 12, "float")
}
Gdip_SetTextRenderingHint(pGraphics, RenderingHint){
    return DllCall("gdiplus\GdipSetTextRenderingHint", A_PtrSize ? "UPtr" : "UInt", pGraphics, "int", RenderingHint)
}
Gdip_MeasureString(pGraphics, sString, hFont, hFormat, ByRef RectF){
    Ptr := A_PtrSize ? "UPtr" : "UInt"
    VarSetCapacity(RC, 16)
    if !A_IsUnicode
    {
        nSize := DllCall("MultiByteToWideChar", "uint", 0, "uint", 0, Ptr, &sString, "int", -1, "uint", 0, "int", 0)
        VarSetCapacity(wString, nSize*2)   
        DllCall("MultiByteToWideChar", "uint", 0, "uint", 0, Ptr, &sString, "int", -1, Ptr, &wString, "int", nSize)
    }
    DllCall("gdiplus\GdipMeasureString", Ptr, pGraphics, Ptr, A_IsUnicode ? &sString : &wString, "int", -1, Ptr, hFont, Ptr, &RectF, Ptr, hFormat, Ptr, &RC, "uint*", Chars, "uint*", Lines)
    return &RC ? NumGet(RC, 0, "float") "|" NumGet(RC, 4, "float") "|" NumGet(RC, 8, "float") "|" NumGet(RC, 12, "float") "|" Chars "|" Lines : 0
}
CreateRect(ByRef Rect, x, y, w, h){
    VarSetCapacity(Rect, 16)
    NumPut(x, Rect, 0, "uint"), NumPut(y, Rect, 4, "uint"), NumPut(w, Rect, 8, "uint"), NumPut(h, Rect, 12, "uint")
}
CreateSizeF(ByRef SizeF, w, h){
   VarSetCapacity(SizeF, 8)
   NumPut(w, SizeF, 0, "float"), NumPut(h, SizeF, 4, "float")     
}
CreatePointF(ByRef PointF, x, y){
   VarSetCapacity(PointF, 8)
   NumPut(x, PointF, 0, "float"), NumPut(y, PointF, 4, "float")     
}
Gdip_DrawArc(pGraphics, pPen, x, y, w, h, StartAngle, SweepAngle){
    Ptr := A_PtrSize ? "UPtr" : "UInt"
    return DllCall("gdiplus\GdipDrawArc", Ptr, pGraphics, Ptr, pPen, "float", x, "float", y, "float", w, "float", h, "float", StartAngle, "float", SweepAngle)
}
Gdip_DrawPie(pGraphics, pPen, x, y, w, h, StartAngle, SweepAngle){
    Ptr := A_PtrSize ? "UPtr" : "UInt"
    return DllCall("gdiplus\GdipDrawPie", Ptr, pGraphics, Ptr, pPen, "float", x, "float", y, "float", w, "float", h, "float", StartAngle, "float", SweepAngle)
}
Gdip_DrawLine(pGraphics, pPen, x1, y1, x2, y2){
    Ptr := A_PtrSize ? "UPtr" : "UInt"
    return DllCall("gdiplus\GdipDrawLine", Ptr, pGraphics, Ptr, pPen, "float", x1, "float", y1, "float", x2, "float", y2)
}
Gdip_DrawLines(pGraphics, pPen, Points){
    Ptr := A_PtrSize ? "UPtr" : "UInt"
    StringSplit, Points, Points, |
    VarSetCapacity(PointF, 8*Points0)   
    Loop, %Points0%
    {
        StringSplit, Coord, Points%A_Index%, `,
        NumPut(Coord1, PointF, 8*(A_Index-1), "float"), NumPut(Coord2, PointF, (8*(A_Index-1))+4, "float")
    }
    return DllCall("gdiplus\GdipDrawLines", Ptr, pGraphics, Ptr, pPen, Ptr, &PointF, "int", Points0)
}
Gdip_FillRectangle(pGraphics, pBrush, x, y, w, h){
    Ptr := A_PtrSize ? "UPtr" : "UInt"
    return DllCall("gdiplus\GdipFillRectangle", Ptr, pGraphics, Ptr, pBrush, "float", x, "float", y, "float", w, "float", h)
}
Gdip_FillRoundedRectangle(pGraphics, pBrush, x, y, w, h, r){
    Region := Gdip_GetClipRegion(pGraphics)
    Gdip_SetClipRect(pGraphics, x-r, y-r, 2*r, 2*r, 4)
    Gdip_SetClipRect(pGraphics, x+w-r, y-r, 2*r, 2*r, 4)
    Gdip_SetClipRect(pGraphics, x-r, y+h-r, 2*r, 2*r, 4)
    Gdip_SetClipRect(pGraphics, x+w-r, y+h-r, 2*r, 2*r, 4)
    E := Gdip_FillRectangle(pGraphics, pBrush, x, y, w, h)
    Gdip_SetClipRegion(pGraphics, Region, 0)
    Gdip_SetClipRect(pGraphics, x-(2*r), y+r, w+(4*r), h-(2*r), 4)
    Gdip_SetClipRect(pGraphics, x+r, y-(2*r), w-(2*r), h+(4*r), 4)
    Gdip_FillEllipse(pGraphics, pBrush, x, y, 2*r, 2*r)
    Gdip_FillEllipse(pGraphics, pBrush, x+w-(2*r), y, 2*r, 2*r)
    Gdip_FillEllipse(pGraphics, pBrush, x, y+h-(2*r), 2*r, 2*r)
    Gdip_FillEllipse(pGraphics, pBrush, x+w-(2*r), y+h-(2*r), 2*r, 2*r)
    Gdip_SetClipRegion(pGraphics, Region, 0)
    Gdip_DeleteRegion(Region)
    return E
}
Gdip_GetClipRegion(pGraphics){
    Region := Gdip_CreateRegion()
    DllCall("gdiplus\GdipGetClip", A_PtrSize ? "UPtr" : "UInt", pGraphics, "UInt*", Region)
    return Region
}
Gdip_SetClipRect(pGraphics, x, y, w, h, CombineMode=0){
   return DllCall("gdiplus\GdipSetClipRect",  A_PtrSize ? "UPtr" : "UInt", pGraphics, "float", x, "float", y, "float", w, "float", h, "int", CombineMode)
}
Gdip_SetClipPath(pGraphics, Path, CombineMode=0){
    Ptr := A_PtrSize ? "UPtr" : "UInt"
    return DllCall("gdiplus\GdipSetClipPath", Ptr, pGraphics, Ptr, Path, "int", CombineMode)
}
Gdip_ResetClip(pGraphics){
   return DllCall("gdiplus\GdipResetClip", A_PtrSize ? "UPtr" : "UInt", pGraphics)
}
Gdip_FillEllipse(pGraphics, pBrush, x, y, w, h){
    Ptr := A_PtrSize ? "UPtr" : "UInt"
    return DllCall("gdiplus\GdipFillEllipse", Ptr, pGraphics, Ptr, pBrush, "float", x, "float", y, "float", w, "float", h)
}
Gdip_FillRegion(pGraphics, pBrush, Region){
    Ptr := A_PtrSize ? "UPtr" : "UInt"
    return DllCall("gdiplus\GdipFillRegion", Ptr, pGraphics, Ptr, pBrush, Ptr, Region)
}
Gdip_FillPath(pGraphics, pBrush, Path){
    Ptr := A_PtrSize ? "UPtr" : "UInt"
    return DllCall("gdiplus\GdipFillPath", Ptr, pGraphics, Ptr, pBrush, Ptr, Path)
}
Gdip_CreateRegion(){
    DllCall("gdiplus\GdipCreateRegion", "UInt*", Region)
    return Region
}
Gdip_DeleteRegion(Region){
    return DllCall("gdiplus\GdipDeleteRegion", A_PtrSize ? "UPtr" : "UInt", Region)
}
Gdip_CreateBitmap(Width, Height, Format=0x26200A){
    DllCall("gdiplus\GdipCreateBitmapFromScan0", "int", Width, "int", Height, "int", 0, "int", Format, A_PtrSize ? "UPtr" : "UInt", 0, A_PtrSize ? "UPtr*" : "uint*", pBitmap)
    Return pBitmap
}
Gdip_SetSmoothingMode(pGraphics, SmoothingMode){
   return DllCall("gdiplus\GdipSetSmoothingMode", A_PtrSize ? "UPtr" : "UInt", pGraphics, "int", SmoothingMode)
}
Gdip_DrawRectangle(pGraphics, pPen, x, y, w, h){
    Ptr := A_PtrSize ? "UPtr" : "UInt"
    return DllCall("gdiplus\GdipDrawRectangle", Ptr, pGraphics, Ptr, pPen, "float", x, "float", y, "float", w, "float", h)
}
Gdip_DrawRoundedRectangle(pGraphics, pPen, x, y, w, h, r){
    Gdip_SetClipRect(pGraphics, x-r, y-r, 2*r, 2*r, 4)
    Gdip_SetClipRect(pGraphics, x+w-r, y-r, 2*r, 2*r, 4)
    Gdip_SetClipRect(pGraphics, x-r, y+h-r, 2*r, 2*r, 4)
    Gdip_SetClipRect(pGraphics, x+w-r, y+h-r, 2*r, 2*r, 4)
    E := Gdip_DrawRectangle(pGraphics, pPen, x, y, w, h)
    Gdip_ResetClip(pGraphics)
    Gdip_SetClipRect(pGraphics, x-(2*r), y+r, w+(4*r), h-(2*r), 4)
    Gdip_SetClipRect(pGraphics, x+r, y-(2*r), w-(2*r), h+(4*r), 4)
    Gdip_DrawEllipse(pGraphics, pPen, x, y, 2*r, 2*r)
    Gdip_DrawEllipse(pGraphics, pPen, x+w-(2*r), y, 2*r, 2*r)
    Gdip_DrawEllipse(pGraphics, pPen, x, y+h-(2*r), 2*r, 2*r)
    Gdip_DrawEllipse(pGraphics, pPen, x+w-(2*r), y+h-(2*r), 2*r, 2*r)
    Gdip_ResetClip(pGraphics)
    return E
}
Gdip_DrawEllipse(pGraphics, pPen, x, y, w, h){
    Ptr := A_PtrSize ? "UPtr" : "UInt"
    return DllCall("gdiplus\GdipDrawEllipse", Ptr, pGraphics, Ptr, pPen, "float", x, "float", y, "float", w, "float", h)
}
Gdip_CreateHBITMAPFromBitmap(pBitmap, Background=0xffffffff){
    DllCall("gdiplus\GdipCreateHBITMAPFromBitmap", A_PtrSize ? "UPtr" : "UInt", pBitmap, A_PtrSize ? "UPtr*" : "uint*", hbm, "int", Background)
    return hbm
}
SetImage(hwnd, hBitmap){
    SendMessage, 0x172, 0x0, hBitmap,, ahk_id %hwnd%
    E := ErrorLevel
    DeleteObject(E)
    return E
}
Gdip_FillPolygon(pGraphics, pBrush, Points, FillMode=0){
    Ptr := A_PtrSize ? "UPtr" : "UInt"
    StringSplit, Points, Points, |
    VarSetCapacity(PointF, 8*Points0)   
    Loop, %Points0%
    {
        StringSplit, Coord, Points%A_Index%, `,
        NumPut(Coord1, PointF, 8*(A_Index-1), "float"), NumPut(Coord2, PointF, (8*(A_Index-1))+4, "float")
    }   
    return DllCall("gdiplus\GdipFillPolygon", Ptr, pGraphics, Ptr, pBrush, Ptr, &PointF, "int", Points0, "int", FillMode)
}
 
    )
    return Gdip_LITE_Part2
}
 
Set_Partial_Script_Var(){
    New_Partial_Script=
    (% ` Join`r`n
#SingleInstance,Force
#NoEnv
ListLines,Off
SetBatchLines,-1
pToken:=Gdip_Startup()
 
 
 
 
 
 
/*
Gui,1:Add,Text,x6 y3 w190 h24 BackgroundTrans gMove_Window 
Gui,1:Add,Text,x360 y5 w15 h15 BackgroundTrans gMin_Window
Gui,1:Add,Text,x380 y5 w15 h15 BackgroundTrans gGuiClose
Gui,1:Color,222222,222222
Gui,1:Font,cWhite s8 
*/
 
 
 
 
return
GuiClose:
GuiContextMenu:
*Esc::
    ExitApp
 
Move_Window(){
    PostMessage,0xA1,2
}
 
Min_Window(){
    Gui,1:Minimize
}
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
    
    
    )
    return New_Partial_Script
}
 
Set_Custom_Window_Class_Var(){
    Custom_Window_Class_Var =
    (% ` Join`r`n
Class Custom_Window {
    __New(x:="",y:="",w:=300,h:=200,Name:=1,Options:="+AlwaysOnTop -Caption -DPIScale",Title:="",Background_Bitmap:=""){
        This.X:=x
        This.Y:=y
        This.W:=w 
        This.H:=h 
        This.Name:=Name
        This.Title:=Title
        This.Options:=Options
        This.Background_Bitmap:=Background_Bitmap
        This.Create_Window()
    }
    Create_Window(){
        Gui,% This.Name ":New",%  This.Options " +LastFound"
        This.Hwnd:=WinExist()
        if(This.Background_Bitmap)
            This.Draw_Background_Bitmap()
    }
    Draw_Background_Bitmap(){
        This.Bitmap:=Gdip_CreateHBITMAPFromBitmap(This.Background_Bitmap)
        Gdip_DisposeImage(This.Background_Bitmap)
        Gui,% This.Name ":Add",Picture,% "x0 y0 w" This.W " h" This.H " 0xE" 
        GuiControlGet,hwnd,% This.Name ":hwnd",Static1
        This.Background_Hwnd:=hwnd
        SetImage(This.Background_Hwnd,This.Bitmap)
    }
    Show_Window(){
        if(This.X&&This.Y)
            Gui,% This.Name ":Show",% "x" This.X " y" This.Y " w" This.W " h" This.H,% This.Title
        else if(This.X&&!This.Y)
            Gui,% This.Name ":Show",% "x" This.X  " w" This.W " h" This.H,% This.Title
        else if(!This.X&&This.Y)
            Gui,% This.Name ":Show",% "y" This.Y  " w" This.W " h" This.H,% This.Title
        else 
            Gui,% This.Name ":Show",% " w" This.W " h" This.H,% This.Title
    }
}   
    )
    return Custom_Window_Class_Var
}