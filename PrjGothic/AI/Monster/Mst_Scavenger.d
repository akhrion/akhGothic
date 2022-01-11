
prototype Mst_Default_Scavenger(C_Npc)
{
	name[0] = "���������";
	guild = GIL_SCAVENGER;
	aivar[AIV_IMPORTANT] = ID_SCAVENGER;
	level = 5;
	attribute[ATR_STRENGTH] = 8;
	attribute[ATR_DEXTERITY] = 8;
	attribute[ATR_HITPOINTS_MAX] = 40;
	attribute[ATR_HITPOINTS] = 40;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 9;
	protection[PROT_EDGE] = 9;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_SCAVENGER;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
//	senses_range = 3000;
	senses_range = 1054055056;
	aivar[AIV_FINDABLE] = PASSIVE;
	aivar[AIV_PCISSTRONGER] = 1200;
	aivar[AIV_BEENATTACKED] = 1000;
	aivar[AIV_MM_AttackRange] = 700;
	aivar[AIV_HAS_ERPRESSED] = 5;
	aivar[AIV_BEGGAR] = 10;
	aivar[AIV_OBSERVEINTRUDER] = TRUE;
	aivar[AIV_MM_LASTHPSTATE] = attribute[ATR_HITPOINTS_MAX];
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_WARNTARGET] = 22;
	aivar[AIV_LASTHITBYRANGEDWEAPON] = 6;
	aivar[AIV_GUARDITERATOR] = 6;
	aivar[AIV_FIGHTSPEACHFLAG] = 22;
};

func void Set_Scavenger_Visuals()
{
	Mdl_SetVisual(self,"Scavenger.mds");
	Mdl_SetVisualBody(self,"Sca_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void set_yscavenger_visuals()
{
	Mdl_SetVisual(self,"Scavenger.mds");
	Mdl_SetVisualBody(self,"Sca_Body",1,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance Scavenger(Mst_Default_Scavenger)
{
	spawnDelay = 10;
	Set_Scavenger_Visuals();
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItFoMuttonRaw,2);
};

instance Rspn_Scavenger(Mst_Default_Scavenger)
{
	Set_Scavenger_Visuals();
	start_aistate = ZS_WaitRespawn;
};

func void Set_rspndoll_Visuals()
{
	Mdl_SetVisual(self,"Scavenger.mds");
	Mdl_SetVisualBody(self,"Sca_Body",1,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

instance rspndoll(Mst_Default_Scavenger)
{
	Set_rspndoll_Visuals();
	Mdl_SetModelScale(self,0,0,0);
	CreateInvItems(self,ItFoMuttonRaw,2);
};

instance YScavenger(Mst_Default_Scavenger)
{
	name[0] = "������� ���������";
	level = 4;
	attribute[ATR_STRENGTH] = 6;
	attribute[ATR_DEXTERITY] = 6;
	attribute[ATR_HITPOINTS_MAX] = 35;
	attribute[ATR_HITPOINTS] = 35;
	protection[PROT_BLUNT] = 8;
	protection[PROT_EDGE] = 8;
	fight_tactic = FAI_MONSTER_COWARD;
	set_yscavenger_visuals();
	Mdl_SetModelScale(self,0.9,0.9,0.9);
	Npc_SetToFistMode(self);
	CreateInvItems(self,ItFoMuttonRaw,1);
};

