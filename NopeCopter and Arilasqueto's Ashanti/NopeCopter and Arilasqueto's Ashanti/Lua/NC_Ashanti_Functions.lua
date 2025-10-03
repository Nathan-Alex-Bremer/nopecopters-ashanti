-- Ashanti_Functions
-- Author: NopeCopter
-- DateCreated: 7/23/2025
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
include("FLuaVector.lua")
include("PlotIterators.lua")
include("RouteConnections.lua")
--include("UniqueDiplomacyUtilsV2.lua")
--==========================================================================================================================
-- GLOBALS
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
local g_ConvertTextKey  = Locale.ConvertTextKey
local g_MapGetPlot		= Map.GetPlot
local g_MathCeil		= math.ceil
local g_MathFloor		= math.floor
local g_MathMax			= math.max
local g_MathMin			= math.min

local Players 			= Players
local HexToWorld 		= HexToWorld
local ToHexFromGrid 	= ToHexFromGrid
local Teams 			= Teams
--==========================================================================================================================
-- UTILITIES
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- CORE UTILITIES
------------------------------------------------------------------------------------------------------------------------
--HasTrait
function HasTrait(player, traitID)
	if Player.HasTrait then 
		return player:HasTrait(traitID)
	else
		local leaderType = GameInfo.Leaders[player:GetLeaderType()].Type
		local traitType  = GameInfo.Traits[traitID].Type
		for row in GameInfo.Leader_Traits("LeaderType = '" .. leaderType .. "' AND TraitType = '" .. traitType .. "'") do
			return true
		end
	end
	return false
end

----------------------------------------------------------------------------------------------------------------------------
-- JFD_IsCivilisationActive
function JFD_IsCivilizationActive(civilizationID)
	for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
			if PreGame.GetCivilization(iSlot) == civilizationID then
				return true
			end
		end
	end
	return false
end

function Neirai_GetNearestCity(pPlayer, pPlot)
    local distance = 9999
    local cNearestCity = nil
    for cCity in pPlayer:Cities() do
        local pCityPlot = cCity:Plot()
        local between = Map.PlotDistance(pCityPlot:GetX(), pCityPlot:GetY(), pPlot:GetX(), pPlot:GetY())
        if (between < distance) and (between > 0) then
            distance = between
            cNearestCity = cCity
        end
    end
    return cNearestCity
end

function GetTradeRoutesFromCity(pCity)
	local pOwner = Players[pCity:GetOwner()]
	local tLocalRoutes = {}
	local iVal = 1
	for k, v in pairs(pOwner:GetTradeRoutes()) do
		if v.FromCity == pCity then
			tLocalRoutes[iVal] = v
			iVal = iVal + 1
		end
	end
	return tLocalRoutes
end

function GetNumTradeRoutesFromCity(pCity)
	local pOwner = Players[pCity:GetOwner()]
	local iVal = 1
	for k, v in pairs(pOwner:GetTradeRoutes()) do
		if v.FromCity == pCity then
			iVal = iVal + 1
		end
	end
	return iVal
end

------------------------------------------------------------------------------------------------------------------------
-- GetPlayerByCivilization
------------------------------------------------------------------------------------------------------------------------
function GetPlayerByCivilization(civilizationType)
	for _, pPlayer in pairs(Players) do
		if pPlayer and pPlayer:GetCivilizationType() == civilizationType then 
			return pPlayer
		end
	end
end
------------------------------------------------------------------------------------------------------------------------
-- MOD UTILITIES
------------------------------------------------------------------------------------------------------------------------
--Game_IsCPActive
function Game_IsCPActive()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "d1b6328c-ff44-4b0d-aad7-c657f83610cd" then
			return true
		end
	end
	return false
end
local g_IsCPActive = (Game_IsCPActive() and Player.HasStateReligion)
------------------------------------------------------------------------------------------------------------------------
--Game_IsVMCActive
function Game_IsVMCActive()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "d1b6328c-ff44-4b0d-aad7-c657f83610cd" then
			return true
		end
	end
	return false
