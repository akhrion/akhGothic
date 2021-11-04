
func void pan_s1()
{
	if(Npc_IsPlayer(self))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_PAN;
		CreateInvItems(self,ItFoMuttonRaw,1);
		AI_ProcessInfos(hero);
	};
};


instance PC_NOPAN(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = pc_nopan_condition;
	information = pc_nopan_info;
	important = 0;
	permanent = 1;
	description = STR_INFO_TRADE_EXIT;
};


func int pc_nopan_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_PAN)
	{
		return TRUE;
	};
};

func void pc_nopan_info()
{
	AI_StopProcessInfos(self);
	Npc_RemoveInvItems(self,ItFoMuttonRaw,1);
	if(!Npc_HasItems(hero,ItFoMuttonRaw))
	{
		Npc_RemoveInvItems(self,ItFoMutton,1);
	};
	self.aivar[AIV_INVINCIBLE] = FALSE;
};


instance PC_PAN1(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = pc_pan1_condition;
	information = pc_pan1_info;
	important = 0;
	permanent = 1;
	description = "Пожарить 1 кусок мяса.";
};


func int pc_pan1_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PAN) && (Npc_HasItems(hero,ItFoMuttonRaw) >= 1))
	{
		return TRUE;
	};
};

func void pc_pan1_info()
{
	CreateInvItems(self,ItFoMutton,1);
	Npc_RemoveInvItems(self,ItFoMuttonRaw,1);
	AI_Wait(self,1);
	PrintScreen("Получен 1 кусок жареного мяса.",-1,-1,"font_old_10_white.tga",2);
};


instance PC_PAN5(C_Info)
{
	npc = PC_Hero;
	nr = 5;
	condition = pc_pan5_condition;
	information = pc_pan5_info;
	important = 0;
	permanent = 1;
	description = "Пожарить 5 кусков мяса.";
};


func int pc_pan5_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PAN) && (Npc_HasItems(hero,ItFoMuttonRaw) >= 5))
	{
		return TRUE;
	};
};

func void pc_pan5_info()
{
	CreateInvItems(self,ItFoMutton,5);
	Npc_RemoveInvItems(self,ItFoMuttonRaw,5);
	AI_Wait(self,2);
	PrintScreen("Получено 5 кусков жареного мяса.",-1,-1,"font_old_10_white.tga",2);
};


instance PC_PAN10(C_Info)
{
	npc = PC_Hero;
	nr = 10;
	condition = pc_pan10_condition;
	information = pc_pan10_info;
	important = 0;
	permanent = 1;
	description = "Пожарить 10 кусков мяса.";
};


func int pc_pan10_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PAN) && (Npc_HasItems(hero,ItFoMuttonRaw) >= 10))
	{
		return TRUE;
	};
};

func void pc_pan10_info()
{
	CreateInvItems(self,ItFoMutton,10);
	Npc_RemoveInvItems(self,ItFoMuttonRaw,10);
	AI_Wait(self,3);
	PrintScreen("Получено 10 кусков жареного мяса.",-1,-1,"font_old_10_white.tga",2);
};


instance PC_PANALL(C_Info)
{
	npc = PC_Hero;
	nr = 9;
	condition = pc_panall_condition;
	information = pc_panall_info;
	important = 0;
	permanent = 1;
	description = "Пожарить все куски мяса.";
};


func int pc_panall_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PAN) && (Npc_HasItems(hero,ItFoMuttonRaw) < 10) && (Npc_HasItems(hero,ItFoMuttonRaw) > 1) && (Npc_HasItems(hero,ItFoMuttonRaw) != 5))
	{
		return TRUE;
	};
};

func void pc_panall_info()
{
	CreateInvItems(self,ItFoMutton,Npc_HasItems(self,ItFoMuttonRaw));
	Npc_RemoveInvItems(self,ItFoMuttonRaw,Npc_HasItems(self,ItFoMuttonRaw));
	AI_Wait(self,3);
	PrintScreen("Обжарены все куски сырого мяса.",-1,-1,"font_old_10_white.tga",2);
};

