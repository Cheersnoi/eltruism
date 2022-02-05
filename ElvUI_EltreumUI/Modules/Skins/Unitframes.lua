local ElvUI_EltreumUI, E, L, V, P, G = unpack(select(2, ...))
local UF = E:GetModule('UnitFrames')
local LSM = LibStub("LibSharedMedia-3.0")

--elvui spark hook
local function EltruismSpark()
	--print("spark spam")
	if E.db.ElvUI_EltreumUI.sparkcustomcolor.enable then
		local castbar = _G["ElvUF_Player_CastBar"]
		castbar.Spark_ = castbar:CreateTexture(nil, 'OVERLAY')
		castbar.Spark_:SetTexture(E.media.blankTex)
		--local sparkheight = castbar.Spark_:GetHeight() --check if its needed
		castbar.Spark_:SetVertexColor(E.db.ElvUI_EltreumUI.sparkcustomcolor.r, E.db.ElvUI_EltreumUI.sparkcustomcolor.g, E.db.ElvUI_EltreumUI.sparkcustomcolor.b, 1)
		castbar.Spark_:Size(E.db.ElvUI_EltreumUI.sparkcustomcolor.width)
	end
end
hooksecurefunc(UF, 'Construct_Castbar', EltruismSpark)

--color unitframes target texture during light mode
local unitframeclass = {
	['WARRIOR'] = "Eltreum-Class-Warrior",
	['PALADIN'] = "Eltreum-Class-Paladin",
	['HUNTER'] = "Eltreum-Class-Hunter",
	['ROGUE'] = "Eltreum-Class-Rogue",
	['PRIEST'] = "Eltreum-Class-Priest",
	['DEATHKNIGHT'] = "Eltreum-Class-DeathKnight",
	['SHAMAN'] = "Eltreum-Class-Shaman",
	['MAGE'] = "Eltreum-Class-Mage",
	['WARLOCK'] = "Eltreum-Class-Warlock",
	['MONK'] = "Eltreum-Class-Monk",
	['DRUID'] = "Eltreum-Class-Druid",
	['DEMONHUNTER'] = "Eltreum-Class-DemonHunter",
}

--bar colors for party/raid/raid40
--local disconnected = {r = "0.83921384811401", g = "0.74901795387268", b = "0.65097898244858"}
local paladin = {r = "0.95686066150665", g = "0.54901838302612", b = "0.72941017150879"}
local warrior = {r = "0.77646887302399", g = "0.60784178972244", b = "0.4274500310421"}
local shaman = {r = "0", g = "0.4392147064209", b = "0.86666476726532",}
local druid = {r = "0.99999779462814", g = "0.48627343773842", b = "0.039215601980686"}
local deathknight = {r = "0.76862573623657", g = "0.11764679849148", b = "0.2274504750967"}
local demonhunter = {r = "0.63921427726746", g = "0.1882348805666", b = "0.78823357820511"}
local monk = {r = "0", g = "0.99999779462814", b = "0.59607714414597"}
local rogue = {r = "0.99999779462814", g = "0.95686066150665", b = "0.40784224867821"}
local priest = {r = "0.99999779462814", g = "0.99999779462814", b = "0.99999779462814"}
local mage = {r = "0.24705828726292", g = "0.78039044141769", b = "0.92156660556793"}
local hunter = {r = "0.66666519641876", g = "0.82744914293289", b = "0.44705784320831"}
local warlock = {r = "0.52941060066223", g = "0.53333216905594", b = "0.93333131074905"}

