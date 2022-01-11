
prototype Mst_Default_Zombie(C_Npc)
{
	name[0] = "�����";
	guild = GIL_ZOMBIE;
	aivar[AIV_IMPORTANT] = ID_ZOMBIE;
	level = 20;
	attribute[ATR_STRENGTH] = 140;
	attribute[ATR_DEXTERITY] = 140;
	attribute[ATR_HITPOINTS_MAX] = 250;
	attribute[ATR_HITPOINTS] = 250;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 130;
	protection[PROT_EDGE] = 130;
	protection[PROT_POINT] = 9999;
	protection[PROT_FIRE] = 100;
	protection[PROT_FLY] = 30;
	protection[PROT_MAGIC] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ZOMBIE;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
//	senses_range = 3000;
	senses_range = 1000055000;
	aivar[AIV_FINDABLE] = HUNTER;
	aivar[AIV_PCISSTRONGER] = 2000;
	aivar[AIV_BEENATTACKED] = 1500;
	aivar[AIV_HIGHWAYMEN] = 1500;
	aivar[AIV_HAS_ERPRESSED] = 0;
	aivar[AIV_BEGGAR] = 10;
	aivar[AIV_OBSERVEINTRUDER] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_HASBEENDEFEATEDINPORTALROOM] = OnlyRoutine;
};

func void Set_Zombie_Visuals()
{
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,0,"Zom_Head",0,3,-1);
};

func void Set_Zombie2_Visuals()
{
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,0,"Zom_Head",1,3,-1);
};

func void Set_Zombie3_Visuals()
{
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,1,"Zom_Head",0,3,-1);
};

func void Set_Zombie4_Visuals()
{
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"Zom_Body",0,1,"Zom_Head",1,3,-1);
};

func void set_zombie5_visuals()
{
	Mdl_SetVisual(self,"Zombie.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",4,2,"Zom_Head",1,3,zom_armor);
};


instance Zombie(Mst_Default_Zombie)
{
	Set_Zombie_Visuals();
	Npc_SetToFistMode(self);
};

instance Zombie2(Mst_Default_Zombie)
{
	Set_Zombie2_Visuals();
	Npc_SetToFistMode(self);
};

instance Zombie3(Mst_Default_Zombie)
{
	Set_Zombie3_Visuals();
	Npc_SetToFistMode(self);
};

instance Zombie4(Mst_Default_Zombie)
{
	Set_Zombie4_Visuals();
	Npc_SetToFistMode(self);
};

instance ZombieTheKeeper(Mst_Default_Zombie)
{
	name[0] = "����� ������";
	level = 150;
	id = MID_THEKEEPER;
	set_zombie5_visuals();
	Npc_SetToFistMode(self);
	protection[PROT_BLUNT] = 150;
	protection[PROT_EDGE] = 150;
	protection[PROT_FIRE] = 9999;
	senses_range = 1000;
	aivar[AIV_FINDABLE] = HUNTER;
	aivar[AIV_PCISSTRONGER] = 1000;
	aivar[AIV_BEENATTACKED] = 1000;
	aivar[AIV_HIGHWAYMEN] = 1000;
	aivar[AIV_HAS_ERPRESSED] = 0;
	aivar[AIV_BEGGAR] = 10;
	aivar[AIV_OBSERVEINTRUDER] = FALSE;
	CreateInvItem(self,ItMi_OrcTalisman);
	CreateInvItem(self,ItKe_Focus5);
};

