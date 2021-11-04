
instance Info_Riordian_EXIT(C_Info)
{
	npc = KDW_605_Riordian;
	nr = 999;
	condition = Info_Riordian_EXIT_Condition;
	information = Info_Riordian_EXIT_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_Riordian_EXIT_Condition()
{
	return TRUE;
};

func void Info_Riordian_EXIT_Info()
{
	if(!Npc_HasItems(self,itarrune_3_2_thunderball))
	{
		CreateInvItem(self,itarrune_3_2_thunderball);
	};
	if(Npc_HasItems(other,alchemybook))
	{
		Npc_RemoveInvItem(other,alchemybook);
		CreateInvItem(other,alch200);
	};
	AI_StopProcessInfos(self);
};


instance Info_Riordian_NEWS(C_Info)
{
	npc = KDW_605_Riordian;
	condition = Info_Riordian_NEWS_Condition;
	information = Info_Riordian_NEWS_Info;
	permanent = 0;
	important = 0;
	description = "���� ������� �������.";
};


func int Info_Riordian_NEWS_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Saturas_OFFER))
	{
		return TRUE;
	};
};

func void Info_Riordian_NEWS_Info()
{
	AI_Output(other,self,"Info_Riordian_NEWS_15_01");	//���� ������� �������.
	AI_Output(self,other,"Info_Riordian_NEWS_14_02");	//������. ��� ��� �������� � ����.
	AI_Output(self,other,"Info_Riordian_NEWS_14_03");	//���, ������ ��� ��������. ����� ���, ��� ���� ����� �����������.
	CreateInvItems(hero,ItFo_Potion_Health_01,5);
	CreateInvItems(hero,ItFo_Potion_Mana_01,5);
	CreateInvItems(hero,ItFo_Potion_Health_02,2);
	CreateInvItems(hero,ItFo_Potion_Mana_02,2);
	CreateInvItems(hero,ItFo_Potion_Health_03,1);
	CreateInvItems(hero,ItFo_Potion_Mana_03,1);
	CreateInvItems(hero,ItFo_Potion_Haste_02,2);
	if(DIFF_HARD == FALSE)
	{
		CreateInvItems(hero,ItFo_Potion_Strength_01,1);
		CreateInvItems(hero,ItFo_Potion_Dex_01,1);
		b_printtrademsg1("�������� 20 ��������� ���������.");
	}
	else
	{
		CreateInvItems(hero,ItFo_Potion_Health_Perma_01,1);
		b_printtrademsg1("�������� 19 ��������� ���������.");
	};
	AI_Output(self,other,"Info_Riordian_NEWS_14_04");	//������ ������ ����. ��� ����� ���� ��������� ������� - ����� ��!
};


instance Info_Riordian_REWARD(C_Info)
{
	npc = KDW_605_Riordian;
	condition = Info_Riordian_REWARD_Condition;
	information = Info_Riordian_REWARD_Info;
	permanent = 0;
	important = 0;
	description = "������� ������, ��� � ���� ���� ��� ���� �������.";
};


func int Info_Riordian_REWARD_Condition()
{
	if(Saturas_BringFoci == 5)
	{
		return TRUE;
	};
};

func void Info_Riordian_REWARD_Info()
{
	AI_Output(other,self,"Info_Riordian_REWARD_15_01");	//������� ������, ��� � ���� ���� ��� ���� �������.
	AI_Output(self,other,"Info_Riordian_REWARD_14_02");	//�, �� �������, �������.
	AI_Output(self,other,"Info_Riordian_REWARD_14_03");	//��� �������� ��������� ��������� � ����� ��������� ���������.
	AI_Output(self,other,"Info_Riordian_REWARD_14_04");	//��� ������ ������ - �� ��� ���, ���� ������� - � �������� ����� ����� �����.
	AI_Output(self,other,"Info_Riordian_REWARD_14_05");	//����� �� ��� ��� �������� ������� � ���� ����� �������������.
	CreateInvItems(hero,ItFo_Potion_Health_02,5);
	CreateInvItems(hero,ItFo_Potion_Mana_02,5);
	CreateInvItems(hero,ItFo_Potion_Health_03,2);
	CreateInvItems(hero,ItFo_Potion_Mana_03,2);
	CreateInvItems(hero,ItFo_Potion_Haste_02,3);
	CreateInvItems(hero,ItFo_Potion_Health_Perma_02,1);
	if(DIFF_HARD == FALSE)
	{
		CreateInvItems(hero,ItFo_Potion_Master_01,1);
		CreateInvItems(hero,ItFo_Potion_Mana_Perma_02,1);
		b_printtrademsg1("�������� 20 ��������� ���������.");
	}
	else
	{
		b_printtrademsg1("�������� 18 ��������� ���������.");
	};
	B_LogEntry(CH3_BringFoci,"������� ��� ��� ��������� �����, ������� ����� ��� ����������� � ��������� �����.");
	if(Npc_KnowsInfo(hero,Info_Cronos_REWARD))
	{
		Log_SetTopicStatus(CH3_BringFoci,LOG_SUCCESS);
	};
};


instance Info_Riordian_MESSAGE(C_Info)
{
	npc = KDW_605_Riordian;
	condition = Info_Riordian_MESSAGE_Condition;
	information = Info_Riordian_MESSAGE_Info;
	permanent = 0;
	important = 1;
};


func int Info_Riordian_MESSAGE_Condition()
{
	if(UrShak_SpokeOfUluMulu && !EnteredFreeMine)
	{
		return TRUE;
	};
};