--from Benik
function ElvUI_EltreumUI:ChangeUnitTexture()
	--print("change unit texture spam")
	if E.db.ElvUI_EltreumUI.lightmode and E.db.ElvUI_EltreumUI.modetexture then

		--target
		local targetbar = LSM:Fetch("statusbar", "Eltreum-Blank")
		local _, targetclass = UnitClass("target")
		local reactiontarget = UnitReaction("player", "target")
		if UnitExists("target") then
			if UnitIsPlayer("target") then
				if targetclass then
					targetbar = LSM:Fetch("statusbar", unitframeclass[targetclass])
				end
			elseif not UnitIsPlayer("target") then
				if reactiontarget >= 5 then
					targetbar = LSM:Fetch("statusbar", "Eltreum-Class-Hunter")
				elseif reactiontarget == 4 then
					targetbar = LSM:Fetch("statusbar", "Eltreum-Class-Rogue")
				elseif reactiontarget == 3 then
					targetbar = LSM:Fetch("statusbar", "Eltreum-Class-Druid")
				elseif reactiontarget == 2 or reactiontarget == 1 then
					targetbar = LSM:Fetch("statusbar", "Eltreum-Class-DeathKnight")
				end
			end
		end
		if UF.units.target then
			local unitframe = _G["ElvUF_Target"]
			if unitframe and unitframe.Health then
				unitframe.Health:SetStatusBarTexture(targetbar)
			end
		end

		--target of target
		local _, targettargetclass = UnitClass("targettarget")
		local reactiontargettarget = UnitReaction("player", "targettarget")
		local targettargetbar = LSM:Fetch("statusbar", "Eltreum-Blank")
		if UnitExists("targettarget") then
			if UnitIsPlayer("targettarget") then
				if targettargetclass then
					targettargetbar = LSM:Fetch("statusbar", unitframeclass[targettargetclass])
				end
			elseif not UnitIsPlayer("targettarget") then
				if reactiontargettarget >= 5 then
					targettargetbar = LSM:Fetch("statusbar", "Eltreum-Class-Hunter")
				elseif reactiontargettarget == 4 then
					targettargetbar = LSM:Fetch("statusbar", "Eltreum-Class-Rogue")
				elseif reactiontargettarget == 3 then
					targettargetbar = LSM:Fetch("statusbar", "Eltreum-Class-Druid")
				elseif reactiontargettarget == 2 or reactiontargettarget == 1 then
					targettargetbar = LSM:Fetch("statusbar", "Eltreum-Class-DeathKnight")
				end
			end
		end
		if UF.units.targettarget then
			local unitframe = _G["ElvUF_TargetTarget"]
			if unitframe and unitframe.Health then
				unitframe.Health:SetStatusBarTexture(targettargetbar)
			end
		end

		--focus
		local _, focusclass = UnitClass("focus")
		local focusbar = LSM:Fetch("statusbar", "Eltreum-Blank")
		if focusclass and UnitIsPlayer("focus") then
			focusbar = LSM:Fetch("statusbar", unitframeclass[focusclass])
		end
		if UF.units.focus then
			local focusframe = _G["ElvUF_Focus"]
			if focusframe and focusframe.Health then
				focusframe.Health:SetStatusBarTexture(focusbar)
			end
		end

		--pet
		local petbar = LSM:Fetch("statusbar", "Eltreum-Class-Hunter")
		if UF.units.pet then
			local petframe = _G["ElvUF_Pet"]
			if petframe and petframe.Health then
				petframe.Health:SetStatusBarTexture(petbar)
			end
		end

		--raid & party its UF.groupunits instead
	end
end
hooksecurefunc(UF, "Construct_HealthBar", ElvUI_EltreumUI.ChangeUnitTexture)
hooksecurefunc(UF, "Style", ElvUI_EltreumUI.ChangeUnitTexture)  --if not hooking into this then when the target of target changes it doesnt update
--hooksecurefunc(UF, "Update_StatusBar", ElvUI_EltreumUI.ChangeUnitTexture) --needed for druid form swap for some reason + fixes on player entering world... except it also causes memory to go WAY up

--from Benik
function ElvUI_EltreumUI:ChangePlayerTexture()
	--print("change unit texture spam")
	if E.db.ElvUI_EltreumUI.lightmode and E.db.ElvUI_EltreumUI.modetexture then
		--player
		local playertexture = LSM:Fetch("statusbar", unitframeclass[E.myclass])
		if UF.units.player then
			local unitframe = _G["ElvUF_Player"]
			if unitframe and unitframe.Health then
				unitframe.Health:SetStatusBarTexture(playertexture)
			end
		end
	end
end
hooksecurefunc(UF, "Construct_HealthBar", ElvUI_EltreumUI.ChangePlayerTexture)
--hooksecurefunc(UF, "Update_StatusBar", ElvUI_EltreumUI.ChangePlayerTexture) --needed for druid form swap for some reason + fixes on player entering world... except it also causes memory to go WAY up

