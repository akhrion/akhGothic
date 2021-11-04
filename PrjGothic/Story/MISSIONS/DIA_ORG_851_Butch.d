
instance DIA_Butch_Exit(C_Info)
{
	npc = ORG_851_Butch;
	nr = 999;
	condition = DIA_Butch_Exit_Condition;
	information = DIA_Butch_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Butch_Exit_Condition()
{
	return TRUE;
};

func void DIA_Butch_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance BUTCH_GETLOST(C_Info)
{
	npc = ORG_851_Butch;
	nr = 1;
	condition = butch_getlost_condition;
	information = butch_getlost_info;
	permanent = 0;
	important = 1;
};


func int butch_getlost_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void butch_getlost_info()
{
	if(Npc_GetTrueGuild(hero) != GIL_ORG)
	{
		AI_Output(self,other,"DIA_Butch_GS_01");	//Чего уставился?
	};
	if(((BaalKagan_VerteilKraut == LOG_RUNNING) || (BaalKagan_VerteilKraut == LOG_SUCCESS)) && ((Npc_HasItems(other,ItMiJoint_1) > 0) || (Npc_HasItems(other,ItMiJoint_2) > 0) || (Npc_HasItems(other,ItMiJoint_3) > 0)))
	{
		AI_Output(other,self,"Info_Org_13_Krautprobe_15_00");	//Просто подумал, может быть, ты захочешь болотника.
		if(Npc_HasItems(other,ItMiJoint_1))
		{
			B_GiveInvItems(other,self,ItMiJoint_1,1);
			b_printtrademsg1("Отдан 'Новичок'.");
		}
		else if(Npc_HasItems(other,ItMiJoint_2))
		{
			B_GiveInvItems(other,self,ItMiJoint_2,1);
			b_printtrademsg1("Отдан 'Северный темный'.");
		}
		else if(Npc_HasItems(other,ItMiJoint_3))
		{
			B_GiveInvItems(other,self,ItMiJoint_3,1);
			b_printtrademsg1("Отдан 'Зов мечты'.");
		};
		NC_Joints_verteilt = NC_Joints_verteilt + 1;
		AI_Output(self,other,"DIA_Butch_GS_02");	//О, давай его сюда! Гуляй пока, малыш...
		Info_ClearChoices(butch_getlost);
		Info_AddChoice(butch_getlost,"Я думаю, ты меня не так понял!",butch_getlost_take);
		Info_AddChoice(butch_getlost,"Лучше я пойду отсюда...",butch_getlost_forget);
	}
	else if((Npc_GetTrueGuild(hero) == GIL_None) || (Npc_GetTrueGuild(hero) == GIL_STT) || (Npc_GetTrueGuild(hero) == GIL_GRD) || (Npc_GetTrueGuild(hero) == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Butch_GS_03");	//Что ты здесь забыл, оборванец вонючий?
		AI_StopProcessInfos(self);
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_Attack,1,"");
		self.guild = GIL_None;
		Npc_SetTrueGuild(self,GIL_None);
		Npc_SetPermAttitude(self,ATT_HOSTILE);
		Npc_SetTempAttitude(self,ATT_HOSTILE);
	}
	else if((Npc_GetTrueGuild(hero) == GIL_ORG) || (Npc_GetTrueGuild(hero) == GIL_SLD) || (Npc_GetTrueGuild(hero) == GIL_KDW))
	{
		AI_DrawWeapon(self);
		AI_Output(self,other,"DIA_Butch_GS_04");	//Не нравится мне твоя рожа... Попробуй только чихнуть громко, мигом глотку перережу!
		AI_StopProcessInfos(self);
		AI_RemoveWeapon(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Butch_GS_05");	//Не нравится мне твоя рожа...
		AI_StopProcessInfos(self);
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_Attack,0,"");
	};
};

func void butch_getlost_take()
{
	AI_Output(other,self,"DIA_SLD_753_Baloro_SC_wills_wissen_Info_15_02");	//Я думаю, ты меня не так понял!
	AI_Output(self,other,"DIA_Butch_GS_06");	//Чего??
	if((Npc_GetTrueGuild(hero) == GIL_None) || (Npc_GetTrueGuild(hero) == GIL_STT) || (Npc_GetTrueGuild(hero) == GIL_GRD) || (Npc_GetTrueGuild(hero) == GIL_KDF))
	{
		AI_StopProcessInfos(self);
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_Attack,1,"");
		self.guild = GIL_None;
		Npc_SetTrueGuild(self,GIL_None);
		Npc_SetPermAttitude(self,ATT_HOSTILE);
		Npc_SetTempAttitude(self,ATT_HOSTILE);
	}
	else
	{
		AI_StopProcessInfos(self);
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_Attack,0,"");
	};
};

func void butch_getlost_forget()
{
	AI_Output(other,self,"DIA_SLD_761_Soeldner_EXIT_2_INFO_15_01");	//Лучше я пойду отсюда...
	AI_StopProcessInfos(self);
};


instance BUTCH_GETLOST2(C_Info)
{
	npc = ORG_851_Butch;
	nr = 1;
	condition = butch_getlost2_condition;
	information = butch_getlost2_info;
	permanent = 1;
	important = 1;
};


func int butch_getlost2_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && Npc_KnowsInfo(hero,butch_getlost))
	{
		return TRUE;
	};
};

func void butch_getlost2_info()
{
	AI_Output(self,other,"SVM_19_GetOutOfHere");	//Проваливай!
	AI_StopProcessInfos(self);
};

