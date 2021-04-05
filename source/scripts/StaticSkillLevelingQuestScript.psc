scriptname StaticSkillLevelingQuestScript extends Quest
{This script adds a hidden active effect to the character upon game start that enables static leveling}

GlobalVariable Property LStaticSkillLevelingKey auto
{Keybind for the menu}

StaticSkillLevelingEffectScript Property StaticSkillEffectScript Auto

int MenuKeyCode = 48



Spell property ApplyActiveEffect auto
{This spell applies the active effect to the character}


Event OnInit()
    Game.GetPlayer().AddSpell(ApplyActiveEffect)
    ;Debug.MessageBox("The effect was applied to the player")
    activateMod()
    MenuKeyCode = LStaticSkillLevelingKey.GetValueInt()
endEvent


;============================================
;Main function for showing the menu
;============================================
Event OnKeyDown(int keycode)
    if (keycode == MenuKeyCode)
        StaticSkillEffectScript.OpenMenu()
    endif
endEvent

;============================================
;Main Helper Functions
;============================================

Function setMenuKeyCode(int newKeyCode)
	UnregisterForKey(MenuKeyCode)
	MenuKeyCode = newKeyCode
	RegisterForKey(MenuKeyCode)
EndFunction

Function activateMod()
	RegisterForKey(MenuKeyCode)
EndFunction

