
func void B_Story_UrizielLoaded()
{
	Log_SetTopicStatus(CH5_Uriziel,LOG_SUCCESS);
	B_GiveXP(XP_LoadedUriziel);
	B_SetPermAttitude(Kdw_600_Saturas,ATT_HOSTILE);
	B_SetPermAttitude(Kdw_601_Myxir,ATT_HOSTILE);
	B_SetPermAttitude(Kdw_602_Merdarion,ATT_HOSTILE);
	B_SetPermAttitude(Kdw_603_Nefarius,ATT_HOSTILE);
	B_SetPermAttitude(KDW_604_Cronos,ATT_HOSTILE);
	B_SetPermAttitude(KDW_605_Riordian,ATT_HOSTILE);
	B_ClearImmortal(Kdw_600_Saturas);
	B_ClearImmortal(Kdw_601_Myxir);
	B_ClearImmortal(Kdw_602_Merdarion);
	B_ClearImmortal(Kdw_603_Nefarius);
	B_ClearImmortal(KDW_604_Cronos);
	B_ClearImmortal(KDW_605_Riordian);
	B_SetNpcType(Kdw_600_Saturas,npctype_main);
	B_SetNpcType(Kdw_601_Myxir,npctype_main);
	B_SetNpcType(Kdw_602_Merdarion,npctype_main);
	B_SetNpcType(Kdw_603_Nefarius,npctype_main);
	B_SetNpcType(KDW_604_Cronos,npctype_main);
	B_SetNpcType(KDW_605_Riordian,npctype_main);
	AI_Teleport(SLD_723_Soeldner,"NC_OREALERT_2");
	AI_Teleport(SLD_732_Soeldner,"NC_OREALERT_1");
	AI_Teleport(Kdw_603_Nefarius,"NC_LOWER_CAVE_01");
	AI_Teleport(Kdw_601_Myxir,"NC_KDW03+04_OUT");
	AI_Teleport(KDW_604_Cronos,"NC_KDW05+06_OUT");
	AI_Teleport(Kdw_602_Merdarion,"NC_PLACE02");
	B_ExchangeRoutine(SLD_723_Soeldner,"OREALERT");
	B_ExchangeRoutine(SLD_732_Soeldner,"OREALERT");
	B_ExchangeRoutine(Kdw_603_Nefarius,"OREALERT");
	B_ExchangeRoutine(Kdw_601_Myxir,"OREALERT");
	B_ExchangeRoutine(KDW_604_Cronos,"OREALERT");
	B_ExchangeRoutine(Kdw_602_Merdarion,"OREALERT");
	B_SetPermAttitude(SLD_723_Soeldner,ATT_HOSTILE);
	B_SetPermAttitude(SLD_732_Soeldner,ATT_HOSTILE);
	NC_BANNED = TRUE;
	Log_CreateTopic(CH6_Sleeper,LOG_MISSION);
	Log_SetTopicStatus(CH6_Sleeper,LOG_RUNNING);
	B_LogEntry(CH6_Sleeper,"Все получилось. УРИЗЕЛЬ восстановлен, его сила так же велика, как и в древние времена. Сатурас и маги Воды смертельно обижены, так что лучше мне больше не попадаться им на глаза. Но это не так важно, ведь меня ждет Спящий!");
};

