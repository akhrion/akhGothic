
instance NOV_1308_Novize(Npc_Default)
{
	name[0] = NAME_Novize;
	npcType = npctype_ambient;
	guild = GIL_NOV;
	level = 9;
	voice = 14;
	id = 1308;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 15;
	attribute[ATR_DEXTERITY] = 15;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 148;
	attribute[ATR_HITPOINTS] = 148;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_Bald",34,3,nov_armor_m);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1H_Axe_Old_01);
	CreateInvItems(self,ItMiJoint_1,20);
	CreateInvItems(self,ItMiNugget,50);
	daily_routine = Rtn_start_1308;
};


func void Rtn_start_1308()
{
	TA_HerbAlchemy(7,5,0,5,"PSI_HERB_PLACE_3");
	TA_Sleep(0,5,7,5,"PSI_6_HUT_IN_BED1");
};

func void rtn_ch5_1308()
{
	TA_Stay(8,0,16,0,"NC_TAVERN_ROOM07");
	TA_Smalltalk(16,0,17,0,"NC_TAVERN_SIDE02");
	TA_StandAround(17,0,23,0,"NC_TAVERN_ROOM07");
	TA_SitAround(23,0,8,0,"NC_TAVERN_SIT");
};


instance DIA_1308_NOVIZE_EXIT(C_Info)
{
	npc = NOV_1308_Novize;
	nr = 999;
	condition = dia_1308_novize_exit_condition;
	information = dia_1308_novize_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_1308_novize_exit_condition()
{
	return 1;
};

func void dia_1308_novize_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_1308_NOVIZE_HI(C_Info)
{
	npc = NOV_1308_Novize;
	nr = 1;
	condition = dia_1308_novize_hi_condition;
	information = dia_1308_novize_hi_info;
	permanent = 0;
	important = 1;
};


func int dia_1308_novize_hi_condition()
{
	if((Kapitel > 2) && (BaalIsidro_DealerJob != LOG_SUCCESS))
	{
		return 1;
	};
};

func void dia_1308_novize_hi_info()
{
	AI_Output(self,other,"DIA_Baal1308_01");	//Приветствую тебя, незнакомец! Я продаю косяки из свежайшего болотника, прямиком из Болотного лагеря! Обращайся ко мне, договоримся...
	if((BAALISIDRO_JOINTS_STARTED == TRUE) && !Npc_KnowsInfo(hero,dia_baalisidro_revenge) && !Npc_KnowsInfo(hero,dia_baalisidro_hello_ch5))
	{
		AI_Output(other,self,"DIA_Baal1308_02");	//Где я могу найти...
		AI_Output(self,other,"DIA_Baal1308_03");	//...Идола Исидро? Теперь я вместо него. Он поддался искушению мирской жизни вдали от своих братьев и больше не мог выполнять свои обязанности.
		AI_Output(self,other,"DIA_Baal1308_04");	//Гуру решили вернуть его к более простой работе.
	};
	Log_CreateTopic(GE_TraderNC,LOG_NOTE);
	B_LogEntry(GE_TraderNC,"В баре на озере появился послушник из Болотного лагеря. Он продает косяки из болотника.");
};


instance DIA_1308_NOVIZE_TRADE(C_Info)
{
	npc = NOV_1308_Novize;
	nr = 800;
	condition = dia_1308_novize_trade_condition;
	information = dia_1308_novize_trade_info;
	permanent = 1;
	description = "Покажи, что ты там продаешь.";
	trade = 1;
};


func int dia_1308_novize_trade_condition()
{
	if((Kapitel > 2) && Npc_KnowsInfo(hero,dia_1308_novize_hi))
	{
		return 1;
	};
};

func void dia_1308_novize_trade_info()
{
	AI_Output(other,self,"DIA_BaalIsidro_TRADE_15_00");	//Покажи, что ты там продаешь.
};


instance DIA_1308_NOVIZE_PRECH2(C_Info)
{
	npc = NOV_1308_Novize;
	nr = 2;
	condition = dia_1308_novize_prech2_condition;
	information = dia_1308_novize_prech2_info;
	permanent = 1;
	description = "Как дела?";
};


func int dia_1308_novize_prech2_condition()
{
	if((Kapitel < 2) || (BaalIsidro_DealerJob == LOG_SUCCESS))
	{
		return 1;
	};
};

func void dia_1308_novize_prech2_info()
{
	AI_Output(other,self,"DIA_Gravo_Hallo_15_00");	//Как дела?
	AI_Output(self,other,"DIA_BaalParvez_Sleeper_10_01");	//Спящий говорит с нами во снах и видениях.
	AI_Output(self,other,"DIA_BaalParvez_PSIMagic_10_02");	//Только Гуру посвящены в таинство магии Спящего.
};

