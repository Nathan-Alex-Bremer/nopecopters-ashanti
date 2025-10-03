--=======================================================================================================================
-- MASTER TABLES
--=======================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS CustomModOptions(Name Text, Value INTEGER, Class INTEGER, DbUpdates INTEGER);
--=======================================================================================================================	
-- BUILDINGS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------	
-- Buildings
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Buildings 																																		 																																							 
		(Type, 				BuildingClass, ExtraCityHitPoints, Defense, Cost, FaithCost, SpecialistType, SpecialistCount, UnlockedByBelief, GoldMaintenance,  FreeStartEra, PrereqTech, Description,				Help, 								Strategy, 								Civilopedia, 						ArtDefineTag, MinAreaSize, HurryCostModifier, IconAtlas,								ConquestProb, PortraitIndex)
SELECT	'BUILDING_NC_EPIE',	BuildingClass, ExtraCityHitPoints, Defense, Cost, FaithCost, SpecialistType, SpecialistCount, UnlockedByBelief, GoldMaintenance,  FreeStartEra, PrereqTech, 'TXT_KEY_BUILDING_NC_EPIE', 'TXT_KEY_BUILDING_NC_EPIE_HELP', 	'TXT_KEY_BUILDING_NC_EPIE_STRATEGY',  	'TXT_KEY_BUILDING_NC_EPIE_TEXT',  	ArtDefineTag, MinAreaSize, HurryCostModifier, 'NC_ASHANTI_YAA_ASANTEWAA_ICON_ATLAS',	ConquestProb, 3
FROM Buildings WHERE Type = 'BUILDING_ARSENAL';
------------------------------------------------------------------------------------------------------------------------	
-- Building_YieldModifiers
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_YieldModifiers 	
		(BuildingType, 						YieldType,  Yield)
SELECT	'BUILDING_NC_EPIE',	YieldType,  Yield
FROM Building_YieldModifiers WHERE BuildingType = 'BUILDING_ARSENAL';	
------------------------------------------------------------------------------------------------------------------------	
-- Building_YieldChanges
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_YieldChanges 		
		(BuildingType, 						YieldType, Yield)
SELECT	'BUILDING_NC_EPIE',	YieldType, Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_ARSENAL';	
------------------------------------------------------------------------------------------------------------------------	
-- Building_FeatureYieldChanges
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_FeatureYieldChanges 	
		(BuildingType, 						FeatureType, YieldType, Yield)
SELECT	'BUILDING_NC_EPIE',	FeatureType, YieldType, Yield
FROM Building_FeatureYieldChanges WHERE BuildingType = 'BUILDING_ARSENAL';	
------------------------------------------------------------------------------------------------------------------------	
-- Building_ResourceYieldChanges
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_ResourceYieldChanges 	
		(BuildingType, 						ResourceType, YieldType, Yield)
SELECT	'BUILDING_NC_EPIE',	ResourceType, YieldType, Yield
FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_ARSENAL';	
------------------------------------------------------------------------------------------------------------------------	
-- Building_ClassesNeededInCity
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 						BuildingClassType)
SELECT	'BUILDING_NC_EPIE',	BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_ARSENAL';	
------------------------------------------------------------------------------------------------------------------------	
-- Building_Flavors
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_Flavors 	
		(BuildingType, 						FlavorType, Flavor)
SELECT	'BUILDING_NC_EPIE',	FlavorType, Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_ARSENAL';

INSERT INTO Building_Flavors
		(BuildingType, 				FlavorType, 				Flavor)
VALUES	('BUILDING_NC_EPIE', 'FLAVOR_CULTURE',  			 15);
--=======================================================================================================================	
-- UNITS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO UnitPromotions 
		(Type, 										LostWithUpgrade,  Description, 										Help, 													Sound, 				CannotBeChosen, PortraitIndex, 	IconAtlas, 			PediaType, 			 PediaEntry)
VALUES	('PROMOTION_NC_ASHANTI_GYASE',				0,				  'TXT_KEY_PROMOTION_NC_ASHANTI_GYASE',				'TXT_KEY_PROMOTION_NC_ASHANTI_GYASE_HELP', 				'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES',  'TXT_KEY_PROMOTION_NC_ASHANTI_GYASE'),
		('PROMOTION_NC_ASHANTI_GYASE_GENERAL',		0,				  'TXT_KEY_PROMOTION_NC_ASHANTI_GYASE_GENERAL',		'TXT_KEY_PROMOTION_NC_ASHANTI_GYASE_GENERAL_HELP', 		'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES',  'TXT_KEY_PROMOTION_NC_ASHANTI_GYASE_GENERAL'),
		('PROMOTION_NC_ASHANTI_GENERAL_IN_CITY',	0,				  'TXT_KEY_PROMOTION_NC_ASHANTI_GENERAL_IN_CITY',	'TXT_KEY_PROMOTION_NC_ASHANTI_GENERAL_IN_CITY_HELP', 	'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES',  'TXT_KEY_PROMOTION_NC_ASHANTI_GENERAL_IN_CITY'),
		('PROMOTION_NC_ASHANTI_GENERAL_EXTENDED',	0,				  'TXT_KEY_PROMOTION_NC_ASHANTI_GENERAL_EXTENDED',	'TXT_KEY_PROMOTION_NC_ASHANTI_GENERAL_EXTENDED_HELP', 	'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES',  'TXT_KEY_PROMOTION_NC_ASHANTI_GENERAL_EXTENDED');

