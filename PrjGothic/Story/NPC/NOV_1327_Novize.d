
instance NOV_1327_Novize(Npc_Default)
{
	name[0] = NAME_Novize;
	npcType = npctype_ambient;
	guild = GIL_NOV;
	level = 3;
	voice = 5;
	id = 1327;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 76;
	attribute[ATR_HITPOINTS] = 76;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_Bald",29,1,nov_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,-1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1H_Hatchet_01);
	daily_routine = Rtn_start_1327;
};


func void Rtn_start_1327()
{
	TA_Sleep(0,0,7,0,"PSI_31_HUT_IN");
	TA_Stand(7,0,0,0,"PSI_31_HUT_EX");
};

func void rtn_wait_1327()
{
	TA_Stand(0,0,7,0,"PSI_31_HUT_EX");
	TA_Stand(7,0,0,0,"PSI_31_HUT_EX");
};


instance DIA_WHEREISFORTUNO(C_Info)
{
	npc = NOV_1327_Novize;
	condition = dia_whereisfortuno_condition;
	information = dia_whereisfortuno_info;
	important = 1;
	permanent = 0;
};


func int dia_whereisfortuno_condition()
{
	if((CORKALOMLEFT == TRUE) && !Npc_KnowsInfo(hero,dia_fortuno_help))
	{
		return TRUE;
	};
};

func void dia_whereisfortuno_info()
{
	AI_Output(self,other,"Info_WhereIsFortuno_01");	//Если ты ищешь Фортуно, то он теперь работает в лаборатории Кор Галома. Варит какие-то зелья и провонял всю мою хижину!
	Npc_ExchangeRoutine(self,"start");
	AI_StopProcessInfos(self);
};

