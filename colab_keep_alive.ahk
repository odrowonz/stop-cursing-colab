
KeepAlive(ColabWinTitle, Interval){
	Loop
	{
		Sleep(1000 * 3)
		if WinExist(ColabWinTitle)
		{
			WinActivate  ; Automatically uses the window found above.
			WinMaximize  ; same
			Sleep(2000)
			MouseClick("left", 1750, 250, 1, 30)
            WheelDownCount := Random(5, 20)
			Send("{WheelDown %WheelDownCount%}")
            WheelUpCount := Random(5, 20)
			Send("{WheelUp %WheelUpCount%}")
            PgDnCount := Random(2, 6)
			send("{PgDn %PgDnCount%}")
			MouseClick("left", 1750, 500, 1, 30)
            PgUpCount := Random(2, 6)
			send("{PgUp %PgUpCount%}")
		}
		else{
			MsgBox("Did not find Window : %ColabWinTitle%", "Halt : No Such Window")
			Return	
		}
		Sleep(Interval)
	}
}
	

ColabFileName := InputBox("Enter the Google Colab filename", "Colab Keep Alive Script")
ColabWinTitle := ColabFileName . " - Colaboratory - Google Chrome"
if WinExist(ColabWinTitle){
	WinActivate
	Interval := InputBox("Enter an interval (in minutes) to emulate mouse and keyboard behaviour ", "Keep Alive  %ColabWinTitle%")
	if (not(Interval is integer))
	{
		MsgBox("Enter an Integer for the Interval", "Halt : Bad Type")
		Return
	}
	else{
		MsgBox("interval set for %Interval% minutes.", "Interval Set")
		Interval := 1000 * 60 * Interval
		KeepAlive(ColabWinTitle , Interval)
	}
}
else{
	MsgBox("Did not find Window : %ColabWinTitle%", "Halt : No Such Window")
	Return
}