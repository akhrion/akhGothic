
instance GRD_280_Gardist(Npc_Default)
{
	name[0] = NAME_Gardist;
	npcType = npctype_guard;
	flags = NPC_FLAG_IMMORTAL;
	guild = GIL_GRD;
	level = 20;
	voice = 6;
	id = 280;
	attribute[ATR_STRENGTH] = 70;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 220;
	attribute[ATR_HITPOINTS] = 220;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",19,0,grd_armor_m);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	EquipItem(self,ItMw_1H_Sword_02);
	CreateInvItem(self,ItFoApple);
	CreateInvItems(self,ItMiNugget,10);
	daily_routine = Rtn_start_280;
};


func void Rtn_start_280()
{
	TA_GuardWheelOpen(6,25,23,10,"OCC_GATE_VWHEEL");
	TA_GuardWheelOpen(23,10,6,25,"OCC_GATE_VWHEEL");
};

func void Rtn_FMTaken_280()
{
	TA_GuardWheelClosed(6,25,23,10,"OCC_GATE_VWHEEL");
	TA_GuardWheelClosed(23,10,6,25,"OCC_GATE_VWHEEL");
};


instance GRD_998_GARDIST(Npc_Default)
{
	name[0] = NAME_Gardist;
	npcType = npctype_guard;
	flags = NPC_FLAG_IMMORTAL;
	guild = GIL_GRD;
	level = 20;
	voice = 6;
	id = 998;
	attribute[ATR_STRENGTH] = 70;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 220;
	attribute[ATR_HITPOINTS] = 220;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",54,0,grd_armor_m);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	EquipItem(self,ItMw_1H_Sword_02);
	CreateInvItem(self,ItFoApple);
	daily_routine = rtn_start_998;
};


func void rtn_start_998()
{
	TA_GuardWheelClosed(22,59,19,9,"OCR_ARENA_VWHEEL");
	TA_GuardWheelOpen(19,9,22,59,"OCR_ARENA_VWHEEL");
};

func void rtn_aclosed_998()
{
	TA_GuardWheelOpen(6,25,23,10,"OCR_ARENA_VWHEEL");
	TA_GuardWheelOpen(23,10,6,25,"OCR_ARENA_VWHEEL");
};

func void rtn_aopen_998()
{
	TA_GuardWheelClosed(6,25,23,10,"OCR_ARENA_VWHEEL");
	TA_GuardWheelClosed(23,10,6,25,"OCR_ARENA_VWHEEL");
};

func void rtn_wait_998()
{
	TA_Stay(6,25,23,10,"OCR_ARENA_VWHEEL");
	TA_Stay(23,10,6,25,"OCR_ARENA_VWHEEL");
};

