instance Info_Vlk_GiveMeOre(C_Info)
{
	nr = 5;
	condition = Info_Vlk_GiveMeOre_Condition;
	information = Info_Vlk_GiveMeOre_Info;
	permanent = 1;
	description = "С тебя руда";
};


func int Info_Vlk_GiveMeOre_Condition()
{
	if(
		(
		other.guild == GIL_GRD
	||	other.guild == GIL_EBR
		) && !B_Npc_PayDayOre_IsPayed(self)
	){return true;};
	return false;
};

func void Info_Vlk_GiveMeOre_Info()
{
	AI_Output(other,self,"Vlk_GiveMeOre_NULL_01"); //С тебя руда.
	B_GiveInvItems(self,other,ItMiNugget,10);
	B_Npc_PayDayOre_SetPayed(self,true);
	AI_StopProcessInfos(self);
};

func void B_AssignAmbientInfos_Vlk(var C_Npc slf)
{
	Info_Vlk_GiveMeOre.npc = Hlp_GetInstanceID(slf);
};