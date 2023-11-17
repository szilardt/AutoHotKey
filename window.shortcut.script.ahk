
^+RButton::{
	global active_id := WinGetID("A")
	global hkey := ""

	;active_id := WinGetID("A")

	;Obj := InputBox("Press shortcut for active window", "Select shortcut", "W200 H100")

	ShortCutGui := Gui("+MinSize500x550")
	ShortCutGui.Add("Text",, "Please press shortcut:")
	
	ShortCutGui.Opt("+Owner" active_id)
	hotkey := ShortCutGui.AddHotKey("vMyHotKey")

	hotkeyOk := ShortCutGui.AddButton("Default w80", "OK")
	hotkeyCancel := ShortCutGui.AddButton("YP w80", "Cancel")

	ShortCutGui.Show()

	hotkeyOk.OnEvent("Click", MyFunc)
	hotkeyCancel.OnEvent("Click", CancelFunc)	

}

CancelFunc(this*){
	hkey := ""
	this[1].Gui.Destroy()
}

MyFunc(this,*){
	val := this.Gui["MyHotKey"].Value
	if ( val != "") {
		hkey := val
		MsgBox "hkey: " hkey ;just some check
	}else{
		hkey := ""
		MsgBox "hkey: " hkey ;just some check
		this.Gui.Destroy()
	}
}
