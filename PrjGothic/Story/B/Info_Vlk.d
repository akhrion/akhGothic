instance Info_Vlk_GiveMeOre(C_Info)
{
	nr = 5;
	condition = Info_Vlk_GiveMeOre_Condition;
	information = Info_Vlk_GiveMeOre_Info;
	permanent = 1;
	description = "С тебя дневная плата за защиту.";
};


func int Info_Vlk_GiveMeOre_Condition()
{
	if(
		other.guild == GIL_GRD
	||	other.guild == GIL_EBR
	){return true;};
	return false;
};

func void Info_Vlk_GiveMeOre_Info()
{
	AI_Output(other,self,"Vlk_GiveMeOre_NULL_01"); //С тебя дневная плата за защиту.
	if(B_Npc_PayDayOre_IsPayed(self))
	{
		AI_Output(self,other,"Vlk_GiveMeOre_NULL_02"); //Я сегодня уже все отдал.
	}
	else
	{
		AI_Output(self,other,"Vlk_GiveMeOre_NULL_03"); //Да, конечно.
		B_GiveInvItems(self,other,ItMiNugget,10);
		B_Npc_PayDayOre_FlipPayedFlag(self);
	};
	AI_StopProcessInfos(self);
};

func void B_AssignAmbientInfos_Vlk(var C_Npc slf)
{
	Info_Vlk_GiveMeOre.npc = Hlp_GetInstanceID(slf);
};