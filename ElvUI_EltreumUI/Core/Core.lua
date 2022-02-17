local ElvUI_EltreumUI, E, L, V, P, G = unpack(select(2, ...))
local _G = _G
local C_CVar = _G.C_CVar

-- Eltreum UI print
function ElvUI_EltreumUI:Print(msg)
	print('|cff82B4ffEltruism|r: '..msg)
end

--Resolution check for font outline
function ElvUI_EltreumUI:ResolutionOutline()
	if C_CVar.GetCVar('gxFullscreenResolution') == "3140x2160" or C_CVar.GetCVar('gxWindowedResolution') == "3140x2160" then
		ElvUI_EltreumUI:Print(L["4K resolution detected, setting fonts to default mode."])
	elseif C_CVar.GetCVar('gxFullscreenResolution') == '2560x1440' or C_CVar.GetCVar('gxWindowedResolution') == "2560x1440" then
		ElvUI_EltreumUI:SetupFontsOutlineOutline()
		ElvUI_EltreumUI:Print(L["1440p resolution detected, setting fonts to outline mode."])
	elseif C_CVar.GetCVar('gxFullscreenResolution') == "1920x1080" or C_CVar.GetCVar('gxWindowedResolution') == "1920x1080" then
		ElvUI_EltreumUI:SetupFontsOutlineOutline()
		ElvUI_EltreumUI:Print(L["1080p resolution detected, setting fonts to outline mode."])
	elseif C_CVar.GetCVar('gxFullscreenResolution') == "auto" or C_CVar.GetCVar('gxWindowedResolution') == "auto" then
		ElvUI_EltreumUI:SetupFontsOutlineOutline()
		ElvUI_EltreumUI:Print(L["Fonts were set to Outline due to your resolution."])
	else
		ElvUI_EltreumUI:SetupFontsOutlineOutline()
		ElvUI_EltreumUI:Print(L["Fonts were set to Outline due to your resolution."])
	end
end

--turn and off blizzard combat text
function ElvUI_EltreumUI:BlizzCombatText()
	if IsAddOnLoaded('ElvUI_FCT') or IsAddOnLoaded('NameplateSCT') then
		if E.db.ElvUI_EltreumUI.otherstuff.blizzcombattext then
			if E.Retail then
				if not E.db.ElvUI_EltreumUI.otherstuff.blizzcombatmana then
					SetCVar("enableFloatingCombatText", 0)
				end
				SetCVar("floatingCombatTextCombatDamage", 0)
			elseif E.TBC or E.Classic then
				SetCVar("floatingCombatTextCombatDamage", 0)
			end
		end
	end
	if E.db.ElvUI_EltreumUI.otherstuff.blizzcombatmana then
		SetCVar("floatingCombatTextEnergyGains", 1)
		SetCVar("enableFloatingCombatText", 1) ----this is damage taken without this the floating resource will not work
	end
end

