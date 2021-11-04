
instance Vlk_587_Garp_Exit(C_Info)
{
	npc = VLK_587_Garp;
	nr = 999;
	condition = Vlk_587_Garp_Exit_Condition;
	information = Vlk_587_Garp_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Vlk_587_Garp_Exit_Condition()
{
	return 1;
};

func void Vlk_587_Garp_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance Vlk_587_Garp_ORK(C_Info)
{
	npc = VLK_587_Garp;
	condition = Vlk_587_Garp_ORK_Condition;
	information = Vlk_587_Garp_ORK_Info;
	important = 0;
	permanent = 0;
	description = "Скажи, что здесь делает орк?";
};


func int Vlk_587_Garp_ORK_Condition()
{
	return 1;
};

func void Vlk_587_Garp_ORK_Info()
{
	AI_Output(other,self,"Vlk_587_Garp_ORK_Info_15_01");	//Скажи, что здесь делает орк?
	AI_Output(self,other,"Vlk_587_Garp_ORK_Info_01_02");	//Работает. Его нашли стражники и заставили выполнять самую тяжелую работу.
	AI_Output(other,self,"Vlk_587_Garp_ORK_Info_15_03");	//Его не держат на привязи. Почему же он не сбежит?
	AI_Output(self,other,"Vlk_587_Garp_ORK_Info_01_04");	//Однажды он попытался. Стражники его так сильно избили, что он недели две встать не мог. С тех пор он смирился и не хочет убегать.
};

