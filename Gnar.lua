if GetObjectName(GetMyHero()) == "Gnar" then
--Requirements
require('twgank')
-- Menu
Config = scriptConfig("IGnar", "Gnar")
Config.addParam("Q", "Use Gnar Q", SCRIPT_PARAM_ONOFF, true)
Config.addParam("E", "Use Gnar E", SCRIPT_PARAM_ONOFF, true)
BigGnar = scriptConfig("Big", "BigGnar")
BigGnar.addParam("Q", "Use BigGnar Q", SCRIPT_PARAM_ONOFF, true)
BigGnar.addParam("W", "Use BigGnar W", SCRIPT_PARAM_ONOFF, true)
BigGnar.addParam("E", "Use BigGnar E", SCRIPT_PARAM_ONOFF, true)
-- PrintChat
local info = "Evolved Gnar Loaded"
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
local unit = GetCurrentTarget()
if ValidTarget(unit, 1400) then
if IWalkConfig.Combo then

-- Mini Gnar Q

	-- GetPredictionForPlayer(startPosition, targetUnit, targetUnitMoveSpeed, spellTravelSpeed, spellDelay, spellRange, spellWidth, collision, addHitBox)
local QPred = GetPredictionForPlayer(GetMyHeroPos(),unit,GetMoveSpeed(unit),2500,250,1125,60,true,true)
	if Config.Q then
		if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 then
	CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
		end
	end

-- Mini Gnar E
if Config.E then
local mousePos = GetMousePos()
	-- GetPredictionForPlayer(startPosition, targetUnit, targetUnitMoveSpeed, spellTravelSpeed, spellDelay, spellRange, spellWidth, collision, addHitBox)
local EPred = GetPredictionForPlayer(GetMyHeroPos(),unit,GetMoveSpeed(unit),903,0,473,150,false,true)
	if CanUseSpell(myHero, _E) == READY and GetCurrentHP(myHero) > GetCurrentHP(unit) and IsInDistance(unit, GetCastRange(myHero, _E)) and EPred.HitChance == 1 then
	CastSkillShot(_E,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)
	elseif CanUseSpell(myHero, _E) == READY and GetCurrentHP(myHero) < GetCurrentHP(unit) then return end
	elseif CanUseSpell(myHero, _E) == READY and GetCurrentHP(myHero) > GetCurrentHP(unit) and IsInDistance(unit, 1000) then
	CastSkillShot(_E,mousePos.x,mousePos.y,mousePos.z)
	end
-----------------------------------------------MEGA GNAR COMBO------------------------------------------------------------
-- Mega Gnar E
if GetCastName(myHero, _E) == "gnarbigE" then
local mousePos = GetMousePos()
	-- GetPredictionForPlayer(startPosition, targetUnit, targetUnitMoveSpeed, spellTravelSpeed, spellDelay, spellRange, spellWidth, collision, addHitBox)
local EPred = GetPredictionForPlayer(GetMyHeroPos(),unit,GetMoveSpeed(unit),1000,250,475,200,false,true)
	if BigGnar.E then
		if CanUseSpell(myHero, _E) == READY and EPred.HitChance == 1 then
	CastSkillShot(_E,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)
	elseif CanUseSpell(myHero, _E) == READY and IsInDistance(unit, 1000) then
	CastSkillShot(_E,mousePos.x,mousePos.y,mousePos.z)

		end
	end
end
-- Mega Gnar W
	-- GetPredictionForPlayer(startPosition, targetUnit, targetUnitMoveSpeed, spellTravelSpeed, spellDelay, spellRange, spellWidth, collision, addHitBox)
local WPred = GetPredictionForPlayer(GetMyHeroPos(),unit,GetMoveSpeed(unit),math.huge,600,600,80,false,true)
	if BigGnar.W then
		if CanUseSpell(myHero, _W) == READY and WPred.HitChance == 1 then
	CastSkillShot(_W,WPred.PredPos.x,WPred.PredPos.y,WPred.PredPos.z)
		end
	end

-- Mega Gnar Q
if GetCastName(myHero, _Q) == "bnarbigQ" then
	-- GetPredictionForPlayer(startPosition, targetUnit, targetUnitMoveSpeed, spellTravelSpeed, spellDelay, spellRange, spellWidth, collision, addHitBox)
local QPred = GetPredictionForPlayer(GetMyHeroPos(),unit,GetMoveSpeed(unit),2100,500,1150,90,true,true)
	if BigGnar.Q then
		if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 then
	CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
		end
	end
end

end
end
end)
end