-- Ghost frame for Automatic Weakauras Positioning
local EltreumWAAnchor = CreateFrame("Frame", "EltruismWA", E.UIParent)
local EltruismWAConsumablesAnchor = CreateFrame("Frame", "EltruismConsumables", E.UIParent)
function ElvUI_EltreumUI:Anchors()
	if E.private.unitframe.enable then
		--Anchor for general weakauras, like those that replace actionbars
		EltreumWAAnchor:SetParent("ElvUF_Player")
		EltreumWAAnchor:SetFrameStrata("BACKGROUND")
		--position the anchor around the place where the action bars would be
		EltreumWAAnchor:Point("CENTER", E.UIParent, "CENTER", 0, -380)
		EltreumWAAnchor:Size(250, 70)
		--E:CreateMover(parent, name, textString, overlay, snapoffset, postdrag, types, shouldDisable, configString, ignoreSizeChanged)
		E:CreateMover(EltreumWAAnchor, "MoverEltruismWA", "EltruismWA", nil, nil, nil, "ALL,SOLO")

		--consumable weakauras, usually placed near player unitframe
		EltruismWAConsumablesAnchor:SetParent("ElvUF_Player")
		EltruismWAConsumablesAnchor:SetFrameStrata("BACKGROUND")
		--postion the anchor right below the player unitframe
		EltruismWAConsumablesAnchor:Point("LEFT", _G["ElvUF_Player"], 0, -75)
		EltruismWAConsumablesAnchor:Size(270, 30)
		E:CreateMover(EltruismWAConsumablesAnchor, "MoverEltruismWAConsumables", L["EltruismConsumables"], nil, nil, nil, "ALL,SOLO")
	end

	--mover for UI errors frame
	if E.db.ElvUI_EltreumUI.blizzframes.hideerrorframe then
		_G.UIErrorsFrame:Clear()
		_G.UIErrorsFrame:Hide()
	else
		E:CreateMover(_G.UIErrorsFrame, "MoverUIERRORS", "UI Error Frame", nil, nil, nil, "ALL,SOLO")
		if E.db.ElvUI_EltreumUI.blizzframes.errorframe then
			_G.UIErrorsFrame:SetFont(E.LSM:Fetch("font", E.db.general.font), E.db.general.fontSize+2, "THINOUTLINE")
		end
	end

	E:CreateMover(_G.RaidBossEmoteFrame, "MoverRaidBossEmoteFrame", "Raid/Boss Emote Frame", nil, nil, nil, "ALL,SOLO")
	if E.db.ElvUI_EltreumUI.blizzframes.raidbossframe then
		_G.UIErrorsFrame:SetFont(E.LSM:Fetch("font", E.db.general.font), E.db.general.fontSize+2, "THINOUTLINE")
	end
end

-- UI Scale
function ElvUI_EltreumUI:SetupScale()
	E.global["general"]["UIScale"] = 0.7
	if (not IsAddOnLoaded("ElvUI_SLE")) then
		SetCVar('uiScale', 0.7)
	end
end

function ElvUI_EltreumUI:AutoScale()
	local a = E:PixelBestSize()
	SetCVar('uiScale', a)
	E.global["general"]["UIScale"] = a
	ElvUI_EltreumUI:Print(L["A scale of "..a.." has automatically been set."])
end

--World text Scale
function ElvUI_EltreumUI:WorldTextScale(value)
	E.db.ElvUI_EltreumUI.otherstuff.worldtextscale = value
	SetCVar('WorldTextScale', value)
end

--set some CVars when entering world
function ElvUI_EltreumUI:EnteringWorldCVars()
	--SetCVars at start
	SetCVar('nameplateOtherBottomInset', E.db.ElvUI_EltreumUI.cvars.nameplateOtherBottomInset)
	SetCVar('nameplateOtherTopInset', E.db.ElvUI_EltreumUI.cvars.nameplateOtherTopInset)
	SetCVar('cameraDistanceMaxZoomFactor', E.db.ElvUI_EltreumUI.cvars.cameraDistanceMaxZoomFactor)
	SetCVar('nameplateTargetRadialPosition', E.db.ElvUI_EltreumUI.cvars.nameplateTargetRadialPosition)
	--ElvUI_EltreumUI:Print(L["Custom Nameplate CVars were set."])
	if E.Retail then
		SetCVar('showInGameNavigation', E.db.ElvUI_EltreumUI.cvars.showInGameNavigation)
	elseif E.Classic or E.TBC then
		SetCVar('clampTargetNameplateToScreen', E.db.ElvUI_EltreumUI.cvars.clampTargetNameplateToScreen)
	end
end