end
local g_IsVMCActive = Game_IsVMCActive()
--==========================================================================================================================
-- GAME DEFINES
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
local defineMaxMajorCivs = GameDefines["MAX_MAJOR_CIVS"]
local defineMaxMinorCivs = GameDefines["MAX_MINOR_CIVS"]
--==========================================================================================================================
-- UNIQUE FUNCTIONS
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local civilizationBarbarianID = 63
local civilizationID = GameInfoTypes["CIVILIZATION_NC_ASHANTI_YAA_ASANTEWAA"]
local bIsActive = JFD_IsCivilizationActive(civilizationID)
local traitAshantiID = GameInfoTypes["TRAIT_NC_ASHANTI_YAA_ASANTEWAA"]

local unitGyaseID = GameInfoTypes["UNIT_NC_GYASE"]
local buildingEpieID = GameInfoTypes["BUILDING_NC_EPIE"]

local iPracticalNumCivs = (GameDefines.MAX_MAJOR_CIVS - 1)

-- Dummies
local buildingGoldenStoolID = GameInfoTypes["BUILDING_NC_GOLDEN_STOOL"]
local buildingGoldenStoolDummyID = GameInfoTypes["BUILDING_DUMMY_NC_GOLDEN_STOOL_BUILD"]
local buildingGyaseProductionDummyID = GameInfoTypes["BUILDING_DUMMY_NC_ASHANTI_GYASE_PRODUCTION"]
local buildingGeneralGarrisonDummyID = GameInfoTypes["BUILDING_DUMMY_NC_ASHANTI_GENERAL_GARRISON"]

local promotionGyaseID = GameInfoTypes["PROMOTION_NC_ASHANTI_GYASE"]
local promotionGyaseGeneralBonusID = GameInfoTypes["PROMOTION_NC_ASHANTI_GYASE_GENERAL"]
local promotionGeneralInCityID = GameInfoTypes["PROMOTION_NC_ASHANTI_GENERAL_IN_CITY"]
local promotionExtendedGeneralID = GameInfoTypes["PROMOTION_NC_ASHANTI_GENERAL_EXTENDED"]

-------------------------------------------------------------------------------------------------------
-- FUNCTIONS
------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------
-- UA: Begin with the Golden Stool, a special building with a Great Work of Art slot and an Artist specialist which can be moved by building it in other cities
----------------------------------------------------------------------------------------------------------------------------

-- Track Golden Stool location on game start
-- Note that because of how this is set up having multiple Ashanti civs in the game just won't work, sorry
local stoolLocationX = 0
local stoolLocationY = 0
local stoolOwner = 0

function NC_Ashanti_UA_CheckMapAtGameStart()
	for iPlayer = 0, defineMaxMajorCivs - 1 do
		local pPlayer = Players[iPlayer]
		if pPlayer and pPlayer:IsAlive() then
			-- print("Checking player")
			if pPlayer:GetCapitalCity() then
				for cCity in pPlayer:Cities() do
					-- print("Checking player city")
					if cCity:IsHasBuilding(buildingGoldenStoolID) then
						-- print("Found Golden Stool city!")
						stoolLocationX = cCity:GetX()
						stoolLocationY = cCity:GetY()
						return -- Since there should only ever be one Golden Stool
					end
				end
			end
		end
	end
end

if bIsActive then
	Events.SequenceGameInitComplete.Add(NC_Ashanti_UA_CheckMapAtGameStart)
end

-- Give Golden Stool to Ashanti capital on founding
function NC_Ashanti_UA_CityFounded(playerID, iX, iY)
	-- print("NC_Ashanti_UA_CityFounded: Running")
	local pPlayer = Players[playerID]
	if (not pPlayer:IsAlive()) then return end
	if pPlayer:IsBarbarian() then return end
	if pPlayer:IsMinorCiv() then return end
	if not HasTrait(pPlayer, traitAshantiID) then return end -- Feels weird to have HasTrait here, maybe change just for consistency
	
	-- print("NC_Ashanti_UA_CityFounded: Ashanti city founded")
	local city = Map.GetPlot(iX, iY):GetPlotCity()
	
	if city:IsOriginalCapital() then
		city:SetNumRealBuilding(buildingGoldenStoolID, 1)
		stoolLocationX = iX
		stoolLocationY = iY
		-- print("NC_Ashanti_UA_CityFounded: City is capital, adding Golden Stool")
	end
	
	city:SetNumRealBuilding(buildingGoldenStoolDummyID, 1)