UPDATE UnitPromotions
SET OpenDefense = 15, RoughDefense = 15, OpenAttack = 15, RoughAttack = 15
WHERE Type = 'PROMOTION_NC_ASHANTI_GENERAL_EXTENDED';

UPDATE UnitPromotions
SET OpenDefense = 10, RoughDefense = 10, OpenAttack = 10, RoughAttack = 10
WHERE Type = 'PROMOTION_NC_ASHANTI_GYASE_GENERAL';
------------------------------------------------------------------------------------------------------------------------
-- Units
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Units 	
		(Type, 					Class, PrereqTech,			 	Combat,	Cost,    	FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, IgnoreBuildingDefense, GoodyHutUpgradeUnitClass, AdvancedStartCost, XPValueAttack, XPValueDefense, MoveRate, Description, 					Help, 										Strategy, 									Civilopedia, 							UnitArtInfo, 						UnitFlagAtlas,								UnitFlagIconOffset,		IconAtlas,								PortraitIndex)
SELECT	'UNIT_NC_GYASE',		Class, PrereqTech, 				Combat,	Cost, 		FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, IgnoreBuildingDefense, GoodyHutUpgradeUnitClass, AdvancedStartCost, XPValueAttack, XPValueDefense, MoveRate, 'TXT_KEY_UNIT_NC_GYASE',	'TXT_KEY_UNIT_NC_GYASE_HELP',		'TXT_KEY_UNIT_NC_GYASE_STRATEGY', 	'TXT_KEY_UNIT_NC_GYASE_TEXT',		'ART_DEF_UNIT_NC_GYASE',		'NC_ASHANTI_YAA_ASANTEWAA_UNIT_FLAG_ATLAS',		0,						'NC_ASHANTI_YAA_ASANTEWAA_ICON_ATLAS',		2
FROM Units WHERE Type = 'UNIT_RIFLEMAN';
------------------------------------------------------------------------------------------------------------------------		
-- Unit_AITypes
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Unit_AITypes 	
		(UnitType, 					UnitAIType)
SELECT	'UNIT_NC_GYASE',		UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_RIFLEMAN';
------------------------------------------------------------------------------------------------------------------------	
-- Unit_ClassUpgrades
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 					UnitClassType)
SELECT	'UNIT_NC_GYASE',		UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_RIFLEMAN';
------------------------------------------------------------------------------------------------------------------------	
-- Unit_Flavors
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Unit_Flavors 	
		(UnitType, 					FlavorType, Flavor)
SELECT	'UNIT_NC_GYASE',		FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_RIFLEMAN';
------------------------------------------------------------------------------------------------------------------------	
-- Unit_FreePromotions
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
SELECT	'UNIT_NC_GYASE', 		PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_RIFLEMAN';

INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
VALUES	('UNIT_NC_GYASE', 	'PROMOTION_NC_ASHANTI_GYASE');
------------------------------------------------------------------------------------------------------------------------	
-- UnitGameplay2DScripts
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 					SelectionSound,	FirstSelectionSound)
SELECT	'UNIT_NC_GYASE',		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_RIFLEMAN';		
--=======================================================================================================================	
-- LEADERS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Leaders
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Leaders 
		(Type, 							ArtDefineTag, 						Description, 								Civilopedia, 									CivilopediaTag, 										IconAtlas, 							PortraitIndex)
VALUES	('LEADER_NC_ASHANTI_YAA_ASANTEWAA', 	'yaa_ls.xml',		'TXT_KEY_LEADER_NC_ASHANTI_YAA_ASANTEWAA',		'TXT_KEY_LEADER_NC_ASHANTI_YAA_ASANTEWAA_PEDIA',		'TXT_KEY_CIVILOPEDIA_LEADERS_NC_ASHANTI_YAA_ASANTEWAA',		'NC_ASHANTI_YAA_ASANTEWAA_ICON_ATLAS', 	1);

UPDATE Leaders
SET VictoryCompetitiveness = 5,
WonderCompetitiveness = 5,
MinorCivCompetitiveness = 6,
Boldness = 8,
DiploBalance = 8,
WarmongerHate = 9,
DenounceWillingness = 9,
DoFWillingness = 4,
Loyalty = 7,
Neediness = 6,
Forgiveness = 4,
Chattiness = 5,
Meanness = 5
WHERE Type = 'LEADER_NC_ASHANTI_YAA_ASANTEWAA';	
------------------------------------------------------------------------------------------------------------------------		
-- Leader_MajorCivApproachBiases
------------------------------------------------------------------------------------------------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 					MajorCivApproachType, 				Bias)
VALUES	('LEADER_NC_ASHANTI_YAA_ASANTEWAA', 	'MAJOR_CIV_APPROACH_WAR', 			7),
		('LEADER_NC_ASHANTI_YAA_ASANTEWAA', 	'MAJOR_CIV_APPROACH_HOSTILE', 		8),
		('LEADER_NC_ASHANTI_YAA_ASANTEWAA', 	'MAJOR_CIV_APPROACH_DECEPTIVE',		5),
		('LEADER_NC_ASHANTI_YAA_ASANTEWAA', 	'MAJOR_CIV_APPROACH_GUARDED', 		7),
		('LEADER_NC_ASHANTI_YAA_ASANTEWAA', 	'MAJOR_CIV_APPROACH_AFRAID', 		3),
		('LEADER_NC_ASHANTI_YAA_ASANTEWAA', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		5),
		('LEADER_NC_ASHANTI_YAA_ASANTEWAA', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		6);
