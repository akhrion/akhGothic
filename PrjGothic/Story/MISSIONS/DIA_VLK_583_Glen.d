
instance VLK_583_Glen_Exit(C_Info)
{
	npc = VLK_583_Glen;
	nr = 999;
	condition = VLK_583_Glen_Exit_Condition;
	information = VLK_583_Glen_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int VLK_583_Glen_Exit_Condition()
{
	return 1;
};

func void VLK_583_Glen_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance VLK_583_Glen_INFO(C_Info)
{
	npc = VLK_583_Glen;
	condition = VLK_583_Glen_INFO_Condition;
	information = VLK_583_Glen_INFO_Info;
	important = 0;
	permanent = 1;
	description = "Я хочу осмотреть шахту. Можешь что-нибудь посоветовать?";
};


func int VLK_583_Glen_INFO_Condition()
{
	return 1;
};

func void VLK_583_Glen_INFO_Info()
{
	AI_Output(other,self,"VLK_583_Glen_INFO_Info_15_01");	//Я хочу осмотреть шахту. Можешь что-нибудь посоветовать?
	AI_Output(self,other,"VLK_583_Glen_INFO_Info_02_02");	//Держись подальше от ползунов.
	AI_Output(self,other,"VLK_583_Glen_INFO_Info_02_03");	//Чем ниже ты спускаешься, тем больше будет вокруг этих тварей. Мерзкие порождения Белиара!
	AI_Output(self,other,"VLK_583_Glen_INFO_Info_02_04");	//Они таятся во тьме и поджидают свою добычу. Ты слышишь, как их когти царапают камень, когда они подбираются все ближе и ближе. Я видел, как они убивают...
	AI_Output(self,other,"VLK_583_Glen_INFO_Info_02_05");	//Они быстры и безжалостны. Если тебе дорога жизнь, лучше уноси отсюда ноги, пока еще цел.
};


instance VLK_583_Glen_LOCKPICK(C_Info)
{
	npc = VLK_583_Glen;
	condition = VLK_583_Glen_LOCKPICK_Condition;
	information = VLK_583_Glen_LOCKPICK_Info;
	important = 0;
	permanent = 0;
	description = "Я слышал, у тебя можно купить отмычки.";
};


func int VLK_583_Glen_LOCKPICK_Condition()
{
	if(Npc_KnowsInfo(hero,VLK_585_Aleph_GLEN))
	{
		return 1;
	};
};

func void VLK_583_Glen_LOCKPICK_Info()
{
	AI_Output(other,self,"VLK_583_Glen_LOCKPICK_15_01");	//Я слышал, у тебя можно купить отмычки.
	AI_Output(self,other,"VLK_583_Glen_LOCKPICK_02_02");	//Ну, от такого проныры, как ты, ничего не скроешь, верно? По 10 кусков руды за штуку.
};


instance VLK_583_Glen_BUY(C_Info)
{
	npc = VLK_583_Glen;
	condition = VLK_583_Glen_BUY_Condition;
	information = VLK_583_Glen_BUY_Info;
	important = 0;
	permanent = 1;
	description = "(купить отмычки)";
	trade = 1;
};


func int VLK_583_Glen_BUY_Condition()
{
	if(Npc_KnowsInfo(hero,VLK_583_Glen_LOCKPICK))
	{
		return 1;
	};
};

func void VLK_583_Glen_BUY_Info()
{
	AI_Output(other,self,"VLK_583_Glen_BUY_Info_15_01");	//Я хочу купить отмычки.
};

