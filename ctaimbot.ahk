; version 1 its rlly bad
init:
#NoEnv
#SingleInstance, Force
#Persistent
#InstallKeybdHook
#UseHook
#KeyHistory, 0
#HotKeyInterval 1
#MaxHotkeysPerInterval 127
version = 1.1
traytip, cs2 aimbot %version%, Running in background!, 5, 1
Menu, tray, NoStandard
Menu, tray, Tip, csgo aimbot %version%
Menu, tray, Add, csgo aimbot %version%, return
Menu, tray, Add
Menu, tray, Add, Help, info
Menu, tray, Add, Exit, exit
SetKeyDelay,-1, 1
SetControlDelay, -1
SetMouseDelay, -1
SetWinDelay,-1
SendMode, InputThenPlay
SetBatchLines,-1
ListLines, Off
CoordMode, Pixel, Screen, RGB
CoordMode, Mouse, Screen
PID := DllCall("GetCurrentProcessId")
Process, Priority, %PID%, High

EMCol := 0x809DB5
ColVn := 65
AntiShakeX := (A_ScreenHeight // 100)
AntiShakeY := (A_ScreenHeight // 108)
ZeroX := (A_ScreenWidth // 2)
ZeroY := (A_ScreenHeight // 2)
CFovX := (A_ScreenWidth // 8)
CFovY := (A_ScreenHeight // 64)
ScanL := ZeroX - CFovX
ScanT := ZeroY
ScanR := ZeroX + CFovX
ScanB := ZeroY + CFovY
NearAimScanL := ZeroX - AntiShakeX
NearAimScanT := ZeroY - AntiShakeY
NearAimScanR := ZeroX + AntiShakeX
NearAimScanB := ZeroY + AntiShakeY

Loop, {
KeyWait, E, D ; Bind key to aimbot
PixelSearch, AimPixelX, AimPixelY, NearAimScanL, NearAimScanT, NearAimScanR, NearAimScanB, EMCol, ColVn, Fast RGB
if (!ErrorLevel=0) {
loop, 10 {
PixelSearch, AimPixelX, AimPixelY, ScanL, ScanT, ScanR, ScanB, EMCol, ColVn, Fast RGB
AimX := AimPixelX - ZeroX
AimY := AimPixelY - ZeroY
DirX := -1
DirY := -1
If ( AimX > 0 ) {
DirX := 1
}
If ( AimY > 0 ) {
DirY := 1
}
AimOffsetX := AimX * DirX
AimOffsetY := AimY * DirY
MoveX := Floor(( AimOffsetX ** ( 1 / 2 ))) * DirX
MoveY := Floor(( AimOffsetY ** ( 1 / 2 ))) * DirY
DllCall("mouse_event", uint, 1, int, MoveX * 5, int, MoveY, uint, 0, int, 0) ; aim speed 1.5 or 1 is good 10 
}
}
}

Pause:: pause
return:
goto, init

info:
msgbox, 0, %version%, segiware`n uwu
return

exit:
exitapp