func int akh_PCInnerDialogues_Exit_CONDITION()
{
	return 1;
};

func void akh_PCInnerDialogues_Exit_ACTION()
{
	AI_StopProcessInfos(self);
};

func int akh_PC_DrinkPotionQuicksilver_CONDITION()
{
	if(Used_ItMi_Alchemy_Quicksilver_01){
		return true;
	};
	return false;
};
func void akh_PC_DrinkPotionQuicksilver_ACTION()
{
	Used_ItMi_Alchemy_Quicksilver_01 = false;
	AI_StopProcessInfos(self);
	PrintScreen("Теперь я стал как в марвел?",-1,52,"FONT_OLD_20_WHITE.TGA",7);
	PrintScreen("Нет, кажется просто мозги вытекают..",-1,56,"FONT_OLD_20_WHITE.TGA",9);
	Npc_RemoveInvItem(self,ItMi_Alchemy_Quicksilver_01);
	CreateInvItem(self,ItMi_Potion_Quicksilver_01);
	AI_UseItem(self,ItMi_Potion_Quicksilver_01);
};

func int akh_npcReaction_condition()
{
	return true;
};
func void akh_npcReaction_action()
{
	AI_Output(self,hero,"akh_npcReaction_NULL_01"); //Привет дружище!
};

func int akh_svmTests_cond()
{
	return false;
};
func void akh_svmTests_acti()
{
};