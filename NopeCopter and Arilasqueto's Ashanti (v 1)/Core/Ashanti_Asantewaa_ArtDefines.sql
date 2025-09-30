--=======================================================================================================================
-- ART DEFINES
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_StrategicView
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 					TileType,		Asset)
VALUES	('ART_DEF_UNIT_NC_GYASE',			'Unit', 		'ashanti_uu_alpha_sv.dds');
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfos
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO ArtDefine_UnitInfos 
		(Type, 									DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_NC_GYASE',			DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_RIFLEMAN'; 
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,							UnitMemberInfoType,						NumMembers)
SELECT	'ART_DEF_UNIT_NC_GYASE',			'ART_DEF_UNIT_MEMBER_NC_GYASE',	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_RIFLEMAN';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_NC_GYASE',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_RIFLEMAN';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_NC_GYASE',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_RIFLEMAN';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 									Scale, ZOffset, Domain, Model, 				 MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_NC_GYASE',	Scale, ZOffset, Domain, 'MC_Abrade.fxsxml', MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_RIFLEMAN';
--=======================================================================================================================
-- AUDIO
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Audio_Sounds
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 											Filename, 						LoadType)
VALUES	('SND_LEADER_MUSIC_NC_ASHANTI_YAA_ASANTEWAA_PEACE',		'yaa_ashanti_peace',		'DynamicResident'),
		('SND_LEADER_MUSIC_NC_ASHANTI_YAA_ASANTEWAA_WAR', 		'yaa_ashanti_war', 		'DynamicResident');		
------------------------------------------------------------------------------------------------------------------------
-- Audio_2DSounds
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 											SoundID, 										SoundType, 		TaperSoundtrackVolume,	MinVolume, 	MaxVolume,	IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_NC_ASHANTI_YAA_ASANTEWAA_PEACE',		'SND_LEADER_MUSIC_NC_ASHANTI_YAA_ASANTEWAA_PEACE',	'GAME_MUSIC', 	-1.0,					50, 		50, 		1, 		 0),
		('AS2D_LEADER_MUSIC_NC_ASHANTI_YAA_ASANTEWAA_WAR',		'SND_LEADER_MUSIC_NC_ASHANTI_YAA_ASANTEWAA_WAR', 		'GAME_MUSIC', 	-1.0,					50, 		50, 		1,		 0);
--=======================================================================================================================
-- COLOURS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Colors
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Colors 
		(Type, 											Red, 	Green, 	Blue,   Alpha)
VALUES	('COLOR_PLAYER_NC_ASHANTI_YAA_ASANTEWAA_ICON', 		0.384, 	0.012, 	0.075, 	1),
		('COLOR_PLAYER_NC_ASHANTI_YAA_ASANTEWAA_BACKGROUND', 	0.784,	0.792,	0.173, 	1);
------------------------------------------------------------------------------------------------------------------------
-- PlayerColors
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO PlayerColors 
		(Type, 									PrimaryColor, 								SecondaryColor, 								 TextColor)
VALUES	('PLAYERCOLOR_NC_ASHANTI_YAA_ASANTEWAA',		'COLOR_PLAYER_NC_ASHANTI_YAA_ASANTEWAA_ICON',		'COLOR_PLAYER_NC_ASHANTI_YAA_ASANTEWAA_BACKGROUND',	 'COLOR_PLAYER_WHITE_TEXT');
--=======================================================================================================================
-- ICON ATLASES
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- IconTextureAtlases
------------------------------------------------------------------------------------------------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 								IconSize, 	Filename, 										IconsPerRow, 	IconsPerColumn)
VALUES	('NC_ASHANTI_YAA_ASANTEWAA_ALPHA_ATLAS',		128, 		'porkie_128.dds',			1,				1),
		('NC_ASHANTI_YAA_ASANTEWAA_ALPHA_ATLAS',		80, 		'porkie_80.dds',			1, 				1),
		('NC_ASHANTI_YAA_ASANTEWAA_ALPHA_ATLAS',		64, 		'porkie_64.dds',			1, 				1),
		('NC_ASHANTI_YAA_ASANTEWAA_ALPHA_ATLAS',		48, 		'porkie_48.dds',			1, 				1),
		('NC_ASHANTI_YAA_ASANTEWAA_ALPHA_ATLAS',		45, 		'porkie_45.dds',			1, 				1),
		('NC_ASHANTI_YAA_ASANTEWAA_ALPHA_ATLAS',		32, 		'porkie_32.dds',			1, 				1),
		('NC_ASHANTI_YAA_ASANTEWAA_ALPHA_ATLAS',		24, 		'porkie_24.dds',			1, 				1),
		('NC_ASHANTI_YAA_ASANTEWAA_ALPHA_ATLAS',		16, 		'porkie_16.dds',			1, 				1),
		('NC_ASHANTI_YAA_ASANTEWAA_ICON_ATLAS', 		256, 		'yaaAshantiAtlas_256.dds',			2, 				3),
		('NC_ASHANTI_YAA_ASANTEWAA_ICON_ATLAS', 		128, 		'yaaAshantiAtlas_128.dds',			2, 				3),
		('NC_ASHANTI_YAA_ASANTEWAA_ICON_ATLAS', 		80, 		'yaaAshantiAtlas_80.dds',			2, 				3),
		('NC_ASHANTI_YAA_ASANTEWAA_ICON_ATLAS', 		64, 		'yaaAshantiAtlas_64.dds',			2, 				3),
		('NC_ASHANTI_YAA_ASANTEWAA_ICON_ATLAS', 		45, 		'yaaAshantiAtlas_45.dds',			2, 				3),
		('NC_ASHANTI_YAA_ASANTEWAA_ICON_ATLAS', 		32, 		'yaaAshantiAtlas_32.dds',			2, 				3),
		('NC_ASHANTI_YAA_ASANTEWAA_UNIT_FLAG_ATLAS',	32, 		'ashanti_uu_alpha_32.dds',		1, 				1);
--=======================================================================================================================	
--=======================================================================================================================	
