local ElvUI_EltreumUI, E, L, V, P, G = unpack(select(2, ...))
local _G = _G
local SetCVar = SetCVar
local IsAddOnLoaded = IsAddOnLoaded

-- Eltreum UI print
function ElvUI_EltreumUI:Print(msg)
	print('|c4682B4ffEltruism|r: '..msg)
end

--- Friendly Nameplate Control
function ElvUI_EltreumUI:FriendlyNameplates()
	if E.private.ElvUI_EltreumUI.friendlynameplatetoggle.enable then
		local inInstance, instanceType = IsInInstance()
		if instanceType == "party" or instanceType == "raid" or instanceType == "pvp" or instanceType == "arena" or instanceType == "scenario" then
		E:SetupCVars(noDisplayMsg)
			SetCVar("nameplateShowFriends", 0)
		end
		if instanceType == "none" then
		E:SetupCVars(noDisplayMsg)
			SetCVar("nameplateShowFriends", 1)
		end
	end
end

-- AFK racial music (ALPHA TEST CANT STOP MUSIC YET)
function ElvUI_EltreumUI:RacialAFKmusic()
	if E.private.ElvUI_EltreumUI.afkmusic.enable then
		local _ , race, _ = UnitRace("player")
		--local _, soundHandle = PlaySoundFile("Path\\To\\File.mp3")
		if UnitIsAFK("player") then 
			if race == "Human" then
					_, soundHandle = PlaySound(49517, "Dialog")
			end
			if race == "Gnome" then
					_, soundHandle = PlaySound(22756, "Dialog")
			end
			if race == "NightElf" then
					_, soundHandle = PlaySound(49521, "Dialog")
			end
			if race == "KulTiran" then
					_, soundHandle = PlaySound(129710, "Dialog")
			end
			if race == "Dwarf" then
					willPlay, soundHandle = PlaySound(15873, "Dialog", true)
					--ElvUI_EltreumUI:Print('Playing music')
			end
			if race == "Draenei" then
					_, soundHandle = PlaySound(9972, "Dialog")
			end
			if race == "Worgen" then
					_, soundHandle = PlaySound(23077, "Dialog")
			end
			if race == "VoidElf" then
					_, soundHandle = PlaySound(97311, "Dialog")
			end
			if race == "LightforgedDraenei" then
					_, soundHandle = PlaySound(97314, "Dialog")
			end
			if race == "DarkIronDwarf" then
					_, soundHandle = PlaySound(22160, "Dialog")
			end
			if race == "Mechagnome" then
					_, soundHandle = PlaySound(138271, "Dialog")
			end
			if race == "Orc" then
					_, soundHandle = PlaySound(22193, "Dialog")
			end
			if race == "Undead" then
					_, soundHandle = PlaySound(115014, "Dialog")
			end
			if race == "Tauren" then
					_, soundHandle = PlaySound(22210, "Dialog")
			end
			if race == "Troll" then
					_, soundHandle = PlaySound(23034, "Dialog")
			end
			if race == "Goblin" then
					_, soundHandle = PlaySound(48887, "Dialog")
			end
			if race == "BloodElf" then
					_, soundHandle = PlaySound(9801, "Dialog")
			end
			if race == "Pandaren" then
					_, soundHandle = PlaySound(30229, "Dialog")
			end
			if race == "Nightborne" then
					_, soundHandle = PlaySound(76666, "Dialog")
			end
			if race == "HighmountainTauren" then
					_, soundHandle = PlaySound(76577, "Dialog")
			end
			if race == "ZandalariTroll" then
					_, soundHandle = PlaySound(129774, "Dialog")
			end
			if race == "Vulpera" then
					_, soundHandle = PlaySound(147882, "Dialog")
			end
			if race == "MagharOrc" then
					_, soundHandle = PlaySound(117436, "Dialog")
			end
		end
		--if not UnitIsAFK("player") then
			--if soundHandle then
			--ElvUI_EltreumUI:Print('Tried to stop music')
			--StopSound(soundHandle, 1)
				--end
			--end
	--gotta figure out how to stopsound at some point
	--	StopSound(soundHandle)
	end
end

--simpy:
--it would be far more efficient if you managed the group list table outside 
--of the combat calling function (using GROUP_ROSTER_UPDATE), 
--emptied it when you aren't in a group, 
--and only looked for names on that list when the combat event fires

