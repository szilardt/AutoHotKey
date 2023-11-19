
global hkey_array := Array()
global hwnd_array := Array()

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

	hotkeyOk.OnEvent("Click", OkFunc)
	hotkeyCancel.OnEvent("Click", CancelFunc)	

}

CancelFunc(this*){
	hkey := ""

	;PrintArray(hkey_array)
	;PrintArray(hwnd_array)

	PrintArrays(hkey_array, hwnd_array)

	global hkey_array := Array()
	global hwnd_array := Array()

	this[1].Gui.Destroy()
}

OkFunc(this,*){
	val := this.Gui["MyHotKey"].Value
	if ( val != "") {
		hkey := val
		hkey_array.Push val
		hwnd_array.Push active_id

		MsgBox "hkey: " hkey ;just some check
		this.Gui.Destroy()
	}else{
		hkey := ""
		MsgBox "hkey: " hkey ;just some check
		this.Gui.Destroy()
	}
}

PrintArrays(array1, array2){
	;MsgBox "lenght 1: " array1.Length "`n" "lenght 2: " array2.Length

	;array1.Length != 0 and array2.Length != 0

	;MsgBox "hotkey index: " 1 "`n" "hotkey element: " array1[1] "`n`n"  "hwnd index: " 1 "`n" "hwnd :" array2[1]

	if (array1.Length == array2.Length){
		Loop array1.Length{
			MsgBox "index: " A_Index "`n" "element: " array1[A_Index] "`n`n" "index: " A_Index "`n" "element: " array2[A_Index]
		}
	}
}

PrintArray(array){
	Loop array.Length{
		MsgBox "index: " A_Index "`n" "element: " array[A_Index]
	}	
}