function ElvUI_EltreumUI:ChangeRaidTexture()
	if E.db.ElvUI_EltreumUI.lightmode and E.db.ElvUI_EltreumUI.modetexture then
		local header = _G['ElvUF_Raid']
		for i = 1, header:GetNumChildren() do
			local group = select(i, header:GetChildren())
			for j = 1, group:GetNumChildren() do
				local unitbutton = select(j, group:GetChildren())
				if unitbutton and unitbutton.Health then
					local r1,g1,b1 = unitbutton.Health:GetStatusBarColor()
					local r = tostring(r1)
					local g = tostring(g1)
					local b = tostring(b1)
					if (r == paladin.r) and (g == paladin.g) and (b == paladin.b) then
						unitbutton.Health:SetStatusBarTexture(LSM:Fetch("statusbar", "Eltreum-Class-Paladin"))
					elseif (r == warrior.r) and (g == warrior.g) and (b == warrior.b) then
						unitbutton.Health:SetStatusBarTexture(LSM:Fetch("statusbar", "Eltreum-Class-Warrior"))
					elseif (r == shaman.r) and (g == shaman.g) and (b == shaman.b) then
						unitbutton.Health:SetStatusBarTexture(LSM:Fetch("statusbar", "Eltreum-Class-Shaman"))
					elseif (r == druid.r) and (g == druid.g) and (b == druid.b) then
						unitbutton.Health:SetStatusBarTexture(LSM:Fetch("statusbar", "Eltreum-Class-Druid"))
					elseif (r == deathknight.r) and (g == deathknight.g) and (b == deathknight.b) then
						unitbutton.Health:SetStatusBarTexture(LSM:Fetch("statusbar", "Eltreum-Class-DeathKnight"))
					elseif (r == demonhunter.r) and (g == demonhunter.g) and (b == demonhunter.b) then
						unitbutton.Health:SetStatusBarTexture(LSM:Fetch("statusbar", "Eltreum-Class-DemonHunter"))
					elseif (r == monk.r) and (g == monk.g) and (b == monk.b) then
						unitbutton.Health:SetStatusBarTexture(LSM:Fetch("statusbar", "Eltreum-Class-Monk"))
					elseif (r == rogue.r) and (g == rogue.g) and (b == rogue.b) then
						unitbutton.Health:SetStatusBarTexture(LSM:Fetch("statusbar", "Eltreum-Class-Rogue"))
					elseif (r == priest.r) and (g == priest.g) and (b == priest.b) then
						unitbutton.Health:SetStatusBarTexture(LSM:Fetch("statusbar", "Eltreum-Class-Priest"))
					elseif (r == mage.r) and (g == mage.g) and (b == mage.b) then
						unitbutton.Health:SetStatusBarTexture(LSM:Fetch("statusbar", "Eltreum-Class-Mage"))
					elseif (r == hunter.r) and (g == hunter.g) and (b == hunter.b) then
						unitbutton.Health:SetStatusBarTexture(LSM:Fetch("statusbar", "Eltreum-Class-Hunter"))
					elseif (r == warlock.r) and (g == warlock.g) and (b == warlock.b) then
						unitbutton.Health:SetStatusBarTexture(LSM:Fetch("statusbar", "Eltreum-Class-Warlock"))
					else
						unitbutton.Health:SetStatusBarTexture(LSM:Fetch("statusbar", "Eltreum-Blank"))
					end
				end
			end
		end
	end
end
hooksecurefunc(UF, 'Update_RaidFrames', ElvUI_EltreumUI.ChangeRaidTexture)

function ElvUI_EltreumUI:ChangeRaid40Texture()
	if E.db.ElvUI_EltreumUI.lightmode and E.db.ElvUI_EltreumUI.modetexture then
		local header = _G['ElvUF_Raid40']
		for i = 1, header:GetNumChildren() do
			local group = select(i, header:GetChildren())
			for j = 1, group:GetNumChildren() do
				local unitbutton = select(j, group:GetChildren())
				if unitbutton and unitbutton.Health then
					local r1,g1,b1 = unitbutton.Health:GetStatusBarColor()
					local r = tostring(r1)
					local g = tostring(g1)
					local b = tostring(b1)
					if (r == paladin.r) and (g == paladin.g) and (b == paladin.b) then
						unitbutton.Health:SetStatusBarTexture(LSM:Fetch("statusbar", "Eltreum-Class-Paladin"))
					elseif (r == warrior.r) and (g == warrior.g) and (b == warrior.b) then
						unitbutton.Health:SetStatusBarTexture(LSM:Fetch("statusbar", "Eltreum-Class-Warrior"))
					elseif (r == shaman.r) and (g == shaman.g) and (b == shaman.b) then
						unitbutton.Health:SetStatusBarTexture(LSM:Fetch("statusbar", "Eltreum-Class-Shaman"))
					elseif (r == druid.r) and (g == druid.g) and (b == druid.b) then
						unitbutton.Health:SetStatusBarTexture(LSM:Fetch("statusbar", "Eltreum-Class-Druid"))
					elseif (r == deathknight.r) and (g == deathknight.g) and (b == deathknight.b) then
						unitbutton.Health:SetStatusBarTexture(LSM:Fetch("statusbar", "Eltreum-Class-DeathKnight"))
					elseif (r == demonhunter.r) and (g == demonhunter.g) and (b == demonhunter.b) then
						unitbutton.Health:SetStatusBarTexture(LSM:Fetch("statusbar", "Eltreum-Class-DemonHunter"))
					elseif (r == monk.r) and (g == monk.g) and (b == monk.b) then
						unitbutton.Health:SetStatusBarTexture(LSM:Fetch("statusbar", "Eltreum-Class-Monk"))
					elseif (r == rogue.r) and (g == rogue.g) and (b == rogue.b) then
						unitbutton.Health:SetStatusBarTexture(LSM:Fetch("statusbar", "Eltreum-Class-Rogue"))
					elseif (r == priest.r) and (g == priest.g) and (b == priest.b) then
						unitbutton.Health:SetStatusBarTexture(LSM:Fetch("statusbar", "Eltreum-Class-Priest"))
					elseif (r == mage.r) and (g == mage.g) and (b == mage.b) then
						unitbutton.Health:SetStatusBarTexture(LSM:Fetch("statusbar", "Eltreum-Class-Mage"))
					elseif (r == hunter.r) and (g == hunter.g) and (b == hunter.b) then
						unitbutton.Health:SetStatusBarTexture(LSM:Fetch("statusbar", "Eltreum-Class-Hunter"))
					elseif (r == warlock.r) and (g == warlock.g) and (b == warlock.b) then
						unitbutton.Health:SetStatusBarTexture(LSM:Fetch("statusbar", "Eltreum-Class-Warlock"))
					else
						unitbutton.Health:SetStatusBarTexture(LSM:Fetch("statusbar", "Eltreum-Blank"))
					end
				end
			end
		end
	end
