
instance Stt_302_Viper_Exit(C_Info)
{
	npc = STT_302_Viper;
	nr = 999;
	condition = Stt_302_Viper_Exit_Condition;
	information = Stt_302_Viper_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Stt_302_Viper_Exit_Condition()
{
	return 1;
};

func void Stt_302_Viper_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance Stt_302_Viper_GREET(C_Info)
{
	npc = STT_302_Viper;
	condition = Stt_302_Viper_GREET_Condition;
	information = Stt_302_Viper_GREET_Info;
	important = 0;
	permanent = 0;
	description = "Ты, должно быть, плавильщик.";
};


func int Stt_302_Viper_GREET_Condition()
{
	return 1;
};

func void Stt_302_Viper_GREET_Info()
{
	AI_Output(other,self,"Stt_302_Viper_GREET_Info_15_01");	//Ты, должно быть, плавильщик.
	AI_Output(self,other,"Stt_302_Viper_GREET_Info_11_02");	//А ты умный парень, как я посмотрю.
};


instance Stt_302_Viper_MELT(C_Info)
{
	npc = STT_302_Viper;
	condition = Stt_302_Viper_MELT_Condition;
	information = Stt_302_Viper_MELT_Info;
	important = 0;
	permanent = 0;
	description = "Я слышал, что в шахте переплавляется только часть руды.";
};


func int Stt_302_Viper_MELT_Condition()
{
	if(Npc_KnowsInfo(hero,Stt_302_Viper_GREET) && Npc_KnowsInfo(hero,Grd_260_Drake_Mine_Mehr))
	{
		return 1;
	};
};

func void Stt_302_Viper_MELT_Info()
{
	AI_Output(other,self,"Stt_302_Viper_MELT_Info_15_01");	//Я слышал, что в шахте переплавляется только часть руды.
	AI_Output(self,other,"Stt_302_Viper_MELT_Info_11_02");	//Когда-то мы переплавляли всю руду. Но Гомез и маги решили, что так не пойдет.
	AI_Output(self,other,"Stt_302_Viper_MELT_Info_11_03");	//Несколько недель они что-то здесь изучали, рассматривали руду и все остальное.
	AI_Output(self,other,"Stt_302_Viper_MELT_Info_11_04");	//Они несли всякую чушь и совали свои благородные носы в те вещи, о которых не имели ни малейшего представления.
	AI_Output(self,other,"Stt_302_Viper_MELT_Info_11_05");	//В итоге мы стали переплавлять только часть руды, а маги сюда больше не показывались.
};


instance Stt_302_Viper_BUY(C_Info)
{
	npc = STT_302_Viper;
	condition = Stt_302_Viper_BUY_Condition;
	information = Stt_302_Viper_BUY_Info;
	important = 0;
	permanent = 0;
	description = "Ты можешь дать мне руду?";
};


func int Stt_302_Viper_BUY_Condition()
{
	if(Npc_KnowsInfo(hero,Stt_302_Viper_GREET))
	{
		return 1;
	};
};

func void Stt_302_Viper_BUY_Info()
{
	AI_Output(other,self,"Stt_302_Viper_BUY_Info_15_01");	//Ты можешь дать мне руду?
	if(hero.guild == GIL_ORG)
	{
		AI_Output(self,other,"SVM_11_YouStoleFromMe");	//И ты еще смеешь появляться мне на глаза, грязный вор?
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"Stt_302_Viper_BUY_Info_11_02");	//Если у тебя есть что-нибудь взамен.
		Log_CreateTopic(GE_TRADEROM,LOG_NOTE);
		B_LogEntry(GE_TRADEROM,"Вайпер занимается переплавкой руды и может обменять ее на мои товары.");
	};
};


instance STT_302_VIPER_BUY2(C_Info)
{
	npc = STT_302_Viper;
	condition = stt_302_viper_buy2_condition;
	information = stt_302_viper_buy2_info;
	important = 0;
	permanent = 1;
	description = DIALOG_TRADE;
	trade = 1;
};


func int stt_302_viper_buy2_condition()
{
	if(Npc_KnowsInfo(hero,Stt_302_Viper_BUY) && (hero.guild != GIL_ORG))
	{
		return 1;
	};
};

func void stt_302_viper_buy2_info()
{
	AI_Output(other,self,"DIA_Fortuno_BuyJoints_15_00");	//Давай меняться.
};