function ElvUI_EltreumUI:AlternativeGroupsDPS()
	if ElvDB.profileKeys[E.mynameRealm]:match("Eltreum DPS/Tank") then
		if not E.db.movers then E.db.movers = {} end
		E.db["movers"]["ElvUF_PartyMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,228,-322"
		E.db["movers"]["ElvUF_Raid40Mover"] = "TOPLEFT,ElvUIParent,TOPLEFT,47,-337"
		E.db["movers"]["ElvUF_RaidMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,229,-327"
		E.db["unitframe"]["units"]["raid"]["groupSpacing"] = 7
		E.db["unitframe"]["units"]["raid"]["groupsPerRowCol"] = 2
		E.db["unitframe"]["units"]["raid"]["horizontalSpacing"] = 25
		if E.TBC then
			E.db["unitframe"]["units"]["raid"]["numGroups"] = 5
		else
			E.db["unitframe"]["units"]["raid"]["numGroups"] = 4
		end
		E.db["unitframe"]["units"]["raid"]["verticalSpacing"] = 0
		E.db["unitframe"]["units"]["raid"]["width"] = 120
		E.db["unitframe"]["units"]["raid40"]["groupSpacing"] = 7
		E.db["unitframe"]["units"]["raid40"]["groupsPerRowCol"] = 2
		E.db["unitframe"]["units"]["raid40"]["growthDirection"] = "DOWN_RIGHT"
		E.db["unitframe"]["units"]["raid40"]["height"] = 30
		E.db["unitframe"]["units"]["raid40"]["horizontalSpacing"] = 2
		E.db["unitframe"]["units"]["raid40"]["width"] = 120
		ElvUI_EltreumUI:Print('Alternative Group, Raid and Raid40 layout has been set')
		--ReloadUI()
	else
		ElvUI_EltreumUI:Print(L["The alternative layout was made for the Eltruism DPS/Tank profile, please switch to it to use it"])
	end
end

function ElvUI_EltreumUI:OriginalGroupsDPS()
	if ElvDB.profileKeys[E.mynameRealm]:match("Eltreum DPS/Tank") then
		if not E.db.movers then E.db.movers = {} end
		E.db["movers"]["ElvUF_PartyMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-247"
		E.db["movers"]["ElvUF_Raid40Mover"] = "TOPLEFT,ElvUIParent,TOPLEFT,0,1"
		E.db["movers"]["ElvUF_RaidMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,0,1"
		E.db["unitframe"]["units"]["raid"]["groupSpacing"] = 7
		E.db["unitframe"]["units"]["raid"]["groupsPerRowCol"] = 4
		E.db["unitframe"]["units"]["raid"]["horizontalSpacing"] = 0
		if E.TBC then
			E.db["unitframe"]["units"]["raid"]["numGroups"] = 5
		else
			E.db["unitframe"]["units"]["raid"]["numGroups"] = 4
		end
		E.db["unitframe"]["units"]["raid"]["verticalSpacing"] = 0
		E.db["unitframe"]["units"]["raid"]["width"] = 120
		E.db["unitframe"]["units"]["raid40"]["groupSpacing"] = 7
		E.db["unitframe"]["units"]["raid40"]["groupsPerRowCol"] = 4
		E.db["unitframe"]["units"]["raid40"]["growthDirection"] = "DOWN_RIGHT"
		E.db["unitframe"]["units"]["raid40"]["height"] = 32
		E.db["unitframe"]["units"]["raid40"]["horizontalSpacing"] = 2
		E.db["unitframe"]["units"]["raid40"]["width"] = 120
		ElvUI_EltreumUI:Print('Alternative Group, Raid and Raid40 layout has been set')
		--ReloadUI()
	else
		ElvUI_EltreumUI:Print(L["The original layout was made for the Eltruism DPS/Tank profile, please switch to it to use it"])
	end
end

--Better EventTrace CLEU logging thanks to ;Meorawr.wtf.lua;
function ElvUI_EltreumUI:DevTools()
	if E.db.ElvUI_EltreumUI.dev then
		if not EventTraceFrame then
			UIParentLoadAddOn("Blizzard_DebugTools")
			_G.TableAttributeDisplay:SetWidth(800)
			_G.TableAttributeDisplay.LinesScrollFrame:SetWidth(700)
			_G.TableAttributeDisplay.TitleButton.Text:SetWidth(600)
		end
		if not IsAddOnLoaded("Blizzard_EventTrace") then
			LoadAddOn("Blizzard_EventTrace")
		end
		local function LogEvent(self, event, ...)
			if event == "COMBAT_LOG_EVENT_UNFILTERED" or event == "COMBAT_LOG_EVENT" then
				self:LogEvent_Original(event, CombatLogGetCurrentEventInfo())
			elseif event == "COMBAT_TEXT_UPDATE" then
				self:LogEvent_Original(event, (...), GetCurrentCombatTextEventInfo())
			else
				self:LogEvent_Original(event, ...)
			end
		end

		local function OnEventTraceLoaded()
			EventTrace.LogEvent_Original = EventTrace.LogEvent
			EventTrace.LogEvent = LogEvent
		end

		if EventTrace then
			OnEventTraceLoaded()
		else
			local frame = CreateFrame("Frame")
			frame:RegisterEvent("ADDON_LOADED")
			frame:SetScript("OnEvent", function(self, event, ...)
				if event == "ADDON_LOADED" and (...) == "Blizzard_EventTrace" then
					OnEventTraceLoaded()
					frame:UnregisterAllEvents()
				end
			end)
		end
	end
end

local maxmemory = 3072
local currentmemory
function ElvUI_EltreumUI:ClearMemory()
	if not InCombatLockdown() and not UnitAffectingCombat("player") then
		UpdateAddOnMemoryUsage() --so that it doesnt freeze if spammed
		currentmemory = GetAddOnMemoryUsage ("ElvUI_EltreumUI")
		if E.db.ElvUI_EltreumUI.dev then
			if currentmemory > maxmemory then
				collectgarbage("collect")
				ResetCPUUsage()
				ElvUI_EltreumUI:Print(currentmemory.." memory was cleared")
				--UpdateAddOnCPUUsage("ElvUI_EltreumUI") --only works with profiling
				--/run UpdateAddOnMemoryUsage() print("memory "..GetAddOnMemoryUsage("ElvUI_EltreumUI")); print("cpu "..GetAddOnCPUUsage("ElvUI_EltreumUI"))
				currentmemory = 0
			else
				ElvUI_EltreumUI:Print("Not enough memory usage to clear memory")
			end
		else
			if currentmemory >= maxmemory then
				collectgarbage("collect")
				ResetCPUUsage()
				currentmemory = 0
			end
		end
	end
end

function ElvUI_EltreumUI:DeleteItem()
	if E.db.ElvUI_EltreumUI.otherstuff.delete then
		hooksecurefunc(StaticPopupDialogs["DELETE_GOOD_ITEM"],"OnShow",function(self) --Interface/FrameXML/StaticPopup.lua line 1965/2074
			local itemLink = select(3, GetCursorInfo())
			local lootName = select(1, GetItemInfo(itemLink))
			local lootTexture = select(10, GetItemInfo(itemLink))
			local deletetext = string.gsub(StaticPopup1Text:GetText(), lootName, "|T"..lootTexture..":".. 14 .."|t"..itemLink.."")
			StaticPopup1Text:SetText(deletetext)
			self.editBox:SetText(DELETE_ITEM_CONFIRM_STRING)  --from line 2028
			ElvUI_EltreumUI:Print("DELETE automatically typed")
		end)

		hooksecurefunc(StaticPopupDialogs["DELETE_GOOD_QUEST_ITEM"],"OnShow",function(self) --Interface/FrameXML/StaticPopup.lua line 2125
			local itemLink = select(3, GetCursorInfo())
			local lootName = select(1, GetItemInfo(itemLink))
			local lootTexture = select(10, GetItemInfo(itemLink))
			local deletetext = string.gsub(StaticPopup1Text:GetText(), lootName, "|T"..lootTexture..":".. 14 .."|t"..itemLink.."")
			StaticPopup1Text:SetText(deletetext)
			self.editBox:SetText(DELETE_ITEM_CONFIRM_STRING)  --from line 2028
			ElvUI_EltreumUI:Print("DELETE automatically typed")
		end)
	end
end

--make the video options movable because its annoying when adjusting settings
_G.VideoOptionsFrame:SetMovable(true)
_G.VideoOptionsFrame:EnableMouse(true)
_G.VideoOptionsFrame:RegisterForDrag("LeftButton")
_G.VideoOptionsFrame:SetScript("OnDragStart", _G.VideoOptionsFrame.StartMoving)
_G.VideoOptionsFrame:SetScript("OnDragStop",_G.VideoOptionsFrame.StopMovingOrSizing)
_G.VideoOptionsFrame:SetClampedToScreen(true)
