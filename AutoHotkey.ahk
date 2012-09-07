; IMPORTANT INFO ABOUT GETTING STARTED: Lines that start with a
; semicolon, such as this one, are comments.  They are not executed.

; This script has a special filename and path because it is automatically
; launched when you run the program directly.  Also, any text file whose
; name ends in .ahk is associated with the program, which means that it
; can be launched simply by double-clicking it.  You can have as many .ahk
; files as you want, located in any folder.  You can also run more than
; one ahk file simultaneously and each will get its own tray icon.

; SAMPLE HOTKEYS: Below are two sample hotkeys.  The first is Win+Z and it
; launches a web site in the default browser.  The second is Control+Alt+N
; and it launches a new Notepad window (or activates an existing one).  To
; try out these hotkeys, run AutoHotkey again, which will load this file.

#z::Run www.autohotkey.com
^!n::
IfWinExist Mozilla Firefox
    WinActivate
else
    Run Firefox
return


; Note: From now on whenever you run AutoHotkey directly, this script
; will be loaded.  So feel free to customize it to suit your needs.

; Please read the QUICK-START TUTORIAL near the top of the help file.
; It explains how to perform common automation tasks such as sending
; keystrokes and mouse clicks.  It also explains more about hotkeys.


MsgBox %MyNumber%
; Get Program Name
getProgram(sTitle) {
  sProgram := ""
  iPos := InStr(sTitle, "IntelliJ")
  ;MsgBox %iPos%
  return %sProgram%
}
; Ctrl + Alt + g to get title
^!g::
  WinGetTitle, sTitle, A
  sProgram := getProgram(sTitle)
  MsgBox %sProgram%-%sTitle%
  return

; Docs : 1. http://www.autohotkey.com/docs/commands/
;        2. http://www.autohotkey.com/docs/Hotkeys.htm
;        3. http://www.autohotkey.com/docs/commands/Send.htm
;        4. http://www.autohotkey.com/docs/commands/_EscapeChar.htm
; # : WinKey
; ! : Alt
; ^ : Control
; + : Shift

BetterSend(sInputStr) {
    KeyWait, LWin         ; Wait for Left WinKey to be released,
    SendInput %sInputStr% ; then do "SendInput" to fix "WinKey stuck down" issue under Win7
    return
}

; ForVIVOTEK. Only bind for PuTTY
#IfWinActive ahk_class PuTTY
#1::BetterSend("mount -t nfs -o tcp,nolock 172.16.5.31:/home /home")
#2::BetterSend("mount / -o remount,rw; mkdir /workspace; mount -t nfs -o tcp,nolock 172.16.5.31:/workspace /workspace")
#3::BetterSend("mkdir /mnt/flash/smb_rd1-2; smbmount //172.16.5.31/kent /mnt/flash/smb_rd1-2 -o username=kent,rw")
#4::BetterSend("facmode setfac; sysparam set macaddress 00:02:D1:78:22:01")
#5::BetterSend("mount / -o remount,rw")
#6::BetterSend("nand scrub 0x0 0x8000000")
#7::BetterSend("setenv serverip 172.16.2.54; setenv ipaddr 172.16.2.254; setenv netmask 255.255.0.0; setenv ethaddr 00:02:D1:11:22:33; saveenv; reset")
#8::BetterSend("rm /etc/mtab; mknod -m 644 /etc/mtab c 1 3; mkdir -p /home/kent; smbmount //172.16.5.31/kent /home/kent -o username=kent,ro")
#9::BetterSend("killall ServiceMonitor; killall stream")
#0::BetterSend("/home/kent/Repos/MyGitRepos/VIVOTEK_SDK_FOR_CISCO/Samples/sensor_app/sensor_app.out")
; Decrease PuTTY Font size
^-::Send !{Space}g+{Tab}Ap!n!S{Up}{Enter 2}
; Increase PuTTY Font size
Ctrl & +::Send !{Space}g+{Tab}Ap!n!S{Down}{Enter 2}
; Set Default PuTTY Font size: 12
^0::Send !{Space}g+{Tab}Ap!n!S12{Enter 2}
; for PuTTY -> VIm -> MiniBufExplorer
; ^Tab::SendInput :MBEbn{Enter}
; +Tab::SendInput :MBEbp{Enter}
^,::SendInput ^ap
^.::SendInput ^an
; Capslock::SendInput {Escape}
; Home::SendInput +6

; Bind all
#IfWinActive
#a::Run D:\Vim\vim71\gvim.exe C:\Users\kent.chen\Documents\AutoHotkey.ahk
#r::reload
#f::Run Firefox
#p::Run "D:\[Software]\PUTTY.exe"
#i::Run "C:\Program Files\Internet Explorer\iexplore.exe"
#+i::Run "C:\Program Files (x86)\VIVOTEK Inc\Installation Wizard 2\IW2.exe"
#g::Run "D:\Vim\vim71\gvim.exe"
#c::Run cmd
#o::Run "C:\Program Files\Microsoft Office\OFFICE11\OUTLOOK.EXE"  /recycle
#v::Run "C:\Program Files (x86)\VideoLAN\VLC\vlc.exe"
#q::Run "C:\Program Files (x86)\QuickTime\QuickTimePlayer.exe"
#m::Run "C:\Program Files (x86)\K-Lite Codec Pack\Media Player Classic\mpc-hc.exe"
;#+d::Run http://www.google.com.tw/dictionary?langpair=en|zh-TW&q=%clipboard%&hl=zh-TW&aq=f
;#+d::Run http://www.google.com/search?hl=zh-TW&tbs=dfn`%3A1&q=%clipboard%
#+d::Run http://translate.google.com/#en|zh-TW|%clipboard%
#+y::Run http://tw.dictionary.yahoo.com/dictionary?p=%clipboard%
#+c::Run Calc
