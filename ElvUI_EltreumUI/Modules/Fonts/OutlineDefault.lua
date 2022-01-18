local ElvUI_EltreumUI, E, L, V, P, G = unpack(select(2, ...))
local _G = _G
local IsAddOnLoaded = _G.IsAddOnLoaded
local PA = _G.ProjectAzilroka

function ElvUI_EltreumUI:SetupFontsOutlineDefault(addon)
	if ElvUI_EltreumUI.Retail then
		if IsAddOnLoaded('ProjectAzilroka') then
			PA.db["stAddonManager"]["FontFlag"] = "THICKOUTLINE"
		end
		if IsAddOnLoaded("ElvUI_SLE") then
			E.db["sle"]["armory"]["stats"]["catFonts"]["outline"] = "THICKOUTLINE"
			E.db["sle"]["armory"]["stats"]["itemLevel"]["outline"] = "THICKOUTLINE"
			E.db["sle"]["armory"]["stats"]["statFonts"]["outline"] = "THICKOUTLINE"
			E.db["sle"]["media"]["fonts"]["mail"]["outline"] = "THICKOUTLINE"
			E.db["sle"]["media"]["fonts"]["objective"]["outline"] = "THICKOUTLINE"
			E.db["sle"]["media"]["fonts"]["objectiveHeader"]["outline"] = "THICKOUTLINE"
			E.db["sle"]["media"]["fonts"]["pvp"]["outline"] = "THICKOUTLINE"
			E.db["sle"]["media"]["fonts"]["questFontSuperHuge"]["outline"] = "THICKOUTLINE"
			E.db["sle"]["media"]["fonts"]["subzone"]["outline"] = "THICKOUTLINE"
			E.db["sle"]["media"]["fonts"]["zone"]["outline"] = "THICKOUTLINE"
			E.db["sle"]["minimap"]["coords"]["fontOutline"] = "THICKOUTLINE"
			E.db["sle"]["minimap"]["instance"]["fontOutline"] = "THICKOUTLINE"
			E.db["sle"]["minimap"]["locPanel"]["fontOutline"] = "THICKOUTLINE"
			E.db["sle"]["nameplates"]["targetcount"]["fontOutline"] = "THICKOUTLINE"
			E.db["sle"]["skins"]["merchant"]["list"]["subOutline"] = "THICKOUTLINE"
		end
		if IsAddOnLoaded("ElvUI_WindTools") then
			E.private["WT"]["quest"]["objectiveTracker"]["header"]["style"] = "THICKOUTLINE"
			E.private["WT"]["quest"]["objectiveTracker"]["info"]["style"] = "THICKOUTLINE"
			E.private["WT"]["quest"]["objectiveTracker"]["title"]["style"] = "THICKOUTLINE"
			E.db["WT"]["item"]["extraItemsBar"]["bar1"]["bindFont"]["style"] = "THICKOUTLINE"
			E.db["WT"]["item"]["extraItemsBar"]["bar1"]["countFont"]["style"] = "THICKOUTLINE"
			E.db["WT"]["misc"]["gameBar"]["additionalText"]["font"]["style"] = "THICKOUTLINE"
			E.db["WT"]["misc"]["gameBar"]["time"]["font"]["style"] = "THICKOUTLINE"
		end
		E.db["general"]["altPowerBar"]["fontOutline"] = "THICKOUTLINE"
		E.db["databars"]["azerite"]["fontOutline"] = "THICKOUTLINE"
		E.db["unitframe"]["units"]["party"]["customTexts"]["EltreumPartyAbsorb"]["fontOutline"] = "THICKOUTLINE"
		E.db["unitframe"]["units"]["player"]["customTexts"]["EltreumPlayerAbsorb"]["fontOutline"] = "THICKOUTLINE"
		E.db["unitframe"]["units"]["raid"]["customTexts"]["EltreumRaidAbsorb"]["fontOutline"] = "THICKOUTLINE"
		E.db["unitframe"]["units"]["raid40"]["customTexts"]["EltreumRaid40Absorb"]["fontOutline"] = "THICKOUTLINE"
		E.db["unitframe"]["units"]["target"]["customTexts"]["EltreumTargetAbsorb"]["fontOutline"] = "THICKOUTLINE"
		E.db["actionbar"]["extraActionButton"]["hotkeyFontOutline"] = "THICKOUTLINE"
		E.db["unitframe"]["units"]["player"]["castbar"]["customTimeFont"]["fontStyle"] = "MONOCHROMEOUTLINE"
	end
	E.db["general"]["fontStyle"] = "THICKOUTLINE"
	E.db["general"]["minimap"]["locationFontOutline"] = "THICKOUTLINE"
	if ElvUI_EltreumUI.Retail then
		E.db["general"]["minimap"]["icons"]["queueStatus"]["fontOutline"] = "OUTLINE"
	end
	--E.db["general"]["minimap"]["locationFontOutline"] = "THICKOUTLINE" --test
	E.db["bags"]["countFontOutline"] = "OUTLINE"
	E.db["bags"]["itemInfoFontOutline"] = "OUTLINE"
	E.db["bags"]["itemLevelFontOutline"] = "OUTLINE"
	E.db["chat"]["fontOutline"] = "OUTLINE"
	E.db["chat"]["tabFontOutline"] = "OUTLINE"
	E.db["cooldown"]["fonts"]["fontOutline"] = "THICKOUTLINE"
	E.db["databars"]["experience"]["fontOutline"] = "THICKOUTLINE"
	E.db["databars"]["reputation"]["fontOutline"] = "THICKOUTLINE"
	E.db["databars"]["threat"]["fontOutline"] = "THICKOUTLINE"
	E.db["datatexts"]["fontOutline"] = "THICKOUTLINE"
	E.db["tooltip"]["healthBar"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["party"]["customTexts"]["EltreumPartyHealth"]["fontOutline"] = "THICKOUTLINE"
	E.db["unitframe"]["units"]["party"]["customTexts"]["EltreumPartyName"]["fontOutline"] = "THICKOUTLINE"
	E.db["unitframe"]["units"]["party"]["customTexts"]["EltreumPartyPower"]["fontOutline"] = "THICKOUTLINE"
	E.db["unitframe"]["units"]["pet"]["customTexts"]["EltreumPetName"]["fontOutline"] = "THICKOUTLINE"
	E.db["unitframe"]["units"]["player"]["customTexts"]["EltreumHealth"]["fontOutline"] = "THICKOUTLINE"
	E.db["unitframe"]["units"]["player"]["customTexts"]["EltreumName"]["fontOutline"] = "THICKOUTLINE"
	E.db["unitframe"]["units"]["player"]["customTexts"]["EltreumPower"]["fontOutline"] = "THICKOUTLINE"
	E.db["unitframe"]["units"]["player"]["customTexts"]["EltreumPvP"]["fontOutline"] = "THICKOUTLINE"
	E.db["unitframe"]["units"]["raid"]["customTexts"]["EltreumGroup"]["fontOutline"] = "NONE"
	E.db["unitframe"]["units"]["raid"]["customTexts"]["EltreumRaidHealth"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["raid"]["customTexts"]["EltreumRaidName"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["raid40"]["customTexts"]["EltreumRaid40Group"]["fontOutline"] = "NONE"
	E.db["unitframe"]["units"]["raid40"]["customTexts"]["EltreumRaid40Health"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["target"]["customTexts"]["EltreumTargetHealth"]["fontOutline"] = "THICKOUTLINE"
	E.db["unitframe"]["units"]["target"]["customTexts"]["EltreumTargetName"]["fontOutline"] = "THICKOUTLINE"
	E.db["unitframe"]["units"]["target"]["customTexts"]["EltreumTargetPower"]["fontOutline"] = "THICKOUTLINE"
	E.db["unitframe"]["units"]["target"]["customTexts"]["EltreumTargetofTarget"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["targettarget"]["customTexts"]["EltreumTargetTargetHealth"]["fontOutline"] = "THICKOUTLINE"
	E.db["unitframe"]["units"]["targettarget"]["customTexts"]["EltreumTargetTargetName"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["targettarget"]["customTexts"]["Powercustom"]["fontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["bar1"]["countFontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["bar1"]["hotkeyFontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["bar1"]["macroFontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["bar10"]["countFontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["bar10"]["hotkeyFontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["bar10"]["macroFontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["bar2"]["countFontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["bar2"]["hotkeyFontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["bar2"]["macroFontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["bar3"]["countFontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["bar3"]["hotkeyFontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["bar3"]["macroFontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["bar4"]["countFontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["bar4"]["hotkeyFontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["bar4"]["macroFontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["bar5"]["countFontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["bar5"]["hotkeyFontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["bar5"]["macroFontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["bar6"]["countFontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["bar6"]["hotkeyFontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["bar6"]["macroFontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["bar7"]["countFontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["bar7"]["hotkeyFontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["bar7"]["macroFontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["bar8"]["countFontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["bar8"]["hotkeyFontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["bar8"]["macroFontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["bar9"]["countFontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["bar9"]["hotkeyFontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["bar9"]["macroFontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["barPet"]["countFontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["barPet"]["hotkeyFontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["fontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["stanceBar"]["hotkeyFontOutline"] = "THICKOUTLINE"
	E.db["actionbar"]["vehicleExitButton"]["hotkeyFontOutline"] = "THICKOUTLINE"
	E.db["auras"]["buffs"]["countFontOutline"] = "THICKOUTLINE"
	E.db["auras"]["buffs"]["timeFontOutline"] = "THICKOUTLINE"
	E.db["auras"]["debuffs"]["countFontOutline"] = "THICKOUTLINE"
	E.db["auras"]["debuffs"]["timeFontOutline"] = "THICKOUTLINE"
	E.db["unitframe"]["fontOutline"] = "OUTLINE"
	E.db["unitframe"]["units"]["assist"]["rdebuffs"]["fontOutline"] = "THICKOUTLINE"
	E.db["unitframe"]["units"]["party"]["debuffs"]["countFontOutline"] = "THICKOUTLINE"
	E.db["unitframe"]["units"]["party"]["rdebuffs"]["fontOutline"] = "THICKOUTLINE"
	E.db["unitframe"]["units"]["raid"]["rdebuffs"]["fontOutline"] = "THICKOUTLINE"
	E.db["unitframe"]["units"]["raid40"]["rdebuffs"]["fontOutline"] = "THICKOUTLINE"
	E.db["unitframe"]["units"]["tank"]["rdebuffs"]["fontOutline"] = "THICKOUTLINE"
	E.db["nameplates"]["cooldown"]["fonts"]["fontOutline"] = "THICKOUTLINE"
	E.db["nameplates"]["units"]["ENEMY_NPC"]["castbar"]["fontOutline"] = "THICKOUTLINE"
	E.db["nameplates"]["units"]["ENEMY_NPC"]["health"]["text"]["fontOutline"] = "THICKOUTLINE"
	E.db["nameplates"]["units"]["ENEMY_NPC"]["level"]["fontOutline"] = "THICKOUTLINE"
	E.db["nameplates"]["units"]["ENEMY_NPC"]["name"]["fontOutline"] = "THICKOUTLINE"
	E.db["nameplates"]["units"]["FRIENDLY_NPC"]["name"]["fontOutline"] = "OUTLINE"
	E.db["nameplates"]["units"]["FRIENDLY_NPC"]["title"]["fontOutline"] = "OUTLINE"
	E.db["nameplates"]["units"]["ENEMY_NPC"]["power"]["text"]["fontOutline"] = "NONE"
	E.db["nameplates"]["units"]["ENEMY_PLAYER"]["castbar"]["fontOutline"] = "THICKOUTLINE"
	E.db["nameplates"]["units"]["ENEMY_PLAYER"]["health"]["text"]["fontOutline"] = "THICKOUTLINE"
	E.db["nameplates"]["units"]["ENEMY_PLAYER"]["level"]["fontOutline"] = "THICKOUTLINE"
	E.db["nameplates"]["units"]["ENEMY_PLAYER"]["name"]["fontOutline"] = "THICKOUTLINE"
	E.db["nameplates"]["units"]["ENEMY_PLAYER"]["power"]["text"]["fontOutline"] = "NONE"
	E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["buffs"]["countFontOutline"] = "NONE"
	E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["castbar"]["fontOutline"] = "NONE"
	E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["debuffs"]["countFontOutline"] = "NONE"
	E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["health"]["text"]["fontOutline"] = "NONE"
	E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["level"]["fontOutline"] = "NONE"
	E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["name"]["fontOutline"] = "OUTLINE"
	E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["title"]["fontOutline"] = "OUTLINE"
	E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["power"]["text"]["fontOutline"] = "NONE"
	E.db["nameplates"]["units"]["PLAYER"]["buffs"]["countFontOutline"] = "NONE"
	E.db["nameplates"]["units"]["PLAYER"]["castbar"]["fontOutline"] = "NONE"
	E.db["nameplates"]["units"]["PLAYER"]["debuffs"]["countFontOutline"] = "NONE"
	E.db["nameplates"]["units"]["PLAYER"]["health"]["text"]["fontOutline"] = "THICKOUTLINE"
	E.db["nameplates"]["units"]["PLAYER"]["level"]["fontOutline"] = "NONE"
	E.db["nameplates"]["units"]["PLAYER"]["name"]["fontOutline"] = "THICKOUTLINE"
	E.db["nameplates"]["units"]["PLAYER"]["power"]["text"]["fontOutline"] = "THICKOUTLINE"
	E.db["nameplates"]["units"]["PLAYER"]["title"]["fontOutline"] = "NONE"
end