------------------------------------------------------------------------------------------------------------------------	
-- Leader_MajorCivApproachBiases
------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 					MinorCivApproachType, 				Bias)
VALUES	('LEADER_NC_ASHANTI_YAA_ASANTEWAA', 	'MINOR_CIV_APPROACH_IGNORE', 		6),
		('LEADER_NC_ASHANTI_YAA_ASANTEWAA', 	'MINOR_CIV_APPROACH_FRIENDLY', 		5),
		('LEADER_NC_ASHANTI_YAA_ASANTEWAA', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	7),
		('LEADER_NC_ASHANTI_YAA_ASANTEWAA', 	'MINOR_CIV_APPROACH_CONQUEST', 		5),
		('LEADER_NC_ASHANTI_YAA_ASANTEWAA', 	'MINOR_CIV_APPROACH_BULLY', 		6);
------------------------------------------------------------------------------------------------------------------------	
-- Leader_Flavors
------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_Flavors 
		(LeaderType, 					FlavorType, 						Flavor)
VALUES	('LEADER_NC_ASHANTI_YAA_ASANTEWAA', 	'FLAVOR_OFFENSE', 					7),
		('LEADER_NC_ASHANTI_YAA_ASANTEWAA', 	'FLAVOR_DEFENSE', 					9),
		('LEADER_NC_ASHANTI_YAA_ASANTEWAA', 	'FLAVOR_CITY_DEFENSE', 				5),
		('LEADER_NC_ASHANTI_YAA_ASANTEWAA', 	'FLAVOR_MILITARY_TRAINING', 		5),
		('LEADER_NC_ASHANTI_YAA_ASANTEWAA', 	'FLAVOR_RECON', 					6),
		('LEADER_NC_ASHANTI_YAA_ASANTEWAA', 	'FLAVOR_RANGED', 					6),
		('LEADER_NC_ASHANTI_YAA_ASANTEWAA', 	'FLAVOR_MOBILE', 					4),
		('LEADER_NC_ASHANTI_YAA_ASANTEWAA', 	'FLAVOR_NAVAL', 					4),
		('LEADER_NC_ASHANTI_YAA_ASANTEWAA', 	'FLAVOR_NAVAL_RECON', 				4),
		('LEADER_NC_ASHANTI_YAA_ASANTEWAA', 	'FLAVOR_NAVAL_GROWTH', 				4),
		('LEADER_NC_ASHANTI_YAA_ASANTEWAA', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	4),
		('LEADER_NC_ASHANTI_YAA_ASANTEWAA', 	'FLAVOR_AIR', 						5),
		('LEADER_NC_ASHANTI_YAA_ASANTEWAA', 	'FLAVOR_EXPANSION', 				6),
		('LEADER_NC_ASHANTI_YAA_ASANTEWAA', 	'FLAVOR_GROWTH', 					6),
		('LEADER_NC_ASHANTI_YAA_ASANTEWAA', 	'FLAVOR_TILE_IMPROVEMENT', 			6),
		('LEADER_NC_ASHANTI_YAA_ASANTEWAA', 	'FLAVOR_INFRASTRUCTURE', 			7),
		('LEADER_NC_ASHANTI_YAA_ASANTEWAA', 	'FLAVOR_PRODUCTION', 				7),
		('LEADER_NC_ASHANTI_YAA_ASANTEWAA', 	'FLAVOR_GOLD', 						5),
		('LEADER_NC_ASHANTI_YAA_ASANTEWAA', 	'FLAVOR_SCIENCE', 					5),
		('LEADER_NC_ASHANTI_YAA_ASANTEWAA', 	'FLAVOR_CULTURE', 					7),
		('LEADER_NC_ASHANTI_YAA_ASANTEWAA', 	'FLAVOR_HAPPINESS', 				5),
		('LEADER_NC_ASHANTI_YAA_ASANTEWAA', 	'FLAVOR_GREAT_PEOPLE', 				8),
		('LEADER_NC_ASHANTI_YAA_ASANTEWAA', 	'FLAVOR_WONDER', 					5),
		('LEADER_NC_ASHANTI_YAA_ASANTEWAA', 	'FLAVOR_RELIGION', 					6),
		('LEADER_NC_ASHANTI_YAA_ASANTEWAA', 	'FLAVOR_DIPLOMACY', 				5),
		('LEADER_NC_ASHANTI_YAA_ASANTEWAA', 	'FLAVOR_SPACESHIP', 				4),
		('LEADER_NC_ASHANTI_YAA_ASANTEWAA', 	'FLAVOR_WATER_CONNECTION', 			4),
		('LEADER_NC_ASHANTI_YAA_ASANTEWAA', 	'FLAVOR_NUKE', 						4),
		('LEADER_NC_ASHANTI_YAA_ASANTEWAA', 	'FLAVOR_USE_NUKE', 					4),
		('LEADER_NC_ASHANTI_YAA_ASANTEWAA', 	'FLAVOR_ESPIONAGE', 				6),
		('LEADER_NC_ASHANTI_YAA_ASANTEWAA', 	'FLAVOR_AIRLIFT', 					5),
		('LEADER_NC_ASHANTI_YAA_ASANTEWAA', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_NC_ASHANTI_YAA_ASANTEWAA', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_NC_ASHANTI_YAA_ASANTEWAA', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_NC_ASHANTI_YAA_ASANTEWAA', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_NC_ASHANTI_YAA_ASANTEWAA', 	'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_NC_ASHANTI_YAA_ASANTEWAA', 	'FLAVOR_AIR_CARRIER', 				5);
