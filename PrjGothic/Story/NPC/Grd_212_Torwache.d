
instance Grd_212_Torwache(Npc_Default)
{
	name[0] = NAME_Torwache;
	npcType = npctype_main;
	guild = GIL_GRD;
	level = 15;
	voice = 13;
	id = 212;
	attribute[ATR_STRENGTH] = 70;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 220;
	attribute[ATR_HITPOINTS] = 220;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Bald",19,1,grd_armor_m);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	aivar[AIV_IMPORTANT] = TRUE;
	aivar[AIV_RESPAWN] = TRUE;
	aivar[AIV_PASSGATE] = true; //с этой хуйнёй сопряжён баг: крашится игра, если у 213ого false и 213ый находится не в воротах, а ГГ находится на WP: OCC_GATE.. вообще странный баг, ибо он тригирится извне.. если ГГ на OCC_GATE, то тригирится алерт, но алерт не от 212 или 213, а хуй знает откуда..
	fight_tactic = FAI_HUMAN_RANGED;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_CROSSBOW,1);
	EquipItem(self,ItMw_1H_Sword_03);
	EquipItem(self,ItRw_Crossbow_01);
	CreateInvItems(self,ItAmBolt,30);
	CreateInvItem(self,ItFoCheese);
	CreateInvItem(self,ItFoApple);
	CreateInvItems(self,ItMiNugget,10);
	CreateInvItem(self,ItLsTorch);
	daily_routine = Rtn_start_212;
};


func void Rtn_start_212()
{
	TA_GuardPassage(7,30,0,0,"OCC_GATE_RIGHT_GUARD");
//	TA_GuardPassage(0,0,7,30,"OCC_GATE_RIGHT_GUARD");
	TA_GuardPassage(0,0,7,30,"OCC_GATE");
};

func void Rtn_OMFull_212()
{
	TA_GuardPassage(6,0,21,0,"OCC_GATE_RIGHT_GUARD");
	TA_StandAround(21,0,22,0,"OCC_MERCS_RIGHT_ROOM_FRONT");
	TA_SitAround(22,0,24,0,"OCC_GATE_CAMPFIRE_1");
	TA_Sleep(24,0,6,0,"OCC_MERCS_UPPER_LEFT_ROOM_FRONT");
};

func void Rtn_FMTaken_212()
{
};

func void Rtn_OrcAssault_212()
{
};

instance INFO_GRD212_FireMagesLetter(C_Info)
{
	npc = Grd_212_Torwache;
	condition = INFO_GRD212_FireMagesLetter_condition;
	information = INFO_GRD212_FireMagesLetter_info;
	permanent = 0;
	description = "Слушай, мне очень нужно попасть внутрь.";
};

func int info_grd212_FireMagesLetter_condition()
{
	if(
		!isPermPass_OCCGATE &&
		!isTempPass_grd212 &&
		Npc_GetDistToNpc(self,GRD_200_Thorus) > 2000) &&
		getCurDayHours() < 4
	{
		return TRUE;
	};
	return false;
};

func void info_grd212_FireMagesLetter_info()
{
	AI_Output(hero,self,"FireMagesLetter_NULL_01"); //Слушай мне очень шужно попасть внутрь.
	AI_Output(self,hero,"FireMagesLetter_NULL_02"); //Да что ты говоришь..
	AI_Output(self,hero,"FireMagesLetter_NULL_03"); //А мне очень нужно, что-бы было много пива, много мяса и НИКОГО больше.
	AI_Output(self,hero,"FireMagesLetter_NULL_04"); //Тебе что-то нужно? Вали отсюда!
	Log_CreateTopic(CH1_PassToInnerOldCamp,LOG_NOTE);
	B_LogEntry(CH1_PassToInnerOldCamp,"Один из стражников, у входа во внутреннее кольцо, возможно пропустит меня, если я принесу ему немного пива и мяса.");
	B_LogEntry(CH1_PassToInnerOldCamp,"Или-же я что-то не так понял и мне каюк..");
	AI_StopProcessInfos(self);
};

instance INFO_GRD212_FireMagesLetterFood(C_Info)
{
	npc = Grd_212_Torwache;
	condition = INFO_GRD212_FireMagesLetterFood_condition;
	information = INFO_GRD212_FireMagesLetterFood_info;
	permanent = 1;
	description = "Вот, посмотри что я тут принес.";
};

func int info_grd212_FireMagesLetterFood_condition()
{
	if(
		Npc_KnowsInfo(hero,INFO_GRD212_FireMagesLetter) &&
		!isTempPass_grd212 &&
		!isPermPass_OCCGATE
	)
	{
		return TRUE;
	};
	return false;
};

func void info_grd212_FireMagesLetterFood_info()
{
	AI_Output(hero,self,"FireMagesLetterFood_NULL_01"); //Вот, посмотри что я тут принес.
	if(
		Npc_GetDistToNpc(self,GRD_200_Thorus) > 2000
	)
	{
		if(
			Npc_HasItems(hero,ItFoBeer) > 4 &&
			Npc_HasItems(hero,ItFoMutton) > 9
		)
		{
			isTempPass_grd212 = true;
			tempPassExpires_grd212 = getTimestamp() / 1440 * 1440 + 5 * 60;
			B_GiveInvItems(hero,self,ItFoBeer,5);
			b_printtrademsg1("Отдано 5 бутылок пива");
			B_GiveInvItems(hero,self,ItFoMutton,10);
			b_printtrademsg2("И 10 кусков мяса");
//			Npc_GiveItem(hero,ItFoBeer,self);
//			AI_TakeItem(self,ItFoBeer);
//			Npc_GiveItem(hero,ItFoMutton,self);
//			AI_TakeItem(self,ItFoMutton);//Визуально это выглядит, как Милтен бегает после получения письма.. это нерабочая функция.
			B_LogEntry(CH1_PassToInnerOldCamp,"Так, стражник сказал, что я могу пройти, но выйти должен до утра. Эх жаль никто не изобрел часов.. что?");
			AI_Output(self,hero,"FireMagesLetterFood_NULL_02"); //Хмм.. ну. Топай.
		}
		else
		{
			AI_Output(self,hero,"FireMagesLetterFood_NULL_06"); //Эх парень, ты меня разочаровываешь. Этим ты будешь кормить свою мышку. Такую маааленькую, знаешь..
		};
	}
	else
	{
		AI_Output(self,hero,"FireMagesLetterFood_NULL_04"); //Тебе что здесь, олух надо?!
		AI_Output(self,hero,"FireMagesLetterFood_NULL_05"); //Что ты несешь?!
		AI_StopProcessInfos(self);
		Npc_SetTarget(self,hero);
		AI_StartState(self,ZS_Attack,1,"");
	};
	AI_StopProcessInfos(self);
};
instance INFO_GRD212_FireMagesLetterFoodNote(C_Info)
{
	npc = Grd_212_Torwache;
	condition = INFO_GRD212_FireMagesLetterFoodNote_condition;
	information = INFO_GRD212_FireMagesLetterFoodNote_info;
	permanent = 0;
	important = 1;
};
func int info_grd212_FireMagesLetterFoodNote_condition()
{
	if(
		isTempPass_grd212
	)
	{
		return TRUE;
	};
	return false;
};
func void INFO_GRD212_FireMagesLetterFoodNote_info()
{
	AI_UseItem(self,ItFoMutton);
	AI_Output(self,hero,"FireMagesLetterFood_NULL_03"); //А.. и да.. (ном-ном) не выйдешь до утра - пиняй на себя.
	AI_StopProcessInfos(self);
};