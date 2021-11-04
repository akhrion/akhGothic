
func void B_Story_FMTaken()
{
	var C_Npc fighter;
	var C_Npc calash;
	fighter = Hlp_GetNpc(PC_Fighter);
	Npc_ExchangeRoutine(fighter,"NCREPORT");
	CreateInvItem(SLD_753_Baloro,baloronote);
	B_KillNpc(SLD_750_Soeldner);
	B_KillNpc(SLD_751_Soeldner);
	B_KillNpc(SLD_752_Okyl);
	B_KillNpc(SLD_753_Baloro);
	B_KillNpc(SLD_756_Soeldner);
	B_KillNpc(SLD_757_Soeldner);
	B_KillNpc(SLD_758_Soeldner);
	B_KillNpc(SLD_759_Soeldner);
	B_KillNpc(SLD_760_Soeldner);
	B_KillNpc(SLD_761_Soeldner);
	B_KillNpc(SLD_762_Soeldner);
	B_KillNpc(SLD_763_Soeldner);
	B_KillNpc(SLD_764_Soeldner);
	B_KillNpc(SLD_765_Soeldner);
	B_KillNpc(SFB_1030_Schuerfer);
	B_KillNpc(SFB_1031_Schuerfer);
	B_KillNpc(SFB_1032_Schuerfer);
	B_KillNpc(SFB_1033_Schuerfer);
	B_KillNpc(SFB_1034_Schuerfer);
	B_KillNpc(SFB_1035_Schuerfer);
	B_KillNpc(SFB_1036_Schuerfer);
	B_KillNpc(SFB_1037_Swiney);
	B_KillNpc(SFB_1038_Schuerfer);
	B_KillNpc(SFB_1039_Schuerfer);
	B_KillNpc(SFB_1042_Schuerfer);
	B_KillNpc(SFB_1043_Schuerfer);
	B_KillNpc(SFB_1044_Schuerfer);
	B_KillNpc(ORG_890_Organisator);
	B_KillNpc(ORG_891_Organisator);
	B_KillNpc(ORG_892_Organisator);
	B_ExchangeRoutine(SLD_755_Soeldner,"saved");
	B_ExchangeRoutine(SLD_758_Soeldner,"dead");
	B_ExchangeRoutine(SLD_765_Soeldner,"dead");
	B_ExchangeRoutine(SFB_1030_Schuerfer,"dead");
	B_ExchangeRoutine(SFB_1031_Schuerfer,"dead");
	B_ExchangeRoutine(SFB_1032_Schuerfer,"dead");
	B_ExchangeRoutine(SFB_1033_Schuerfer,"dead");
	B_ExchangeRoutine(SFB_1034_Schuerfer,"dead");
	B_ExchangeRoutine(SFB_1035_Schuerfer,"dead");
	B_ExchangeRoutine(SFB_1036_Schuerfer,"dead");
	B_ExchangeRoutine(SFB_1037_Swiney,"dead");
	B_ExchangeRoutine(SFB_1038_Schuerfer,"dead");
	B_ExchangeRoutine(SFB_1039_Schuerfer,"dead");
	B_ExchangeRoutine(SFB_1040_Schuerfer,"saved");
	B_ExchangeRoutine(SFB_1041_Schuerfer,"saved");
	B_ExchangeRoutine(SFB_1042_Schuerfer,"dead");
	B_ExchangeRoutine(SFB_1043_Schuerfer,"dead");
	B_ExchangeRoutine(SFB_1044_Schuerfer,"dead");
	B_ExchangeRoutine(ORG_890_Organisator,"dead");
	B_ExchangeRoutine(ORG_891_Organisator,"dead");
	B_ExchangeRoutine(ORG_892_Organisator,"dead");
	if(!GATE_05_STATE)
	{
		Wld_SendTrigger("EVT_NC_LOCKOUT_MOVER_01");
		GATE_05_STATE = 1;
	};
	Wld_InsertNpc(Grd_283_Gardist,"FMC_ENTRANCE");
	Wld_InsertNpc(Grd_285_Gardist,"FMC_ENTRANCE");
	B_ClearImmortal(Grd_201_Jackal);
	B_ExchangeRoutine(Grd_201_Jackal,"FMTaken");
	B_ExchangeRoutine(ORG_857_Calash,"FMTaken");
	B_ExchangeRoutine(Org_834_Organisator,"FMTaken");
	B_ExchangeRoutine(Org_829_Organisator,"FMTaken");
	B_ExchangeRoutine(Org_830_Organisator,"FMTaken");
	B_ExchangeRoutine(SLD_710_Soeldner,"FMTaken");
	B_ExchangeRoutine(SLD_704_Blade,"FMTaken");
	B_ExchangeRoutine(SLD_703_Soeldner,"FMTaken");
	B_ExchangeRoutine(SLD_706_Soeldner,"FMTaken");
	B_ExchangeRoutine(SLD_708_Soeldner,"FMTaken");
	B_ExchangeRoutine(SLD_720_Soeldner,"FMTaken");
	B_ExchangeRoutine(SLD_705_Soeldner,"FMTaken");
	B_ExchangeRoutine(GRD_205_Scorpio,"BANNISHED");
	B_ChangeGuild(GRD_205_Scorpio,GIL_None);
	B_SetPermAttitude(GRD_205_Scorpio,ATT_NEUTRAL);
	calash = Hlp_GetNpc(ORG_857_Calash);
	calash.guild = GIL_None;
	Npc_SetTrueGuild(calash,GIL_None);
	if(Npc_KnowsInfo(hero,Info_Milten_OCWARN))
	{
		B_LogEntry(CH4_Firemages,"Диего мог бы многое рассказать мне о событиях в Старом лагере.");
	}
	else
	{
		B_LogEntry(CH4_Firemages,"У входа в Старый лагерь меня нашел Диего и рассказал о том, что там недавно произошло.");
	};
	B_LogEntry(CH4_Firemages,"После разрушения Старой шахты Гомез приказал своим людям захватить Свободную шахту в Новом лагере. Корристо и все маги Огня выступили против захвата, и за это были убиты.");
	B_LogEntry(CH4_Firemages,"Я должен как можно быстрее предупредить людей Нового лагеря и рассказать Сатурасу о том, что произошло с магами Огня. Надеюсь, я не опоздаю.");
	if(Scorpio_Exile == FALSE)
	{
		Log_CreateTopic(GE_TraderOW,LOG_NOTE);
		B_LogEntry(GE_TraderOW,"Скорпио покинул Старый лагерь и остановился в охотничьем домике Кавалорна, между Старым и Новым лагерями.");
		Scorpio_Exile = TRUE;
	};
	FMTaken = TRUE;
};