--------------------------------------------------------------------------------------------------------------------------
-- Diplomacy_Responses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Diplomacy_Responses
		(LeaderType, 					ResponseType, 							 			Response, 																	Bias)
VALUES 	('LEADER_NC_ASHANTI_YAA_ASANTEWAA',	'RESPONSE_AI_DOF_BACKSTAB', 			 			'TXT_KEY_LEADER_NC_ASHANTI_YAA_ASANTEWAA_DENOUNCE_FRIEND%', 			 			500),
		('LEADER_NC_ASHANTI_YAA_ASANTEWAA',	'RESPONSE_ATTACKED_HOSTILE', 			 			'TXT_KEY_LEADER_NC_ASHANTI_YAA_ASANTEWAA_ATTACKED_HOSTILE%', 			 			500),
		('LEADER_NC_ASHANTI_YAA_ASANTEWAA',	'RESPONSE_ATTACKED_STRONG_HOSTILE', 			 	'TXT_KEY_LEADER_NC_ASHANTI_YAA_ASANTEWAA_ATTACKED_HOSTILE%', 			 			500),
		('LEADER_NC_ASHANTI_YAA_ASANTEWAA',	'RESPONSE_DEFEATED', 					 			'TXT_KEY_LEADER_NC_ASHANTI_YAA_ASANTEWAA_DEFEATED%', 					 			500),
		('LEADER_NC_ASHANTI_YAA_ASANTEWAA',	'RESPONSE_DOW_GENERIC', 				 			'TXT_KEY_LEADER_NC_ASHANTI_YAA_ASANTEWAA_DOW_GENERIC%', 				 			500),
		('LEADER_NC_ASHANTI_YAA_ASANTEWAA',	'RESPONSE_EXPANSION_SERIOUS_WARNING', 				'TXT_KEY_LEADER_NC_ASHANTI_YAA_ASANTEWAA_EXPANSION_SERIOUS_WARNING%', 	 		500),
		('LEADER_NC_ASHANTI_YAA_ASANTEWAA',	'RESPONSE_FIRST_GREETING', 				 			'TXT_KEY_LEADER_NC_ASHANTI_YAA_ASANTEWAA_FIRSTGREETING%', 				 		500),
		('LEADER_NC_ASHANTI_YAA_ASANTEWAA',	'RESPONSE_GREETING_HOSTILE_HELLO', 					'TXT_KEY_LEADER_NC_ASHANTI_YAA_ASANTEWAA_GREETING_HOSTILE_HELLO%', 		 		500),
		('LEADER_NC_ASHANTI_YAA_ASANTEWAA',	'RESPONSE_GREETING_NEUTRAL_HELLO', 					'TXT_KEY_LEADER_NC_ASHANTI_YAA_ASANTEWAA_GREETING_NEUTRAL_HELLO%', 		 		500),
		('LEADER_NC_ASHANTI_YAA_ASANTEWAA',	'RESPONSE_GREETING_POLITE_HELLO', 					'TXT_KEY_LEADER_NC_ASHANTI_YAA_ASANTEWAA_GREETING_POLITE_HELLO%', 		 		500),
		('LEADER_NC_ASHANTI_YAA_ASANTEWAA',	'RESPONSE_HOSTILE_AGGRESSIVE_MILITARY_WARNING', 	'TXT_KEY_LEADER_NC_ASHANTI_YAA_ASANTEWAA_HOSTILE_AGGRESSIVE_MILITARY_WARNING%',	500),
		('LEADER_NC_ASHANTI_YAA_ASANTEWAA',	'RESPONSE_OPEN_BORDERS_EXCHANGE', 					'TXT_KEY_LEADER_NC_ASHANTI_YAA_ASANTEWAA_OPEN_BORDERS_EXCHANGE%', 		  		500),
		('LEADER_NC_ASHANTI_YAA_ASANTEWAA',	'RESPONSE_PLOT_BUYING_SERIOUS_WARNING', 			'TXT_KEY_LEADER_NC_ASHANTI_YAA_ASANTEWAA_PLOT_BUYING_SERIOUS_WARNING%', 			500),
		('LEADER_NC_ASHANTI_YAA_ASANTEWAA',	'RESPONSE_REQUEST', 								'TXT_KEY_LEADER_NC_ASHANTI_YAA_ASANTEWAA_REQUEST%', 		  						500),
		('LEADER_NC_ASHANTI_YAA_ASANTEWAA',	'RESPONSE_RESPONSE_TO_BEING_DENOUNCED',  			'TXT_KEY_LEADER_NC_ASHANTI_YAA_ASANTEWAA_RESPONSE_TO_BEING_DENOUNCED%',   		500),
		('LEADER_NC_ASHANTI_YAA_ASANTEWAA',	'RESPONSE_TOO_SOON_FOR_DOF', 						'TXT_KEY_LEADER_NC_ASHANTI_YAA_ASANTEWAA_TOO_SOON_FOR_DOF%', 						500),
		('LEADER_NC_ASHANTI_YAA_ASANTEWAA',	'RESPONSE_TOO_SOON_NO_PEACE', 			 			'TXT_KEY_LEADER_NC_ASHANTI_YAA_ASANTEWAA_TOO_SOON_NO_PEACE%', 			  		500),
		('LEADER_NC_ASHANTI_YAA_ASANTEWAA',	'RESPONSE_WORK_AGAINST_SOMEONE', 		 			'TXT_KEY_LEADER_NC_ASHANTI_YAA_ASANTEWAA_DENOUNCE%', 					  			500),
		('LEADER_NC_ASHANTI_YAA_ASANTEWAA',	'RESPONSE_WORK_WITH_US', 				 			'TXT_KEY_LEADER_NC_ASHANTI_YAA_ASANTEWAA_DEC_FRIENDSHIP%', 			  	  		500),
		('LEADER_NC_ASHANTI_YAA_ASANTEWAA',	'RESPONSE_INFLUENTIAL_ON_AI', 		 			'TXT_KEY_LEADER_NC_ASHANTI_YAA_ASANTEWAA_INFLUENTIAL_ON_AI%', 					  			500),
		('LEADER_NC_ASHANTI_YAA_ASANTEWAA',	'RESPONSE_INFLUENTIAL_ON_HUMAN', 				 			'TXT_KEY_LEADER_NC_ASHANTI_YAA_ASANTEWAA_INFLUENTIAL_ON_HUMAN%', 			  	  		500);
