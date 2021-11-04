
instance Bau_940_Riddler(Npc_Default)
{
	name[0] = "Труп";
	npcType = npctype_main;
	guild = GIL_KDF;
	level = 50;
	voice = 7;
	id = 940;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 30;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	attribute[ATR_HITPOINTS_MAX] = 400;
	attribute[ATR_HITPOINTS] = 400;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",3,1,"Hum_Head_Pony",110,1,-1);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_MAGE;
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,5);
	CreateInvItem(self,itarrune_2_4_firerain);
	CreateInvItems(self,ItMiNugget,302);
	CreateInvItems(self,ItFoRice,6);
	CreateInvItem(self,Lebensamulett);
	CreateInvItem(self,theriddle6);
	CreateInvItems(self,ItArScrollTrfBloodfly,2);
	daily_routine = Rtn_start_940;
};


func void Rtn_start_940()
{
	TA_Stand(8,0,20,0,"OW_FOGDUNGEON_36_MOVEMENT");
	TA_Stand(20,0,8,0,"OW_FOGDUNGEON_36_MOVEMENT");
};

