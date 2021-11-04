
instance SLD_726_Soeldner(Npc_Default)
{
	name[0] = NAME_Soeldner;
	npcType = npctype_guard;
	guild = GIL_SLD;
	level = 18;
	voice = 11;
	id = 726;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 90;
	attribute[ATR_DEXTERITY] = 70;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 256;
	attribute[ATR_HITPOINTS] = 256;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Bald",53,1,sld_armor_h);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,ItMw_1H_Mace_War_03);
	CreateInvItems(self,ItFoRice,9);
	CreateInvItems(self,ItFoLoaf,5);
	CreateInvItems(self,ItFoMutton,1);
	CreateInvItems(self,ItMiNugget,25);
	CreateInvItems(self,ItFoBooze,3);
	CreateInvItems(self,ItLsTorch,5);
	CreateInvItems(self,ItFo_Potion_Health_02,10);
	CreateInvItem(self,ItMi_Stuff_Barbknife_01);
	CreateInvItem(self,ItMi_Stuff_Mug_01);
	daily_routine = Rtn_start_726;
};


func void Rtn_start_726()
{
	TA_GuardPassage(23,0,7,0,"NC_PATH35");
	TA_GuardPassage(7,0,23,0,"NC_PATH35");
};

func void Rtn_loadsword_726()
{
	TA_Guard(23,0,7,0,"NC_PLACE02");
	TA_Guard(7,0,23,0,"NC_PLACE02");
};

func void rtn_drained_726()
{
	ta_drained_oreguard(23,0,7,0,"NC_PATH35");
	ta_drained_oreguard(7,0,23,0,"NC_PATH35");
};

