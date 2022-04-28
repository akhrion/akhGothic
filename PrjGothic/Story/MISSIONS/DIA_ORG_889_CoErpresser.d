
instance INFO_COERPRESSER_EXIT(C_Info)
{
	npc = ORG_889_CoErpresser;
	nr = 999;
	condition = info_coerpresser_exit_condition;
	information = info_coerpresser_exit_info;
	important = 1;
	permanent = 1;
};


func int info_coerpresser_exit_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void info_coerpresser_exit_info()
{
	AI_Output(self,other,"SVM_7_YouDeafOrWhat");	//Хочешь со мной поссориться? Уйди с дороги!
	AI_StopProcessInfos(self);
};

