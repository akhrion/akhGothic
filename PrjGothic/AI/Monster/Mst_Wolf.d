
prototype Mst_Default_Wolf(C_Npc)
{
	name[0] = "Волк";
	guild = GIL_WOLF;
	aivar[AIV_MM_REAL_ID] = ID_WOLF;
	level = 9;
	attribute[ATR_STRENGTH] = 40;
	attribute[ATR_DEXTERITY] = 40;
	attribute[ATR_HITPOINTS_MAX] = 80;
	attribute[ATR_HITPOINTS] = 80;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 20;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 30;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_WOLF;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
//	senses_range = 3000;
	senses_range = 1054055056; //HEAR|SEE|SMELL -> 054 == 5^4 == 625 HEAR range B_SensesSystem.d
	aivar[AIV_MM_Behaviour] = PACKHUNTER;
	aivar[AIV_MM_PercRange] = 1500;
	aivar[AIV_MM_DrohRange] = 1200;
	aivar[AIV_MM_AttackRange] = 500;
	aivar[AIV_MM_DrohTime] = 3;
	aivar[AIV_MM_FollowTime] = 10;
	aivar[AIV_MM_FollowInWater] = TRUE;
	aivar[AIV_MM_LASTHPSTATE] = attribute[ATR_HITPOINTS_MAX];
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

func void Set_Wolf_Visuals()
{
	Mdl_SetVisual(self,"Wolf.mds");
	Mdl_SetVisualBody(self,"Wol_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance Wolf(Mst_Default_Wolf)
{
	Set_Wolf_Visuals();
	Npc_SetToFistMode(self);
};

