
instance KDF_403_Drago_RUNE(C_Info)
{
	npc = KDF_403_Drago;
	condition = KDF_403_Drago_RUNE_Condition;
	information = KDF_403_Drago_RUNE_Info;
	important = 1;
	permanent = 0;
};


func int KDF_403_Drago_RUNE_Condition()
{
	if(Npc_KnowsInfo(hero,KDF_402_Corristo_ROBE))
	{
		return TRUE;
	};
};

func void KDF_403_Drago_RUNE_Info()
{
	AI_Output(self,other,"KDF_403_Drago_RUNE_Info_13_01");	//����� ��� ���� ��� ��� ������. ��� ������� ���� �� ����� ����!
	b_printtrademsg1("�������� ���� �������� ������.");
	CreateInvItem(self,itarrune_2_1_firebolt);
	B_GiveInvItems(self,other,itarrune_2_1_firebolt,1);
	AI_StopProcessInfos(self);
};


instance KDF_403_Drago_Exit(C_Info)
{
	npc = KDF_403_Drago;
	nr = 999;
	condition = KDF_403_Drago_Exit_Condition;
	information = KDF_403_Drago_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int KDF_403_Drago_Exit_Condition()
{
	return TRUE;
};

func void KDF_403_Drago_Exit_Info()
{
	AI_StopProcessInfos(self);
};

