
instance Info_Org_7_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Org_7_EXIT_Condition;
	information = Info_Org_7_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_Org_7_EXIT_Condition()
{
	return 1;
};

func void Info_Org_7_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Org_7_EinerVonEuchWerden(C_Info)
{
	nr = 4;
	condition = Info_Org_7_EinerVonEuchWerden_Condition;
	information = Info_Org_7_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "Я хочу присоединиться к вашему лагерю. Как это сделать?";
};


func int Info_Org_7_EinerVonEuchWerden_Condition()
{
	if(Npc_GetTrueGuild(other) == GIL_None)
	{
		return TRUE;
	};
};

func void Info_Org_7_EinerVonEuchWerden_Info()
{
	var C_Npc Lares;
	AI_Output(other,self,"Info_Org_7_EinerVonEuchWerden_15_00");	//Я хочу присоединиться к вашему лагерю. Как это сделать?
	AI_Output(self,other,"Info_Org_7_EinerVonEuchWerden_07_01");	//Мы можем принять тебя в нашу шайку. Но ты должен доказать нам, что ты против Гомеза.
	AI_Output(other,self,"Info_Org_7_EinerVonEuchWerden_15_02");	//И как это можно доказать?
	AI_Output(self,other,"Info_Org_7_EinerVonEuchWerden_07_03");	//На твоем месте я бы принес Ларсу что-нибудь очень важное из Старого лагеря или из их шахты.
	Lares = Hlp_GetNpc(Org_801_Lares);
	Lares.aivar[AIV_FINDABLE] = TRUE;
};


instance Info_Org_7_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Org_7_WichtigePersonen_Condition;
	information = Info_Org_7_WichtigePersonen_Info;
	permanent = 1;
	description = "Кто у вас главный?";
};


func int Info_Org_7_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Org_7_WichtigePersonen_Info()
{
	var C_Npc Lares;
	AI_Output(other,self,"Info_Org_7_WichtigePersonen_15_00");	//Кто у вас главный?
	AI_Output(self,other,"Info_Org_7_WichtigePersonen_07_01");	//Глава нашей шайки - Ларс. Большинство наших подчиняется ему.
	AI_Output(self,other,"Info_Org_7_WichtigePersonen_07_02");	//Но он никогда не указывает нам, что делать.
	Lares = Hlp_GetNpc(Org_801_Lares);
	Lares.aivar[AIV_FINDABLE] = TRUE;
};


instance Info_Org_7_DasLager(C_Info)
{
	nr = 2;
	condition = Info_Org_7_DasLager_Condition;
	information = Info_Org_7_DasLager_Info;
	permanent = 1;
	description = "Расскажешь мне о лагере?";
};


func int Info_Org_7_DasLager_Condition()
{
	return 1;
};

func void Info_Org_7_DasLager_Info()
{
	AI_Output(other,self,"Info_Org_7_DasLager_15_00");	//Расскажешь мне о лагере?
	AI_Output(self,other,"Info_Org_7_DasLager_07_01");	//В нашем лагере нет никаких особых правил. Каждый делает то, что считает нужным, но нас так много, что Гомезу не так уж легко будет от нас избавиться.
	AI_Output(self,other,"Info_Org_7_DasLager_07_02");	//А он бы сделал это с огромным удовольствием.
	AI_Output(other,self,"Info_Org_7_DasLager_15_03");	//Почему же он вас так не любит?
	AI_Output(self,other,"Info_Org_7_DasLager_07_04");	//Мы воруем его вещи!
};


instance Info_Org_7_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Org_7_DieLage_Condition;
	information = Info_Org_7_DieLage_Info;
	permanent = 1;
	description = "Каковы здешние порядки?";
};


func int Info_Org_7_DieLage_Condition()
{
	return 1;
};

func void Info_Org_7_DieLage_Info()
{
	AI_Output(other,self,"Info_Org_7_DieLage_15_00");	//Как здесь живется?
	AI_Output(self,other,"Info_Org_7_DieLage_07_01");	//Ты прибыл сюда недавно, да?
	AI_Output(self,other,"Info_Org_7_DieLage_07_02");	//Маги многие годы вели приготовления, чтобы взорвать гору руды. Судя по всему, очень скоро они так и сделают.
	AI_Output(self,other,"Info_Org_7_DieLage_07_03");	//По крайней мере, именно это мне приходит в голову, когда я вижу нашу гору руды, которую добыли рудокопы.
};


instance Info_Org_7_Krautprobe(C_Info)
{
	nr = 5;
	condition = Info_Org_7_Krautprobe_Condition;
	information = Info_Org_7_Krautprobe_Info;
	permanent = 1;
	description = "Болотника хочешь?";
};


func int Info_Org_7_Krautprobe_Condition()
{
	if(((BaalKagan_VerteilKraut == LOG_RUNNING) || (BaalKagan_VerteilKraut == LOG_SUCCESS)) && (self.aivar[AIV_DEALDAY] <= Wld_GetDay()))
	{
		return TRUE;
	};
};

func void Info_Org_7_Krautprobe_Info()
{
	AI_Output(other,self,"Info_Org_7_Krautprobe_15_00");	//Болотника хочешь?
	if((Npc_HasItems(other,ItMiJoint_1) > 0) || (Npc_HasItems(other,ItMiJoint_2) > 0) || (Npc_HasItems(other,ItMiJoint_3) > 0))
	{
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
		AI_Output(self,other,"Info_Org_7_Krautprobe_07_01");	//Да, вот тебе за него десять кусков руды.
		AI_Output(self,other,"Info_Org_7_Krautprobe_07_02");	//Если захочешь продать еще, приходи ко мне.
		b_printtrademsg2("Получено руды: 10");
		CreateInvItems(self,ItMiNugget,10);
		B_GiveInvItems(self,other,ItMiNugget,10);
		self.aivar[AIV_DEALDAY] = Wld_GetDay() + 1;
		NC_Joints_verteilt = NC_Joints_verteilt + 1;
	}
	else
	{
		AI_Output(self,other,"Info_Org_7_Krautprobe_No_Joint_07_00");	//Какого болотника? У тебя же его нет!
	};
};

func void B_AssignAmbientInfos_Org_7(var C_Npc slf)
{
	B_AssignFindNpc_NC(slf);
	Info_Org_7_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Org_7_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Org_7_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Org_7_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Org_7_DieLage.npc = Hlp_GetInstanceID(slf);
	Info_Org_7_Krautprobe.npc = Hlp_GetInstanceID(slf);
};

