scriptname StaticSkillLevelingQuestScript extends Quest
{This script adds a hidden active effect to the character upon game start that enables static leveling}


;==========================================
;Keybinding
;==========================================

int staticSkillMenuKey = 48 global
;==========================================

Spell property ApplyActiveEffect auto
{This spell applies the active effect to the character}

Event OnInit()
Game.GetPlayer().AddSpell(ApplyActiveEffect)
;Debug.MessageBox("The effect was applied to the player")
EndEvent

;==========================================
;Keybind Help Functions
;==========================================

int function getStaticSkillMenuKey() global
	return staticSkillMenuKey
EndFunction

Function setStaticSkillMenuKey(int newKeyCode)
	UnregisterForKey(staticSkillMenuKey)
	staticSkillMenuKey = newKeyCode
	RegisterForKey(staticSkillMenuKey)
EndFunction
