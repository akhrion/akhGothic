
func void b_corkalomleft()
{
	var C_Npc templerguard1;
	var C_Npc templerguard2;
	templerguard1 = Hlp_GetNpc(TPL_1442_Templer);
	templerguard2 = Hlp_GetNpc(TPL_1441_Templer);
	B_ExchangeRoutine(TPL_1407_Templer,"remove");
	B_ExchangeRoutine(TPL_1425_Templer,"remove");
	B_ExchangeRoutine(TPL_1413_Templer,"remove");
	B_ExchangeRoutine(TPL_1431_Templer,"remove");
	B_ExchangeRoutine(TPL_1430_Templer,"remove");
	B_ExchangeRoutine(TPL_1432_Templer,"remove");
	B_ExchangeRoutine(NOV_1313_Novize,"remove");
	B_ExchangeRoutine(NOV_1336_Novize,"remove");
	B_ExchangeRoutine(NOV_1342_Novize,"remove");
	B_ExchangeRoutine(NOV_1353_Novize,"remove");
	B_ExchangeRoutine(NOV_1340_Novize,"remove");
	B_ExchangeRoutine(NOV_1345_Novize,"remove");
	B_ExchangeRoutine(NOV_1326_Novize,"remove");
	if((GETNEWGUY_DUSTY_JOINED == TRUE) && !Npc_IsDead(VLK_524_Dusty) && Npc_KnowsInfo(hero,DIA_BaalTondral_DustySuccess))
	{
		B_ExchangeRoutine(VLK_524_Dusty,"PREPARERITUAL2");
	};
	B_ExchangeRoutine(GUR_1201_CorKalom,"FLEE");
	B_ExchangeRoutine(TPL_1406_Templer,"FLEE");
	B_ExchangeRoutine(NOV_1301_Caine,"FLEE");
	B_ExchangeRoutine(templerguard1,"remove");
	B_ExchangeRoutine(templerguard2,"remove");
	B_ExchangeRoutine(NOV_1357_Fortuno,"lab");
	B_ExchangeRoutine(NOV_1327_Novize,"wait");
	B_ExchangeRoutine(GUR_1203_BaalTondral,"ch3");
	B_ExchangeRoutine(GUR_1208_BaalCadar,"ch3");
	templerguard1.aivar[AIV_PASSGATE] = TRUE;
	templerguard2.aivar[AIV_PASSGATE] = TRUE;
	CORKALOMLEFT = TRUE;
};

