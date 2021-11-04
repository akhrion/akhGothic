
instance Sld_701_Orik_Exit(C_Info)
{
	npc = SLD_701_Orik;
	nr = 999;
	condition = Sld_701_Orik_Exit_Condition;
	information = Sld_701_Orik_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Sld_701_Orik_Exit_Condition()
{
	return TRUE;
};

func void Sld_701_Orik_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance SLD_701_ORIK_DIELAGE(C_Info)
{
	npc = SLD_701_Orik;
	nr = 1;
	condition = sld_701_orik_dielage_condition;
	information = sld_701_orik_dielage_info;
	permanent = 1;
	description = "��� ���� ����?";
};


func int sld_701_orik_dielage_condition()
{
	if(self.aivar[AIV_DEALDAY] <= Wld_GetDay())
	{
		if(FMTaken && !Npc_KnowsInfo(hero,Info_Xardas_DISTURB))
		{
			return FALSE;
		}
		else
		{
			return TRUE;
		};
	};
};

func void sld_701_orik_dielage_info()
{
	AI_Output(other,self,"Info_Sld_8_DieLage_15_00");	//��� ���� ����?
	if(!FMTaken)
	{
		AI_Output(self,other,"Sld_701_Orik_DieLage_02_01");	//���� ����� ������� ������������ ������� ��� � �������. �� ���� ������ �� �������� ������ �� �����������...
	}
	else
	{
		AI_Output(self,other,"Sld_701_Orik_DieLage_02_02");	//���������� �����������. ����� ������� ����� ����� ����� ��������. �� ���� ��������, ����.
		AI_Output(self,other,"Sld_701_Orik_DieLage_02_03");	//� �� ���� ����, ����� ��� ���������.
	};
	if(Npc_KnowsInfo(hero,sld_701_orik_daslager) && Npc_KnowsInfo(hero,sld_701_orik_einervoneuchwerden) && Npc_KnowsInfo(hero,sld_701_orik_krautprobe))
	{
		AI_StopProcessInfos(self);
	};
	self.aivar[AIV_DEALDAY] = Wld_GetDay() + 1;
};


instance SLD_701_ORIK_DASLAGER(C_Info)
{
	npc = SLD_701_Orik;
	nr = 2;
	condition = sld_701_orik_daslager_condition;
	information = sld_701_orik_daslager_info;
	permanent = 0;
	description = "�������� ��� �� ���� ������.";
};


func int sld_701_orik_daslager_condition()
{
	return TRUE;
};

func void sld_701_orik_daslager_info()
{
	AI_Output(other,self,"Info_Sld_8_DasLager_15_00");	//�������� ��� �� ���� ������.
	AI_Output(self,other,"Sld_701_Orik_DasLager_02_01");	//������ �� ������, �������� � ������. �� ��� ��� �������. ������ �� ������� ���������� ����� �� ��������.
};


instance SLD_701_ORIK_EINERVONEUCHWERDEN(C_Info)
{
	npc = SLD_701_Orik;
	nr = 3;
	condition = sld_701_orik_einervoneuchwerden_condition;
	information = sld_701_orik_einervoneuchwerden_info;
	permanent = 0;
	description = "��� ��� �������������� � ���?";
};


func int sld_701_orik_einervoneuchwerden_condition()
{
	if(((Npc_GetTrueGuild(other) == GIL_None) || (Npc_GetTrueGuild(other) == GIL_ORG)) && (oldHeroGuild != GIL_KDF))
	{
		return TRUE;
	};
};

func void sld_701_orik_einervoneuchwerden_info()
{
	AI_Output(other,self,"Info_Mine_Sld_11_EinerVonEuchWerden_15_00");	//��� ��� �������������� � ���?
	AI_Output(self,other,"Sld_701_Orik_EinerVonEuchWerden_02_01");	//��� �� ����� �������. �� ���� �� - ������� ������, � ���� ���� ����. �������� � ��.
};


instance SLD_701_ORIK_KRAUTPROBE(C_Info)
{
	npc = SLD_701_Orik;
	nr = 4;
	condition = sld_701_orik_krautprobe_condition;
	information = sld_701_orik_krautprobe_info;
	permanent = 0;
	description = "� ���� ���� ��������. ������?";
};




var int isExplainJoint;    //���� ��������, ������ ������� �������� ������� �����
var int cntrOrikJoint;      //������� ��� �� ��������� � ����� �� ������ �����

func int sld_701_orik_krautprobe_condition()
{
	if((BaalKagan_VerteilKraut == LOG_RUNNING) || (BaalKagan_VerteilKraut == LOG_SUCCESS))
	{
		if(
			Npc_HasItems(self,orik_key) &&
			(
				Npc_HasItems(hero,ItMiJoint_1) ||
				Npc_HasItems(hero,ItMiJoint_2) ||
				Npc_HasItems(hero,ItMiJoint_3)
			)
		)
		{
			return TRUE;
		};
	};
};

func void orikExplainJoint()
{
		AI_Output(self,other,"Sld_701_Orik_Krautprobe_02_03");	//� ��������� ��-�� ��������� ���� � ������� ���������. �� ������ �������?
		if(Npc_KnowsInfo(hero,DIA_Torlof_Hallo))
		{
			AI_Output(other,self,"INFO_THORUS_LETTERFORMAGES_15_02");	//��.
		}
		else
		{
			AI_Output(other,self,"DIA_Orry_GuardGate_No_15_00");	//��� ���.
		};
		AI_Output(self,other,"Sld_701_Orik_Krautprobe_02_06");	    //������� ������! ������ ������� ����! �� � ��������� ��� �� �� ����� ��������� �����. �������, ��� ��� ��������� �����-�� ���� � ������ �����.
		AI_Output(self,other,"Sld_701_Orik_Krautprobe_02_07");	    //��� ������� �� ����� �����, ����� ���� �����������, ����������� ��� � ������� �������. �� � ���� ������ � ���� ����� �� ���������! �����?
		AI_Output(other,self,"DIA_Harlok_FetchHarlok_BACK_15_00");	//�� �����, �� �������� ���.
		isExplainJoint = true;
};
func void sld_701_orik_krautprobe_info()
{
	AI_Output(other,self,"Info_Org_6_Krautprobe_15_00"); 	//<���������� ������������ ��� �������.. ������ �� �������� ����-����? ������ ����������� ����������? �������������>
	AI_Output(self,other,"Sld_701_Orik_Krautprobe_02_01");	//���, ������. � ������ ���, ��������� �������� ���� �������� ���� �����.
	AI_Output(self,other,"Sld_701_Orik_Krautprobe_02_02");	//�� �������, ��� ������ ��� ���������? ��� �� �� ���!
	orikExplainJoint();
	cntrOrikJoint = cntrOrikJoint + 1;
	AI_StopProcessInfos(self);
};

instance orik_krautprobeAgain(C_Info)
{
	npc = SLD_701_Orik;
	nr = 4;
	condition = orik_krautprobeAgain_condition;
	information = orik_krautprobeAgain_info;
	important = 0;
	permanent = 1;
	description = "���.. � ���� ���� ������� �����..";
};

func int orik_krautprobeAgain_condition()
{
	if(
		(BaalKagan_VerteilKraut == LOG_RUNNING) ||
		(BaalKagan_VerteilKraut == LOG_SUCCESS)
	)
	{
		if(
			(cntrOrikJoint > 0) &&
			(
				Npc_HasItems(hero,ItMiJoint_1) ||
				Npc_HasItems(hero,ItMiJoint_2) ||
				Npc_HasItems(hero,ItMiJoint_3)
			)
		)
		{
			return TRUE;
		};
	};
};

func void orik_krautprobeAgain_info()
{
	AI_Output(other,self,"akh_GG_OrikKey_NULL_00");   //���.. � ���� ���� ������� �����..
	if(isExplainJoint && cntrOrikJoint < 4)
	{
		AI_Output(self,other,"akh_Orik_OrikKey_NULL_01"); //�-�� ������������ ���� �� ���� ������� �����!
		AI_Output(self,other,"akh_Orik_OrikKey_NULL_02"); //�������� ������! ���������� ���������� ���� ��������� � ��� ���������� �����.
		AI_Output(self,other,"akh_Orik_OrikKey_NULL_03"); //� (������� ������) �� ����..
		cntrOrikJoint = cntrOrikJoint + 1;
		AI_StopProcessInfos(self);
	} else if(isExplainJoint && cntrOrikJoint > 3)
	{
		AI_Output(self,other,"akh_Orik_OrikKey_NULL_04"); //��� (������ �������) ��� ������. ������ �� ���� � � �������.. �����.. ������� �� ����.
	} else if(cntrOrikJoint == 1)
	{
		AI_Output(self,other,"akh_Orik_OrikKey_NULL_5");//(��������������) �� ������..
		orikExplainJoint();
		cntrOrikJoint = cntrOrikJoint + 1;
	};
};

instance ORIK_STEALKEY(C_Info)
{
	npc = SLD_701_Orik;
	nr = 990;
	condition = orik_stealkey_condition;
	information = orik_stealkey_info;
	important = 0;
	permanent = 0;
	description = "(������� ����)";
};


func int orik_stealkey_condition()
{
	if(Npc_HasItems(self,orik_key) && (Npc_GetTalentSkill(hero,NPC_TALENT_PICKPOCKET) >= 1) && hero.attribute[ATR_DEXTERITY] >= 30)
	{
		return TRUE;
	};
};

func void orik_stealkey_info()
{
	AI_GotoNpc(other,self);
	AI_Output(other,self,"Info_Org_6_Krautprobe_15_00");	//� ���� ���� ��������. ������?
	if(cntrOrikJoint > 0){
		AI_Output(self,other,"akh_Orik_OrikKey_ZADOLBAL_NULL_01");  //��� ������, �������� �� �����..
	} else {
		AI_Output(self,other,"Sld_701_Orik_Krautprobe_02_01");	//���, ������. � ������ ���, ��������� �������� ���� �������� ���� �����.
		AI_Output(self,other,"Sld_701_Orik_Krautprobe_02_02");	//�� �������, ��� ������ ��� ���������? ��� �� �� ���!
	};
	PrintScreen("������� ����.",-1,_YPOS_MESSAGE_TAKEN,"FONT_OLD_10_WHITE.TGA",_TIME_MESSAGE_TAKEN);
	CreateInvItem(hero,orik_key);
	Npc_RemoveInvItem(self,orik_key);
	cntrOrikJoint = cntrOrikJoint + 1;
	AI_StopProcessInfos(self);
};

