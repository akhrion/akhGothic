
var C_Npc oth;
func void b_cycle_function()
{
	akhrion_Loop();
	var C_Npc Kirgo;
	var C_Npc Kharim;
	var C_Npc GorHanis;
	Kirgo = Hlp_GetNpc(GRD_251_Kirgo);
	Kharim = Hlp_GetNpc(Sld_729_Kharim);
	GorHanis = Hlp_GetNpc(Tpl_1422_GorHanis);
	if(Kapitel < 4)
	{
		if(Wld_IsTime(20,18,20,18))
		{
			Kharim.attribute[ATR_HITPOINTS] = Kharim.attribute[ATR_HITPOINTS_MAX];
//			Kharim.attribute[ATR_HITPOINTS_MAX] = 172;
		};
		if(Wld_IsTime(21,38,21,38))
		{
			Kirgo.attribute[ATR_HITPOINTS] = Kirgo.attribute[ATR_HITPOINTS_MAX];
//			Kirgo.attribute[ATR_HITPOINTS_MAX] = 160;
		};
		if(Wld_IsTime(22,58,22,58))
		{
			Kharim.attribute[ATR_HITPOINTS] = Kharim.attribute[ATR_HITPOINTS_MAX];
//			Kharim.attribute[ATR_HITPOINTS_MAX] = 172;
			GorHanis.attribute[ATR_HITPOINTS] = GorHanis.attribute[ATR_HITPOINTS_MAX];
//			GorHanis.attribute[ATR_HITPOINTS_MAX] = 280;
		};
	};
	if((RUSSOBITMFIXV13 == FALSE) && Npc_KnowsInfo(hero,Info_Diego_Gamestart))
	{
		PrintScreen("Загруженное сохранение не поддерживается!",50,43,"font_old_10_white.tga",2);
		PrintScreen("Пожалуйста, начните новую игру.",50,40,"font_old_10_white.tga",2);
	};
	if(RIDDLE1INSERT == TRUE)
	{
		Wld_InsertItem(theriddle2,"FP_RIDD_2");
		RIDDLE1INSERT = FALSE;
	};
	if(RIDDLE2INSERT == TRUE)
	{
		Wld_InsertItem(theriddle3,"FP_SLEEP_OW_BLOODFLY_01_02");
		RIDDLE2INSERT = FALSE;
	};
	if(RIDDLE3INSERT == TRUE)
	{
		Wld_InsertItem(theriddle4,"FP_SLEEP_OW_LURKER_NC_LAKE_02");
		RIDDLE3INSERT = FALSE;
	};
	if(RIDDLE4INSERT == TRUE)
	{
		Wld_InsertItem(theriddle5,"FP_RIDD_4");
		RIDDLE4INSERT = FALSE;
	};
	Wld_SendTrigger("CYCLE_TRIGGER");
};

