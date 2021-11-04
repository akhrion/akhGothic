
instance Info_Sld_11_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Sld_11_EXIT_Condition;
	information = Info_Sld_11_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_Sld_11_EXIT_Condition()
{
	return 1;
};

func void Info_Sld_11_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Sld_11_EinerVonEuchWerden(C_Info)
{
	nr = 4;
	condition = Info_Sld_11_EinerVonEuchWerden_Condition;
	information = Info_Sld_11_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "Я бы хотел быть наемником магов.";
};


func int Info_Sld_11_EinerVonEuchWerden_Condition()
{
	if((Npc_GetTrueGuild(other) != GIL_SLD) && (Npc_GetTrueGuild(other) != GIL_KDW) && !C_NpcBelongsToOldCamp(other) && !C_NpcBelongsToPsiCamp(other))
	{
		return TRUE;
	};
};

func void Info_Sld_11_EinerVonEuchWerden_Info()
{
	var C_Npc gorn;
	AI_Output(other,self,"Info_Sld_11_EinerVonEuchWerden_15_00");	//Я бы хотел быть наемником магов.
	AI_Output(self,other,"Info_Sld_11_EinerVonEuchWerden_11_01");	//Это не так уж сложно. Если ты докажешь, что хочешь работать на нас, Ли примет тебя.
	AI_Output(self,other,"Info_Sld_11_EinerVonEuchWerden_11_02");	//Но ему нужны такие люди, которые хорошо владеют мечом. А ты можешь сказать это о себе?
	AI_Output(other,self,"Info_Sld_11_EinerVonEuchWerden_15_03");	//Ну...я...
	AI_Output(self,other,"Info_Sld_11_EinerVonEuchWerden_11_04");	//Так я и подумал. Если ты еще не передумал, поговори с Горном. Когда-то он уже тренировал новичков.
	AI_Output(self,other,"Info_Sld_11_EinerVonEuchWerden_11_05");	//Может быть, тебе повезет, и он согласится поработать над твоей техникой.
	gorn = Hlp_GetNpc(PC_Fighter);
	gorn.aivar[AIV_FINDABLE] = TRUE;
};


instance Info_Sld_11_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Sld_11_WichtigePersonen_Condition;
	information = Info_Sld_11_WichtigePersonen_Info;
	permanent = 1;
	description = "Кто здесь главный?";
};


func int Info_Sld_11_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Sld_11_WichtigePersonen_Info()
{
	var C_Npc Lee;
	var C_Npc Cronos;
	AI_Output(other,self,"Info_Sld_11_WichtigePersonen_15_00");	//Кто здесь главный?
	AI_Output(self,other,"Info_Sld_11_WichtigePersonen_11_01");	//Мы делаем то, что говорят нам маги. Но чаще всего они просто молчат. Они изучают гору руды и копаются в своих книгах.
	AI_Output(self,other,"Info_Sld_11_WichtigePersonen_11_02");	//Вообще-то, командует здесь Ли. Он наш лидер.
	Lee = Hlp_GetNpc(Sld_700_Lee);
	Lee.aivar[AIV_FINDABLE] = TRUE;
	Cronos = Hlp_GetNpc(KDW_604_Cronos);
	Cronos.aivar[AIV_FINDABLE] = TRUE;
};


instance Info_Sld_11_DasLager(C_Info)
{
	nr = 2;
	condition = Info_Sld_11_DasLager_Condition;
	information = Info_Sld_11_DasLager_Info;
	permanent = 1;
	description = "А как у вас тут? Проблем много?";
};


func int Info_Sld_11_DasLager_Condition()
{
	if(FMTaken == FALSE)
	{
		return 1;
	};
};

func void Info_Sld_11_DasLager_Info()
{
	AI_Output(other,self,"Info_Sld_11_DasLager_15_00");	//А как у вас тут? Проблем много?
	AI_Output(self,other,"Info_Sld_11_DasLager_11_01");	//У нас здесь всегда есть какие-нибудь проблемы. Воры делают все, что хотят, а наемники охраняют магов и защищают лагерь.
};


instance Info_Sld_11_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Sld_11_DieLage_Condition;
	information = Info_Sld_11_DieLage_Info;
	permanent = 1;
	description = "Ну, а у тебя как жизнь?";
};


func int Info_Sld_11_DieLage_Condition()
{
	if(FMTaken == FALSE)
	{
		return 1;
	};
};

func void Info_Sld_11_DieLage_Info()
{
	AI_Output(other,self,"Info_Sld_11_DieLage_15_00");	//Ну, а у тебя как жизнь?
	AI_Output(self,other,"Info_Sld_11_DieLage_11_01");	//Пока все спокойно...
	AI_Output(other,self,"Info_Sld_11_DieLage_15_02");	//Пока?
	AI_Output(self,other,"Info_Sld_11_DieLage_11_03");	//Если воры и дальше будут грабить караваны Гомеза, он соберет армию и нападет на наш лагерь.
	AI_Output(self,other,"Info_Sld_11_DieLage_11_04");	//А это уже будет совсем плохо.
};


instance Info_Sld_11_Krautprobe(C_Info)
{
	nr = 5;
	condition = Info_Sld_11_Krautprobe_Condition;
	information = Info_Sld_11_Krautprobe_Info;
	permanent = 1;
	description = "Болотника хочешь?";
};


func int Info_Sld_11_Krautprobe_Condition()
{
	if(((BaalKagan_VerteilKraut == LOG_RUNNING) || (BaalKagan_VerteilKraut == LOG_SUCCESS)) && (self.aivar[AIV_DEALDAY] <= Wld_GetDay()))
	{
		return TRUE;
	};
};

func void Info_Sld_11_Krautprobe_Info()
{
	AI_Output(other,self,"Info_Sld_11_Krautprobe_15_00");	//Болотника хочешь?
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
		AI_Output(self,other,"Info_Sld_11_Krautprobe_11_01");	//Конечно. Вот тебе за него десять кусков руды.
		AI_Output(self,other,"Info_Sld_11_Krautprobe_11_02");	//Если у тебя будет еще, ты знаешь, где меня найти...
		b_printtrademsg2("Получено руды: 10");
		CreateInvItems(self,ItMiNugget,10);
		B_GiveInvItems(self,other,ItMiNugget,10);
		NC_Joints_verteilt = NC_Joints_verteilt + 1;
		self.aivar[AIV_DEALDAY] = Wld_GetDay() + 1;
	}
	else
	{
		AI_Output(self,other,"Info_Sld_11_Krautprobe_No_Joint_11_00");	//Сначала принеси его, а потом поговорим.
	};
};

func void B_AssignAmbientInfos_Sld_11(var C_Npc slf)
{
	B_AssignFindNpc_NC(slf);
	Info_Sld_11_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Sld_11_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Sld_11_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Sld_11_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Sld_11_DieLage.npc = Hlp_GetInstanceID(slf);
	Info_Sld_11_Krautprobe.npc = Hlp_GetInstanceID(slf);
};

