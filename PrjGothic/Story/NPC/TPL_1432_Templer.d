
instance TPL_1432_Templer(Npc_Default)
{
	name[0] = NAME_Templer;
	npcType = npctype_guard;
	guild = GIL_TPL;
	level = 17;
	voice = 8;
	id = 1432;
	attribute[ATR_STRENGTH] = 85;
	attribute[ATR_DEXTERITY] = 65;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 244;
	attribute[ATR_HITPOINTS] = 244;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_Psionic",59,2,tpl_armor_m);
	B_Scale(self);
	Mdl_SetModelFatness(self,-1);
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	EquipItem(self,ItMw_2H_Sword_Light_02);
	CreateInvItem(self,ItFoSoup);
	CreateInvItem(self,ItMiJoint_1);
	daily_routine = Rtn_start_1432;
};


func void Rtn_start_1432()
{
	TA_GuardPassage(21,0,8,0,"PSI_TEMPLE_GUARD_04");
	TA_GuardPassage(8,0,21,0,"PSI_TEMPLE_GUARD_04");
};

func void Rtn_PrepareRitual_1432()
{
	TA_GuardPassage(21,0,8,0,"PSI_TEMPLE_GUARD_04");
	TA_GuardPassage(8,0,21,0,"PSI_TEMPLE_GUARD_04");
};

func void Rtn_OMFull_1432()
{
	TA_GuardPassage(21,0,8,0,"PSI_TEMPLE_GUARD_04");
	TA_GuardPassage(8,0,21,0,"PSI_TEMPLE_GUARD_04");
};

func void Rtn_FMTaken_1432()
{
	TA_GuardPassage(21,0,8,0,"PSI_TEMPLE_GUARD_04");
	TA_GuardPassage(8,0,21,0,"PSI_TEMPLE_GUARD_04");
};

func void Rtn_OrcAssault_1432()
{
	TA_GuardPassage(21,0,8,0,"PSI_TEMPLE_GUARD_04");
	TA_GuardPassage(8,0,21,0,"PSI_TEMPLE_GUARD_04");
};

func void rtn_remove_1432()
{
	TA_Stay(23,0,7,45,"WP_INTRO01");
	TA_Stay(7,45,23,0,"WP_INTRO01");
};

