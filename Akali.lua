if GetObjectName(GetMyHero()) == "Akali" then
--Requirements
require('twgank')
-- Menu
Config = scriptConfig("IAkali", "Akali")
Config.addParam("Q", "Use Akali Q", SCRIPT_PARAM_ONOFF, true)
Config.addParam("E", "Use Akali E", SCRIPT_PARAM_ONOFF, true)
Config.addParam("R", "Use Akali R", SCRIPT_PARAM_ONOFF, true)
KSConfig = scriptConfig("KS", "Killsteal:")
KSConfig.addParam("KSR", "Killsteal with R", SCRIPT_PARAM_ONOFF, false)
-- PrintChat
local info = "Evolved Akali Loaded"
local upv = "Upvote if you like it!"
local sig = "Made by Asserio"
local ver = "v 1.0"
textTable = {info,upv,sig,ver}
PrintChat(textTable[1])
PrintChat(textTable[2])
PrintChat(textTable[3])
PrintChat(textTable[4])
-- Start
OnLoop(function(myHero)
AutoIgnite()
Killsteal()
if IWalkConfig.Combo then
local unit = GetCurrentTarget()
if ValidTarget(unit, 1400) then

-- Akali Q
if CanUseSpell(myHero, _Q) == READY and IsInDistance(unit, GetCastRange(myHero, _Q)) then
CastTargetSpell(unit, _Q)
end
-- Akali R
if CanUseSpell(myHero, _R) == READY and IsInDistance(unit, GetCastRange(myHero, _R)) then
CastTargetSpell(unit, _R)
end
-- Akali E
if CanUseSpell(myHero, _E) == READY and IsInDistance(unit, GetCastRange(myHero, _E)) then
CastTargetSpell(myHero, _E)
end

end
end
end)

function Killsteal()
        for i,enemy in pairs(GetEnemyHeroes()) do
            if CanUseSpell(myHero, _R) == READY and ValidTarget(enemy,GetCastRange(myHero,_R)) and KSConfig.KSR and GetCurrentHP(enemy) < CalcDamage(myHero, enemy, 0, (75*GetCastLevel(myHero,_R)+25+.5*GetBonusAP(myHero))) then
		CastTargetSpell(enemy, _R)
            end
        end
end
end
