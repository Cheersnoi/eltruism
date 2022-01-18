local ElvUI_EltreumUI, E, L, V, P, G = unpack(select(2, ...))
local _G = _G
local IsAddOnLoaded = _G.IsAddOnLoaded
local GetAddOnMetadata = _G.GetAddOnMetadata
local sleversioncheck = GetAddOnMetadata('ElvUI_SLE', 'Version')
local PA = _G.ProjectAzilroka

function ElvUI_EltreumUI:SetupFontsRoboto(addon)
	if not E.db.movers then E.db.movers = {} end
		--nameplates
		E.db["nameplates"]["cooldown"]["fonts"]["font"] = "Roboto"
		E.db["nameplates"]["units"]["ENEMY_NPC"]["buffs"]["countFont"] = "Roboto"
		E.db["nameplates"]["units"]["ENEMY_NPC"]["castbar"]["font"] = "Roboto"
		E.db["nameplates"]["units"]["ENEMY_NPC"]["debuffs"]["countFont"] = "Roboto"
		E.db["nameplates"]["units"]["ENEMY_NPC"]["health"]["text"]["font"] = "Roboto"
		E.db["nameplates"]["units"]["ENEMY_NPC"]["level"]["font"] = "Roboto"
		E.db["nameplates"]["units"]["ENEMY_NPC"]["name"]["font"] = "Roboto"
		E.db["nameplates"]["units"]["ENEMY_NPC"]["power"]["text"]["font"] = "Roboto"
		if ElvUI_EltreumUI.Retail then
			E.db["nameplates"]["units"]["ENEMY_NPC"]["questIcon"]["font"] = "Roboto"
		end
		E.db["nameplates"]["units"]["ENEMY_NPC"]["title"]["font"] = "Roboto"
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["buffs"]["countFont"] = "Roboto"
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["castbar"]["font"] = "Roboto"
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["debuffs"]["countFont"] = "Roboto"
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["health"]["text"]["font"] = "Roboto"
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["level"]["font"] = "Roboto"
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["name"]["font"] = "Roboto"
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["power"]["text"]["font"] = "Roboto"
		E.db["nameplates"]["units"]["ENEMY_PLAYER"]["title"]["font"] = "Roboto"
		E.db["nameplates"]["units"]["FRIENDLY_NPC"]["buffs"]["countFont"] = "Roboto"
		E.db["nameplates"]["units"]["FRIENDLY_NPC"]["castbar"]["font"] = "Roboto"
		E.db["nameplates"]["units"]["FRIENDLY_NPC"]["debuffs"]["countFont"] = "Roboto"
		E.db["nameplates"]["units"]["FRIENDLY_NPC"]["health"]["text"]["font"] = "Roboto"
		E.db["nameplates"]["units"]["FRIENDLY_NPC"]["level"]["font"] = "Roboto"
		E.db["nameplates"]["units"]["FRIENDLY_NPC"]["name"]["font"] = "Roboto"
		E.db["nameplates"]["units"]["FRIENDLY_NPC"]["power"]["text"]["font"] = "Roboto"
		if ElvUI_EltreumUI.Retail then
			E.db["nameplates"]["units"]["FRIENDLY_NPC"]["questIcon"]["font"] = "Roboto"
		end
		E.db["nameplates"]["units"]["FRIENDLY_NPC"]["title"]["font"] = "Roboto"
		E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["buffs"]["countFont"] = "Roboto"
		E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["castbar"]["font"] = "Roboto"
		E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["debuffs"]["countFont"] = "Roboto"
		E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["health"]["text"]["font"] = "Roboto"
		E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["level"]["font"] = "Roboto"
		E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["name"]["font"] = "Roboto"
		E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["power"]["text"]["font"] = "Roboto"
		E.db["nameplates"]["units"]["FRIENDLY_PLAYER"]["title"]["font"] = "Roboto"
		E.db["nameplates"]["units"]["PLAYER"]["buffs"]["countFont"] = "Roboto"
		E.db["nameplates"]["units"]["PLAYER"]["castbar"]["font"] = "Roboto"
		E.db["nameplates"]["units"]["PLAYER"]["debuffs"]["countFont"] = "Roboto"
		E.db["nameplates"]["units"]["PLAYER"]["health"]["text"]["font"] = "Roboto"
		E.db["nameplates"]["units"]["PLAYER"]["level"]["font"] = "Roboto"
		E.db["nameplates"]["units"]["PLAYER"]["name"]["font"] = "Roboto"
		E.db["nameplates"]["units"]["PLAYER"]["power"]["text"]["font"] = "Roboto"
		E.db["nameplates"]["units"]["PLAYER"]["title"]["font"] = "Roboto"
		E.private["general"]["chatBubbleFont"] = "Roboto"
		E.private["general"]["dmgfont"] = "Roboto"
		E.private["general"]["namefont"] = "Roboto"
	if ElvUI_EltreumUI.Retail then
		if IsAddOnLoaded('ProjectAzilroka') then
			PA.db["stAddonManager"]["Font"] = "Roboto"
		end
		if IsAddOnLoaded("ElvUI_SLE") then
			E.db["sle"]["armory"]["character"]["durability"]["font"] = "Roboto"
			E.db["sle"]["armory"]["character"]["enchant"]["font"] = "Roboto"
			E.db["sle"]["armory"]["character"]["ilvl"]["font"] = "Roboto"
			E.db["sle"]["armory"]["inspect"]["enchant"]["font"] = "Roboto"
			E.db["sle"]["armory"]["inspect"]["ilvl"]["font"] = "Roboto"
			E.db["sle"]["armory"]["stats"]["catFonts"]["font"] = "Roboto"
			E.db["sle"]["armory"]["stats"]["itemLevel"]["font"] = "Roboto"
			E.db["sle"]["armory"]["stats"]["statFonts"]["font"] = "Roboto"
			E.db["sle"]["media"]["fonts"]["gossip"]["font"] = "Roboto"
			E.db["sle"]["media"]["fonts"]["mail"]["font"] = "Roboto"
			E.db["sle"]["media"]["fonts"]["objective"]["font"] = "Roboto"
			E.db["sle"]["media"]["fonts"]["objectiveHeader"]["font"] = "Roboto"
			E.db["sle"]["media"]["fonts"]["pvp"]["font"] = "Roboto"
			E.db["sle"]["media"]["fonts"]["questFontSuperHuge"]["font"] = "Roboto"
			E.db["sle"]["media"]["fonts"]["subzone"]["font"] = "Roboto"
			E.db["sle"]["media"]["fonts"]["zone"]["font"] = "Roboto"
			E.db["sle"]["minimap"]["coords"]["font"] = "Roboto"
			E.db["sle"]["minimap"]["instance"]["font"] = "Roboto"
			E.db["sle"]["minimap"]["locPanel"]["font"] = "Roboto"
			if sleversioncheck >= "4.22" then
				E.db["sle"]["afk"]["animTime"] = 2
				E.db["sle"]["afk"]["animType"] = "FadeIn"
				E.db["sle"]["afk"]["defaultGraphics"]["classCrest"]["anchorPoint"] = "CENTER"
				E.db["sle"]["afk"]["defaultGraphics"]["classCrest"]["attachTo"] = "SL_TopPanel"
				E.db["sle"]["afk"]["defaultGraphics"]["classCrest"]["styleOptions"] = "benikui"
				E.db["sle"]["afk"]["defaultGraphics"]["classCrest"]["xOffset"] = 184
				E.db["sle"]["afk"]["defaultGraphics"]["elvuiLogo"]["anchorPoint"] = "LEFT"
				E.db["sle"]["afk"]["defaultGraphics"]["elvuiLogo"]["attachTo"] = "SL_TopPanel"
				E.db["sle"]["afk"]["defaultGraphics"]["elvuiLogo"]["height"] = 128
				E.db["sle"]["afk"]["defaultGraphics"]["elvuiLogo"]["styleOptions"] = "releaf-flat"
				E.db["sle"]["afk"]["defaultGraphics"]["elvuiLogo"]["width"] = 256
				E.db["sle"]["afk"]["defaultGraphics"]["elvuiLogo"]["xOffset"] = 0
				E.db["sle"]["afk"]["defaultGraphics"]["elvuiLogo"]["yOffset"] = 0
				E.db["sle"]["afk"]["defaultGraphics"]["exPack"]["anchorPoint"] = "BOTTOM"
				E.db["sle"]["afk"]["defaultGraphics"]["exPack"]["inversePoint"] = true
				E.db["sle"]["afk"]["defaultGraphics"]["exPack"]["styleOptions"] = "blizzard"
				E.db["sle"]["afk"]["defaultGraphics"]["exPack"]["yOffset"] = 196
				E.db["sle"]["afk"]["defaultGraphics"]["factionCrest"]["anchorPoint"] = "TOPLEFT"
				E.db["sle"]["afk"]["defaultGraphics"]["factionCrest"]["attachTo"] = "SL_BottomPanel"
				E.db["sle"]["afk"]["defaultGraphics"]["factionCrest"]["styleOptions"] = "releaf-flat"
				E.db["sle"]["afk"]["defaultGraphics"]["factionCrest"]["xOffset"] = 0
				E.db["sle"]["afk"]["defaultGraphics"]["factionCrest"]["yOffset"] = 0
				E.db["sle"]["afk"]["defaultGraphics"]["factionLogo"]["enable"] = false
				E.db["sle"]["afk"]["defaultGraphics"]["raceCrest"]["anchorPoint"] = "CENTER"
				E.db["sle"]["afk"]["defaultGraphics"]["raceCrest"]["styleOptions"] = "releaf-flat"
				E.db["sle"]["afk"]["defaultGraphics"]["raceCrest"]["xOffset"] = -184
				E.db["sle"]["afk"]["defaultGraphics"]["raceCrest"]["yOffset"] = 0
				E.db["sle"]["afk"]["defaultGraphics"]["slLogo"]["anchorPoint"] = "RIGHT"
				E.db["sle"]["afk"]["defaultGraphics"]["slLogo"]["attachTo"] = "SL_TopPanel"
				E.db["sle"]["afk"]["defaultGraphics"]["slLogo"]["height"] = 128
				E.db["sle"]["afk"]["defaultGraphics"]["slLogo"]["width"] = 256
				E.db["sle"]["afk"]["defaultGraphics"]["slLogo"]["xOffset"] = 0
				E.db["sle"]["afk"]["defaultGraphics"]["slLogo"]["yOffset"] = 0
				E.db["sle"]["afk"]["defaultTexts"]["SL_AFKMessage"]["anchorPoint"] = "LEFT"
				E.db["sle"]["afk"]["defaultTexts"]["SL_AFKMessage"]["attachTo"] = "SL_BottomPanel"
				E.db["sle"]["afk"]["defaultTexts"]["SL_AFKMessage"]["font"] = "Roboto"
				E.db["sle"]["afk"]["defaultTexts"]["SL_AFKMessage"]["size"] = 20
				E.db["sle"]["afk"]["defaultTexts"]["SL_AFKMessage"]["xOffset"] = 127
				E.db["sle"]["afk"]["defaultTexts"]["SL_AFKMessage"]["yOffset"] = 0
				E.db["sle"]["afk"]["defaultTexts"]["SL_AFKTimePassed"]["font"] = "Roboto"
				E.db["sle"]["afk"]["defaultTexts"]["SL_AFKTimePassed"]["size"] = 20
				E.db["sle"]["afk"]["defaultTexts"]["SL_AFKTimePassed"]["xOffset"] = 4
				E.db["sle"]["afk"]["defaultTexts"]["SL_Date"]["anchorPoint"] = "TOPRIGHT"
				E.db["sle"]["afk"]["defaultTexts"]["SL_Date"]["attachTo"] = "SL_BottomPanel"
				E.db["sle"]["afk"]["defaultTexts"]["SL_Date"]["enable"] = false
				E.db["sle"]["afk"]["defaultTexts"]["SL_Date"]["font"] = "Roboto"
				E.db["sle"]["afk"]["defaultTexts"]["SL_Date"]["xOffset"] = 20
				E.db["sle"]["afk"]["defaultTexts"]["SL_Date"]["yOffset"] = 50
				E.db["sle"]["afk"]["defaultTexts"]["SL_GuildName"]["anchorPoint"] = "BOTTOMLEFT"
				E.db["sle"]["afk"]["defaultTexts"]["SL_GuildName"]["attachTo"] = "SL_PlayerName"
				E.db["sle"]["afk"]["defaultTexts"]["SL_GuildName"]["font"] = "Roboto"
				E.db["sle"]["afk"]["defaultTexts"]["SL_GuildName"]["size"] = 20
				E.db["sle"]["afk"]["defaultTexts"]["SL_GuildRank"]["anchorPoint"] = "RIGHT"
				E.db["sle"]["afk"]["defaultTexts"]["SL_GuildRank"]["attachTo"] = "SL_GuildName"
				E.db["sle"]["afk"]["defaultTexts"]["SL_GuildRank"]["font"] = "Roboto"
				E.db["sle"]["afk"]["defaultTexts"]["SL_GuildRank"]["size"] = 20
				E.db["sle"]["afk"]["defaultTexts"]["SL_PlayerClass"]["anchorPoint"] = "TOPRIGHT"
				E.db["sle"]["afk"]["defaultTexts"]["SL_PlayerClass"]["attachTo"] = "SL_TopPanel"
				E.db["sle"]["afk"]["defaultTexts"]["SL_PlayerClass"]["enable"] = false
				E.db["sle"]["afk"]["defaultTexts"]["SL_PlayerClass"]["font"] = "Roboto"
				E.db["sle"]["afk"]["defaultTexts"]["SL_PlayerLevel"]["enable"] = false
				E.db["sle"]["afk"]["defaultTexts"]["SL_PlayerName"]["anchorPoint"] = "TOPLEFT"
				E.db["sle"]["afk"]["defaultTexts"]["SL_PlayerName"]["attachTo"] = "SL_BottomPanel"
				E.db["sle"]["afk"]["defaultTexts"]["SL_PlayerName"]["font"] = "Roboto"
				E.db["sle"]["afk"]["defaultTexts"]["SL_PlayerName"]["size"] = 20
				E.db["sle"]["afk"]["defaultTexts"]["SL_PlayerName"]["xOffset"] = 128
				E.db["sle"]["afk"]["defaultTexts"]["SL_PlayerName"]["yOffset"] = -30
				E.db["sle"]["afk"]["defaultTexts"]["SL_SubText"]["enable"] = false
				E.db["sle"]["afk"]["defaultTexts"]["SL_SubText"]["size"] = 16
				E.db["sle"]["afk"]["defaultTexts"]["SL_SubText"]["xOffset"] = 0
				E.db["sle"]["afk"]["defaultTexts"]["SL_Time"]["anchorPoint"] = "CENTER"
				E.db["sle"]["afk"]["defaultTexts"]["SL_Time"]["attachTo"] = "SL_BottomPanel"
				E.db["sle"]["afk"]["defaultTexts"]["SL_Time"]["font"] = "Roboto"
				E.db["sle"]["afk"]["defaultTexts"]["SL_Time"]["size"] = 32
				E.db["sle"]["afk"]["defaultTexts"]["SL_Time"]["yOffset"] = 40
				E.db["sle"]["afk"]["enable"] = true
				E.db["sle"]["afk"]["panels"]["bottom"]["height"] = 120
				E.db["sle"]["afk"]["panels"]["top"]["height"] = 120
				E.db["sle"]["afk"]["playermodel"]["anim"] = 47
			end
			E.db["sle"]["skins"]["merchant"]["list"]["nameFont"] = "Roboto"
			E.db["sle"]["skins"]["merchant"]["list"]["subFont"] = "Roboto"
		end
		if IsAddOnLoaded("ElvUI_WindTools") then
			E.private["WT"]["skins"]["ime"]["label"]["name"] = "Roboto"
			E.db["WT"]["item"]["extraItemsBar"]["bar1"]["bindFont"]["name"] = "Roboto"
			E.db["WT"]["item"]["extraItemsBar"]["bar1"]["countFont"]["name"] = "Roboto"
			E.db["WT"]["item"]["inspect"]["levelText"]["name"] = "Roboto"
			E.db["WT"]["misc"]["gameBar"]["additionalText"]["font"]["name"] = "Roboto"
			E.db["WT"]["misc"]["gameBar"]["time"]["font"]["name"] = "Roboto"
		end
		E.db["general"]["altPowerBar"]["font"] = "Roboto"
		E.db["general"]["itemLevel"]["itemLevelFont"] = "Roboto"
	end
		E.db["general"]["font"] = "Roboto"
		E.db["general"]["minimap"]["locationFont"] = "Roboto"
		if ElvUI_EltreumUI.Retail then
			E.db["general"]["minimap"]["icons"]["queueStatus"]["font"] = "Roboto"
		end
		E.db["bags"]["countFont"] = "Roboto"
		E.db["bags"]["itemInfoFont"] = "Roboto"
		E.db["bags"]["itemLevelFont"] = "Roboto"
		E.db["chat"]["font"] = "Roboto"
		E.db["chat"]["tabFont"] = "Roboto"
		E.db["cooldown"]["fonts"]["font"] = "Roboto"
		if ElvUI_EltreumUI.Retail then
			E.db["databars"]["azerite"]["font"] = "Roboto"
			E.db["databars"]["honor"]["font"] = "Roboto"
		end
		E.db["databars"]["experience"]["font"] = "Roboto"
		E.db["databars"]["reputation"]["font"] = "Roboto"
		E.db["databars"]["threat"]["font"] = "Roboto"
		E.db["datatexts"]["font"] = "Roboto"
		E.db["tooltip"]["font"] = "Roboto"
		E.db["tooltip"]["healthBar"]["font"] = "Roboto"


		-- Custom Text: Party
		E.db["unitframe"]["units"]["party"]["customTexts"] = E.db["unitframe"]["units"]["party"]["customTexts"] or {}
		E.db["unitframe"]["units"]["party"]["customTexts"]["EltreumPartyHealth"] = {
			["attachTextTo"] = "Health",
			["enable"] = true,
			["font"] = "Roboto",
			["fontOutline"] = "THICKOUTLINE",
			["justifyH"] = "RIGHT",
			["size"] = 16,
			["text_format"] = "[eltruism:raidmarker] [health:current:shortvalue]",
			["xOffset"] = 0,
			["yOffset"] = 0
		}
		E.db["unitframe"]["units"]["party"]["customTexts"]["EltreumPartyName"] = {
			["attachTextTo"] = "InfoPanel",
			["enable"] = true,
			["font"] = "Roboto",
			["fontOutline"] = "THICKOUTLINE",
			["justifyH"] = "LEFT",
			["size"] = 12,
			["text_format"] = "[namecolor][name:medium] [difficultycolor][smartlevel]",
			["xOffset"] = 2,
			["yOffset"] = 0
		}
		E.db["unitframe"]["units"]["party"]["customTexts"]["EltreumPartyPower"] = {
			["attachTextTo"] = "Power",
			["enable"] = true,
			["font"] = "Roboto",
			["fontOutline"] = "THICKOUTLINE",
			["justifyH"] = "RIGHT",
			["size"] = 11,
			["text_format"] = "[powercolor][power:current:shortvalue]",
			["xOffset"] = 0,
			["yOffset"] = 0
		}
		if ElvUI_EltreumUI.Retail then
			E.db["unitframe"]["units"]["party"]["customTexts"]["EltreumPartyAbsorb"] = {
			["attachTextTo"] = "Health",
			["enable"] = false,
			["font"] = "Roboto",
			["fontOutline"] = "THICKOUTLINE",
			["justifyH"] = "RIGHT",
			["size"] = 11,
			["text_format"] = "||cffFFFF00[absorbs]||r ",
			["xOffset"] = 6,
			["yOffset"] = 0
			}
		end
		-- Custom Text: Pet
		if ElvUI_EltreumUI.Retail then
			E.db["unitframe"]["units"]["pet"]["customTexts"] = E.db["unitframe"]["units"]["pet"]["customTexts"] or {}
			E.db["unitframe"]["units"]["pet"]["customTexts"]["EltreumPetName"] = {
				["attachTextTo"] = "Health",
				["enable"] = true,
				["font"] = "Roboto",
				["fontOutline"] = "THICKOUTLINE",
				["justifyH"] = "CENTER",
				["size"] = 12,
				["text_format"] = "[namecolor][name]",
				["xOffset"] = 0,
				["yOffset"] = 0
			}
		elseif ElvUI_EltreumUI.TBC or ElvUI_EltreumUI.Classic then
			E.db["unitframe"]["units"]["pet"]["customTexts"] = E.db["unitframe"]["units"]["pet"]["customTexts"] or {}
			E.db["unitframe"]["units"]["pet"]["customTexts"]["EltreumPetName"] = {
				["attachTextTo"] = "Health",
				["enable"] = true,
				["font"] = "Roboto",
				["fontOutline"] = "THICKOUTLINE",
				["justifyH"] = "CENTER",
				["size"] = 12,
				["text_format"] = "[namecolor][name][happiness:discord]",
				["xOffset"] = 0,
				["yOffset"] = 0
			}
		end
		-- Custom Text: Player
		E.db["unitframe"]["units"]["player"]["customTexts"] = E.db["unitframe"]["units"]["player"]["customTexts"] or {}
		if ElvUI_EltreumUI.Retail then
			E.db["unitframe"]["units"]["player"]["customTexts"]["EltreumPlayerAbsorb"] = {
			["attachTextTo"] = "Health",
			["enable"] = true,
			["font"] = "Roboto",
			["fontOutline"] = "THICKOUTLINE",
			["justifyH"] = "RIGHT",
			["size"] = 12,
			["text_format"] = "||cffFFFF00[absorbs]||r ",
			["xOffset"] = 0,
			["yOffset"] = 15
			}
		end
		E.db["unitframe"]["units"]["player"]["customTexts"]["EltreumHealth"] = {
			["attachTextTo"] = "Health",
			["enable"] = true,
			["font"] = "Roboto",
			["fontOutline"] = "THICKOUTLINE",
			["justifyH"] = "RIGHT",
			["size"] = 14,
			["text_format"] = "[health:current-percent:shortvalue]",
			["xOffset"] = 0,
			["yOffset"] = 0
		}
		E.db["unitframe"]["units"]["player"]["customTexts"]["EltreumName"] = {
			["attachTextTo"] = "Health",
			["enable"] = true,
			["font"] = "Roboto",
			["fontOutline"] = "THICKOUTLINE",
			["justifyH"] = "LEFT",
			["size"] = 16,
			["text_format"] = "[namecolor][name] [eltruism:class:player] [eltruism:raidmarker]",
			["xOffset"] = 2,
			["yOffset"] = 0
		}
		E.db["unitframe"]["units"]["player"]["customTexts"]["EltreumPower"] = {
			["attachTextTo"] = "Power",
			["enable"] = true,
			["font"] = "Roboto",
			["fontOutline"] = "THICKOUTLINE",
			["justifyH"] = "RIGHT",
			["size"] = 10,
			["text_format"] = "[powercolor][power:current:shortvalue]",
			["xOffset"] = 0,
			["yOffset"] = -1
		}
		E.db["unitframe"]["units"]["player"]["customTexts"]["EltreumPvP"] = {
			["attachTextTo"] = "Health",
			["enable"] = true,
			["font"] = "Roboto",
			["fontOutline"] = "THICKOUTLINE",
			["justifyH"] = "CENTER",
			["size"] = 15,
			["text_format"] = "[mouseover]||cFFB04F4F[pvptimer]||r",
			["xOffset"] = 0,
			["yOffset"] = 0
		}
		-- Custom Text: Raid
		E.db["unitframe"]["units"]["raid"]["customTexts"] = E.db["unitframe"]["units"]["raid"]["customTexts"] or {}
		E.db["unitframe"]["units"]["raid"]["customTexts"]["EltreumGroup"] = {
			["attachTextTo"] = "Health",
			["enable"] = false,
			["font"] = "Roboto",
			["fontOutline"] = "NONE",
			["justifyH"] = "LEFT",
			["size"] = 8,
			["text_format"] = " Group [group]",
			["xOffset"] = 37,
			["yOffset"] = 10
		}
		if ElvUI_EltreumUI.Retail then
			E.db["unitframe"]["units"]["raid"]["customTexts"]["EltreumRaidAbsorb"] = {
			["attachTextTo"] = "Health",
			["enable"] = false,
			["font"] = "Roboto",
			["fontOutline"] = "THICKOUTLINE",
			["justifyH"] = "CENTER",
			["size"] = 10,
			["text_format"] = "||cffFFFF00[absorbs]||r",
			["xOffset"] = 45,
			["yOffset"] = 0
			}
		end
		E.db["unitframe"]["units"]["raid"]["customTexts"]["EltreumRaidHealth"]= {
		["attachTextTo"] = "InfoPanel",
		["enable"] = true,
		["font"] = "Roboto",
		["fontOutline"] = "OUTLINE",
		["justifyH"] = "RIGHT",
		["size"] = 10,
		["text_format"] = "[health:current:shortvalue]",
		["xOffset"] = 0,
		["yOffset"] = -1
		}
		E.db["unitframe"]["units"]["raid"]["customTexts"]["EltreumRaidName"] = {
		["attachTextTo"] = "InfoPanel",
		["enable"] = true,
		["font"] = "Roboto",
		["fontOutline"] = "OUTLINE",
		["justifyH"] = "LEFT",
		["size"] = 10,
		["text_format"] = "[namecolor][name:medium] [difficultycolor][smartlevel]",
		["xOffset"] = 0,
		["yOffset"] = 0
		}
		-- Custom Text: Raid 40
		E.db["unitframe"]["units"]["raid40"]["customTexts"] = E.db["unitframe"]["units"]["raid40"]["customTexts"] or {}
		if ElvUI_EltreumUI.Retail then
			E.db["unitframe"]["units"]["raid40"]["customTexts"]["EltreumRaid40Absorb"] = {
			["attachTextTo"] = "Health",
			["enable"] = false,
			["font"] = "Roboto",
			["fontOutline"] = "THICKOUTLINE",
			["justifyH"] = "CENTER",
			["size"] = 10,
			["text_format"] = "||cffFFFF00[absorbs]||r",
			["xOffset"] = 37,
			["yOffset"] = 12
			}
		end
		E.db["unitframe"]["units"]["raid40"]["customTexts"]["EltreumRaid40Group"] = {
			["attachTextTo"] = "Health",
			["enable"] = false,
			["font"] = "Roboto",
			["fontOutline"] = "NONE",
			["justifyH"] = "LEFT",
			["size"] = 8,
			["text_format"] = " Group [group]",
			["xOffset"] = 40,
			["yOffset"] = 12
		}
		E.db["unitframe"]["units"]["raid40"]["customTexts"]["EltreumRaid40Health"] = {
			["attachTextTo"] = "InfoPanel",
			["enable"] = true,
			["font"] = "Roboto",
			["fontOutline"] = "OUTLINE",
			["justifyH"] = "RIGHT",
			["size"] = 10,
			["text_format"] = "[health:current:shortvalue]",
			["xOffset"] = 0,
			["yOffset"] = 0
		}
		-- Custom Text: Target
		E.db["unitframe"]["units"]["target"]["customTexts"] = E.db["unitframe"]["units"]["target"]["customTexts"] or {}
		if ElvUI_EltreumUI.Retail then
			E.db["unitframe"]["units"]["target"]["customTexts"]["EltreumTargetAbsorb"] = {
			["attachTextTo"] = "Health",
			["enable"] = true,
			["font"] = "Roboto",
			["fontOutline"] = "THICKOUTLINE",
			["justifyH"] = "RIGHT",
			["size"] = 12,
			["text_format"] = "||cffFFFF00[absorbs]||r",
			["xOffset"] = 0,
			["yOffset"] = 15
			}
		end
		E.db["unitframe"]["units"]["target"]["customTexts"]["EltreumTargetHealth"] = {
			["attachTextTo"] = "Health",
			["enable"] = true,
			["font"] = "Roboto",
			["fontOutline"] = "THICKOUTLINE",
			["justifyH"] = "LEFT",
			["size"] = 14,
			["text_format"] = "[health:current-percent:shortvalue]",
			["xOffset"] = 2,
			["yOffset"] = 0
		}
		E.db["unitframe"]["units"]["target"]["customTexts"]["EltreumTargetName"] = {
			["attachTextTo"] = "Health",
			["enable"] = true,
			["font"] = "Roboto",
			["fontOutline"] = "THICKOUTLINE",
			["justifyH"] = "RIGHT",
			["size"] = 16,
			["text_format"] = "[eltruism:raidmarker] [eltruism:class:player] [namecolor][eltruism:difficulty][name:eltruism:abbreviate]",
			["xOffset"] = -2,
			["yOffset"] = 0
		}
		E.db["unitframe"]["units"]["target"]["customTexts"]["EltreumTargetPower"] = {
		["attachTextTo"] = "Power",
		["enable"] = true,
		["font"] = "Roboto",
		["fontOutline"] = "THICKOUTLINE",
		["justifyH"] = "LEFT",
		["size"] = 10,
		["text_format"] = "[powercolor][power:current:shortvalue]",
		["xOffset"] = 2,
		["yOffset"] = -1
		}
		E.db["unitframe"]["units"]["target"]["customTexts"]["EltreumTargetofTarget"] = {
		["attachTextTo"] = "Frame",
		["enable"] = false,
		["font"] = "Roboto",
		["fontOutline"] = "OUTLINE",
		["justifyH"] = "RIGHT",
		["size"] = 10,
		["text_format"] = "Target: [eltruism:targetcast]",
		["xOffset"] = -5,
		["yOffset"] = -14
		}
		-- Custom Text: TargetTarget
		E.db["unitframe"]["units"]["targettarget"]["customTexts"] = E.db["unitframe"]["units"]["targettarget"]["customTexts"] or {}
		E.db["unitframe"]["units"]["targettarget"]["customTexts"]["EltreumTargetTargetHealth"] = {
			["attachTextTo"] = "Health",
			["enable"] = false,
			["font"] = "Roboto",
			["fontOutline"] = "THICKOUTLINE",
			["justifyH"] = "LEFT",
			["size"] = 11,
			["text_format"] = "[health:current:shortvalue]",
			["xOffset"] = 2,
			["yOffset"] = 3
		}
		E.db["unitframe"]["units"]["targettarget"]["customTexts"]["EltreumTargetTargetName"] = {
			["attachTextTo"] = "Health",
			["enable"] = true,
			["font"] = "Roboto",
			["fontOutline"] = "OUTLINE",
			["justifyH"] = "CENTER",
			["size"] = 12,
			["text_format"] = "[namecolor][name:abbrev]",
			["xOffset"] = 0,
			["yOffset"] = 3
		}
		E.db["unitframe"]["units"]["targettarget"]["customTexts"]["Powercustom"] = {
		["attachTextTo"] = "Power",
		["enable"] = true,
		["font"] = "Roboto",
		["fontOutline"] = "THICKOUTLINE",
		["justifyH"] = "RIGHT",
		["size"] = 9,
		["text_format"] = "[powercolor][power:current:shortvalue]",
		["xOffset"] = 0,
		["yOffset"] = -1
		}

		--ActionBars
		E.db["actionbar"]["bar1"]["countFont"] = "Roboto"
		E.db["actionbar"]["bar1"]["hotkeyFont"] = "Roboto"
		E.db["actionbar"]["bar1"]["macroFont"] = "Roboto"
		E.db["actionbar"]["bar10"]["countFont"] = "Roboto"
		E.db["actionbar"]["bar10"]["hotkeyFont"] = "Roboto"
		E.db["actionbar"]["bar10"]["macroFont"] = "Roboto"
		E.db["actionbar"]["bar2"]["countFont"] = "Roboto"
		E.db["actionbar"]["bar2"]["hotkeyFont"] = "Roboto"
		E.db["actionbar"]["bar2"]["macroFont"] = "Roboto"
		E.db["actionbar"]["bar3"]["countFont"] = "Roboto"
		E.db["actionbar"]["bar3"]["hotkeyFont"] = "Roboto"
		E.db["actionbar"]["bar3"]["macroFont"] = "Roboto"
		E.db["actionbar"]["bar4"]["countFont"] = "Roboto"
		E.db["actionbar"]["bar4"]["hotkeyFont"] = "Roboto"
		E.db["actionbar"]["bar4"]["macroFont"] = "Roboto"
		E.db["actionbar"]["bar5"]["countFont"] = "Roboto"
		E.db["actionbar"]["bar5"]["hotkeyFont"] = "Roboto"
		E.db["actionbar"]["bar5"]["macroFont"] = "Roboto"
		E.db["actionbar"]["bar6"]["countFont"] = "Roboto"
		E.db["actionbar"]["bar6"]["hotkeyFont"] = "Roboto"
		E.db["actionbar"]["bar6"]["macroFont"] = "Roboto"
		E.db["actionbar"]["bar7"]["countFont"] = "Roboto"
		E.db["actionbar"]["bar7"]["hotkeyFont"] = "Roboto"
		E.db["actionbar"]["bar7"]["macroFont"] = "Roboto"
		E.db["actionbar"]["bar8"]["countFont"] = "Roboto"
		E.db["actionbar"]["bar8"]["hotkeyFont"] = "Roboto"
		E.db["actionbar"]["bar8"]["macroFont"] = "Roboto"
		E.db["actionbar"]["bar9"]["countFont"] = "Roboto"
		E.db["actionbar"]["bar9"]["hotkeyFont"] = "Roboto"
		E.db["actionbar"]["bar9"]["macroFont"] = "Roboto"
		E.db["actionbar"]["barPet"]["countFont"] = "Roboto"
		E.db["actionbar"]["barPet"]["hotkeyFont"] = "Roboto"
		if ElvUI_EltreumUI.Retail then
			E.db["actionbar"]["extraActionButton"]["hotkeyFont"] = "Roboto"
		end
		E.db["actionbar"]["font"] = "Roboto"
		E.db["actionbar"]["stanceBar"]["hotkeyFont"] = "Roboto"
		E.db["actionbar"]["vehicleExitButton"]["hotkeyFont"] = "Roboto"
		E.db["auras"]["buffs"]["countFont"] = "Roboto"
		E.db["auras"]["buffs"]["timeFont"] = "Roboto"
		E.db["auras"]["debuffs"]["countFont"] = "Roboto"
		E.db["auras"]["debuffs"]["timeFont"] = "Roboto"
		E.db["unitframe"]["font"] = "Roboto"
		if ElvUI_EltreumUI.Retail then
			E.db["unitframe"]["units"]["arena"]["buffs"]["countFont"] = "Roboto"
			E.db["unitframe"]["units"]["arena"]["debuffs"]["countFont"] = "Roboto"
			E.db["unitframe"]["units"]["assist"]["buffs"]["countFont"] = "Roboto"
			E.db["unitframe"]["units"]["assist"]["debuffs"]["countFont"] = "Roboto"
			E.db["unitframe"]["units"]["assist"]["rdebuffs"]["font"] = "Roboto"
			E.db["unitframe"]["units"]["boss"]["buffs"]["countFont"] = "Roboto"
			E.db["unitframe"]["units"]["boss"]["debuffs"]["countFont"] = "Roboto"
			E.db["unitframe"]["units"]["focus"]["debuffs"]["countFont"] = "Roboto"
			E.db["unitframe"]["units"]["party"]["castbar"]["customTextFont"]["font"] = "Roboto"
			E.db["unitframe"]["units"]["player"]["castbar"]["customTimeFont"]["font"] = "Roboto"
		end
		E.db["unitframe"]["units"]["party"]["buffs"]["countFont"] = "Roboto"
		E.db["unitframe"]["units"]["party"]["debuffs"]["countFont"] = "Roboto"
		E.db["unitframe"]["units"]["party"]["rdebuffs"]["font"] = "Roboto"
		E.db["unitframe"]["units"]["player"]["buffs"]["countFont"] = "Roboto"
		E.db["unitframe"]["units"]["player"]["debuffs"]["countFont"] = "Roboto"
		E.db["unitframe"]["units"]["raid"]["buffs"]["countFont"] = "Roboto"
		E.db["unitframe"]["units"]["raid"]["debuffs"]["countFont"] = "Roboto"
		E.db["unitframe"]["units"]["raid"]["rdebuffs"]["font"] = "Roboto"
		E.db["unitframe"]["units"]["raid40"]["rdebuffs"]["font"] = "Roboto"
		E.db["unitframe"]["units"]["tank"]["buffs"]["countFont"] = "Roboto"
		E.db["unitframe"]["units"]["tank"]["debuffs"]["countFont"] = "Roboto"
		E.db["unitframe"]["units"]["tank"]["rdebuffs"]["font"] = "Roboto"
		E.db["unitframe"]["units"]["target"]["buffs"]["countFont"] = "Roboto"
		E.db["unitframe"]["units"]["target"]["debuffs"]["countFont"] = "Roboto"
		E.db["unitframe"]["units"]["targettargettarget"]["buffs"]["countFont"] = "Roboto"
		E.db["unitframe"]["units"]["targettargettarget"]["debuffs"]["countFont"] = "Roboto"

		E:StaggeredUpdateAll(nil, true)

	ElvUI_EltreumUI:Print(L["Roboto Font has been set."])
end
