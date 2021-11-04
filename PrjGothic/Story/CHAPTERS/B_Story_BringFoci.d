
func void B_Story_BringFoci()
{
	var C_Npc gorn;
	var C_Npc lester;
	var C_Npc Lestermonster;
	var C_Npc milten;
	var C_Npc diego;
	var C_Npc DiegoMonster;
	var C_Npc sld723;
	var C_Npc sld732;
	CreateInvItem(hero,ItWrFocimap);
	CreateInvItem(hero,ItArScrollTeleport2);
	gorn = Hlp_GetNpc(PC_Fighter);
	Npc_ExchangeRoutine(gorn,"RuinWait");
	AI_ContinueRoutine(gorn);
	lester = Hlp_GetNpc(PC_Psionic);
	Npc_ExchangeRoutine(lester,"FORTRESSWAIT");
	AI_ContinueRoutine(lester);
	B_ExchangeRoutine(tpl_1400_gornabar_psi,"Namib");
	B_ExchangeRoutine(KDF_405_Torrez,"MiltenLeft");
	B_ExchangeRoutine(KDF_400_Rodriguez,"MiltenLeft");
	Lestermonster = Hlp_GetNpc(Bridgegolem);
	if(Npc_IsDead(Lestermonster))
	{
		Wld_InsertNpc(Bridgegolem,"PATH_TO_PLATEAU04_BRIDGE2");
	};
	milten = Hlp_GetNpc(PC_Mage);
	Npc_ExchangeRoutine(milten,"SHWait");
	AI_ContinueRoutine(milten);
	diego = Hlp_GetNpc(PC_Thief);
	Npc_ExchangeRoutine(diego,"TROLLWAIT");
	AI_ContinueRoutine(diego);
	DiegoMonster = Hlp_GetNpc(Troll);
	if(Npc_IsDead(DiegoMonster))
	{
		Wld_InsertNpc(Troll,"LOCATION_12_14");
	};
	sld723 = Hlp_GetNpc(SLD_723_Soeldner);
	sld723.aivar[AIV_PASSGATE] = TRUE;
	sld732 = Hlp_GetNpc(SLD_732_Soeldner);
	sld732.aivar[AIV_PASSGATE] = TRUE;
	B_LogEntry(CH3_EscapePlanNC,"� ��������� �������� ������ ��������� ������. �� ��� ��� �������: ����� ������ �����-�������.");
	Log_SetTopicStatus(CH3_EscapePlanNC,LOG_SUCCESS);
	Log_CreateTopic(CH3_BringFoci,LOG_MISSION);
	Log_SetTopicStatus(CH3_BringFoci,LOG_RUNNING);
	B_LogEntry(CH3_BringFoci,"����� ����, ��� � ����� �������� ������ � �������� �� ��������� ������, �� �������� ���� ����� ��� ������ �����-������� � �������� �� ����� ����.");
	B_LogEntry(CH3_BringFoci,"������� ��� ��� ������ �����, �� ������� �������� ����� ���������� ���������� ��������. ������ � ������ � ������� �� ���� ������ ������������, �������� �������, � ����� ����������� � ����� ����.");
	B_LogEntry(CH3_BringFoci,"�������, ���� �� ����� ����, ���������� ��� ����� ����������� ��������� �����. � ����� ����� �� � ���������� ����������� �� ������ ������ ������ ������.");
	Saturas_BringFoci = 1;
};

