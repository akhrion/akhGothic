
prototype Mst_Default_Minecrawler(C_Npc)
{
	name[0] = "Ползун";
	guild = GIL_MINECRAWLER;
	aivar[AIV_MM_REAL_ID] = ID_MINECRAWLER;
	level = 13;
	attribute[ATR_STRENGTH] = 65;
	attribute[ATR_DEXTERITY] = 30;
	attribute[ATR_HITPOINTS_MAX] = 90;
	attribute[ATR_HITPOINTS] = 90;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 55;
	protection[PROT_EDGE] = 50;
	protection[PROT_POINT] = 15;
	protection[PROT_FIRE] = 25;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_MINECRAWLER;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 3000;
	aivar[AIV_MM_Behaviour] = PACKHUNTER;
	aivar[AIV_MM_PercRange] = 1200;
	aivar[AIV_MM_DrohRange] = 1200;
	aivar[AIV_MM_AttackRange] = 1000;
	aivar[AIV_MM_DrohTime] = 2;
	aivar[AIV_MM_FollowTime] = 10;
	aivar[AIV_MM_FollowInWater] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_WuselStart] = OnlyRoutine;
};

func void Set_Minecrawler_Visuals()
{
	Mdl_SetVisual(self,"Crawler.mds");
	Mdl_SetVisualBody(self,"Crw_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance MineCrawler(Mst_Default_Minecrawler)
{
	Set_Minecrawler_Visuals();
	Npc_SetToFistMode(self);
};

instance YMINECRAWLER(Mst_Default_Minecrawler)
{
	name[0] = "Молодой ползун";
	level = 4;
	attribute[ATR_STRENGTH] = 6;
	attribute[ATR_DEXTERITY] = 6;
	attribute[ATR_HITPOINTS_MAX] = 40;
	attribute[ATR_HITPOINTS] = 40;
	protection[PROT_BLUNT] = 8;
	protection[PROT_EDGE] = 8;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 5;
	Set_Minecrawler_Visuals();
	Mdl_SetModelScale(self,0.4,0.4,0.4);
	Npc_SetToFistMode(self);
};

instance MINECRAWLER_OMGATE(Mst_Default_Minecrawler)
{
	Set_Minecrawler_Visuals();
	Npc_SetToFistMode(self);
	start_aistate = zs_mm_minecrawler_omgate;
};

