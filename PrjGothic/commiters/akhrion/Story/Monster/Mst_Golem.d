
//Прописать в функцию получения урона
//если это каменный голем, то он становится крепче
//после каждого удара
//Лор: по мере приближения к сердцу голема, его сила возрастает
//т.к. исчезает необходимость поддерживать ту часть внешней скорлупы,
//которую воин с него сбил.
prototype akh_Mst_Default_Golem(C_Npc)
{
	name[0] = "Голем";
	guild = GIL_GOLEM;
	level = 100;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 600;
	attribute[ATR_HITPOINTS] = 600;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 9999;
	protection[PROT_EDGE] = 9999;
	protection[PROT_POINT] = 9999;
	protection[PROT_FIRE] = 9999;
	protection[PROT_FLY] = 9999;
	protection[PROT_MAGIC] = 9999;
	damagetype = DAM_FLY;
	fight_tactic = FAI_GOLEM;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 2000;
	aivar[AIV_FINDABLE] = PASSIVE;
	aivar[AIV_PCISSTRONGER] = 1500;
	aivar[AIV_BEENATTACKED] = 1500;
	aivar[AIV_HIGHWAYMEN] = 1500;
	aivar[AIV_HAS_ERPRESSED] = 0;
	aivar[AIV_BEGGAR] = 5;
	aivar[AIV_OBSERVEINTRUDER] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_HASBEENDEFEATEDINPORTALROOM] = OnlyRoutine;
};

func void akh_Set_StoneGolem_Visuals()
{
	Mdl_SetVisual(self,"Golem.mds");
	Mdl_SetVisualBody(self,"Gol_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void akh_Set_FireGolem_Visuals()
{
	Mdl_SetVisual(self,"Golem.mds");
	Mdl_ApplyOverlayMds(self,"Golem_Firegolem.mds");
	Mdl_SetVisualBody(self,"Gol_Fire_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void akh_Set_IceGolem_Visuals()
{
	Mdl_SetVisual(self,"Golem.mds");
	Mdl_ApplyOverlayMds(self,"Golem_Icegolem.mds");
	Mdl_SetVisualBody(self,"Gol_Ice_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance akh_StoneGolem(Mst_Default_Golem)
{
	name[0] = "Каменный голем";
	aivar[AIV_IMPORTANT] = id_stonegolem;
	protection[PROT_BLUNT] = 75;
	Set_StoneGolem_Visuals();
	CreateInvItem(self,ItAt_StoneGolem_01);
	Npc_SetToFistMode(self);
};

instance akh_SummonedByPC_StoneGolem(Mst_Default_Golem)
{
	name[0] = "Призванный голем";
	aivar[AIV_IMPORTANT] = ID_STONEGOLEM;
	level = 0;
	Set_StoneGolem_Visuals();
	Npc_SetToFistMode(self);
	protection[PROT_EDGE] = 999;
	protection[PROT_BLUNT] = 75;
	senses = SENSE_HEAR | SENSE_SEE;
	start_aistate = ZS_MM_SummonedByPC;
	aivar[AIV_HASDEFEATEDSC] = 400;
	aivar[AIV_ISLOOKING] = 2;
	aivar[AIV_MOVINGMOB] = TRUE;
};

instance akh_SummonedByNPC_StoneGolem(Mst_Default_Golem)
{
	name[0] = "Каменный голем";
	aivar[AIV_IMPORTANT] = ID_STONEGOLEM;
	Set_StoneGolem_Visuals();
	Npc_SetToFistMode(self);
	protection[PROT_BLUNT] = 75;
	start_aistate = ZS_MM_Summoned;
};

instance akh_FireGolem(Mst_Default_Golem)
{
	name[0] = "Огненный голем";
	aivar[AIV_IMPORTANT] = id_firegolem;
	Set_FireGolem_Visuals();
	Npc_SetToFistMode(self);
	attribute[ATR_STRENGTH] = 50;
	protection[PROT_MAGIC] = 0;
	attribute[ATR_HITPOINTS_MAX] = 150;
	attribute[ATR_HITPOINTS] = 150;
	damagetype = DAM_FIRE;
	CreateInvItem(self,ItAt_FireGolem_01);
};

instance akh_IceGolem(Mst_Default_Golem)
{
	name[0] = "Ледяной голем";
	aivar[AIV_IMPORTANT] = id_icegolem;
	Set_IceGolem_Visuals();
	attribute[ATR_MANA_MAX] = 500;
	attribute[ATR_MANA] = 500;
	attribute[ATR_HITPOINTS_MAX] = 150;
	attribute[ATR_HITPOINTS] = 150;
	protection[PROT_FIRE] = 0;
	damagetype = DAM_BLUNT;
	CreateInvItem(self,ItAt_IceGolem_01);
	CreateInvItem(self,ItAt_IceGolem_02);
	fight_tactic = FAI_HUMAN_MAGE;
};

instance akh_Bridgegolem(Mst_Default_Golem)
{
	name[0] = "Каменный голем";
	aivar[AIV_IMPORTANT] = ID_STONEGOLEM;
	level = 50;
	Set_StoneGolem_Visuals();
	Npc_SetToFistMode(self);
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_HITPOINTS_MAX] = 700;
	attribute[ATR_HITPOINTS] = 600;
	protection[PROT_BLUNT] = 100;
};