end

if bIsActive then
	GameEvents.PlayerCityFounded.Add(NC_Ashanti_UA_CityFounded)
end


-- Check whether city can construct Golden Stool
-- TODO: Check whether players without the Golden Stool can even see the option to build it!
function NC_Ashanti_UA_CityCanConstruct(playerID, cityID, buildingID)
	-- print("NC_Ashanti_UA_CityCanConstruct: Running")
	if buildingID ~= buildingGoldenStoolID then return true end
	local pPlayer = Players[playerID]
	local pCity = pPlayer:GetCityByID(cityID)
	local pPlot = pCity:Plot()
	
	-- print("NC_Ashanti_UA_CityCanConstruct: Valid player")
	
	local hasGoldenStool = false
	local buildingGoldenStool = false
	
	-- Don't bother checking if the Golden Stool is already in this city
	if pCity:GetNumRealBuilding(buildingGoldenStoolID) > 0 then
		-- print("NC_Ashanti_UA_CityCanConstruct: Valid city")
		return false 
		
		
	else
		for otherCity in pPlayer:Cities() do
			if otherCity:IsHasBuilding(buildingGoldenStoolID) then
				hasGoldenStool = true
				-- print("NC_Ashanti_UA_CityCanConstruct: Player has Golden Stool")
			end
			
			if otherCity:GetProductionBuilding() == buildingGoldenStoolID and otherCity:GetID() ~= cityID then
				buildingGoldenStool = true
				-- print("NC_Ashanti_UA_CityCanConstruct: Player is building Golden Stool")
			end
		end
	end
	
	if hasGoldenStool and (not buildingGoldenStool) then
		-- print("NC_Ashanti_UA_CityCanConstruct: Returning TRUE")
		return true
	end
	
	return false
end
GameEvents.CityCanConstruct.Add(NC_Ashanti_UA_CityCanConstruct)

-- When constructed, remove all other Golden Stools
local iGoldenStoolClass = GameInfoTypes["BUILDINGCLASS_DUMMY_NC_GOLDEN_STOOL"]
function NC_Ashanti_UA_CityConstructed(playerID, cityID, buildingType)
	if buildingType == buildingGoldenStoolID then
		local pPlayer = Players[playerID]
		local pCity = pPlayer:GetCityByID(cityID)
		
		local hasGoldenStool = false
		for otherCity in pPlayer:Cities() do
			if not (otherCity:GetID() == cityID) then
				if otherCity:GetNumRealBuilding(buildingGoldenStoolID) > 0 then
					hasGoldenStool = true
					-- Moving the Great Work
					if otherCity:IsHoldingGreatWork(iGoldenStoolClass) then
						-- print("Great work found!")
						local iStoolGreatWork = otherCity:GetBuildingGreatWork(iGoldenStoolClass, 0)
						pCity:SetBuildingGreatWork(iGoldenStoolClass, 0, iStoolGreatWork)
						otherCity:SetBuildingGreatWork(iGoldenStoolClass, 0, -1)
					end
					otherCity:SetNumRealBuilding(buildingGoldenStoolID, 0)
				end
			end
		
		end
		
		-- If you happen to lose the Golden Stool mid-move, and so you don't have it when you finish building it, remove the one that just got built
		if not (hasGoldenStool) then
			pCity:SetNumRealBuilding(buildingGoldenStoolID, 0)
		else
			-- Update Golden Stool location
			stoolLocationX = pCity:GetX()
			stoolLocationY = pCity:GetY()
		end
	end
end
GameEvents.CityConstructed.Add(NC_Ashanti_UA_CityConstructed)

----------------------------------------------------------------------------------------------------------------------------
-- UA: Great Works generate Great General Points while at war
----------------------------------------------------------------------------------------------------------------------------