------------------------------------------------------------------------------------------------------------------------	
-- Leader_Traits
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 					TraitType)
VALUES	('LEADER_NC_ASHANTI_YAA_ASANTEWAA', 	'TRAIT_NC_ASHANTI_YAA_ASANTEWAA');
------------------------------------------------------------------------------------------------------------------------
-- Traits
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Traits 
		(Type, 							Description, 							ShortDescription)
VALUES	('TRAIT_NC_ASHANTI_YAA_ASANTEWAA', 	'TXT_KEY_TRAIT_NC_ASHANTI_YAA_ASANTEWAA',		'TXT_KEY_TRAIT_NC_ASHANTI_YAA_ASANTEWAA_SHORT');
------------------------------------------------------------------------------------------------------------------------
-- BuildingClasses
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO BuildingClasses
		(Type, 											DefaultBuilding, 						Description)
VALUES	('BUILDINGCLASS_DUMMY_NC_GOLDEN_STOOL',			'BUILDING_NC_GOLDEN_STOOL',		'TXT_KEY_BUILDING_DUMMY_NC_GOLDEN_STOOL'),
		('BUILDINGCLASS_DUMMY_NC_GOLDEN_STOOL_BUILD',			'BUILDING_DUMMY_NC_GOLDEN_STOOL_BUILD',		'TXT_KEY_BUILDING_DUMMY_NC_GOLDEN_STOOL_BUILD'),
		('BUILDINGCLASS_DUMMY_NC_ASHANTI_GYASE_PRODUCTION',			'BUILDING_DUMMY_NC_ASHANTI_GYASE_PRODUCTION',		'TXT_KEY_BUILDING_DUMMY_NC_ASHANTI_GYASE_PRODUCTION'),
		('BUILDINGCLASS_DUMMY_NC_ASHANTI_GENERAL_GARRISON',			'BUILDING_DUMMY_NC_ASHANTI_GENERAL_GARRISON',		'TXT_KEY_BUILDING_DUMMY_NC_ASHANTI_GENERAL_GARRISON');
--------------------------------------------------------------------------------------------------------------------------
-- Buildings
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Buildings
		(Type,							Description,								Help,											Strategy,											Civilopedia,									Cost,	FaithCost,	PrereqTech, 	ConquestProb,	BuildingClass,							SpecialistType,			SpecialistCount,	GreatWorkSlotType,				GreatWorkCount,	IconAtlas,								PortraitIndex)
VALUES	('BUILDING_NC_GOLDEN_STOOL',	'TXT_KEY_BUILDING_DUMMY_NC_GOLDEN_STOOL',	'TXT_KEY_BUILDING_DUMMY_NC_GOLDEN_STOOL_HELP',	'TXT_KEY_BUILDING_DUMMY_NC_GOLDEN_STOOL_STRATEGY',	'TXT_KEY_BUILDING_DUMMY_NC_GOLDEN_STOOL_TEXT',	1,		-1,			null, 			100,			'BUILDINGCLASS_DUMMY_NC_GOLDEN_STOOL',	'SPECIALIST_ARTIST',	1,					'GREAT_WORK_SLOT_ART_ARTIFACT',	1,				'NC_ASHANTI_YAA_ASANTEWAA_ICON_ATLAS',	4);

