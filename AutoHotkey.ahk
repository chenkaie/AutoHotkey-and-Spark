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
; Ctrl + Alt + n to get title
^!g::
  WinGetTitle, sTitle, A
  sProgram := getProgram(sTitle)
  MsgBox %sProgram%-%sTitle%
  return

; Docs : 1. http://www.autohotkey.com/docs/commands/
;        2. http://www.autohotkey.com/docs/Hotkeys.htm
; # : WinKey
; ! : Alt
; ^ : Control
; + : Shift

; ForVIVOTEK. Only bind for PuTTY
#IfWinActive ahk_class PuTTY
#1::SendInput mount -t nfs -o tcp,nolock 172.16.5.31:/home /home 
#2::SendInput mkdir /mnt/ramdisk/worksapce; mount -t nfs -o tcp,nolock 172.16.5.31:/workspace/kent /mnt/ramdisk/worksapce
#3::SendInput mkdir /mnt/ramdisk/smb_rd1-2; smbmount //172.16.5.31/kent /mnt/ramdisk/smb_rd1-2 -o username=kent,rw
#4::SendInput facmode setfac; sysparam set macaddress 00:02:D1:78:22:01
#5::SendInput mount / -o remount,rw
#6::SendInput nand scrub 0x0 0x8000000
; for PuTTY -> VIm -> MiniBufExplorer
^Tab::SendInput :MBEbn{Enter}
+Tab::SendInput :MBEbp{Enter}
^,::SendInput ^ap
^.::SendInput ^an
; Home::SendInput +6

; Bind all
#IfWinActive
#a::Run C:\VimE\vim71\gvim.exe D:\MyDocuments\AutoHotkey.ahk
#r::reload
#f::Run Firefox
#p::Run "D:\[Software]\PUTTY.exe"
#i::Run "C:\Program Files\Internet Explorer\iexplore.exe"
#+i::Run "C:\Program Files\Vivotek Inc\Installation Wizard 2\IW2.exe"
#g::Run "C:\VimE\vim71\gvim.exe"
#c::Run cmd
#o::Run "C:\Program Files\Microsoft Office\OFFICE11\OUTLOOK.EXE"  /recycle
#v::Run "C:\Program Files\VideoLAN\VLC\vlc.exe" 
#q::Run "C:\Program Files\QuickTime\QuickTimePlayer.exe"
#m::Run "C:\Program Files\K-Lite Codec Pack\Media Player Classic\mplayerc.exe"
#+d::Run http://www.google.com.tw/dictionary?langpair=en|zh-TW&q=%clipboard%&hl=zh-TW&aq=f
#+c::Run Calc 
