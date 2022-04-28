
prototype Mst_Default_Molerat(C_Npc)
{
	name[0] = "Кротокрыс";
	guild = GIL_MOLERAT;
	aivar[AIV_IMPORTANT] = ID_MOLERAT;
	level = 5;
	attribute[ATR_STRENGTH] = 8;
	attribute[ATR_DEXTERITY] = 8;
	attribute[ATR_HITPOINTS_MAX] = 40;
	attribute[ATR_HITPOINTS] = 40;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 8;
	protection[PROT_EDGE] = 8;
	protection[PROT_POINT] = 25;
	protection[PROT_FIRE] = 5;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_MOLERAT;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 3000;
	spawnDelay = 7;
	aivar[AIV_FINDABLE] = PASSIVE;
	aivar[AIV_PCISSTRONGER] = 1200;
	aivar[AIV_BEENATTACKED] = 1000;
	aivar[AIV_HIGHWAYMEN] = 700;
	aivar[AIV_HAS_ERPRESSED] = 5;
	aivar[AIV_BEGGAR] = 5;
	aivar[AIV_OBSERVEINTRUDER] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_Trigger3] = OnlyRoutine;
};
func void Set_Molerat_Visuals()
{
	Mdl_SetVisual(self,"Molerat.mds");
	Mdl_SetVisualBody(self,"Mol_Body",1,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void set_ymolerat_visuals()
{
	Mdl_SetVisual(self,"Molerat.mds");
	Mdl_SetVisualBody(self,"Mol_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance Molerat(Mst_Default_Molerat)
{
	Set_Molerat_Visuals();
	Npc_SetToFistMode(self);
//	CreateInvItem(self,ItFoMuttonRaw);
};

instance YMolerat(Mst_Default_Molerat)
{
	name[0] = "Молодой кротокрыс";
	level = 4;
	attribute[ATR_STRENGTH] = 5;
	attribute[ATR_DEXTERITY] = 5;
	attribute[ATR_HITPOINTS_MAX] = 40;
	attribute[ATR_HITPOINTS] = 40;
	protection[PROT_BLUNT] = 8;
	protection[PROT_EDGE] = 8;
	fight_tactic = FAI_MONSTER_COWARD;
	set_ymolerat_visuals();
	Mdl_SetModelScale(self,0.8,0.8,0.8);
	Npc_SetToFistMode(self);
//	CreateInvItems(self,ItFoMuttonRaw,1);
};
instance Molerat_Big(Mst_Default_Molerat)
{
	name[0] = "Пузатый кротокрыс";
	level = 7;
	Npc_SetHp_Mult(self,180);
	Npc_SetHpMax_Mult(self,180);
	Npc_SetStr_Mult(self,180);
	Npc_SetProt_Blunt_Mult(self,180);
	Npc_SetProt_Edge_Mult(self,180);
	Npc_SetProt_Fire_Mult(self,180);
	Npc_SetProt_Magic_Mult(self,180);
	Npc_SetProt_Point_Mult(self,180);
	fight_tactic = FAI_MOLERAT;
	set_ymolerat_visuals();
	Mdl_SetModelScale(self,1.1,1.1,1.1);
	Npc_SetToFistMode(self);
//	CreateInvItems(self,ItFoMuttonRaw,4);
};
instance Molerat_Egg(Egg)
{
	name[0] = "Яйцо кротокрыса";
	guild = GIL_MOLERAT;
	spawnDelay = 240;
//	spawnDelay = 2;
	start_aistate = B_MM_Respawn;
};
instance Molerat_Egg_Yang(Egg)
{
	name[0] = "Яйцо кротокрыса";
	guild = GIL_MOLERAT;
	spawnDelay = 120;
//	spawnDelay = 1;
	start_aistate = B_MM_Respawn;
};
instance Molerat_Egg_Big(Egg)
{
	name[0] = "Яйцо кротокрыса";
	guild = GIL_MOLERAT;
	spawnDelay = 480;
//	spawnDelay = 4;
	start_aistate = B_MM_Respawn;
};
