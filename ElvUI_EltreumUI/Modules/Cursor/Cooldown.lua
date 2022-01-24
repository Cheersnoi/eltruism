--CursorCooldown is a fork of CooldownToGo by mitchnull, which is licensed under Public Domain. My thanks to mitchnull for making it!
local ElvUI_EltreumUI, E, L, V, P, G = unpack(select(2, ...))
local _G = _G

--onupdate things
local NormalUpdateDelay = 1.0/10 -- update frequency == 1/NormalUpdateDelay
local FadingUpdateDelay = 1.0/25 -- update frequency while fading == 1/FadingUpdateDelay, must be <= NormalUpdateDelay
local lastUpdate = 0 -- time since last real update
local updateDelay = NormalUpdateDelay

local fadeStamp -- the timestamp when we should start fading the display
local endStamp -- the timestamp when the cooldown will be over
local finishStamp -- the timestamp when the we are finished with this cooldown
local currGetCooldown
local currArg
local currStart
local currDuration
local lastTexture
local lastGetCooldown
local lastArg
local needUpdate = false
local isActive = false
local isAlmostReady = false
local isReady = false
local isHidden = false

--gcd things
local GCD = 1.5
if E.myclass == "ROGUE" or E.myclass == "MONK" or E.myclass == "DRUID" then
	GCD = 1
end

local db = {
	holdTime = 1.0,
	fadeTime = 1.0,
	readyTime = 4.0,
	gracePeriod = 0.5, --time after cd start that pressing a skill will show the cd left
}

local function itemIdFromLink(link)
	if not link then return nil end
	local id = link:match("item:(%d+)")
	return tonumber(id)
end

local EltruismCooldownFrame = CreateFrame("MessageFrame", "EltruismCooldown", UIParent)
local EltruismCooldownText = EltruismCooldownFrame:CreateFontString("EltruismCoooldownText", "OVERLAY", "GameFontNormal")
local EltruismCooldownIcon = EltruismCooldownFrame:CreateTexture("EltruismCooldownIcon", "OVERLAY")
local EltruismCooldownMask = EltruismCooldownFrame:CreateMaskTexture()
EltruismCooldownMask:SetTexture([[Interface\CHARACTERFRAME\TempPortraitAlphaMask]], "CLAMPTOBLACKADDITIVE", "CLAMPTOBLACKADDITIVE")
EltruismCooldownMask:SetAllPoints(EltruismCooldownFrame)
EltruismCooldownFrame:Hide()

function ElvUI_EltreumUI:CooldownInitialize()
	local cooldownsize
	if not E.db.ElvUI_EltreumUI then
		cooldownsize = 28
	elseif E.db.ElvUI_EltreumUI then
		if not E.db.ElvUI_EltreumUI.cursorcursor then
			cooldownsize = 28
		elseif E.db.ElvUI_EltreumUI.cursorcursor then
			if E.db.ElvUI_EltreumUI.cursorcursor.radius then
				cooldownsize = ( (E.db.ElvUI_EltreumUI.cursorcursor.radius * 2 ) - 2 )
			else
				cooldownsize = 28
			end
		end
	end
	EltruismCooldownFrame:SetWidth(cooldownsize)
	EltruismCooldownFrame:SetHeight(cooldownsize)
	EltruismCooldownFrame:SetJustifyH("CENTER")
	local textsize = ( (cooldownsize / 2) + 1)
	EltruismCooldownText:SetFont(E.media.normFont, textsize, "OUTLINE")
	EltruismCooldownText:SetTextColor(1, 1, 1)
	EltruismCooldownText:SetPoint("CENTER")
	EltruismCooldownIcon:SetTexture(nil)
	EltruismCooldownIcon:AddMaskTexture(EltruismCooldownMask)
	EltruismCooldownIcon:ClearAllPoints()
	EltruismCooldownIcon:SetPoint("CENTER")
	EltruismCooldownIcon:SetHeight(cooldownsize +2)
	EltruismCooldownIcon:SetWidth(cooldownsize +2)
