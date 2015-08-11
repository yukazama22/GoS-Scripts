if GetObjectName(GetMyHero()) == "DrMundo" then
-- Requirements
require('twgank')
-- Keys
Config = scriptConfig("IDrMundo", "DrMundo")
Config.addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
Config.addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
Config.addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
AutoConfig = scriptConfig("AU", "Automatic")
AutoConfig.addParam("R", "Use Auto R", SCRIPT_PARAM_ONOFF, true)
KSConfig = scriptConfig("KS", "Killsteal:")
KSConfig.addParam("KSQ", "Killsteal with Q", SCRIPT_PARAM_ONOFF, false)
-- PrintChat
local info = "Evolved DrMundo Loaded"
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
AutoUltimate()
if IWalkConfig.Combo then
local unit = GetCurrentTarget()
if ValidTarget(unit, 1300) then

-- Dr.Mundo Q
	-- GetPredictionForPlayer(startPosition, targetUnit, targetUnitMoveSpeed, spellTravelSpeed, spellDelay, spellRange, spellWidth, collision, addHitBox)
local QPred = GetPredictionForPlayer(GetMyHeroPos(),unit,GetMoveSpeed(unit),2000,250,1050,60,true,true)
	if Config.Q then
		if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 then
	CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
		end
	end
-- Dr.Mundo W
if Config.W then
	if GotBuff(myHero, "BurningAgony") ~= 1 then
	if CanUseSpell(myHero, _W) == READY and IsInDistance(unit, GetCastRange(myHero, _W)) then
	CastTargetSpell(myHero, _W)
	end
end

-- Dr.Mundo E
if Config.E then
	if CanUseSpell(myHero, _E) == READY and IsInDistance(unit, 200) then
	CastTargetSpell(myHero, _E)
	end
end

end
end
end
end)


function AutoUltimate()
	local hp = GetCurrentHP(myHero)
	local maxHP = GetMaxHP(myHero)

	if AutoConfig.R then
		if CanUseSpell(myHero, _R) == READY and (hp/maxHP) < 0.6 then
	CastTargetSpell(myHero, _R)
		end
	end

end

function Killsteal()
        for i,enemy in pairs(GetEnemyHeroes()) do
			-- GetPredictionForPlayer(startPosition, targetUnit, targetUnitMoveSpeed, spellTravelSpeed, spellDelay, spellRange, spellWidth, collision, addHitBox)
local QPred = GetPredictionForPlayer(GetMyHeroPos(),enemy,GetMoveSpeed(enemy),2000,250,GetCastRange(myHero,_Q),60,true,true)
            if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 and ValidTarget(enemy,GetCastRange(myHero,_Q)) and KSConfig.KSQ and GetCurrentHP(enemy) < CalcDamage(myHero, enemy, 0, (2.5*GetCastLevel(myHero,_Q)+12.5)*GetCurrentHP(enemy)/100 + 50*GetCastLevel(myHero, _Q)+30) then
		CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
            end
        end
end
end
