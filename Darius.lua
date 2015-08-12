if GetObjectName(GetMyHero()) == "Darius" then
-- Requirements
require('twgank')
-- Keys
Config = scriptConfig("IDarius", "Darius")
Config.addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
Config.addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
Config.addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
AutoRConfig = scriptConfig("AT", "Auto R")
AutoRConfig.addParam("R", "Auto R", SCRIPT_PARAM_ONOFF, true)
-- PrintChat
local info = "Evolved Darius Loaded"
local upv = "Upvote if you like it!"
local sig = "Made by Asserio"
local ver = "v 1.0"
textTable = {info,upv,sig,ver}
PrintChat(textTable[1])
PrintChat(textTable[2])
PrintChat(textTable[3])
PrintChat(textTable[4])

OnLoop(function(myHero)
Killsteal()
local unit = GetCurrentTarget()
if ValidTarget(unit, 1400) then
if IWalkConfig.Combo then
local hp = GetCurrentHP(unit)
local maxHP = GetMaxHP(unit)
-- Darius E
  -- GetPredictionForPlayer(startPosition, targetUnit, targetUnitMoveSpeed, spellTravelSpeed, spellDelay, spellRange, spellWidth, collision, addHitBox)
local EPred = GetPredictionForPlayer(GetMyHeroPos(),unit,GetMoveSpeed(unit),math.huge,300,550,80,false,true)
  if Config.E then
    if CanUseSpell(myHero, _E) == READY and EPred.HitChance == 1 then
      CastTargetSpell(unit, _E)
    end
  end

-- Darius Q
 if Config.Q then
 local QPred = GetPredictionForPlayer(GetMyHeroPos(),unit,GetMoveSpeed(unit),1700,250,475,50,true,true)
                        if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 and IsInDistance(unit, 475) then
                        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
                        end
                end
-- Darius W
if Config.W then
  if CanUseSpell(myHero, _W) == READY and IsInDistance(unit, GetRange(myHero)) then
    CastTargetSpell(myHero, _W)
  end
end



end
end
end)

function Killsteal()
        for i,enemy in pairs(GetEnemyHeroes()) do
      -- GetPredictionForPlayer(startPosition, targetUnit, targetUnitMoveSpeed, spellTravelSpeed, spellDelay, spellRange, spellWidth, collision, addHitBox)
            if CanUseSpell(myHero, _R) == READY and ValidTarget(enemy,GetCastRange(myHero,_R)) and AutoRConfig.R and GetCurrentHP(enemy) < CalcDamage(myHero, enemy, 0,  (math.max(90*GetCastLevel(myHero,_R)+70+.75*GetBonusDmg(myHero),(90*GetCastLevel(myHero,_R)+70+.75*GetBonusDmg(myHero))*2))) then
    CastTargetSpell(enemy, _R)
            end
        end
end
end