end

function ElvUI_EltreumUI:CooldownEnable()
	--print("CooldownEnable spam "..math.random(1,99))
	if ElvUI_EltreumUI:IsHooked("UseAction", "checkActionCooldown") then
		return
	else
		ElvUI_EltreumUI:SecureHook("UseAction", "checkActionCooldown") --this enables tracking actions that are not macros
	end

	if ElvUI_EltreumUI:IsHooked("UseContainerItem", "checkContainerItemCooldown") then
		return
	else
		ElvUI_EltreumUI:SecureHook("UseContainerItem", "checkContainerItemCooldown")
	end

	if ElvUI_EltreumUI:IsHooked("UseInventoryItem", "checkInventoryItemCooldown") then
		return
	else
		ElvUI_EltreumUI:SecureHook("UseInventoryItem", "checkInventoryItemCooldown")
	end

	if ElvUI_EltreumUI:IsHooked("UseItemByName", "checkItemCooldown") then
		return
	else
		ElvUI_EltreumUI:SecureHook("UseItemByName", "checkItemCooldown")
	end

	if ElvUI_EltreumUI:IsHooked("CastSpellByName", "checkSpellCooldown") then
		return
	else
		ElvUI_EltreumUI:SecureHook("CastSpellByName", "checkSpellCooldown") -- only needed for pet spells
	end

	if ElvUI_EltreumUI:IsHooked("CastPetAction", "checkPetActionCooldown") then
		return
	else
		ElvUI_EltreumUI:SecureHook("CastPetAction", "checkPetActionCooldown")
	end

	--self:SecureHook("UseAction", "checkActionCooldown") --this enables tracking actions that are not macros
	--self:SecureHook("UseContainerItem", "checkContainerItemCooldown")
	--self:SecureHook("UseInventoryItem", "checkInventoryItemCooldown")
	--self:SecureHook("UseItemByName", "checkItemCooldown")
	--self:SecureHook("CastSpellByName", "checkSpellCooldown") -- only needed for pet spells
	--self:SecureHook("CastPetAction", "checkPetActionCooldown")
	ElvUI_EltreumUI:RegisterEvent("SPELL_UPDATE_COOLDOWN", "updateCooldown")
	ElvUI_EltreumUI:RegisterEvent("ACTIONBAR_UPDATE_COOLDOWN", "updateCooldown")
	ElvUI_EltreumUI:RegisterEvent("BAG_UPDATE_COOLDOWN", "updateCooldown")
	ElvUI_EltreumUI:RegisterEvent("PET_BAR_UPDATE_COOLDOWN", "updateCooldown")
	--self:RegisterEvent("UNIT_SPELLCAST_FAILED") --this triggers every single time a spell fails like when out of resources or on cd
end

function ElvUI_EltreumUI:CooldownUpdate()
	--print("CooldownUPdate spam "..math.random(1,99))
	if not isActive then
		return
	end
	if needUpdate then
		needUpdate = false
		local start, duration = currGetCooldown(currArg)
		if currStart ~= start or currDuration ~= duration then
			ElvUI_EltreumUI:updateStamps(start, duration, false)
		end
	end
	local now = GetTime()
	if now > finishStamp then
		isActive = false
		EltruismCooldownText:SetText(nil)
		EltruismCooldownIcon:SetTexture(nil)
		ElvUI_EltreumUI:updateCooldown() -- check lastGetCooldown, lastArg
		return
	end
	if now >= endStamp then
		if not isReady then
			isReady = true
			EltruismCooldownText:SetText("")
			ElvUI_EltreumUI:updateStamps(currStart, currDuration, true)
		end
	else
		local cd = endStamp - now
		if cd <= db.readyTime and not isAlmostReady then
			isAlmostReady = true
			ElvUI_EltreumUI:updateStamps(currStart, currDuration, true)
		end
		if cd > 60 then
			EltruismCooldownText:SetFormattedText("%01.f".."m", cd / 60, cd % 60)
			EltruismCooldownText:SetTextColor(1, 1, 1)
		elseif cd > 1 and cd < 60 then
			EltruismCooldownText:SetFormattedText("%01.f", math.floor(cd))
			EltruismCooldownText:SetTextColor(1, 1, 1)
		else
			EltruismCooldownText:SetFormattedText("%.1f", cd)
			EltruismCooldownText:SetTextColor(1, 0, 0)
		end
	end
	if isHidden then
		return
	end
	if now > fadeStamp then
		local alpha = 1 - ((now - fadeStamp) / db.fadeTime)
		if alpha <= 0 then
			isHidden = true
			EltruismCooldownFrame:SetAlpha(0)
			updateDelay = NormalUpdateDelay
		else
			EltruismCooldownFrame:SetAlpha(alpha)
			updateDelay = FadingUpdateDelay
		end
	end