end
hooksecurefunc(UF, 'Update_Raid40Frames', ElvUI_EltreumUI.ChangeRaid40Texture)

function ElvUI_EltreumUI:ChangePartyTexture()
	if E.db.ElvUI_EltreumUI.lightmode and E.db.ElvUI_EltreumUI.modetexture then
		local header = _G['ElvUF_Party']
		for i = 1, header:GetNumChildren() do
			local group = select(i, header:GetChildren())
			for j = 1, group:GetNumChildren() do
				local unitbutton = select(j, group:GetChildren())
				if unitbutton and unitbutton.Health then
					local r1,g1,b1 = unitbutton.Health:GetStatusBarColor()
					local r = tostring(r1)
					local g = tostring(g1)
					local b = tostring(b1)
					if (r == paladin.r) and (g == paladin.g) and (b == paladin.b) then
						unitbutton.Health:SetStatusBarTexture(LSM:Fetch("statusbar", "Eltreum-Class-Paladin"))
					elseif (r == warrior.r) and (g == warrior.g) and (b == warrior.b) then
						unitbutton.Health:SetStatusBarTexture(LSM:Fetch("statusbar", "Eltreum-Class-Warrior"))
					elseif (r == shaman.r) and (g == shaman.g) and (b == shaman.b) then
						unitbutton.Health:SetStatusBarTexture(LSM:Fetch("statusbar", "Eltreum-Class-Shaman"))
					elseif (r == druid.r) and (g == druid.g) and (b == druid.b) then
						unitbutton.Health:SetStatusBarTexture(LSM:Fetch("statusbar", "Eltreum-Class-Druid"))
					elseif (r == deathknight.r) and (g == deathknight.g) and (b == deathknight.b) then
						unitbutton.Health:SetStatusBarTexture(LSM:Fetch("statusbar", "Eltreum-Class-DeathKnight"))
					elseif (r == demonhunter.r) and (g == demonhunter.g) and (b == demonhunter.b) then
						unitbutton.Health:SetStatusBarTexture(LSM:Fetch("statusbar", "Eltreum-Class-DemonHunter"))
					elseif (r == monk.r) and (g == monk.g) and (b == monk.b) then
						unitbutton.Health:SetStatusBarTexture(LSM:Fetch("statusbar", "Eltreum-Class-Monk"))
					elseif (r == rogue.r) and (g == rogue.g) and (b == rogue.b) then
						unitbutton.Health:SetStatusBarTexture(LSM:Fetch("statusbar", "Eltreum-Class-Rogue"))
					elseif (r == priest.r) and (g == priest.g) and (b == priest.b) then
						unitbutton.Health:SetStatusBarTexture(LSM:Fetch("statusbar", "Eltreum-Class-Priest"))
					elseif (r == mage.r) and (g == mage.g) and (b == mage.b) then
						unitbutton.Health:SetStatusBarTexture(LSM:Fetch("statusbar", "Eltreum-Class-Mage"))
					elseif (r == hunter.r) and (g == hunter.g) and (b == hunter.b) then
						unitbutton.Health:SetStatusBarTexture(LSM:Fetch("statusbar", "Eltreum-Class-Hunter"))
					elseif (r == warlock.r) and (g == warlock.g) and (b == warlock.b) then
						unitbutton.Health:SetStatusBarTexture(LSM:Fetch("statusbar", "Eltreum-Class-Warlock"))
					else
						unitbutton.Health:SetStatusBarTexture(LSM:Fetch("statusbar", "Eltreum-Blank"))
					end
				end
			end
		end
	end
end
hooksecurefunc(UF, 'Update_PartyFrames', ElvUI_EltreumUI.ChangePartyTexture)
