
instance EBR_106_Bartholo(Npc_Default)
{
	name[0] = "Бартоло";
	npcType = npctype_main;
	guild = GIL_EBR;
	level = 70;
	voice = 12;
	id = 106;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 65;
	attribute[ATR_DEXTERITY] = 60;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 388;
	attribute[ATR_HITPOINTS] = 388;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",11,3,ebr_armor_m);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	aivar[AIV_IMPORTANT] = TRUE;
	Npc_SetTalentSkill(self,NPC_TALENT_2H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,2);
	EquipItem(self,Prankenhieb);
	b_give_bartholochapter1food();
	daily_routine = Rtn_start_106;
	fight_tactic = FAI_HUMAN_MASTER;
	senses = SENSE_SEE | SENSE_HEAR | SENSE_SMELL;
	aivar[AIV_ITEMSCHWEIN] = TRUE;
};


func void Rtn_start_106()
{
	TA_Sleep(1,0,8,0,"OCC_BARONS_UPSTAIRS_RIGHT_BACK_ROOM_RIGHT");
	TA_Stand(8,0,15,55,"OCC_BARONS_RIGHT_ROOM_BACK");
	TA_PlayTune(15,55,22,0,"OCC_BARONS_GREATHALL_RIGHT_BACK");
	TA_StandAround(22,0,1,0,"OCC_BARONS_GREATHALL_LEFT_BACK");
};

func void rtn_remove_106()
{
	TA_Stay(23,0,7,45,"WP_INTRO01");
	TA_Stay(7,45,23,0,"WP_INTRO01");
};


instance EBR_598_BARTHOLO(Npc_Default)
{
	name[0] = "Бартоло";
	npcType = npctype_main;
	guild = GIL_None;
	level = 70;
	voice = 12;
	id = 598;
	attribute[ATR_STRENGTH] = 65;
	attribute[ATR_DEXTERITY] = 60;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 388;
	attribute[ATR_HITPOINTS] = 388;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",11,3,ebr_armor_m);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	aivar[AIV_IMPORTANT] = TRUE;
	Npc_SetTalentSkill(self,NPC_TALENT_2H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,2);
	EquipItem(self,Prankenhieb);
	CreateInvItems(self,ItFo_Potion_Health_01,3);
	CreateInvItem(self,ItFo_mutton_01);
	CreateInvItem(self,ItFoCheese);
	daily_routine = rtn_start_598;
	fight_tactic = FAI_HUMAN_MASTER;
	senses = SENSE_SEE | SENSE_HEAR | SENSE_SMELL;
	aivar[AIV_ITEMSCHWEIN] = TRUE;
};


func void rtn_start_598()
{
	TA_Guard(10,0,22,0,"OCC_CHAPEL_STAIRCASE_TOP");
	TA_Guard(22,0,10,0,"OCC_CHAPEL_STAIRCASE_TOP");
};