function NC_Ashanti_UA_UU_PlayerDoTurn(playerID)
	local pPlayer = Players[playerID]
	local iEra = pPlayer:GetCurrentEra()
	if pPlayer == nil then return end
	if not pPlayer:IsAlive() then return end
	if pPlayer:GetCivilizationType() ~= civilizationID then return end
	local pTeam = Teams[pPlayer:GetTeam()]
	
	if pTeam:GetAtWarCount(true) > 0 then
		for city in pPlayer:Cities() do	
			-- UA
			local iGWCount = city:GetNumGreatWorks()
			pPlayer:ChangeCombatExperience(iGWCount * (iEra + 1)) -- TODO: Balance this number
			
			-- UU Production bonus
			if city:GetProductionUnit() == unitGyaseID then
				city:SetNumRealBuilding(buildingGyaseProductionDummyID, (iGWCount * 5), true) -- TODO: Balance this number
			else
				city:SetNumRealBuilding(buildingGyaseProductionDummyID, 0, true)
			end
		end
	end
	
end

if bIsActive then
	GameEvents.PlayerDoTurn.Add(NC_Ashanti_UA_UU_PlayerDoTurn)
end

----------------------------------------------------------------------------------------------------------------------------
-- UU: Constructed faster and with more starting Movement per Great Work present in the city it’s trained in
----------------------------------------------------------------------------------------------------------------------------
-- Adapted from JFD's Pius IX
local function NC_Ashanti_UU_CityTrained(playerID, cityID, unitID)
	local player = Players[playerID]
	local playerTeamID = player:GetTeam()
	local playerTeam = Teams[playerTeamID]
	if (not player:IsAlive()) then return end
	
	--UU
	local unit = player:GetUnitByID(unitID)
	if unit:GetUnitType() == unitGyaseID then
	
		local city = player:GetCityByID(cityID)
		local iGWCount = city:GetNumGreatWorks()

		local numMovesMult = 30
		if iGWCount > 0 then
			unit:ChangeMoves(iGWCount * numMovesMult)
		end
		
		if unit:IsNearGreatGeneral() then
			unit:SetHasPromotion(promotionGyaseGeneralBonusID, true)
		end
	end
	
end
GameEvents.CityTrained.Add(NC_Ashanti_UU_CityTrained)

----------------------------------------------------------------------------------------------------------------------------
-- UU: Increased bonus when near a Great General
----------------------------------------------------------------------------------------------------------------------------
-- AND
----------------------------------------------------------------------------------------------------------------------------
-- UB: Great Generals fortified in the city extend their effect to all tiles in the city
----------------------------------------------------------------------------------------------------------------------------
-- AAAND
----------------------------------------------------------------------------------------------------------------------------
-- UB:  Great Generals fortified in the city passively damage enemy units on Roads
----------------------------------------------------------------------------------------------------------------------------
-- For Great Generals: check if they've moved out of a city or if they've just started in a city, do some funky loops
-- For all other units: check if they've moved into or out of a city
-- For UU: also provide fancy bonus

