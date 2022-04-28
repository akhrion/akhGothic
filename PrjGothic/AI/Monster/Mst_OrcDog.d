
prototype Mst_Default_OrcDog(C_Npc)
{
	guild = GIL_ORCDOG;
	aivar[AIV_IMPORTANT] = ID_ORCDOG;
	level = 12;
	attribute[ATR_STRENGTH] = 80;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 260;
	attribute[ATR_HITPOINTS] = 260;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 90;
	protection[PROT_EDGE] = 60;
	protection[PROT_POINT] = 30;
	protection[PROT_FIRE] = 30;
	protection[PROT_FLY] = 60;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORCDOG;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 3000;
	aivar[AIV_FINDABLE] = HUNTER;
	aivar[AIV_PCISSTRONGER] = 2000;
	aivar[AIV_BEENATTACKED] = 1800;
	aivar[AIV_HIGHWAYMEN] = 1500;
	aivar[AIV_HAS_ERPRESSED] = 5;
	aivar[AIV_BEGGAR] = 15;
	aivar[AIV_OBSERVEINTRUDER] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_HASBEENDEFEATEDINPORTALROOM] = OnlyRoutine;
};

func void Set_OrcDog_Visuals()
{
	Mdl_SetVisual(self,"Wolf.mds");
	Mdl_SetVisualBody(self,"Dog_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance OrcDog(Mst_Default_OrcDog)
{
	name[0] = "Орочья собака";
	Set_OrcDog_Visuals();
	Npc_SetToFistMode(self);
};

instance OrcDogAgressive1(Mst_Default_OrcDog)
{
	name[0] = "Молодой варг";
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 60;
	attribute[ATR_HITPOINTS_MAX] = 460;
	attribute[ATR_HITPOINTS] = 460;
	Set_OrcDog_Visuals();
	Mdl_SetModelScale(self,1.1,1.1,1.1);
	Npc_SetToFistMode(self);
};
instance OrcDogAgressive2(Mst_Default_OrcDog)
{
	name[0] = "Молодой варг";
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 60;
	attribute[ATR_HITPOINTS_MAX] = 460;
	attribute[ATR_HITPOINTS] = 460;
	Set_OrcDog_Visuals();
	Mdl_SetModelScale(self,1.1,1.1,1.1);
	Npc_SetToFistMode(self);
};
instance OrcDogAgressive3(Mst_Default_OrcDog)
{
	name[0] = "Молодой варг";
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 60;
	attribute[ATR_HITPOINTS_MAX] = 460;
	attribute[ATR_HITPOINTS] = 460;
	Set_OrcDog_Visuals();
	Mdl_SetModelScale(self,1.1,1.1,1.1);
	Npc_SetToFistMode(self);
};
instance OrcDog_Egg(Egg)
{
	name[0] = "Яйцо орочьей собаки";
	guild = GIL_ORCDOG;
	spawnDelay = 1200;
	start_aistate = B_MM_Respawn;
};
