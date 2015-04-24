Func MakeSpells()
	Click($BSpellPos[0], $BSpellPos[1]) ;Click Info button
	If _Sleep(2000) Then Return

	_CaptureRegion()
	Local $Spellbar = _PixelSearch(707, 210, 709, 213, Hex(0x37A800, 6), 5)
	ClickP($TopLeftClient) ;Click Away
	If IsArray($Spellbar) = True Then
		$fullSpellFactory = True
		SetLog("Spell Factory is full", $COLOR_RED)
	Else
		If Not $spellsstarted Then
			If _Sleep(1000) Then Return
			Local $BSpellPos = _PixelSearch(500, 603, 570, 605, Hex(0x275C8F, 6), 5) ;Finds create spells button
			If IsArray($BSpellPos) Then
				Click($BSpellPos[0], $BSpellPos[1])
				If _Sleep(1000) Then Return
				SetLog("Making spell: " & GUICtrlRead($cmbSpellCreate) & " x " & $itxtspellcap, $COLOR_BLUE)
				Click(220 + _GUICtrlComboBox_GetCurSel($cmbSpellCreate) * 106, 320, $itxtspellcap)
				If _Sleep(500) Then Return
				ClickP($TopLeftClient)
				$spellsstarted = True
			Else
				SetLog("Unable to click create spells", $COLOR_RED)
			EndIf
		EndIf
	EndIf
	ClickP($TopLeftClient) ;Click Away
	If _Sleep(500) Then Return
	ClickP($TopLeftClient) ;Click Away
EndFunc