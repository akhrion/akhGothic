
instance GUR_1212_MadCorKalom_Talk2SC(C_Info)
{
	npc = GUR_1212_MadCorKalom;
	condition = GUR_1212_MadCorKalom_Talk2SC_Condition;
	information = GUR_1212_MadCorKalom_Talk2SC_Info;
	important = 1;
	permanent = 0;
};


func int GUR_1212_MadCorKalom_Talk2SC_Condition()
{
	if(Npc_GetDistToPlayer(self) < 5000)
	{
		return TRUE;
	};
};

func void GUR_1212_MadCorKalom_Talk2SC_Info()
{
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,Npc_GetNearestWP(hero));
	B_WhirlAround(self,hero);
	AI_GotoWP(hero,Npc_GetNearestWP(hero));
	B_WhirlAround(hero,self);
	AI_Wait(hero,4);
	B_WhirlAround(hero,self);
	AI_Wait(hero,3);
	B_WhirlAround(hero,self);
	AI_Wait(hero,2);
	B_WhirlAround(hero,self);
	AI_Wait(hero,1);
	B_WhirlAround(hero,self);
	AI_Wait(hero,1);
	B_WhirlAround(hero,self);
	AI_Wait(hero,1);
	B_WhirlAround(hero,self);
	AI_Output(self,hero,"GUR_1212_MadCorKalom_Talk2SC_10_01");	//Вот мы снова и встретились!
	AI_Output(self,hero,"GUR_1212_MadCorKalom_Talk2SC_10_02");	//Мой повелитель уже сообщил мне о тебе.
	AI_Output(self,hero,"GUR_1212_MadCorKalom_Talk2SC_10_03");	//Он чувствует, что ты рядом.
	AI_Output(hero,self,"GUR_1212_MadCorKalom_Talk2SC_15_04");	//Скоро я подойду к нему даже ближе, чем ему бы хотелось!
	AI_Output(self,hero,"GUR_1212_MadCorKalom_Talk2SC_10_05");	//Мы не позволим тебе испортить все.
	AI_Output(self,hero,"GUR_1212_MadCorKalom_Talk2SC_10_06");	//Мир на пороге пробуждения нашего Избавителя, и никто не остановит его.
	AI_Output(self,hero,"GUR_1212_MadCorKalom_Talk2SC_10_07");	//Все неверные заплатят за свои грехи.
	AI_Output(self,hero,"GUR_1212_MadCorKalom_Talk2SC_10_08");	//И ты будешь первым в их рядах.
	AI_Output(self,hero,"GUR_1212_MadCorKalom_Talk2SC_10_09");	//Пробудись, Спящий!
	B_ExchangeRoutine(KDF_406_OTXardas,"REMOVE");
	AI_StopProcessInfos(self);
	Npc_SetAttitude(self,ATT_HOSTILE);
	Npc_SetTempAttitude(self,ATT_HOSTILE);
	AI_Wait(self,2);
	Npc_SetTarget(self,hero);
	AI_StartState(self,ZS_Attack,0,"");
};

