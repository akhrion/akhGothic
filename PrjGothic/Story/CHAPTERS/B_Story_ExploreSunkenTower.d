
func void B_Story_ExploreSunkenTower()
{
	var C_Npc Bartholo;
	var C_Npc Skip;
	var C_Npc Bullit;
	var C_Npc Stone;
	var C_Npc Gomez;
	var C_Npc Scorpio;
	var C_Npc Cutter;
	var C_Npc Grd_220;
	var C_Npc Grd_221;
	var C_Npc Grd_222;
	var C_Npc Grd_223;
	var C_Npc Grd_239;
	var C_Npc Grd_245;
	var C_Npc Scar;
	var C_Npc Arto;
	B_LogEntry(CH5_Uriziel,"Пока Ксардас будет создавать для меня заклинание передачи энергии рудной горы УРИЗЕЛЮ, я пойду в затонувшую башню некроманта и попытаюсь найти артефакты, которые помогут в битве со Спящим.");
	Bartholo = Hlp_GetNpc(EBR_106_Bartholo);
	Skip = Hlp_GetNpc(Grd_211_Skip);
	Bullit = Hlp_GetNpc(GRD_203_Bullit);
	Stone = Hlp_GetNpc(GRD_219_Stone);
	Gomez = Hlp_GetNpc(EBR_100_Gomez);
	Scorpio = Hlp_GetNpc(GRD_205_Scorpio);
	Cutter = Hlp_GetNpc(GRD_208_Cutter);
	Grd_220 = Hlp_GetNpc(GRD_220_Gardist);
	Grd_221 = Hlp_GetNpc(GRD_221_Gardist);
	Grd_222 = Hlp_GetNpc(GRD_222_Gardist);
	Grd_223 = Hlp_GetNpc(GRD_223_Gardist);
	Grd_239 = Hlp_GetNpc(GRD_239_Gardist);
	Grd_245 = Hlp_GetNpc(GRD_245_Gardist);
	Scar = Hlp_GetNpc(EBR_101_Scar);
	Arto = Hlp_GetNpc(EBR_102_Arto);
	Wld_InsertNpc(ebr_598_bartholo,"OC1");
	Wld_InsertNpc(grd_599_skip,"OC1");
	Npc_ExchangeRoutine(Bartholo,"remove");
	Npc_ExchangeRoutine(Skip,"remove");
	Npc_ExchangeRoutine(Gomez,"OT");
	Npc_ExchangeRoutine(Arto,"OT");
	Npc_ExchangeRoutine(Scar,"OT");
	Npc_ExchangeRoutine(Bullit,"OT");
	Npc_ExchangeRoutine(Stone,"OT");
	Npc_RemoveInvItems(Stone,ItMw_1H_Sword_02,1);
	Npc_RemoveInvItems(Stone,ItMw_1H_Sword_01,Npc_HasItems(Stone,ItMw_1H_Sword_01));
	Npc_ExchangeRoutine(Grd_220,"OT");
	Npc_ExchangeRoutine(Grd_221,"OT");
	Npc_ExchangeRoutine(Grd_222,"OT");
	Npc_ExchangeRoutine(Grd_223,"OT");
	Npc_ExchangeRoutine(Grd_239,"OT");
	Npc_ExchangeRoutine(Grd_245,"OT");
	Grd_220.guild = GIL_None;
	Npc_SetTrueGuild(Grd_220,GIL_None);
	Grd_221.guild = GIL_None;
	Npc_SetTrueGuild(Grd_221,GIL_None);
	Stone.guild = GIL_None;
	Npc_SetTrueGuild(Stone,GIL_None);
	Bullit.guild = GIL_None;
	Npc_SetTrueGuild(Bullit,GIL_None);
	Gomez.guild = GIL_None;
	Npc_SetTrueGuild(Gomez,GIL_None);
	if(!Npc_KnowsInfo(hero,info_cutter_die) && !Npc_KnowsInfo(hero,Info_Fletcher_DIE) && !Npc_KnowsInfo(hero,info_grd238_die))
	{
		Wld_ExchangeGuildAttitudes("GIL_ATTITUDES_FMTAKEN");
	};
	OC_BANNED = TRUE;
	FREELEARN_OC = FALSE;
	if(C_NpcBelongsToOldCamp(hero))
	{
		Npc_SetTrueGuild(hero,GIL_None);
		hero.guild = GIL_None;
	};
	Npc_SetPermAttitude(Stone,ATT_NEUTRAL);
	Npc_SetTempAttitude(Stone,ATT_NEUTRAL);
	Npc_SetPermAttitude(Bullit,ATT_NEUTRAL);
	Npc_SetTempAttitude(Bullit,ATT_NEUTRAL);
	Npc_SetPermAttitude(ebr_598_bartholo,ATT_NEUTRAL);
	Npc_SetTempAttitude(ebr_598_bartholo,ATT_NEUTRAL);
	Npc_SetPermAttitude(Gomez,ATT_NEUTRAL);
	Npc_SetTempAttitude(Gomez,ATT_NEUTRAL);
	Gomez.flags = 0;
	CreateInvItem(Gomez,DungeonKey);
	ExploreSunkenTower = TRUE;
};

