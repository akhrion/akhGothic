
instance Info_ORG_829_EXIT(C_Info)
{
	npc = Org_829_Organisator;
	nr = 999;
	condition = Info_ORG_829_EXIT_Condition;
	information = Info_ORG_829_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_ORG_829_EXIT_Condition()
{
	return 1;
};

func void Info_ORG_829_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_ORG_829_Hello(C_Info)
{
	npc = Org_829_Organisator;
	nr = 1;
	condition = Info_ORG_829_Hello_Condition;
	information = Info_ORG_829_Hello_Info;
	permanent = 0;
	description = "��� ����?";
};


func int Info_ORG_829_Hello_Condition()
{
	if(FMTaken == FALSE)
	{
		return 1;
	};
};

func void Info_ORG_829_Hello_Info()
{
	AI_Output(other,self,"Info_ORG_829_Hello_15_00");	//��� ����?
	AI_Output(self,other,"Info_ORG_829_Hello_06_01");	//��� ����. � ���� ����������� ������.
};


var int Org_829_GotJoint;

instance Info_ORG_829_OfferJoint(C_Info)
{
	npc = Org_829_Organisator;
	nr = 1;
	condition = Info_ORG_829_OfferJoint_Condition;
	information = Info_ORG_829_OfferJoint_Info;
	permanent = 1;
	description = "� ���� ���� ��������. ������?";
};


func int Info_ORG_829_OfferJoint_Condition()
{
	if(Npc_KnowsInfo(hero,Info_ORG_829_Hello) && (Org_829_GotJoint == FALSE))
	{
		return 1;
	};
};

func void Info_ORG_829_OfferJoint_Info()
{
	AI_Output(other,self,"Info_ORG_829_OfferJoint_15_00");	//� ���� ���� ��������. ������?
	if((Npc_HasItems(other,ItMiJoint_1) > 0) || (Npc_HasItems(other,ItMiJoint_2) > 0) || (Npc_HasItems(other,ItMiJoint_3) > 0))
	{
		if(Npc_HasItems(other,ItMiJoint_1))
		{
			B_GiveInvItems(other,self,ItMiJoint_1,1);
			b_printtrademsg1("����� '�������'.");
		}
		else if(Npc_HasItems(other,ItMiJoint_2))
		{
			B_GiveInvItems(other,self,ItMiJoint_2,1);
			b_printtrademsg1("����� '�������� ������'.");
		}
		else if(Npc_HasItems(other,ItMiJoint_3))
		{
			B_GiveInvItems(other,self,ItMiJoint_3,1);
			b_printtrademsg1("����� '��� �����'.");
		};
		AI_Output(self,other,"Info_ORG_829_OfferJoint_06_01");	//��� ��! �� ���� �� ������ ���������, ��?
		if((other.guild == GIL_NOV) || (other.guild == GIL_TPL))
		{
			AI_Output(other,self,"Info_Swiney_Schuerfer_Ja_15_00");	//��.
		}
		else
		{
			AI_Output(other,self,"KDW_600_Saturas_TIMESUP_Info_15_05");	//���...
		};
		if((BaalKagan_VerteilKraut == LOG_RUNNING) || (BaalKagan_VerteilKraut == LOG_SUCCESS))
		{
			NC_Joints_verteilt = NC_Joints_verteilt + 1;
			b_printtrademsg2("�������� ����: 10");
			CreateInvItems(self,ItMiNugget,10);
			B_GiveInvItems(self,other,ItMiNugget,10);
		};
		Org_829_GotJoint = TRUE;
	}
	else
	{
		AI_Output(self,other,"Info_ORG_829_OfferJoint_No_Joint_06_00");	//��! �� �������� ���� �������, ��? ��� ��� �� ��������!
	};
};


instance Info_ORG_829_SpecialInfo(C_Info)
{
	npc = Org_829_Organisator;
	nr = 1;
	condition = Info_ORG_829_SpecialInfo_Condition;
	information = Info_ORG_829_SpecialInfo_Info;
	permanent = 0;
	description = "� ����� �������. ������ ��� ���-������ ������������?";
};


func int Info_ORG_829_SpecialInfo_Condition()
{
	if((Org_829_GotJoint == TRUE) && (Kapitel < 4))
	{
		return 1;
	};
};

func void Info_ORG_829_SpecialInfo_Info()
{
	AI_Output(other,self,"Info_ORG_829_SpecialInfo_15_00");	//� ����� �������. ������ ��� ���-������ ������������?
	AI_Output(self,other,"Info_ORG_829_SpecialInfo_06_01");	//�������! ����� ������� � ������, �������� � ������. �� ���� �� ���������, �������� �����, �� � ��� ����� ����� ����. �� ��� ���� �� ���.
	AI_Output(other,self,"Info_ORG_829_SpecialInfo_15_02");	//���� �� ���?
	AI_Output(self,other,"Info_ORG_829_SpecialInfo_06_03");	//��, �� �����, ������? �����, ������� ���� ������ �������. ��� ���.
};


instance Info_ORG_829_PERM(C_Info)
{
	npc = Org_829_Organisator;
	nr = 1;
	condition = Info_ORG_829_PERM_Condition;
	information = Info_ORG_829_PERM_Info;
	permanent = 0;
	description = "� �� ������ ���������� ���, ��� ��� �� ������?";
};


func int Info_ORG_829_PERM_Condition()
{
	if((Org_829_GotJoint == TRUE) && (Kapitel < 4))
	{
		return 1;
	};
};

func void Info_ORG_829_PERM_Info()
{
	AI_Output(other,self,"Info_ORG_829_PERM_15_00");	//� �� ������ ���������� ���, ��� ��� �� ������?
	AI_Output(self,other,"Info_ORG_829_PERM_06_01");	//������ ����� ����, � ��� ��� �������.
};

