scriptname Luca_StaticSkillLevelingMenuKey extends SKI_ConfigBase

int function GetVersion()
	return 4
endFunction

int			_keymapOID_K

; State


int keyCode

GlobalVariable Property LStaticSkillLevelingKey Auto

; INITIALIZATION ----------------------------------------------------------------------------------

; @overrides SKI_ConfigBase
event OnConfigInit()
	Pages = new string[1]
	Pages[0] = "Keybinding"
	keyCode = LStaticSkillLevelingKey.GetValueInt()
endEvent

; @implements SKI_QuestBase
event OnVersionUpdate(int a_version)
	{Called when a version update of this script has been detected}
endEvent


; EVENTS ------------------------------------------------------------------------------------------

; @implements SKI_ConfigBase
event OnPageReset(string a_page)
	{Called when a new page is selected, including the initial empty page}

	; Load custom logo in DDS format
	if (a_page == "")
		SetCursorFillMode(TOP_TO_BOTTOM)

		SetCursorPosition(1)

		_keymapOID_K = AddKeyMapOption("KeyBind", LStaticSkillLevelingKey.GetValueInt())
	endIf

endEvent

; @implements SKI_ConfigBase
event OnOptionKeyMapChange(int a_option, int a_keyCode, string a_conflictControl, string a_conflictName)
	{Called when a key has been remapped}

	if (a_option == _keymapOID_K)

		bool continue = true

		if (a_conflictControl != "")
			string msg

			if (a_conflictName != "")
				msg = "This key is already mapped to:\n'" + a_conflictControl + "'\n(" + a_conflictName + ")\n\nAre you sure you want to continue?"
			else
				msg = "This key is already mapped to:\n'" + a_conflictControl + "'\n\nAre you sure you want to continue?"
			endIf

			continue = ShowMessage(msg, true, "$Yes", "$No")
		endIf

		if (continue)
			LStaticSkillLevelingKey.SetValueInt(a_keyCode);
            SetKeymapOptionValue(a_option, a_keyCode)
			((self as quest) as StaticSkillLevelingQuestScript).setMenuKeyCode(keyCode)
		endIf
	endIf
endEvent
