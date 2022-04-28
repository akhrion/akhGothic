prototype Egg(C_Npc)
{
	guild = GIL_None;
	level = 1;
	aivar[AIV_MM_REAL_ID] = ID_EGG;
	attribute[ATR_HITPOINTS] = 1;
	attribute[ATR_HITPOINTS_MAX] = 1;
	fight_tactic = FAI_NONE; 
	spawnDelay = 60;
	Mdl_SetVisual(self,"Molerat.mds");
	Mdl_SetVisualBody(self,"Mol_Body",1,DEFAULT,"",DEFAULT,DEFAULT,-1);
	Mdl_SetModelScale(self,0.01,0.01,0.01);
};
prototype Revive(C_Npc)
{
	guild = GIL_None;
	level = 1;
	aivar[AIV_MM_REAL_ID] = ID_REVIVE;
	attribute[ATR_HITPOINTS] = 1;
	attribute[ATR_HITPOINTS_MAX] = 1;
	fight_tactic = FAI_NONE; 
	spawnDelay = 60;
	Mdl_SetVisual(self,"Molerat.mds");
	Mdl_SetVisualBody(self,"Mol_Body",1,DEFAULT,"",DEFAULT,DEFAULT,-1);
	Mdl_SetModelScale(self,0.01,0.01,0.01);
};
