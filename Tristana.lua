if GetObjectName(GetMyHero()) == "Tristana" then
-- Requirements
require('twgank')
-- Keys
Config = scriptConfig("ITristana", "Tristana.lua")
Config.addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
Config.addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
Config.addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
-- PrintChat
---Credits to TheWelder. I Actualy liked this very much so i will use it here. Hope the Welder doesn't get mad.
local info = "Evolved Tristana Loaded"
local upv = "Upvote if you like it!"
local sig = "Made by Asserio"
local ver = "v 1.0"
textTable = {info,upv,sig,ver}
PrintChat(textTable[1])
PrintChat(textTable[2])
PrintChat(textTable[3])
PrintChat(textTable[4])

-- This is done every mil second
OnLoop(function(myHero)
AutoIgnite()
if IWalkConfig.Combo then
local unit = GetCurrentTarget()
if ValidTarget(unit, 1000) then
-- Use Tristana E
	if Config.E then
		if CanUseSpell(myHero, _E) == READY and IsInDistance(unit, GetCastRange(myHero, _E)) then
		CastTargetSpell(unit, _E)
		end
	end
-- Use Tristana Q
	if Config.Q then
		if CanUseSpell(myHero, _Q) == READY and CanUseSpell(myHero, _W) ~= READY and IsInDistance(unit, GetRange(myHero)) then
		CastTargetSpell(myHero, _Q)
		end
	end
-- Use Tristana R if Target if can kill the target
	if Config.R then
		if CanUseSpell(myHero, _R) == READY and rdmg() > GetCurrentHP(unit) + GetHPRegen(unit) and IsInDistance(unit, GetCastRange(myHero, _R)) then
		CastTargetSpell(unit, _R)
		end
	end

end
--[[ LanceClear Not Working ATM
if IWalkConfig.Laneclear then
	if Config.Q then
		if CanUseSpell(myHero, _Q) == READY then
		CastSpell(myHero, _Q)
end
		end
	end]]

end
end)

-- Rdmg function
function rdmg()
	if GetCastLevel(myHero, _R) == 0 then
		return 0
	end

	if GetCastLevel(myHero, _R) == 1 then
		return 300 + (GetBonusAP(myHero)/100*100)
	end

	if GetCastLevel(myHero, _R) == 2 then
		return 400 + (GetBonusAP(myHero)/100*100)
	end

	if GetCastLevel(myHero, _R) == 3 then
		return 500 + (GetBonusAP(myHero)/100*100)
	end

end
end
