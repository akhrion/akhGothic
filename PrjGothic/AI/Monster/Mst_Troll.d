
prototype Mst_Default_Troll(C_Npc)
{
	name[0] = "Тролль";
	guild = GIL_TROLL;
	aivar[AIV_IMPORTANT] = ID_TROLL;
	level = 200;
	attribute[ATR_STRENGTH] = 560;
	attribute[ATR_DEXTERITY] = 20;
	attribute[ATR_HITPOINTS_MAX] = 4000;
	attribute[ATR_HITPOINTS] = 4000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 450;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 200;
	protection[PROT_FIRE] = 200;
	protection[PROT_FLY] = 9999;
	protection[PROT_MAGIC] = 100;
	damagetype = DAM_FLY;
	fight_tactic = FAI_TROLL;
	Npc_SetToFistMode(self);
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 3000;
	aivar[AIV_MM_Behaviour] = PASSIVE;
	aivar[AIV_MM_PercRange] = 1500;
	aivar[AIV_MM_DrohRange] = 1300;
	aivar[AIV_MM_AttackRange] = 700;
	aivar[AIV_MM_DrohTime] = 5;
	aivar[AIV_MM_FollowTime] = 10;
	aivar[AIV_MM_FollowInWater] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

func void Set_Troll_Visuals()
{
	Mdl_SetVisual(self,"Troll.mds");
	Mdl_SetVisualBody(self,"Tro_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance Troll(Mst_Default_Troll)
{
	Mdl_SetModelScale(self,1.5,1.5,1.5);
	Set_Troll_Visuals();
};

instance YoungTroll(Mst_Default_Troll)
{
	name[0] = "Молодой тролль";
	guild = GIL_TROLL;
	aivar[AIV_IMPORTANT] = ID_TROLL;
	level = 100;
	id = mid_youngtroll;
	Set_Troll_Visuals();
	Mdl_SetModelScale(self,0.7,0.7,0.7);
	attribute[ATR_STRENGTH] = 320;
	attribute[ATR_DEXTERITY] = 30;
	attribute[ATR_HITPOINTS_MAX] = 1500;
	attribute[ATR_HITPOINTS] = 1500;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 220;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 100;
	protection[PROT_FLY] = 9999;
	protection[PROT_MAGIC] = 9999;
	aivar[AIV_MM_Behaviour] = PASSIVE;
	aivar[AIV_MM_PercRange] = 3000;
	aivar[AIV_MM_DrohRange] = 2500;
	aivar[AIV_MM_AttackRange] = 2000;
	aivar[AIV_MM_DrohTime] = 5;
	aivar[AIV_MM_FollowTime] = 10;
	aivar[AIV_MM_FollowInWater] = FALSE;
};
