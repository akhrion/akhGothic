
instance DIA_Org_875_EXIT(C_Info)
{
	npc = ORG_875_Tuersteher;
	nr = 999;
	condition = DIA_Org_875_EXIT_Condition;
	information = DIA_Org_875_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Org_875_EXIT_Condition()
{
	return 1;
};

func void DIA_Org_875_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Org_875_PERM(C_Info)
{
	npc = ORG_875_Tuersteher;
	nr = 1;
	condition = DIA_Org_875_PERM_Condition;
	information = DIA_Org_875_PERM_Info;
	permanent = 1;
	description = "Ты пропускаешь кого-нибудь, кроме воров и рудокопов?";
};


func int DIA_Org_875_PERM_Condition()
{
	return 1;
};

func void DIA_Org_875_PERM_Info()
{
	AI_Output(other,self,"DIA_Org_875_PERM_15_00");	//Ты пропускаешь кого-нибудь, кроме воров и рудокопов?
	AI_Output(self,other,"DIA_Org_875_PERM_13_01");	//Братьям из секты здесь проход всегда открыт.
	AI_Output(self,other,"DIA_Org_875_PERM_13_02");	//Но кроме них мы никого не пропускаем.
};