-- Conversion of the party/raid death weakaura into an addon option
function ElvUI_EltreumUI:RaidDeath()
	if E.private.ElvUI_EltreumUI.partyraiddeath.enable then
		local _, eventType, _, _, _, _, _, _, destName, _, _ = CombatLogGetCurrentEventInfo()
		if eventType == "UNIT_DIED" then
			if IsInGroup() then
				for ii=1, GetNumGroupMembers() do
					local name = GetRaidRosterInfo(ii)
					if destName == name then
						if E.private.ElvUI_EltreumUI.partyraiddeath.bruh then
						PlaySoundFile("Interface\\AddOns\\ElvUI_EltreumUI\\Media\\sound\\bruh.mp3", "Dialog");
						end
						if E.private.ElvUI_EltreumUI.partyraiddeath.robloxoof then
						PlaySoundFile("Interface\\AddOns\\ElvUI_EltreumUI\\Media\\sound\\oof.mp3", "Dialog");
						end
					end
				end
			end
		end
	end
end

-- Create Stealth Overlay Frame
local StealthOptionsFrame = CreateFrame("Frame", "StealthOverlay", E.UIParent)
StealthOptionsFrame:Point("TOPLEFT")
StealthOptionsFrame:Point("BOTTOMRIGHT")
StealthOptionsFrame:SetFrameLevel(0)
StealthOptionsFrame:SetFrameStrata("BACKGROUND")
-- Texture from Shadowmeld, public domain
StealthOptionsFrame.tex = StealthOptionsFrame:CreateTexture()
StealthOptionsFrame.tex:SetTexture("Interface\\Addons\\ElvUI_EltreumUI\\Media\\Textures\\StealthOverlay.tga")
StealthOptionsFrame.tex:SetAllPoints(frame)
-- set to hide so it doesnt show on characters that dont have stealth
StealthOptionsFrame:Hide()
-- Stealth Overlay Options
function ElvUI_EltreumUI:StealthOptions()
	if E.private.ElvUI_EltreumUI.stealthOptions.stealtheffect then
		--Script the frame, ty wowpedia for examples
		StealthOptionsFrame:HookScript("OnEvent", function(__, event)
		  if (event == "PLAYER_ENTERING_WORLD") then
			if IsStealthed() then
				StealthOptionsFrame:Show();
			end
		  elseif (event == "UPDATE_STEALTH") then
			if IsStealthed() then
				UIFrameFadeIn(StealthOptionsFrame, 0.125, 0, 1);
			else
				UIFrameFadeOut(StealthOptionsFrame, 0.1, 1, 0);
			end
		  end
		end);
		StealthOptionsFrame:RegisterEvent("PLAYER_ENTERING_WORLD");
		StealthOptionsFrame:RegisterEvent("UPDATE_STEALTH");
	end
end

-- Nameplate options for Border and Glow
function ElvUI_EltreumUI:NamePlateOptions()
	local nameplateclasscolors
	nameplateclasscolors = E:ClassColor(E.myclass, true)
	if E.private.ElvUI_EltreumUI.nameplateOptions.ClassColorGlow then
		E.db["nameplates"]["colors"]["glowColor"]["b"] = nameplateclasscolors.b
		E.db["nameplates"]["colors"]["glowColor"]["r"] = nameplateclasscolors.r
		E.db["nameplates"]["colors"]["glowColor"]["g"] = nameplateclasscolors.g 
	end
	if E.private.ElvUI_EltreumUI.nameplateOptions.ClassBorderNameplate then
		E.global["nameplate"]["filters"]["ElvUI_Target"]["actions"]["color"]["borderColor"]["b"] = nameplateclasscolors.b
		E.global["nameplate"]["filters"]["ElvUI_Target"]["actions"]["color"]["borderColor"]["g"] = nameplateclasscolors.g
		E.global["nameplate"]["filters"]["ElvUI_Target"]["actions"]["color"]["borderColor"]["r"] = nameplateclasscolors.r
		E.global["nameplate"]["filters"]["ElvUI_Target"]["actions"]["color"]["border"] = true
	end
end