local unitGreatGeneralID = GameInfoTypes["UNIT_GREAT_GENERAL"] -- is this right
local domainLandID = GameInfoTypes["DOMAIN_LAND"]
function NC_Ashanti_UB_UnitSetXY(playerID, unit)
    local pPlayer = Players[playerID]
    local pUnit = pPlayer:GetUnitByID(unit)
	
	-- Check whether player is Ashanti
	if not (pPlayer:GetCivilizationType() == civilizationID) then return end
	-- Check whether the tile can be pillaged
	local pPlot = pUnit:GetPlot()
	if not pPlot then return end -- This should help with some weird errors
	local pPlotOwner = Players[pPlot:GetOwner()]
	local pCity = pPlot:GetWorkingCity()
	
	-- If the unit is a Great General, then if it's just left a city, we need to do some looping
	if pUnit:GetUnitType() == unitGreatGeneralID then
		if pUnit:IsHasPromotion(promotionGeneralInCityID) then
			-- Iterate over adjacent plot to find the city the GG just left
			for nearbyPlot in PlotAreaSweepIterator(pPlot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
				if nearbyPlot:IsCity() then
					local pAdjacentCity = nearbyPlot:GetPlotCity()
					-- Check whether the city has a GG garrison dummy but no GG inside
					if pAdjacentCity:GetOwner() == playerID and pAdjacentCity:IsHasBuilding(buildingGeneralGarrisonDummyID) then
						local hasGG = false
						local iNumUnits = nearbyPlot:GetNumUnits()
						if iNumUnits > 0 then
							for i = 0, (iNumUnits - 1), 1 do
								local nearbyPlotUnit = nearbyPlot:GetUnit(i)
								if nearbyPlotUnit and nearbyPlotUnit:GetUnitType() == unitGreatGeneralID and nearbyPlotUnit:GetOwner() == playerID then
									hasGG = true
									break
								end
							end
						end
						
						-- If we didn't find a Great General, remove the dummy and all the promotions
						if not hasGG then
							pUnit:SetHasPromotion(promotionGeneralInCityID, false)
							pAdjacentCity:SetNumRealBuilding(buildingGeneralGarrisonDummyID, 0)
							
							-- Removing promotions from all units in the city
							for i = 0, pAdjacentCity:GetNumCityPlots(), 1 do
								local pCityPlot = pAdjacentCity:GetCityIndexPlot(i)
								if pCityPlot:GetWorkingCity() == pAdjacentCity then
									local iNumUnits = pCityPlot:GetNumUnits()
									if iNumUnits > 0 then
										for i = 0, (iNumUnits - 1), 1 do
											local cityPlotUnit = pCityPlot:GetUnit(i)
											if cityPlotUnit and cityPlotUnit:IsHasPromotion(promotionExtendedGeneralID) then
												cityPlotUnit:SetHasPromotion(promotionExtendedGeneralID, false) -- Probably some ways to clean this up
												cityPlotUnit:SetHasPromotion(promotionGyaseGeneralBonusID, false) -- Only gets removed from UUs that weren't within two tiles
												-- This DOES have the unfortunate side effect of not updating UUs properly but the only way to fix that would be to commit a cardinal sin
												-- (UnitSetXY + iteration), which I am doing already but this would be SO MUCH WORSE since you'd need to check 2 tiles out every time a GG moved
											end
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end
	
	local giveCombatPromo = false
	local giveUUPromo = false
	if pUnit:IsCombatUnit() and pUnit:GetDomainType() == domainLandID and not (pUnit:IsNearGreatGeneral()) then
		if pCity and pCity:GetOwner() == playerID then
			if pCity:IsHasBuilding(buildingGeneralGarrisonDummyID) then
				giveCombatPromo = true
			end
		end
	end
	pUnit:SetHasPromotion(promotionExtendedGeneralID, giveCombatPromo)
	
	-- Handling updates to the UU's bonus
	if pUnit:IsHasPromotion(promotionGyaseID) then
		if pUnit:IsHasPromotion(promotionExtendedGeneralID) or pUnit:IsNearGreatGeneral() then
			giveUUPromo = true
		end
		pUnit:SetHasPromotion(promotionGyaseGeneralBonusID, giveUUPromo)
	end
	
end


function NC_Ashanti_UB_PlayerDoTurn(playerID)
	local pPlayer = Players[playerID]
	local iEra = pPlayer:GetCurrentEra()
	if pPlayer == nil then return end
	if not pPlayer:IsAlive() then return end
	if pPlayer:GetCivilizationType() ~= civilizationID then return end
	
	local pTeam = Teams[pPlayer:GetTeam()]
	
	for city in pPlayer:Cities() do	
		if city:IsHasBuilding(buildingEpieID) then
			local pCityPlot = city:Plot()
			local iNumUnits = pCityPlot:GetNumUnits()
			if iNumUnits > 0 then
				for i = 0, (iNumUnits - 1), 1 do
					local cityPlotUnit = pCityPlot:GetUnit(i)
					if cityPlotUnit and cityPlotUnit:GetOwner() == playerID and cityPlotUnit:GetUnitType() == unitGreatGeneralID then
						-- City has GG, apply bonus to any units not already getting the GG bonus and add Dummies
						cityPlotUnit:SetHasPromotion(promotionGeneralInCityID, true)
						city:SetNumRealBuilding(buildingGeneralGarrisonDummyID, 1)
						
						for i = 0, city:GetNumCityPlots(), 1 do
							local pCityPlot = city:GetCityIndexPlot(i)
							if pCityPlot:GetWorkingCity() == city then
								local iNumUnits = pCityPlot:GetNumUnits()
								if iNumUnits > 0 then
									for i = 0, (iNumUnits - 1), 1 do
										local cityPlotUnit = pCityPlot:GetUnit(i)
										if cityPlotUnit then
											-- Applying GG bonus to all units in city
											if cityPlotUnit:GetOwner() == playerID then
												if cityPlotUnit:IsCombatUnit() and cityPlotUnit:GetDomainType() == domainLandID and not (cityPlotUnit:IsNearGreatGeneral()) then
													cityPlotUnit:SetHasPromotion(promotionExtendedGeneralID, true) -- Probably some ways to clean this up
												end
											
											-- Applying damage to enemy units on roads
											else
												local iOtherTeam = cityPlotUnit:GetTeam()
												if pCityPlot:IsRoute() and not (pCityPlot:IsRoutePillaged()) and pTeam:IsAtWar(iOtherTeam) then
													cityPlotUnit:ChangeDamage(25) -- TODO: This subtracts health right
												end
											end
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end
	
	-- Setting Gyase bonus (band-aid fix for the fact that it doesn't quite work perfectly on UnitSetXY)
	for unit in pPlayer:Units() do
		if unit:IsHasPromotion(promotionGyaseID) then
			if unit:IsHasPromotion(promotionExtendedGeneralID) or unit:IsNearGreatGeneral() then
				unit:SetHasPromotion(promotionGyaseGeneralBonusID, true)
			else
				unit:SetHasPromotion(promotionGyaseGeneralBonusID, false)
			end
		end
	end
	
end

-- TODO: Add check to remove bonus if a city is captured with a GG inside

if bIsActive then
	GameEvents.UnitSetXY.Add(NC_Ashanti_UB_UnitSetXY)
	GameEvents.PlayerDoTurn.Add(NC_Ashanti_UB_PlayerDoTurn)
end



----------------------------------------------------------------------------------------------------------------------------
-- UB:  Units killed in this city generate Culture the further they were killed from the Golden Stool
----------------------------------------------------------------------------------------------------------------------------

-- Checking when a unit has been killed, to add dummy buildings to the cities
function NC_Ashanti_UB_UnitPrekill(playerID, unitID, unitType, iX, iY, bDelay, killerID)
	
	if bDelay then
		if (playerID == civilizationBarbarianID) then return end
		local pPlot = Map.GetPlot(iX, iY)
		local pPlayer = Players[playerID]
		local pKiller = Players[killerID]
		
		if not pPlot then return end
		if not pPlayer:IsAlive() then return end
		local pUnit = pPlayer:GetUnitByID(unitID)
		
		-- If the unit was actually killed
		if killerID ~= -1 and killerID ~= playerID then
			local pPlotOwner = Players[pPlot:GetOwner()]
			-- If the unit was killed in Ashanti lands
			if pPlotOwner and pPlotOwner:IsAlive() and pPlotOwner:GetCivilizationType() == civilizationID then
				-- If it wasn't an Ashanti unit that died
				if pPlot:GetOwner() ~= playerID then
					-- Get the distance between the plot the unit died on and the Golden Stool plot, and give Culture accoerdingly
					local between = Map.PlotDistance(stoolLocationX, stoolLocationY, pPlot:GetX(), pPlot:GetY()) -- TODO: This works, right
					-- print(stoolLocationX .. ", " .. stoolLocationY)
					-- print(pPlot:GetX() .. ", " .. pPlot:GetY())
					-- print("Distance to Stool: " .. between)
					pPlotOwner:ChangeJONSCulture(between) -- TODO: Balance this value!
				end
			end
		end
	end
end

if bIsActive then
	GameEvents.UnitPrekill.Add(NC_Ashanti_UB_UnitPrekill)
end

print("NC_Ashanti_Functions.lua loaded!")