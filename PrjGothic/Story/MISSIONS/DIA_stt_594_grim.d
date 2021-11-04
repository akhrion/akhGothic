
instance DIA_GRIM2_EXIT(C_Info)
{
	npc = stt_594_grim;
	nr = 999;
	condition = dia_grim2_exit_condition;
	information = dia_grim2_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_grim2_exit_condition()
{
	return 1;
};

func void dia_grim2_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Grim_INEXTREMOAWAY(C_Info)
{
	npc = stt_594_grim;
	nr = 1;
	condition = DIA_Grim_INEXTREMOAWAY_Condition;
	information = DIA_Grim_INEXTREMOAWAY_Info;
	permanent = 0;
	important = 0;
	description = "А где In Extremo?";
};


func int DIA_Grim_INEXTREMOAWAY_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Grim_INEXTREMO) && (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Grim_INEXTREMOAWAY_Info()
{
	AI_Output(hero,self,"DIA_Grim_INEXTREMOAWAY_15_01");	//А где In Extremo?
	AI_Output(self,hero,"DIA_Grim_INEXTREMOAWAY_06_02");	//Они уже уехали. А я уже так привык сидеть по вечерам перед сценой.
	AI_StopProcessInfos(self);
};