func void Info_Riordian_MESSAGE_Info()
{
	AI_Output(self,hero,"Info_Riordian_MESSAGE_14_01");	//���, ��� �� ������! � ���� ����!
};


instance Info_Riordian_MESSAGEWHY(C_Info)
{
	npc = KDW_605_Riordian;
	condition = Info_Riordian_MESSAGEWHY_Condition;
	information = Info_Riordian_MESSAGEWHY_Info;
	permanent = 0;
	important = 0;
	description = "�� ���� ����? �����?";
};


func int Info_Riordian_MESSAGEWHY_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Riordian_MESSAGE))
	{
		return TRUE;
	};
};

func void Info_Riordian_MESSAGEWHY_Info()
{
	AI_Output(hero,self,"Info_Riordian_MESSAGEWHY_15_01");	//�� ���� ����? �����?
	AI_Output(self,hero,"Info_Riordian_MESSAGEWHY_14_02");	//���� ������ ��������� ���� � ����, ��� ������ �� ����������!
	AI_Output(hero,self,"Info_Riordian_MESSAGEWHY_15_03");	//� � ��� ����?
	AI_Output(self,hero,"Info_Riordian_MESSAGEWHY_14_04");	//� ���� ���� ����, ��� ���������� ����������� �����.
	AI_Output(hero,self,"Info_Riordian_MESSAGEWHY_15_05");	//�� ��� ��� �������� ���� � �����?
	AI_Output(self,hero,"Info_Riordian_MESSAGEWHY_14_06");	//��! �, ����������, ����������� � ����, ��� ����� �������.
};


instance KDW_605_Riordian_WELCOME(C_Info)
{
	npc = KDW_605_Riordian;
	condition = KDW_605_Riordian_WELCOME_Condition;
	information = KDW_605_Riordian_WELCOME_Info;
	important = 1;
	permanent = 0;
};


func int KDW_605_Riordian_WELCOME_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_KDW)
	{
		return TRUE;
	};
};

func void KDW_605_Riordian_WELCOME_Info()
{
	AI_Output(self,other,"KDW_605_Riordian_WELCOME_Info_14_01");	//� ���, ��� �� ������ � ����.
};


instance KDW_605_Riordian_HEAL(C_Info)
{
	npc = KDW_605_Riordian;
	condition = KDW_605_Riordian_HEAL_Condition;
	information = KDW_605_Riordian_HEAL_Info;
	important = 1;
	permanent = 0;
};


func int KDW_605_Riordian_HEAL_Condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_KDW) && Npc_KnowsInfo(hero,KDW_605_Riordian_WELCOME))
	{
		return TRUE;
	};
};

func void KDW_605_Riordian_HEAL_Info()
{
	AI_Output(self,other,"KDW_605_Riordian_HEAL_Info_14_01");	//���� �� �����, � ���� �������� ����.
};


instance KDW_605_Riordian_HEALINFO(C_Info)
{
	npc = KDW_605_Riordian;
	nr = 100;
	condition = KDW_605_Riordian_HEALINFO_Condition;
	information = KDW_605_Riordian_HEALINFO_Info;
	important = 0;
	permanent = 1;
	description = "� �����. �� ������ �������� ����?";
};


func int KDW_605_Riordian_HEALINFO_Condition()
{
	if((hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX]) && (Npc_GetTrueGuild(hero) == GIL_KDW))
	{
		return TRUE;
	};
};

func void KDW_605_Riordian_HEALINFO_Info()
{
	AI_Output(other,self,"KDW_605_Riordian_HEALINFO_Info_15_01");	//� �����. �� ������ �������� ����?
	AI_Output(self,other,"KDW_605_Riordian_HEALINFO_Info_14_02");	//�� ������� ����� ��� �������� � ���� ����!
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
};


instance KDW_605_Riordian_GREET(C_Info)
{
	npc = KDW_605_Riordian;
	condition = KDW_605_Riordian_GREET_Condition;
	information = KDW_605_Riordian_GREET_Info;
	important = 0;
	permanent = 0;
	description = "����������� ����, ���!";
};


func int KDW_605_Riordian_GREET_Condition()
{
	return TRUE;
};

func void KDW_605_Riordian_GREET_Info()
{
	AI_Output(other,self,"KDW_605_Riordian_GREET_Info_15_01");	//����������� ����, ���!
	AI_Output(self,other,"KDW_605_Riordian_GREET_Info_14_02");	//� �������, �������. �������, ���� ����� �������?
	Log_CreateTopic(GE_TraderNC,LOG_NOTE);
	B_LogEntry(GE_TraderNC,"��� ����� ���� ������� ������� ���������� �����. � ���� ����� ��� � ����������� �� ������ ������ ������.");
};


instance KDW_605_Riordian_TRADE(C_Info)
{
	npc = KDW_605_Riordian;
	condition = KDW_605_Riordian_TRADE_Condition;
	information = KDW_605_Riordian_TRADE_Info;
	important = 0;
	permanent = 1;
	description = "������ ��� ���� ������.";
	trade = 1;
};


func int KDW_605_Riordian_TRADE_Condition()
{
	if(Npc_KnowsInfo(hero,KDW_605_Riordian_GREET))
	{
		return TRUE;
	};
};

func void KDW_605_Riordian_TRADE_Info()
{
	AI_Output(other,self,"KDW_605_Riordian_TRADE_Info_15_01");	//������ ��� ���� ������.
	if(Npc_HasItems(self,itarrune_3_2_thunderball) >= 1)
	{
		Npc_RemoveInvItems(self,itarrune_3_2_thunderball,Npc_HasItems(self,itarrune_3_2_thunderball));
	};
};