end

function ElvUI_EltreumUI:updateStamps(start, duration, show, startHidden)
	----print("updateStamps spam "..math.random(1,99))
	if not start then
		return
	end
	currStart = start
	currDuration = duration
	local now = GetTime()
	endStamp = start + duration
	if endStamp < now then
		endStamp = now
	end
	if now + db.holdTime >= endStamp then
		fadeStamp = endStamp
	else
		fadeStamp = now + db.holdTime
	end
	finishStamp = endStamp + db.fadeTime
	lastUpdate = NormalUpdateDelay -- to force update in next frame
	isAlmostReady = false
	isHidden = false
	if show then
		updateDelay = NormalUpdateDelay
		if E.db.ElvUI_EltreumUI.cursor.cooldown then
			EltruismCooldownFrame:Show()
		end
		if startHidden then
			isHidden = true
			EltruismCooldownFrame:SetAlpha(0)
			--unregister onupdate when hidden
			EltruismCooldownFrame:SetScript("OnUpdate", nil)
		else
			EltruismCooldownFrame:SetAlpha(1)

			--throttling here using elapsed makes the frame not sync up, idk if i can make it sync with a throttle
			-- so instead we make it not update at all when hidden
			EltruismCooldownFrame:SetScript("OnUpdate", function(frame, elapsed) --if frame is removed, then pet cooldowns can have issues
				-----print("cooldown spam "..math.random(1,99))
				local x, y = GetCursorPosition()
				local scaleDivisor = UIParent:GetEffectiveScale()
				EltruismCooldownFrame:ClearAllPoints()
				EltruismCooldownFrame:SetPoint( "CENTER", UIParent, "BOTTOMLEFT", x / scaleDivisor , y / scaleDivisor )
				lastUpdate = lastUpdate + elapsed
				if lastUpdate < updateDelay then return end
				lastUpdate = 0
				ElvUI_EltreumUI:CooldownUpdate(elapsed)
				--[[if isHidden == true then
					EltruismCooldownFrame:SetScript("OnUpdate", nil)
					--print("stopped updating")
				end]]
			end)

		end
	end
end

function ElvUI_EltreumUI:showCooldown(texture, getCooldownFunc, arg, hasCooldown)
	--print("showCooldown spam "..math.random(1,99))
	local start, duration, enabled = getCooldownFunc(arg)
	if not start or enabled ~= 1 or duration <= GCD then
		if hasCooldown and (isReady or not isActive) then
			lastTexture, lastGetCooldown, lastArg = texture, getCooldownFunc, arg
		end
		return
	end
	if GetTime() - start < db.gracePeriod then
		return
	end
	currGetCooldown, currArg = getCooldownFunc, arg
	isActive = true
	isReady = false
	isAlmostReady = false
	EltruismCooldownIcon:SetTexture(texture)
	EltruismCooldownIcon:AddMaskTexture(EltruismCooldownMask)
	ElvUI_EltreumUI:updateStamps(start, duration, true)
end

function ElvUI_EltreumUI:checkActionCooldown(slot)
	--print("checkActionCooldown spam "..math.random(1,99))
	local type, id, _ = GetActionInfo(slot)
	if type == 'spell' then
		ElvUI_EltreumUI:checkSpellCooldown(id)
	elseif type == 'item' then
		ElvUI_EltreumUI:checkItemCooldown(id)
	end
