if GetObjectName(GetMyHero()) == "Malzahar" then
-- Menu
Config = scriptConfig("IMalzahar", "Malzahar")
Config.addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
Config.addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
Config.addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
Config.addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
-- PrintChat
local info = "Evolved Malzahar Loaded"
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
	local currmana = GetCurrentMana(myHero)
	local unit = GetCurrentTarget()
	if ValidTarget(unit, 1000) then
	if GetCurrentMana(myHero) >= qcost() + wcost() + ecost() + rcost() then
			if Config.E then
			if CanUseSpell(myHero, _E) == READY and GetCastRange(myHero, _E) then
			if isRcasting then return end
			CastTargetSpell(unit, _E)
			end
			end


			if CanUseSpell(myHero, _Q) == READY and Config.Q then
			local QPred = GetPredictionForPlayer(GetMyHeroPos(),unit,GetMoveSpeed(unit),math.huge,1000,GetCastRange(myHero, _Q),85,false,true)
			if QPred.HitChance == 1 then
			if isRcasting then return end
			CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
			end
			end



			if CanUseSpell(myHero, _W) == READY and Config.W then
			local WPred = GetPredictionForPlayer(GetMyHeroPos(),unit,GetMoveSpeed(unit),math.huge,1000,GetCastRange(myHero, _W),250,false,true)
			if WPred.HitChance == 1 then
			CastSkillShot(_W,WPred.PredPos.x,WPred.PredPos.y,WPred.PredPos.z)
			end
			end



			if Config.R then
			if GetCastRange(myHero, _R) and CanUseSpell(myHero, _Q) ~= READY and CanUseSpell(myHero, _W) ~= READY and CanUseSpell(myHero, _E) ~= READY and CanUseSpell(myHero, _R) ~= ONCOOLDOWN then
			HoldPosition()
			CastTargetSpell(unit, _R)
			end
			end
		end
	end
end
end)
end

OnLoop(function(myHero)
	local unit = GetCurrentTarget()
		if ValidTarget(unit, 1000) then
	if IWalkConfig.Harass then

		if Config.E then
			if CanUseSpell(myHero, _E) == READY and GetCastRange(myHero, _E) then
			CastTargetSpell(unit, _E)
			end
			end


			if CanUseSpell(myHero, _Q) == READY and Config.Q then
			local QPred = GetPredictionForPlayer(GetMyHeroPos(),unit,GetMoveSpeed(unit),math.huge,1000,GetCastRange(myHero, _Q),85,false,true)
			if QPred.HitChance == 1 then
			CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
			end
			end
	end
end
end)

OnProcessSpell(function(unit, spell)


                if unit and unit == myHero and spell then





                if spell.name:lower():find("alzaharnethergrasp") then





                waitTickCount = GetTickCount() + 2500




				end





				end


end)


function qcost()

	if GetCastLevel(myHero, _Q) == 0 then
		return 0
	end

	if GetCastLevel(myHero, _Q) == 1 then
		return 80
	end

	if GetCastLevel(myHero, _Q) == 2 then
		return 85
	end

	if GetCastLevel(myHero, _Q) == 3 then
		return 90
	end

	if GetCastLevel(myHero, _Q) == 4 then
		return 95
	end

	if GetCastLevel(myHero, _Q) == 5 then
		return 100
	end
end

function wcost()

	if GetCastLevel(myHero, _W) == 0 then
		return 0
	end

	if GetCastLevel(myHero, _W) == 1 then
		return 90
	end

	if GetCastLevel(myHero, _W) == 2 then
		return 95
	end

	if GetCastLevel(myHero, _W) == 3 then
		return 100
	end

	if GetCastLevel(myHero, _W) == 4 then
		return 105
	end

	if GetCastLevel(myHero, _W) == 5 then
		return 110
	end
end

function ecost()

	if GetCastLevel(myHero, _E) == 0 then
		return 0
	end

	if GetCastLevel(myHero, _E) == 1 then
		return 60
	end

	if GetCastLevel(myHero, _E) == 2 then
		return 75
	end

	if GetCastLevel(myHero, _E) == 3 then
		return 90
	end

	if GetCastLevel(myHero, _E) == 4 then
		return 105
	end

	if GetCastLevel(myHero, _E) == 5 then
		return 120
	end
end

function rcost()

	if GetCastLevel(myHero, _R) == 0 then
		return 0
	end

	if GetCastLevel(myHero, _R) == 1 then
		return 100
	end

	if GetCastLevel(myHero, _R) == 2 then
		return 100
	end

	if GetCastLevel(myHero, _R) == 3 then
		return 100
	end
end
