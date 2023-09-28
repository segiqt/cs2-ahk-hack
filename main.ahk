SendMode Input
SetWorkingDir %A_ScriptDir%
#SingleInstance,Force
Gui,show, w390 h290
Gui Add, Text, cPurple, CS2 Cheat
Gui, Add, Tab3,, Aimbot|Visuals|Misc|Settings
Gui, Add, CheckBox, gAimbot1, Aimbot
Gui, Add, CheckBox, gLegit1, CT (Aim at CT)
Gui, Add, CheckBox, gRage1, T (Aim at T)
Gui, Add, Text, cPurple, Aimbot Speed (Customisable)
Gui, Add, Slider, w200 h20 vMySliderRange Range1-10 ; Default appearance
Gui, Add, Text, cBlack, 1 slow
Gui, Add, Text, cBlack, 10 fast

; Change the slider background color to white
GuiControl, +BackgroundFFFFFF, MySliderRange

Gui, Add, Button, gLoad1, Load Config
Gui, Add, Text, cPurple, Made by segi and fluro!
Gui, Add, Text, cPurple, Running BETA VERSION NOT FINISHED
Aimbot1:
Run Aimbot.ahk
return
Legit1:
Run Legit.ahk
return
Rage1:
Run rage.ahk
return
MsgBox You must put this in your csgo files in order to bypass it
run steam.exe
run csgo.exe
run run.ahk
Load:
Process, Close, run.ahk
Run run.ahk
Load1:
FileSelectFile, SelectedFile, 3, , Open a file, Text Documents (*.cfg; *.config)
if (SelectedFile = "")
MsgBox, You didnt select a config.
else
MsgBox, Selected config:`n%SelectedFile%
Save1:
FileSelectFile,SFL,3,%A_scriptdir%,Select file,(*.cfg*)
If ErrorLevel<>0
return

MySliderRange:
Gui, Submit, NoHide
MsgBox, Slider value changed to %MySliderRange%
return