
instance Info_Vlk_4_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Vlk_4_EXIT_Condition;
	information = Info_Vlk_4_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_Vlk_4_EXIT_Condition()
{
	return 1;
};

func void Info_Vlk_4_EXIT_Info()
{
	AI_Output(other,self,"Info_Vlk_4_EinerVonEuchWerden_15_00");	//Спасибо. Удачи!
	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_01");	//Выше нос, парень.
	AI_StopProcessInfos(self);
};


instance Info_Vlk_4_EinerVonEuchWerden(C_Info)
{
	nr = 4;
	condition = Info_Vlk_4_EinerVonEuchWerden_Condition;
	information = Info_Vlk_4_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "Что нужно сделать, чтобы присоединиться к этому лагерю?";
};


func int Info_Vlk_4_EinerVonEuchWerden_Condition()
{
	if(Npc_GetTrueGuild(other) == GIL_None)
	{
		return TRUE;
	};
};

func void Info_Vlk_4_EinerVonEuchWerden_Info()
{
	var C_Npc Thorus;
	AI_Output(other,self,"Info_Vlk_4_EinerVonEuchWerden_15_01");	//Что нужно сделать, чтобы присоединиться к этому лагерю?
	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_04");	//Чтобы тебя взяли к Стражникам или Призракам, ты хочешь сказать? Это не так уж просто. Старик Торус пустит тебя к Гомезу только тогда, когда ты пройдешь испытание.
	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_02");	//А еще тебе придется познакомиться с нужными людьми. Но пока ты не примкнешь к одному из лагерей, никто не будет воспринимать тебя всерьез.
	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_03");	//На твоем месте я бы сначала пошел к Призракам. Ты наверняка сможешь найти среди них того, кто поможет тебе. Не даром, конечно же.
	Thorus = Hlp_GetNpc(GRD_200_Thorus);
	Thorus.aivar[AIV_FINDABLE] = TRUE;
};


instance Info_Vlk_4_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Vlk_4_WichtigePersonen_Condition;
	information = Info_Vlk_4_WichtigePersonen_Info;
	permanent = 1;
	description = "Кто еще может быть мне полезен?";
};


func int Info_Vlk_4_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Vlk_4_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Vlk_4_WichtigePersonen_15_00");	//Кто еще может быть мне полезен?
	AI_Output(self,other,"Info_Vlk_4_WichtigePersonen_04_01");	//Тебе стоит поговорить с Граво. Постарайся не ссориться с ним. Пусть он и рудокоп, но связан с серьезными людьми. Он даже ведет дела с Баронами.
	AI_Output(self,other,"Info_Vlk_4_WichtigePersonen_04_02");	//Он может помочь тебе, если у тебя вдруг появятся недруги среди людей Гомеза.
};


instance Info_Vlk_4_DasLager(C_Info)
{
	nr = 2;
	condition = Info_Vlk_4_DasLager_Condition;
	information = Info_Vlk_4_DasLager_Info;
	permanent = 1;
	description = "О чем еще мне стоит знать?";
};


func int Info_Vlk_4_DasLager_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_None)
	{
		return 1;
	};
};

func void Info_Vlk_4_DasLager_Info()
{
	AI_Output(other,self,"Info_Vlk_4_DasLager_15_00");	//О чем еще мне стоит знать?
	AI_Output(self,other,"Info_Vlk_4_DasLager_04_01");	//Если работа в шахте тебя не устраивает, то лучше всего тебе будет пойти к площадке между северными воротами и воротами замка.
	AI_Output(self,other,"Info_Vlk_4_DasLager_04_02");	//Если повезет, тебя заметит Торус или Диего. Не отказывайся от их поручений, если хочешь проявить себя здесь. Стать одним из людей Гомеза - мечта многих.
	AI_Output(self,other,"Info_Vlk_4_DasLager_04_03");	//А может быть, ты даже встретишь мага. Иногда они выходят, чтобы дать поручение. Они всегда хорошо платят за такую работу.
	AI_Output(other,self,"Info_Vlk_4_DasLager_15_04");	//Маги выходят из замка? Когда?
	AI_Output(self,other,"Info_Vlk_4_DasLager_04_05");	//Этого я не знаю. Спроси лучше тех, кто живет неподалеку.
};


instance Info_Vlk_4_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Vlk_4_DieLage_Condition;
	information = Info_Vlk_4_DieLage_Info;
	permanent = 1;
	description = "Как у тебя дела?";
};


func int Info_Vlk_4_DieLage_Condition()
{
	return 1;
};

func void Info_Vlk_4_DieLage_Info()
{
	AI_Output(other,self,"Info_Vlk_4_DieLage_15_00");	//Как у тебя дела?
	AI_Output(self,other,"Info_Vlk_4_DieLage_04_01");	//Так же, как и двадцать лет назад. За это время здесь почти ничего не изменилось.
};

func void B_AssignAmbientInfos_Vlk_4(var C_Npc slf)
{
	B_AssignFindNpc_OC(slf);
	Info_Vlk_4_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_4_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_4_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_4_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_4_DieLage.npc = Hlp_GetInstanceID(slf);
};

