
instance Stt_302_Viper_Exit(C_Info)
{
	npc = STT_302_Viper;
	nr = 999;
	condition = Stt_302_Viper_Exit_Condition;
	information = Stt_302_Viper_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Stt_302_Viper_Exit_Condition()
{
	return 1;
};

func void Stt_302_Viper_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance Stt_302_Viper_GREET(C_Info)
{
	npc = STT_302_Viper;
	condition = Stt_302_Viper_GREET_Condition;
	information = Stt_302_Viper_GREET_Info;
	important = 0;
	permanent = 0;
	description = "��, ������ ����, ����������.";
};


func int Stt_302_Viper_GREET_Condition()
{
	return 1;
};

func void Stt_302_Viper_GREET_Info()
{
	AI_Output(other,self,"Stt_302_Viper_GREET_Info_15_01");	//��, ������ ����, ����������.
	AI_Output(self,other,"Stt_302_Viper_GREET_Info_11_02");	//� �� ����� ������, ��� � ��������.
};


instance Stt_302_Viper_MELT(C_Info)
{
	npc = STT_302_Viper;
	condition = Stt_302_Viper_MELT_Condition;
	information = Stt_302_Viper_MELT_Info;
	important = 0;
	permanent = 0;
	description = "� ������, ��� � ����� �������������� ������ ����� ����.";
};


func int Stt_302_Viper_MELT_Condition()
{
	if(Npc_KnowsInfo(hero,Stt_302_Viper_GREET) && Npc_KnowsInfo(hero,Grd_260_Drake_Mine_Mehr))
	{
		return 1;
	};
};

func void Stt_302_Viper_MELT_Info()
{
	AI_Output(other,self,"Stt_302_Viper_MELT_Info_15_01");	//� ������, ��� � ����� �������������� ������ ����� ����.
	AI_Output(self,other,"Stt_302_Viper_MELT_Info_11_02");	//�����-�� �� ������������ ��� ����. �� ����� � ���� ������, ��� ��� �� ������.
	AI_Output(self,other,"Stt_302_Viper_MELT_Info_11_03");	//��������� ������ ��� ���-�� ����� �������, ������������� ���� � ��� ���������.
	AI_Output(self,other,"Stt_302_Viper_MELT_Info_11_04");	//��� ����� ������ ���� � ������ ���� ����������� ���� � �� ����, � ������� �� ����� �� ��������� �������������.
	AI_Output(self,other,"Stt_302_Viper_MELT_Info_11_05");	//� ����� �� ����� ������������ ������ ����� ����, � ���� ���� ������ �� ������������.
};


instance Stt_302_Viper_BUY(C_Info)
{
	npc = STT_302_Viper;
	condition = Stt_302_Viper_BUY_Condition;
	information = Stt_302_Viper_BUY_Info;
	important = 0;
	permanent = 0;
	description = "�� ������ ���� ��� ����?";
};


func int Stt_302_Viper_BUY_Condition()
{
	if(Npc_KnowsInfo(hero,Stt_302_Viper_GREET))
	{
		return 1;
	};
};

func void Stt_302_Viper_BUY_Info()
{
	AI_Output(other,self,"Stt_302_Viper_BUY_Info_15_01");	//�� ������ ���� ��� ����?
	if(hero.guild == GIL_ORG)
	{
		AI_Output(self,other,"SVM_11_YouStoleFromMe");	//� �� ��� ������ ���������� ��� �� �����, ������� ���?
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"Stt_302_Viper_BUY_Info_11_02");	//���� � ���� ���� ���-������ ������.
		Log_CreateTopic(GE_TRADEROM,LOG_NOTE);
		B_LogEntry(GE_TRADEROM,"������ ���������� ����������� ���� � ����� �������� �� �� ��� ������.");
	};
};


instance STT_302_VIPER_BUY2(C_Info)
{
	npc = STT_302_Viper;
	condition = stt_302_viper_buy2_condition;
	information = stt_302_viper_buy2_info;
	important = 0;
	permanent = 1;
	description = DIALOG_TRADE;
	trade = 1;
};


func int stt_302_viper_buy2_condition()
{
	if(Npc_KnowsInfo(hero,Stt_302_Viper_BUY) && (hero.guild != GIL_ORG))
	{
		return 1;
	};
};

func void stt_302_viper_buy2_info()
{
	AI_Output(other,self,"DIA_Fortuno_BuyJoints_15_00");	//����� ��������.
};

