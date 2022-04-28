
func void B_Story_LoadSword()
{
	var C_Npc milten;
	B_LogEntry(CH5_Uriziel,"Ксардас подготовил заклинание. Теперь мне нужно найти сильный источник магической энергии. К счастью, в колонии есть такой источник, а те, кто им владеет, находятся передо мной в долгу...");
	B_GiveXP(XP_ReturnedFromSunkenTower);
	milten = Hlp_GetNpc(PC_Mage);
	Npc_ExchangeRoutine(milten,"LSWait");
	LoadSword = TRUE;
};

