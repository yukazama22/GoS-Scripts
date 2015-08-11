if GetObjectName(GetMyHero()) == "Brand" then
-- Requirements
require('twgank')
-- Menu
Config = scriptConfig("IBrand", "Brand")
Config.addParam("Q", "Use Brand Q", SCRIPT_PARAM_ONOFF, true)
Config.addParam("W", "Use Brand W", SCRIPT_PARAM_ONOFF, true)
Config.addParam("E", "Use Brand E", SCRIPT_PARAM_ONOFF, true)
HarassConfig = scriptConfig("HS", "Harass")
HarassConfig.addParam("Q", "Use Brand Q", SCRIPT_PARAM_ONOFF, true)
HarassConfig.addParam("W", "Use Brand W", SCRIPT_PARAM_ONOFF, true)
RConfig = scriptConfig("R", "R Setting")
RConfig.addParam("R", "R when 2+ champs", SCRIPT_PARAM_ONOFF, true)
-- PrintChat
local info = "Evolved Brand Loaded"
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
local unit = GetCurrentTarget()
if ValidTarget(unit, 1100) then
if IWalkConfig.Combo then


-- Brand E
	if Config.E then
		if CanUseSpell(myHero, _E) == READY and IsInDistance(unit, GetCastRange(myHero, _E)) then
		CastTargetSpell(unit, _E)
		end
	end

-- Brand Q
	-- GetPredictionForPlayer(startPosition, targetUnit, targetUnitMoveSpeed, spellTravelSpeed, spellDelay, spellRange, spellWidth, collision, addHitBox)
local QPred = GetPredictionForPlayer(GetMyHeroPos(),unit,GetMoveSpeed(unit),1600,250,1100,60,true,true)
	if Config.Q then
		if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 then
	CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
		end
	end

-- Brand W
	-- GetPredictionForPlayer(startPosition, targetUnit, targetUnitMoveSpeed, spellTravelSpeed, spellDelay, spellRange, spellWidth, collision, addHitBox)
local WPred = GetPredictionForPlayer(GetMyHeroPos(),unit,GetMoveSpeed(unit),math.huge,850,900,240,false,true)
	if Config.W then
		if CanUseSpell(myHero, _W) == READY and WPred.HitChance == 1 then
	CastSkillShot(_W,WPred.PredPos.x,WPred.PredPos.y,WPred.PredPos.z)
		end
	end
-- Brand R
	if RConfig.R then
		if CanUseSpell(myHero, _R) == READY and EnemiesAround(GetMyHeroPos(), GetCastRange(myHero, _R)) >= 2 then
		CastTargetSpell(unit, _R)
		end
	end

end
end
end)



OnLoop(function(myHero)
local unit = GetCurrentTarget()
if ValidTarget(unit, 1150) then
if IWalkConfig.Harass then

-- Brand Q
	-- GetPredictionForPlayer(startPosition, targetUnit, targetUnitMoveSpeed, spellTravelSpeed, spellDelay, spellRange, spellWidth, collision, addHitBox)
local QPred = GetPredictionForPlayer(GetMyHeroPos(),unit,GetMoveSpeed(unit),1600,250,1100,60,true,true)
	if HarassConfig.Q then
		if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 then
	CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
		end
	end

-- Brand W
	-- GetPredictionForPlayer(startPosition, targetUnit, targetUnitMoveSpeed, spellTravelSpeed, spellDelay, spellRange, spellWidth, collision, addHitBox)
local WPred = GetPredictionForPlayer(GetMyHeroPos(),unit,GetMoveSpeed(unit),math.huge,850,900,240,false,true)
	if HarassConfig.W then
		if CanUseSpell(myHero, _W) == READY and WPred.HitChance == 1 then
	CastSkillShot(_W,WPred.PredPos.x,WPred.PredPos.y,WPred.PredPos.z)
		end
	end
end
end
end)
end