INSERT INTO Buildings 	
		(Type, 						 					BuildingClass, 										Cost, FaithCost, PrereqTech, 	MilitaryProductionModifier,	NeverCapture,	Description, 											Help)
VALUES	('BUILDING_DUMMY_NC_GOLDEN_STOOL_BUILD', 		'BUILDINGCLASS_DUMMY_NC_GOLDEN_STOOL_BUILD', 		-1,   -1, 		 null, 			0,		 					1,				'TXT_KEY_BUILDING_DUMMY_NC_GOLDEN_STOOL_BUILD',			'TXT_KEY_BUILDING_DUMMY_NC_GOLDEN_STOOL_BUILD_HELP'),
		('BUILDING_DUMMY_NC_ASHANTI_GYASE_PRODUCTION', 	'BUILDINGCLASS_DUMMY_NC_ASHANTI_GYASE_PRODUCTION', 	-1,   -1, 		 null, 			5,		 					1,				'TXT_KEY_BUILDING_DUMMY_NC_ASHANTI_GYASE_PRODUCTION',			'TXT_KEY_BUILDING_DUMMY_NC_ASHANTI_GYASE_PRODUCTION_HELP'),
		('BUILDING_DUMMY_NC_ASHANTI_GENERAL_GARRISON', 	'BUILDINGCLASS_DUMMY_NC_ASHANTI_GENERAL_GARRISON', 	-1,   -1, 		 null, 			0,		 					1,				'TXT_KEY_BUILDING_DUMMY_NC_ASHANTI_GENERAL_GARRISON',			'TXT_KEY_BUILDING_DUMMY_NC_ASHANTI_GENERAL_GARRISON_HELP');

--=======================================================================================================================	
-- CIVILIZATIONS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Civilizations
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilizations 	
		(Type, 									DerivativeCiv,				SoundtrackTag,  MapImage, 							DawnOfManQuote, 								DawnOfManImage,						Description,								ShortDescription,								Adjective,										Civilopedia,												CivilopediaTag,										DefaultPlayerColor,						ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,							PortraitIndex,	AlphaIconAtlas)
SELECT	'CIVILIZATION_NC_ASHANTI_YAA_ASANTEWAA',		'TXT_KEY_NC_TAL_ASHANTI',	'Songhai', 		'yaa_ashanti_map.dds',		'TXT_KEY_CIV_DAWN_NC_ASHANTI_YAA_ASANTEWAA_TEXT',		'yaa_ashanti_dom.dds',		'TXT_KEY_CIV_NC_ASHANTI_YAA_ASANTEWAA_DESC',		'TXT_KEY_CIV_NC_ASHANTI_YAA_ASANTEWAA_SHORT_DESC',	'TXT_KEY_CIV_NC_ASHANTI_YAA_ASANTEWAA_ADJECTIVE',		'TXT_KEY_CIVILOPEDIA_CIVS_NC_ASHANTI_YAA_ASANTEWAA_TEXT_1',		'TXT_KEY_CIVILOPEDIA_CIVS_NC_ASHANTI_YAA_ASANTEWAA',		'PLAYERCOLOR_NC_ASHANTI_YAA_ASANTEWAA',		ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'NC_ASHANTI_YAA_ASANTEWAA_ICON_ATLAS',	0,				'NC_ASHANTI_YAA_ASANTEWAA_ALPHA_ATLAS'
FROM Civilizations WHERE Type = 'CIVILIZATION_SONGHAI';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_CityNames
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_CityNames 
		(CivilizationType, 						CityName)
