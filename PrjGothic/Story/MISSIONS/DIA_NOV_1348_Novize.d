
instance DIA_1348_WatchingSea(C_INFO)
{
	npc = NOV_1348_Novize;
	nr = 1;
	condition = DIA_1348_WatchingSea_Condition;
	information = DIA_1348_WatchingSea_Info;
	important = 1;
	permanent = 1;
};
func int DIA_1348_WatchingSea_Condition()
{
	if(
		Npc_WasInState(self,ZS_WatchIngSea) &&
		Npc_IsInState(self,ZS_Talk)
	)
	{
		return true;
	};
	return false;
};
func void DIA_1348_WatchingSea_Info()
{
	AI_Output(self,other,"DIA_1348_WatchingSea_NULL_0");//Выход кажется таким близким.
	AI_Output(self,other,"DIA_1348_WatchingSea_NULL_1");//Свобода? Но нет ее здесь.
	AI_StopProcessInfos(self);
};
