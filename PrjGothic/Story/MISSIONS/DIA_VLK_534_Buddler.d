
instance DIA_Vlk_534_Exit(C_Info)
{
	npc = VLK_534_Buddler;
	nr = 999;
	condition = DIA_Vlk_534_Exit_Condition;
	information = DIA_Vlk_534_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Vlk_534_Exit_Condition()
{
	return 1;
};

func void DIA_Vlk_534_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Vlk_534_LeaveMe(C_Info)
{
	npc = VLK_534_Buddler;
	nr = 1;
	condition = DIA_Vlk_534_LeaveMe_Condition;
	information = DIA_Vlk_534_LeaveMe_Info;
	permanent = 1;
	description = "ѕочему ты не в лагере?";
};


func int DIA_Vlk_534_LeaveMe_Condition()
{
	if(Kapitel < 4)
	{
		return 1;
	};
};

func void DIA_Vlk_534_LeaveMe_Info()
{
	AI_Output(other,self,"DIA_Vlk_534_LeaveMe_15_00");	//ѕочему ты не в лагере?
	AI_Output(self,other,"DIA_Vlk_534_LeaveMe_02_01");	//я жду одного друга из шахты. ќн задолжал мне руду.
	AI_Output(self,other,"DIA_Vlk_534_LeaveMe_02_02");	//ј без руды мне нельз€ по€вл€тьс€ в лагере, потому что € не смогу заплатить стражникам за защиту, и тогда у мен€ начнутс€ большие непри€тности.
	AI_StopProcessInfos(self);
};

