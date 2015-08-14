if GetObjectName(GetMyHero()) == "Rengar" then
-- PrintChat
local info = "Evolved Rengar Loaded"
local upv = "Upvote if you like it!"
local sig = "Made by Asserio"
local ver = "v 1.0"
textTable = {info,upv,sig,ver}
PrintChat(textTable[1])
PrintChat(textTable[2])
PrintChat(textTable[3])
PrintChat(textTable[4])
-- Menu
Config = scriptConfig("Rengar", "Rengar")
Config.addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
Config.addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
Config.addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
DrawingsConfig = scriptConfig("Drawings", "Drawings:")
DrawingsConfig.addParam("DrawW","Draw W", SCRIPT_PARAM_ONOFF, true)
DrawingsConfig.addParam("DrawE","Draw E", SCRIPT_PARAM_ONOFF, true)
-- Start
OnLoop(function(myHero)
local hp = GetCurrentHP(myHero)
local maxhp = GetMaxHP(myHero)
Drawings()
	if Config.W and GetCurrentMana(myHero) == 5 then
		if CanUseSpell(myHero, _W) and (hp/maxhp) < 0.4 then
			CastSpell(_W)
		end
	end

local unit = GetCurrentTarget()
if ValidTarget(unit, 1400) then
if IWalkConfig.Combo then
Ferocyti()

-- Rengar E
	if Config.E then
		-- GetPredictionForPlayer(startPosition, targetUnit, targetUnitMoveSpeed, spellTravelSpeed, spellDelay, spellRange, spellWidth, collision, addHitBox)
		local EPred = GetPredictionForPlayer(GetMyHeroPos(),unit,GetMoveSpeed(unit),1500,250,GetCastRange(myHero, _E),70,true,true)
			if GetCurrentMana(myHero) ~= 5 then
				if CanUseSpell(myHero, _E) == READY and EPred.HitChance == 1 then
					CastSkillShot(_E,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)
				end
			end
		end
	end
-- Rengar Q
	if Config.Q then
		if GetCurrentMana(myHero) ~= 5 then
			if CanUseSpell(myHero, _Q) == READY and IsInDistance(unit, GetCastRange(myHero,_Q)) then
				CastSpell(_Q)
			end
		end
	end
-- Rengar W
	if Config.W then
		if GetCurrentMana(myHero) ~= 5 then
			if CanUseSpell(myHero, _W) == READY and IsInDistance(unit, GetCastRange(myHero,_W)) then
				CastSpell(_W)
			end
		end
	end

end
end)

function Ferocyti()
local hp = GetCurrentHP(myHero)
local maxhp = GetMaxHP(myHero)
local unit = GetCurrentTarget()
if ValidTarget(unit, 1400) then

-- Rengar E
	if Config.E and (hp/maxhp) > 0.4 and (GetCurrentHP(unit)/GetMaxHP(unit)) > 0.3 and GetCurrentMana(myHero) == 5 then
		local EPred = GetPredictionForPlayer(GetMyHeroPos(),unit,GetMoveSpeed(unit),1500,250,GetCastRange(myHero, _E),70,true,true)
			if CanUseSpell(myHero, _E) == READY and EPred.HitChance == 1 then
				CastSkillShot(_E,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)
			end
		end
	end
-- Rengar Q
	if Config.Q and (hp/maxhp) > 0.4 and (GetCurrentHP(unit)/GetMaxHP(unit)) < 0.3 and GetCurrentMana(myHero) == 5 then
		if CanUseSpell(myHero, _Q) == READY and IsInDistance(unit, GetCastRange(myHero, _Q)) then
			CastSpell(_Q)
		end
	end
end

function Drawings()
myHeroPos = GetOrigin(myHero)
if CanUseSpell(myHero, _W) == READY and DrawingsConfig.DrawW then DrawCircle(myHeroPos.x,myHeroPos.y,myHeroPos.z,GetCastRange(myHero,_W),3,100,0xff00ff00) end
if CanUseSpell(myHero, _E) == READY and DrawingsConfig.DrawE then DrawCircle(myHeroPos.x,myHeroPos.y,myHeroPos.z,GetCastRange(myHero,_E),3,100,0xff00ffc00) end
end
end

