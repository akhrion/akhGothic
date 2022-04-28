
prototype Mst_Default_Meatbug(C_Npc)
{
	name[0] = "Мясной жук";
	guild = GIL_MEATBUG;
	aivar[AIV_MM_REAL_ID] = ID_MEATBUG;
	level = 1;
	Npc_SetToFistMode(self);
	attribute[ATR_STRENGTH] = 1;
	attribute[ATR_DEXTERITY] = 1;
	attribute[ATR_HITPOINTS_MAX] = 10;
	attribute[ATR_HITPOINTS] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_EDGE] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	senses = SENSE_SMELL;
	senses_range = 700;
	aivar[AIV_MM_FollowInWater] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_WuselStart] = OnlyRoutine;
};


prototype Mst_Warior_Meatbug(C_Npc)
{
	name[0] = "Воинственный жучара";
	guild = GIL_MEATBUG;
	aivar[AIV_MM_REAL_ID] = ID_MEATBUG;
	level = 1;
	Npc_SetToFistMode(self);
	attribute[ATR_STRENGTH] = 1;
	attribute[ATR_DEXTERITY] = 1;
	attribute[ATR_HITPOINTS_MAX] = 10;
	attribute[ATR_HITPOINTS] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_EDGE] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_MOLERAT;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
//	senses = SENSE_SMELL;
	senses_range = 1054055056;
	aivar[AIV_FINDABLE] = PASSIVE;
	aivar[AIV_PCISSTRONGER] = 1200;
	aivar[AIV_BEENATTACKED] = 1000;
	aivar[AIV_MM_AttackRange] = 700;
	aivar[AIV_HAS_ERPRESSED] = 5;
	aivar[AIV_BEGGAR] = 10;
	aivar[AIV_MM_FollowInWater] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_WuselStart] = OnlyRoutine;
};

func void Set_Meatbug_Visuals()
{
	Mdl_SetVisual(self,"Meatbug.mds");
	Mdl_SetVisualBody(self,"Mbg_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance Meatbug(Mst_Default_Meatbug)
{
	Set_Meatbug_Visuals();
	Mdl_SetModelScale(self,0.7,0.7,0.7);
};

instance Meatbug_010(Mst_Default_Meatbug)
{
	level = 10;
	Npc_SetToFistMode(self);
	attribute[ATR_STRENGTH] = 10;
	Set_Meatbug_Visuals();
	Mdl_SetModelScale(self,1.0,1.0,1.0);
};

instance Meatbug_015(Mst_Default_Meatbug)
{
	level = 15;
	Npc_SetToFistMode(self);
	attribute[ATR_STRENGTH] = 15;
	Set_Meatbug_Visuals();
	Mdl_SetModelScale(self,1.5,1.5,1.5);
};

instance Meatbug_020(Mst_Default_Meatbug)
{
	level = 20;
	Npc_SetToFistMode(self);
	attribute[ATR_STRENGTH] = 20;
	Set_Meatbug_Visuals();
	Mdl_SetModelScale(self,2.0,2.0,2.0);
};