VALUES	('CIVILIZATION_NC_ASHANTI_YAA_ASANTEWAA',		'TXT_KEY_CITY_NAME_NC_ASHANTI_YAA_ASANTEWAA_1'),
		('CIVILIZATION_NC_ASHANTI_YAA_ASANTEWAA',		'TXT_KEY_CITY_NAME_NC_ASHANTI_YAA_ASANTEWAA_2'),
		('CIVILIZATION_NC_ASHANTI_YAA_ASANTEWAA',		'TXT_KEY_CITY_NAME_NC_ASHANTI_YAA_ASANTEWAA_3'),
		('CIVILIZATION_NC_ASHANTI_YAA_ASANTEWAA',		'TXT_KEY_CITY_NAME_NC_ASHANTI_YAA_ASANTEWAA_4'),
		('CIVILIZATION_NC_ASHANTI_YAA_ASANTEWAA',		'TXT_KEY_CITY_NAME_NC_ASHANTI_YAA_ASANTEWAA_5'),
		('CIVILIZATION_NC_ASHANTI_YAA_ASANTEWAA',		'TXT_KEY_CITY_NAME_NC_ASHANTI_YAA_ASANTEWAA_6'),
		('CIVILIZATION_NC_ASHANTI_YAA_ASANTEWAA',		'TXT_KEY_CITY_NAME_NC_ASHANTI_YAA_ASANTEWAA_7'),
		('CIVILIZATION_NC_ASHANTI_YAA_ASANTEWAA',		'TXT_KEY_CITY_NAME_NC_ASHANTI_YAA_ASANTEWAA_8'),
		('CIVILIZATION_NC_ASHANTI_YAA_ASANTEWAA',		'TXT_KEY_CITY_NAME_NC_ASHANTI_YAA_ASANTEWAA_9'),
		('CIVILIZATION_NC_ASHANTI_YAA_ASANTEWAA',		'TXT_KEY_CITY_NAME_NC_ASHANTI_YAA_ASANTEWAA_10'),
		('CIVILIZATION_NC_ASHANTI_YAA_ASANTEWAA',		'TXT_KEY_CITY_NAME_NC_ASHANTI_YAA_ASANTEWAA_11'),
		('CIVILIZATION_NC_ASHANTI_YAA_ASANTEWAA',		'TXT_KEY_CITY_NAME_NC_ASHANTI_YAA_ASANTEWAA_12'),
		('CIVILIZATION_NC_ASHANTI_YAA_ASANTEWAA',		'TXT_KEY_CITY_NAME_NC_ASHANTI_YAA_ASANTEWAA_13'),
		('CIVILIZATION_NC_ASHANTI_YAA_ASANTEWAA',		'TXT_KEY_CITY_NAME_NC_ASHANTI_YAA_ASANTEWAA_14'),
		('CIVILIZATION_NC_ASHANTI_YAA_ASANTEWAA',		'TXT_KEY_CITY_NAME_NC_ASHANTI_YAA_ASANTEWAA_15'),
		('CIVILIZATION_NC_ASHANTI_YAA_ASANTEWAA',		'TXT_KEY_CITY_NAME_NC_ASHANTI_YAA_ASANTEWAA_16'),
		('CIVILIZATION_NC_ASHANTI_YAA_ASANTEWAA',		'TXT_KEY_CITY_NAME_NC_ASHANTI_YAA_ASANTEWAA_17'),
		('CIVILIZATION_NC_ASHANTI_YAA_ASANTEWAA',		'TXT_KEY_CITY_NAME_NC_ASHANTI_YAA_ASANTEWAA_18'),
		('CIVILIZATION_NC_ASHANTI_YAA_ASANTEWAA',		'TXT_KEY_CITY_NAME_NC_ASHANTI_YAA_ASANTEWAA_19'),
		('CIVILIZATION_NC_ASHANTI_YAA_ASANTEWAA',		'TXT_KEY_CITY_NAME_NC_ASHANTI_YAA_ASANTEWAA_20'),
		('CIVILIZATION_NC_ASHANTI_YAA_ASANTEWAA',		'TXT_KEY_CITY_NAME_NC_ASHANTI_YAA_ASANTEWAA_21'),
		('CIVILIZATION_NC_ASHANTI_YAA_ASANTEWAA',		'TXT_KEY_CITY_NAME_NC_ASHANTI_YAA_ASANTEWAA_22'),
		('CIVILIZATION_NC_ASHANTI_YAA_ASANTEWAA',		'TXT_KEY_CITY_NAME_NC_ASHANTI_YAA_ASANTEWAA_23'),
		('CIVILIZATION_NC_ASHANTI_YAA_ASANTEWAA',		'TXT_KEY_CITY_NAME_NC_ASHANTI_YAA_ASANTEWAA_24'),
		('CIVILIZATION_NC_ASHANTI_YAA_ASANTEWAA',		'TXT_KEY_CITY_NAME_NC_ASHANTI_YAA_ASANTEWAA_25'),
		('CIVILIZATION_NC_ASHANTI_YAA_ASANTEWAA',		'TXT_KEY_CITY_NAME_NC_ASHANTI_YAA_ASANTEWAA_26'),
		('CIVILIZATION_NC_ASHANTI_YAA_ASANTEWAA',		'TXT_KEY_CITY_NAME_NC_ASHANTI_YAA_ASANTEWAA_27'),
		('CIVILIZATION_NC_ASHANTI_YAA_ASANTEWAA',		'TXT_KEY_CITY_NAME_NC_ASHANTI_YAA_ASANTEWAA_28'),
		('CIVILIZATION_NC_ASHANTI_YAA_ASANTEWAA',		'TXT_KEY_CITY_NAME_NC_ASHANTI_YAA_ASANTEWAA_29'),
		('CIVILIZATION_NC_ASHANTI_YAA_ASANTEWAA',		'TXT_KEY_CITY_NAME_NC_ASHANTI_YAA_ASANTEWAA_30'),
		('CIVILIZATION_NC_ASHANTI_YAA_ASANTEWAA',		'TXT_KEY_CITY_NAME_NC_ASHANTI_YAA_ASANTEWAA_31'),
		('CIVILIZATION_NC_ASHANTI_YAA_ASANTEWAA',		'TXT_KEY_CITY_NAME_NC_ASHANTI_YAA_ASANTEWAA_32'),
		('CIVILIZATION_NC_ASHANTI_YAA_ASANTEWAA',		'TXT_KEY_CITY_NAME_NC_ASHANTI_YAA_ASANTEWAA_33'),
		('CIVILIZATION_NC_ASHANTI_YAA_ASANTEWAA',		'TXT_KEY_CITY_NAME_NC_ASHANTI_YAA_ASANTEWAA_34'),
		('CIVILIZATION_NC_ASHANTI_YAA_ASANTEWAA',		'TXT_KEY_CITY_NAME_NC_ASHANTI_YAA_ASANTEWAA_35'),
		('CIVILIZATION_NC_ASHANTI_YAA_ASANTEWAA',		'TXT_KEY_CITY_NAME_NC_ASHANTI_YAA_ASANTEWAA_36'),
		('CIVILIZATION_NC_ASHANTI_YAA_ASANTEWAA',		'TXT_KEY_CITY_NAME_NC_ASHANTI_YAA_ASANTEWAA_37'),
		('CIVILIZATION_NC_ASHANTI_YAA_ASANTEWAA',		'TXT_KEY_CITY_NAME_NC_ASHANTI_YAA_ASANTEWAA_38'),
		('CIVILIZATION_NC_ASHANTI_YAA_ASANTEWAA',		'TXT_KEY_CITY_NAME_NC_ASHANTI_YAA_ASANTEWAA_39'),
		('CIVILIZATION_NC_ASHANTI_YAA_ASANTEWAA',		'TXT_KEY_CITY_NAME_NC_ASHANTI_YAA_ASANTEWAA_40');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeBuildingClasses
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 						BuildingClassType)
SELECT	'CIVILIZATION_NC_ASHANTI_YAA_ASANTEWAA', 		BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_SONGHAI';
------------------------------------------------------------------------------------------------------------------------		
-- Civilization_FreeTechs
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 						TechType)
SELECT	'CIVILIZATION_NC_ASHANTI_YAA_ASANTEWAA', 		TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_SONGHAI';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeUnits
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 						UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_NC_ASHANTI_YAA_ASANTEWAA',		UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_SONGHAI';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Leaders
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_Leaders 
		(CivilizationType, 						LeaderheadType)
