--=======================================================================================================================
-- CIVILIZATIONS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_JFD_ColonialCityNames
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_JFD_ColonialCityNames(CivilizationType, ColonyName, LinguisticType);
INSERT INTO Civilization_JFD_ColonialCityNames 
		(CivilizationType, 						LinguisticType)
SELECT	'CIVILIZATION_NC_ASHANTI_YAA_ASANTEWAA',		LinguisticType
FROM Civilization_JFD_ColonialCityNames WHERE CivilizationType = 'CIVILIZATION_SONGHAI';
------------------------------------------------------------------------------------------------------------------------
-- Civilizations_YnAEMP
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMP(CivilizationType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
INSERT INTO Civilizations_YnAEMP
		(CivilizationType,							MapPrefix,				X,		Y,		AltX,	AltY,	AltCapitalName)
VALUES	('CIVILIZATION_NC_TIMURID_SHAH_RUKH',	'AfriAsiaAust',			14,		42,		null,	null,	null),
		('CIVILIZATION_NC_TIMURID_SHAH_RUKH',	'AfricaLarge',			14,		43,		null,	null,	null),
		('CIVILIZATION_NC_TIMURID_SHAH_RUKH',	'AfriGiant',			31,		79,		null,	null,	null),
		('CIVILIZATION_NC_TIMURID_SHAH_RUKH',		'AfriSouthEuro',		24,		37,		null,	null,	null),
		-- ('CIVILIZATION_NC_TIMURID_SHAH_RUKH',	'Americas',				0,		0,		null,	null,	null),
		-- ('CIVILIZATION_NC_TIMURID_SHAH_RUKH',	'Apennine',				17,		50,		null,	null,	null),
		-- ('CIVILIZATION_NC_TIMURID_SHAH_RUKH',	'Asia',					11,		52,		null,	null,	null),
		-- ('CIVILIZATION_NC_TIMURID_SHAH_RUKH',	'BritishIsles',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_NC_TIMURID_SHAH_RUKH',	'Caribbean',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_NC_TIMURID_SHAH_RUKH',		'CentralAsia',			62,		50,		null,	null,	null),
		('CIVILIZATION_NC_TIMURID_SHAH_RUKH',		'Cordiform',			32,		12,		null,	null,	null),
		('CIVILIZATION_NC_TIMURID_SHAH_RUKH',		'EarthMk3',				17,		29,		null,	null,	null),
		-- ('CIVILIZATION_NC_TIMURID_SHAH_RUKH',	'EastAsia',				0,		0,		null,	null,	null),
		-- ('CIVILIZATION_NC_TIMURID_SHAH_RUKH',		'EuroLarge',			32,		36,		null,	null,	null),
		-- ('CIVILIZATION_NC_TIMURID_SHAH_RUKH',		'EuroLargeNew',			34,		29,		null,	null,	null),
		('CIVILIZATION_NC_TIMURID_SHAH_RUKH',		'GreatestEarth',		46,		20,		null,	null,	null),
		-- ('CIVILIZATION_NC_TIMURID_SHAH_RUKH',	'IndianOcean',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_NC_TIMURID_SHAH_RUKH',		'Mediterranean',		36,		50,		null,	null,	null),
		-- ('CIVILIZATION_NC_TIMURID_SHAH_RUKH',	'Mesopotamia',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_NC_TIMURID_SHAH_RUKH',		'NorthAtlantic',		93,		23,		null,	null,	null),
		-- ('CIVILIZATION_NC_TIMURID_SHAH_RUKH',	'NorthEastAsia',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_NC_TIMURID_SHAH_RUKH',	'NorthWestEurope',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_NC_TIMURID_SHAH_RUKH',		'Orient',				84,		50,		null,	null,	null),
		-- ('CIVILIZATION_NC_TIMURID_SHAH_RUKH',	'SouthPacific',			0,		0,		null,	null,	null),
		('CIVILIZATION_NC_TIMURID_SHAH_RUKH',		'Yagem',				14,		32,		null,	null,	null),
		('CIVILIZATION_NC_TIMURID_SHAH_RUKH',		'Yahem',				55,		34,		null,	null,	null);
------------------------------------------------------------------------------------------------------------------------	
-- Civilizations_YnAEMPRequestedResources
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMPRequestedResources(CivilizationType, MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6);
INSERT INTO Civilizations_YnAEMPRequestedResources
		(CivilizationType,						MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6)
SELECT	'CIVILIZATION_NC_ASHANTI_YAA_ASANTEWAA',		MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6
FROM Civilizations_YnAEMPRequestedResources WHERE CivilizationType = 'CIVILIZATION_SONGHAI';
------------------------------------------------------------------------------------------------------------------------
-- Civilization_JFD_CultureTypes
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_JFD_CultureTypes(CivilizationType, CultureType, SubCultureType, ArtDefineTag, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag,	SoundtrackTag, UnitDialogueTag);
INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,						ArtDefineTag, CultureType, SubCultureType, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_NC_ASHANTI_YAA_ASANTEWAA',		ArtDefineTag, CultureType, SubCultureType, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_SONGHAI';
	
UPDATE Civilizations 
SET SoundtrackTag = (SELECT SoundtrackTag FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_NC_ASHANTI_YAA_ASANTEWAA')
WHERE Type = 'CIVILIZATION_NC_ASHANTI_YAA_ASANTEWAA'
AND EXISTS (SELECT SoundID FROM Audio_Sounds WHERE SoundID = 'SND_JFD_ABORIGINAL_PEACE_01');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_JFD_Governments
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_JFD_Governments(CivilizationType, GovernmentType, Weight);
INSERT INTO Civilization_JFD_Governments
		(CivilizationType, 						GovernmentType,					Weight)
VALUES	('CIVILIZATION_NC_ASHANTI_YAA_ASANTEWAA',		'GOVERNMENT_JFD_MONARCHY',	60);
--=======================================================================================================================
--=======================================================================================================================

