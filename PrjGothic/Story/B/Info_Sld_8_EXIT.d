
instance Info_Sld_8_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Sld_8_EXIT_Condition;
	information = Info_Sld_8_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_Sld_8_EXIT_Condition()
{
	return 1;
};

func void Info_Sld_8_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Sld_8_EinerVonEuchWerden(C_Info)
{
	nr = 4;
	condition = Info_Sld_8_EinerVonEuchWerden_Condition;
	information = Info_Sld_8_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "Вам нужны люди?";
};


func int Info_Sld_8_EinerVonEuchWerden_Condition()
{
	if((Npc_GetTrueGuild(other) != GIL_SLD) && (Npc_GetTrueGuild(other) != GIL_KDW) && !C_NpcBelongsToOldCamp(other) && !C_NpcBelongsToPsiCamp(other))
	{
		return TRUE;
	};
};

func void Info_Sld_8_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Sld_8_EinerVonEuchWerden_15_00");	//Вам нужны люди?
	AI_Output(self,other,"Info_Sld_8_EinerVonEuchWerden_08_01");	//Ли не принимает к себе в солдаты людей, которые никак себя не проявили. Ему нужны опытные наемники.
	AI_Output(self,other,"Info_Sld_8_EinerVonEuchWerden_08_02");	//Если ты хочешь присоединиться к нашему лагерю, тебе сначала нужно обратиться к ворам.
};


instance Info_Sld_8_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Sld_8_WichtigePersonen_Condition;
	information = Info_Sld_8_WichtigePersonen_Info;
	permanent = 1;
	description = "Кто здесь всем руководит?";
};


func int Info_Sld_8_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Sld_8_WichtigePersonen_Info()
{
	var C_Npc Lee;
	var C_Npc Cronos;
	AI_Output(other,self,"Info_Sld_8_WichtigePersonen_15_00");	//Кто здесь всем руководит?
	AI_Output(self,other,"Info_Sld_8_WichtigePersonen_08_01");	//Ли. Он командует наемниками. Он договорился с магами. Мы их охраняем, а они находят способ вытащить нас отсюда.
	AI_Output(other,self,"Info_Sld_8_WichtigePersonen_15_02");	//Значит, все-таки маги все контролируют?
	AI_Output(self,other,"Info_Sld_8_WichtigePersonen_08_03");	//Нет. На самом деле в этом лагере нет одного лидера. Многие просто перешли сюда из Старого лагеря.
	AI_Output(self,other,"Info_Sld_8_WichtigePersonen_08_04");	//Здесь каждый сам за себя. И только одно нас объединяет - желание выбраться из этой колонии как можно быстрее. Так что лучше собрать руду в общую кучу и взорвать ее, чем отдать хоть кусок королю!
	Lee = Hlp_GetNpc(Sld_700_Lee);
	Lee.aivar[AIV_FINDABLE] = TRUE;
	Cronos = Hlp_GetNpc(KDW_604_Cronos);
	Cronos.aivar[AIV_FINDABLE] = TRUE;
};


instance Info_Sld_8_DasLager(C_Info)
{
	nr = 2;
	condition = Info_Sld_8_DasLager_Condition;
	information = Info_Sld_8_DasLager_Info;
	permanent = 1;
	description = "Ты можешь рассказать мне об этом лагере?";
};


func int Info_Sld_8_DasLager_Condition()
{
	if(!C_NpcBelongsToNewCamp(other))
	{
		return 1;
	};
};

func void Info_Sld_8_DasLager_Info()
{
	var C_Npc Cronos;
	AI_Output(other,self,"Info_Sld_8_DasLager_15_00");	//Расскажи мне об этом лагере.
	AI_Output(self,other,"Info_Sld_8_DasLager_08_01");	//Здесь очень много головорезов и воров, так что будь осторожен.
	AI_Output(self,other,"Info_Sld_8_DasLager_08_02");	//У нас есть несколько неписаных законов, которые необходимо соблюдать. Первый: к магам могут заходить только наемники.
	AI_Output(self,other,"Info_Sld_8_DasLager_08_03");	//Второй: никому нельзя приближаться к нашей руде. Третий: новичкам лучше не заходить в бар на озере.
	AI_Output(self,other,"Info_Sld_8_DasLager_08_04");	//Этот бар принадлежит ворам, а они не любят, когда вокруг него ходят незнакомые люди.
	Cronos = Hlp_GetNpc(KDW_604_Cronos);
	Cronos.aivar[AIV_FINDABLE] = TRUE;
};


instance Info_Sld_8_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Sld_8_DieLage_Condition;
	information = Info_Sld_8_DieLage_Info;
	permanent = 1;
	description = "Как идут дела?";
};


func int Info_Sld_8_DieLage_Condition()
{
	if(FMTaken == FALSE)
	{
		return 1;
	};
};

func void Info_Sld_8_DieLage_Info()
{
	var C_Npc Cronos;
	AI_Output(other,self,"Info_Sld_8_DieLage_15_00");	//Как идут дела?
	AI_Output(self,other,"Info_Sld_8_DieLage_08_01");	//Как обычно. Слежу за тем, чтобы никто не беспокоил магов и не подходил к горе руды.
	Cronos = Hlp_GetNpc(KDW_604_Cronos);
	Cronos.aivar[AIV_FINDABLE] = TRUE;
};


instance Info_Sld_8_Krautprobe(C_Info)
{
	nr = 5;
	condition = Info_Sld_8_Krautprobe_Condition;
	information = Info_Sld_8_Krautprobe_Info;
	permanent = 1;
	description = "У меня есть немного болотника, может, будешь?";
};


func int Info_Sld_8_Krautprobe_Condition()
{
	if(((BaalKagan_VerteilKraut == LOG_RUNNING) || (BaalKagan_VerteilKraut == LOG_SUCCESS)) && (self.aivar[AIV_DEALDAY] <= Wld_GetDay()))
	{
		return TRUE;
	};
};

func void Info_Sld_8_Krautprobe_Info()
{
	AI_Output(other,self,"Info_Sld_8_Krautprobe_15_00");	//У меня есть немного болотника, может, будешь?
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
		AI_Output(self,other,"Info_Sld_8_Krautprobe_08_01");	//А, давай. Вот тебе за него десять кусков руды.
		AI_Output(self,other,"Info_Sld_8_Krautprobe_08_02");	//Спроси моих друзей. Они тоже не откажутся.
		b_printtrademsg2("Получено руды: 10");
		CreateInvItems(self,ItMiNugget,10);
		B_GiveInvItems(self,other,ItMiNugget,10);
		NC_Joints_verteilt = NC_Joints_verteilt + 1;
		self.aivar[AIV_DEALDAY] = Wld_GetDay() + 1;
	}
	else
	{
		AI_Output(self,other,"Info_Sld_8_Krautprobe_No_Joint_08_00");	//И где же твой болотник, а? У тебя его нет!
	};
};

func void B_AssignAmbientInfos_Sld_8(var C_Npc slf)
{
	B_AssignFindNpc_NC(slf);
	Info_Sld_8_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Sld_8_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Sld_8_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Sld_8_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Sld_8_DieLage.npc = Hlp_GetInstanceID(slf);
	Info_Sld_8_Krautprobe.npc = Hlp_GetInstanceID(slf);
};