end

local function findPetActionIndexForSpell(spell)
	--print("findPetActionIndexForSpell spam "..math.random(1,99))
	if not spell then return end
	for i = 1, NUM_PET_ACTION_SLOTS do
		local name, _, _, isToken = GetPetActionInfo(i)
		if isToken then name = _G[name] end
		if name == spell then
			return i
		end
	end
end

function ElvUI_EltreumUI:checkSpellCooldown(spell)
	--print("checkSpellCooldown spam "..math.random(1,99))
	if not spell then return end
	local name, _, texture = GetSpellInfo(spell)
	if not name then
		 return ElvUI_EltreumUI:checkPetActionCooldown(findPetActionIndexForSpell(spell))
	end
	local baseCooldown = GetSpellBaseCooldown(spell)
	ElvUI_EltreumUI:showCooldown(texture, GetSpellCooldown, spell, (baseCooldown and baseCooldown > 0))
end

function ElvUI_EltreumUI:checkInventoryItemCooldown(invSlot)
	--print("checkInventoryItemCooldown spam "..math.random(1,99))
	local itemLink = GetInventoryItemLink("player", invSlot)
	ElvUI_EltreumUI:checkItemCooldown(itemLink)
end

function ElvUI_EltreumUI:checkContainerItemCooldown(bagId, bagSlot)
	--print("checkContainerItemCooldown spam "..math.random(1,99))
	local itemLink = GetContainerItemLink(bagId, bagSlot)
	ElvUI_EltreumUI:checkItemCooldown(itemLink)
end

function ElvUI_EltreumUI:checkItemCooldown(item)
	--print("checkItemCooldown spam "..math.random(1,99))
	if not item then return end
	local _, itemLink, _, _, _, _, _, _, _, texture = GetItemInfo(item)
	local itemId = itemIdFromLink(itemLink)
	if not itemId then return end
	ElvUI_EltreumUI:showCooldown(texture, GetItemCooldown, itemId)
end

function ElvUI_EltreumUI:checkPetActionCooldown(index)
	--print("checkPetActionCooldown spam "..math.random(1,99))
	if not index then return end
	local _, texture, _, _, _, _, spellId, _, _ = GetPetActionInfo(index) --shadowlands
	--[[if ElvUI_EltreumUI.Classic or ElvUI_EltreumUI.TBC then
		local _, _, texture, _, _, _, _, spellId = GetPetActionInfo(index) --old
	elseif ElvUI_EltreumUI.Retail then
		local _, texture, _, _, _, _, spellId, _, _ = GetPetActionInfo(index) --shadowlands
	end]]
	if spellId then
		ElvUI_EltreumUI:checkSpellCooldown(spellId)
	else
		ElvUI_EltreumUI:showCooldown(texture, GetPetActionCooldown, index)
	end
end

--[[
function ElvUI_EltreumUI:UNIT_SPELLCAST_FAILED(unit,id) -- im thinking this might not be needed
	if unit and unit ~= 'player' then
		return
	elseif unit then
		if unit == 'player' or unit == 'pet' then
			self:checkSpellCooldown(id)
		end
	end
end
]]--

function ElvUI_EltreumUI:updateCooldown() --dont think i need event here
	--print("updateCooldown spam "..math.random(1,99))
	if not isActive then
		if lastGetCooldown then
			local start, duration, enabled = lastGetCooldown(lastArg)
			if not start or enabled ~= 1 or duration <= GCD then
				return
			end
			currGetCooldown, currArg = lastGetCooldown, lastArg
			lastGetCooldown = nil
			isActive = true
			isReady = false
			isAlmostReady = false
			EltruismCooldownIcon:SetTexture(lastTexture)
			ElvUI_EltreumUI:updateStamps(start, duration, true, true)
			EltruismCooldownFrame:SetAlpha(0)
		end
		return
	end
	if isReady then
		return
	end
	needUpdate = true
end
