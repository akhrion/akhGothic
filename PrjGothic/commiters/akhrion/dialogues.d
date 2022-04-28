instance akh_PCInnerDialogues_EXIT(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	important = 0;
	permanent = 1;
	condition = akh_PCInnerDialogues_Exit_CONDITION;
	information = akh_PCInnerDialogues_Exit_ACTION;
	description = DIALOG_ENDE;
};

instance akh_PC_DrinkPotionQuicksilver(C_Info)
{
	npc = PC_Hero;				
	nr = 1;					
	important = 0;			
	permanent = 1;			
	condition = akh_PC_DrinkPotionQuicksilver_CONDITION;		
	information = akh_PC_DrinkPotionQuicksilver_ACTION;		
	description = "Всегда было интересно, какая она на вкус..";	
};

instance akh_npcReaction(C_Info)
{
	npc = Npc_Default;
	nr = 1;
	important = true;
	permanent = true;
	condition = akh_npcReaction_condition;
	information = akh_npcReaction_action;
};

instance akh_svmTests(C_Info)
{
	npc = NOV_1302_Viran;
	nr = 1;
	important = false;
	permanent = true;
	condition = akh_svmTests_cond;
	information = akh_svmTests_acti;
	description = "qwe";
};