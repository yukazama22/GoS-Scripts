if GetObjectName(GetMyHero()) == "Zed" then
-- Menu
Config = scriptConfig("IZed", "Zed")
Config.addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
Config.addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
Config.addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
-- PrintChat
local info = "Evolved Zed Loaded"
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
if IWalkConfig.Combo then
local unit = GetCurrentTarget()
local currhp = GetCurrentHP(myHero)
local buffcnt = GotBuff(unit,"DeathMark")
if ValidTarget(unit, 1000) then

if GetCastName(myHero, _R) ~= "ZedR2" then
if Config.R then
if unit ~= nil then
if CanUseSpell(myHero, _R) == READY and rdmg() > GetCurrentHP(unit) and IsInDistance(unit, 625) then
CastTargetSpell(unit, _R)

end
end
end
end


-- GetPredictionForPlayer(startPosition, targetUnit, targetUnitMoveSpeed, spellTravelSpeed, spellDelay, spellRange, spellWidth, collision, addHitBox)
local QPred = GetPredictionForPlayer(GetMyHeroPos(),unit,GetMoveSpeed(unit),1700,250,925,50,false,true)
if Config.Q then
if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 then
CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
end
end

if Config.E then
if CanUseSpell(myHero, _E) == READY and IsInDistance(unit, 290) then
CastTargetSpell(myHero, _E)
end
end
end
end
end)
end


function qdmg()
	if GetCastLevel(myHero, _Q) == 0 then
		return 0
	end
	if GetCastLevel(myHero, _Q) == 1 then
		return 75 + (GetBonusDmg(myHero)/100*100)
	end
	if GetCastLevel(myHero, _Q) == 2 then
		return 115 + (GetBonusDmg(myHero)/100*100)
	end
	if GetCastLevel(myHero, _Q) == 3 then
		return 155 + (GetBonusDmg(myHero)/100*100)
	end
	if GetCastLevel(myHero, _Q) == 4 then
		return 195 + (GetBonusDmg(myHero)/100*100)
	end
	if GetCastLevel(myHero, _Q) == 5 then
		return 235 + (GetBonusDmg(myHero)/100*100)
	end
end

function edmg()
	if GetCastLevel(myHero, _E) == 0 then
		return 0
	end
	if GetCastLevel(myHero, _E) == 1 then
		return 60 + (GetBonusDmg(myHero)/100*80)
	end
	if GetCastLevel(myHero, _E) == 2 then
		return 90 + (GetBonusDmg(myHero)/100*80)
	end
	if GetCastLevel(myHero, _E) == 3 then
		return 120 + (GetBonusDmg(myHero)/100*80)
	end
	if GetCastLevel(myHero, _E) == 4 then
		return 150 + (GetBonusDmg(myHero)/100*80)
	end
	if GetCastLevel(myHero, _E) == 5 then
		return 180 + (GetBonusDmg(myHero)/100*80)
	end
end

function rdmg()
	if GetCastLevel(myHero, _R) == 0 then
		return 0
	end
	if GetCastLevel(myHero, _R) == 1 then
		return 30 + (GetBonusDmg(myHero)/100*100) + qdmg() + edmg()
	end
	if GetCastLevel(myHero, _R) == 2 then
		return 35 + (GetBonusDmg(myHero)/100*100) + qdmg() + edmg()
	end
	if GetCastLevel(myHero, _R) == 3 then
		return 50 + (GetBonusDmg(myHero)/100*100) + qdmg() + edmg()
	end
end