VALUES	('CIVILIZATION_NC_ASHANTI_YAA_ASANTEWAA',		'LEADER_NC_ASHANTI_YAA_ASANTEWAA');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_BuildingClassOverrides 
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 						BuildingClassType, 				BuildingType)
VALUES	('CIVILIZATION_NC_ASHANTI_YAA_ASANTEWAA',		'BUILDINGCLASS_ARSENAL',		'BUILDING_NC_EPIE');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_UnitClassOverrides 
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 						UnitClassType, 			UnitType)
VALUES	('CIVILIZATION_NC_ASHANTI_YAA_ASANTEWAA',		'UNITCLASS_RIFLEMAN',		'UNIT_NC_GYASE');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Religions
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_Religions 
		(CivilizationType, 						ReligionType)
VALUES	('CIVILIZATION_NC_ASHANTI_YAA_ASANTEWAA',		'RELIGION_CHRISTIANITY');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_SpyNames
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 						SpyName)
VALUES	('CIVILIZATION_NC_ASHANTI_YAA_ASANTEWAA',		'TXT_KEY_SPY_NAME_NC_ASHANTI_YAA_ASANTEWAA_0'),
		('CIVILIZATION_NC_ASHANTI_YAA_ASANTEWAA',		'TXT_KEY_SPY_NAME_NC_ASHANTI_YAA_ASANTEWAA_1'),
		('CIVILIZATION_NC_ASHANTI_YAA_ASANTEWAA',		'TXT_KEY_SPY_NAME_NC_ASHANTI_YAA_ASANTEWAA_2'),
		('CIVILIZATION_NC_ASHANTI_YAA_ASANTEWAA',		'TXT_KEY_SPY_NAME_NC_ASHANTI_YAA_ASANTEWAA_3'),
		('CIVILIZATION_NC_ASHANTI_YAA_ASANTEWAA',		'TXT_KEY_SPY_NAME_NC_ASHANTI_YAA_ASANTEWAA_4'),
		('CIVILIZATION_NC_ASHANTI_YAA_ASANTEWAA',		'TXT_KEY_SPY_NAME_NC_ASHANTI_YAA_ASANTEWAA_5'),
		('CIVILIZATION_NC_ASHANTI_YAA_ASANTEWAA',		'TXT_KEY_SPY_NAME_NC_ASHANTI_YAA_ASANTEWAA_6'),
		('CIVILIZATION_NC_ASHANTI_YAA_ASANTEWAA',		'TXT_KEY_SPY_NAME_NC_ASHANTI_YAA_ASANTEWAA_7'),
		('CIVILIZATION_NC_ASHANTI_YAA_ASANTEWAA',		'TXT_KEY_SPY_NAME_NC_ASHANTI_YAA_ASANTEWAA_8'),
		('CIVILIZATION_NC_ASHANTI_YAA_ASANTEWAA',		'TXT_KEY_SPY_NAME_NC_ASHANTI_YAA_ASANTEWAA_9');
------------------------------------------------------------------------------------------------------------------------ 
-- Civilization_Start_Region_Priority
------------------------------------------------------------------------------------------------------------------------ 	
INSERT INTO Civilization_Start_Region_Priority 
		(CivilizationType, 						RegionType)
VALUES	('CIVILIZATION_NC_ASHANTI_YAA_ASANTEWAA', 'REGION_FOREST');
--=======================================================================================================================
--=======================================================================================================================