-- Skill Glow
local LCG = LibStub('LibCustomGlow-1.0')
function ElvUI_EltreumUI:SkillGlow()
	-- using the same method as nameplate doesnt work, returns black color instead of classcolor
	--local skillglowcolor
	--skillglowcolor = E:ClassColor(E.myclass, true)
	--skillglowcolor = E:GetColor(classColor.r, classColor.g, classColor.b)
	
	--ty Azilroka but it didnt work :(
	---local skillglowcolor:SetVertexColor(unpack(E.media.rgbvaluecolor))

	-- this worked for some reason
	local r, g, b = unpack(E.media.rgbvaluecolor)
	local skillglowcolor = {r, g, b, 1}
	local customglow = LibStub("LibButtonGlow-1.0")
	if E.private.ElvUI_EltreumUI.glow.enable then
		if E.private.ElvUI_EltreumUI.glow.pixel then
			function customglow.ShowOverlayGlow(button)
				if button:GetAttribute("type") == "action" then
					local actionType, actionID = GetActionInfo(button:GetAttribute("action"))
					----PixelGlow_Start(frame[, color[, N[, frequency[, length[, th[, xOffset[, yOffset[, border[ ,key]]]]]]]])
					LCG.PixelGlow_Start(button, skillglowcolor, 9, 1, 3, 5, 5, 5, false, nil, high)
				end
			end
			function customglow.HideOverlayGlow(button)
				LCG.PixelGlow_Stop(button)
			end
		end
		if E.private.ElvUI_EltreumUI.glow.autocast then
			function customglow.ShowOverlayGlow(button)
				if button:GetAttribute("type") == "action" then
					local actionType, actionID = GetActionInfo(button:GetAttribute("action"))
					----AutoCastGlow_Start(frame[, color[, N[, frequency[, scale[, xOffset[, yOffset[, key]]]]]]])
					----N - number of particle groups. Each group contains 4 particles. Defaul value is 4;
					LCG.AutoCastGlow_Start(button, skillglowcolor, 8, 0.8, 2, 5, 5)
				end
			end
			function customglow.HideOverlayGlow(button)
				LCG.AutoCastGlow_Stop(button)
			end
		end
		if E.private.ElvUI_EltreumUI.glow.blizzard then
			function customglow.ShowOverlayGlow(button)
				if button:GetAttribute("type") == "action" then
					local actionType, actionID = GetActionInfo(button:GetAttribute("action"))
					----ButtonGlow_Start(frame[, color[, frequency]]])
					LCG.ButtonGlow_Start(button, skillglowcolor, 0.5)
				end
			end
			function customglow.HideOverlayGlow(button)
				LCG.ButtonGlow_Stop(button)
			end
		end
	end	
end

-- AddOnSkins Profile
function ElvUI_EltreumUI:AddonSetupAS()
	if IsAddOnLoaded('AddOnSkins') then
		ElvUI_EltreumUI:GetASProfile()
		ElvUI_EltreumUI:Print('AddOnSkins profile has been set.')
	end
end
-- Immersion Profile
function ElvUI_EltreumUI:AddonSetupImmersion()
	if IsAddOnLoaded('Immersion') then
		ElvUI_EltreumUI:GetImmersionProfile()
		ElvUI_EltreumUI:Print('Immersion profile has been set.')
	end
end
-- BigWigs Profile
function ElvUI_EltreumUI:AddonSetupBW()
	if IsAddOnLoaded('BigWigs') then
		ElvUI_EltreumUI:GetBigWigsProfile()
		ElvUI_EltreumUI:Print('BigWigs profile has been set.')
	end
end
-- DBM Profile
function ElvUI_EltreumUI:AddonSetupDBM()
	if IsAddOnLoaded('DBM-Core') then
		ElvUI_EltreumUI:GetDBMProfile()
		ElvUI_EltreumUI:Print('DBM profile has been set.')
	end
end
-- Details Profile
function ElvUI_EltreumUI:AddonSetupDT()
	if IsAddOnLoaded('Details') then
		ElvUI_EltreumUI:GetDetailsProfile()
		ElvUI_EltreumUI:Print('Details profile has been set.')
	end
end
-- DynamicCam Profile
function ElvUI_EltreumUI:AddonSetupDynamicCam()
	if IsAddOnLoaded('DynamicCam') then
		ElvUI_EltreumUI:GetDynamicCamProfile()
		ElvUI_EltreumUI:Print('Dynamic Cam profile has been set.')
	end
end
-- GladiusEx Profile
function ElvUI_EltreumUI:AddonSetupGladiusEx()
	if IsAddOnLoaded('GladiusEx') then
		ElvUI_EltreumUI:GetGladiusExProfile()
		ElvUI_EltreumUI:Print('GladiusEx profile has been set.')
	end
end
-- EXRT Profile
function ElvUI_EltreumUI:AddonSetupExRT()
	if IsAddOnLoaded('ExRT') then
		ElvUI_EltreumUI:GetExRTProfile()
		ElvUI_EltreumUI:Print('Exorsus Raid Tools profile has been set.')
	end
end
-- ProjectAzilroka Profile
function ElvUI_EltreumUI:AddonSetupPA()
	if IsAddOnLoaded('ProjectAzilroka') then
		ElvUI_EltreumUI:GetPAProfile()
		ElvUI_EltreumUI:Print('ProjectAzilroka profile has been set.')
	end
end
-- NameplateSCT Profile
function ElvUI_EltreumUI:AddonSetupNameplateSCT()
	if IsAddOnLoaded('NameplateSCT') then
		ElvUI_EltreumUI:GetNameplateSCTProfile()
		ElvUI_EltreumUI:Print('NameplateSCT profile has been set.')
	end
end
-- FCT Profile
function ElvUI_EltreumUI:AddonSetupFCT()
	if IsAddOnLoaded('ElvUI_FCT') then
		ElvUI_EltreumUI:GetFCTProfile()
		ElvUI_EltreumUI:Print('Floating Combat Text profile has been set.')
	end
end
-- CVars General
function ElvUI_EltreumUI:SetupCVars()
	-- ElvUI CVars
	E:SetupCVars(noDisplayMsg)
	SetCVar('nameplateOccludedAlphaMult', 0)
	SetCVar('cameraDistanceMaxZoomFactor', 2.6)
	SetCVar('autoLootDefault', true)
	SetCVar('nameplateShowFriendlyMinions', 0)
	SetCVar('removeChatDelay', 1)
	SetCVar('nameplateMinAlpha',1)
	SetCVar('nameplateLargerScale', 1.2)
	SetCVar('"nameplateMaxDistance', 60)	
	SetCVar('nameplateMinScale', 1)
	SetCVar('nameplateMotion', 1)
	SetCVar('nameplateOccludedAlphaMult', 0)
	SetCVar('nameplateOverlapH', 0.8)
	SetCVar('nameplateOverlapV', 1.1)
	SetCVar('nameplateSelectedScale', 1)
	SetCVar('nameplateSelfAlpha', 1)
	SetCVar('UnitNameEnemyGuardianName', 0)
	SetCVar('UnitNameEnemyMinionName', 0)
	SetCVar('UnitNameEnemyPetName', 0)
	SetCVar('UnitNameEnemyPlayerName', 1)
	SetCVar('UnitNameEnemyTotem', 1)

	ElvUI_EltreumUI:Print('CVars have been set.')
end
-- CVars NamePlates
function ElvUI_EltreumUI:NameplateCVars()
	SetCVar('UnitNameEnemyPlayerName', 1)
	ElvUI_EltreumUI:Print('NamePlate CVars have been set.')
end
-- Private DB
function ElvUI_EltreumUI:SetupPrivate()
	-- ElvUI Private DB
	E.private["general"]["chatBubbleFont"] = "Kimberley"
	E.private["general"]["chatBubbleFontOutline"] = "THICK"
	E.private["general"]["chatBubbleFontSize"] = 12
	E.private["general"]["chatBubbleName"] = true
	E.private["general"]["dmgfont"] = "Kimberley"
	E.private["general"]["glossTex"] = "Eltreum-Blank"
	E.private["general"]["namefont"] = "Kimberley"
	E.private["general"]["normTex"] = "Eltreum-Blank"
	E.private["general"]["totemBar"] = true
	E.private["install_complete"] = "12.23"
	E.private["skins"]["parchmentRemoverEnable"] = true
end
-- Global DB
function ElvUI_EltreumUI:SetupGlobal()
	-- ElvUI Global DB
	E.global["general"]["WorldMapCoordinates"]["position"] = "BOTTOM"
	E.global["general"]["commandBarSetting"] = "DISABLED"
	E.global["general"]["fadeMapDuration"] = 0.1
	E.global["general"]["mapAlphaWhenMoving"] = 0.35
	E.global["general"]["smallerWorldMap"] = false
	E.global["general"]["smallerWorldMapScale"] = 1
		-- Custom DataText
	E.global["datatexts"]["settings"]["Experience"]["textFormat"] = "PERCENT"
	E.global["datatexts"]["settings"]["Friends"]["hideAFK"] = true
	E.global["datatexts"]["settings"]["Friends"]["hideApp"] = true
	E.global["datatexts"]["settings"]["Gold"]["goldCoins"] = false
	E.global["datatexts"]["settings"]["MovementSpeed"]["NoLabel"] = true
	E.global["datatexts"]["settings"]["Time"]["time24"] = true
end
-- UI Scale
function ElvUI_EltreumUI:SetupScale()
	E.global["general"]["UIScale"] = 0.7
	SetCVar('uiScale', 0.7)
end