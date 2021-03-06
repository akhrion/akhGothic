
prototype Mst_Default_Lurker(C_Npc)
{
	name[0] = "Шныг";
	guild = GIL_LURKER;
	aivar[AIV_IMPORTANT] = ID_LURKER;
	level = 17;
	attribute[ATR_STRENGTH] = 50;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 90;
	attribute[ATR_HITPOINTS] = 90;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 50;
	protection[PROT_POINT] = 20;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_LURKER;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 3000;
	aivar[AIV_FINDABLE] = HUNTER;
	aivar[AIV_PCISSTRONGER] = 1400;
	aivar[AIV_BEENATTACKED] = 1300;
	aivar[AIV_HIGHWAYMEN] = 700;
	aivar[AIV_HAS_ERPRESSED] = 5;
	aivar[AIV_BEGGAR] = 10;
	aivar[AIV_OBSERVEINTRUDER] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_Trigger3] = OnlyRoutine;
};

func void Set_Lurker_Visuals()
{
	Mdl_SetVisual(self,"Lurker.mds");
	Mdl_SetVisualBody(self,"Lur_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance Lurker(Mst_Default_Lurker)
{
	Set_Lurker_Visuals();
	Npc_SetToFistMode(self);
};

instance DamLurker(Mst_Default_Lurker)
{
	name[0] = "Шныг с плотины";
	aivar[AIV_MM_REAL_ID] = ID_LURKER_DAM;
	level = 20;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 100;
	protection[PROT_FIRE] = 70;
	protection[PROT_POINT] = 50;
	Set_Lurker_Visuals();
	Npc_SetToFistMode(self);
	CreateInvItem(self,ItAt_DamLurker_01);
};
instance Lurker_Egg(Egg)
{
	name[0] = "Яйцо шныга";
	guild = GIL_LURKER;
	spawnDelay = 360;
	start_aistate = B_MM_Respawn;
};

