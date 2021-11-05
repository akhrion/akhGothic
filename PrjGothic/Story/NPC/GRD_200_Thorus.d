
instance GRD_200_Thorus(Npc_Default)
{
	name[0] = "Торус";
	npcType = npctype_friend;
	guild = GIL_GRD;
	exp = 637500;
	exp_next = 663000;
	level = 50;
	voice = 9;
	id = 200;
//	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 150;
	attribute[ATR_DEXTERITY] = 25;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 780;
	attribute[ATR_HITPOINTS] = 780;
	attribute[ATR_REGENERATEHP] = 4;
	protection[PROT_FALL] = 100;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,3,"Hum_Head_Fighter",12,0,grd_armor_h);
//	B_Scale(self);
	Mdl_SetModelScale(self,1.3,1.15,1.1);
	Mdl_SetModelFatness(self,1.5);
	aivar[AIV_IMPORTANT] = true;
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_CROSSBOW,1);
	Npc_SetTalentValue(self,NPC_TALENT_1H,70);
	Npc_SetTalentValue(self,NPC_TALENT_2H,70);
	EquipItem(self,Thorus_Schwert);
	EquipItem(self,ItRw_Crossbow_01);
	CreateInvItems(self,ItAmBolt,30);
	CreateInvItems(self,ItMiNugget,200);
	CreateInvItems(self,ItFo_Potion_Health_03,7);
	CreateInvItem(self,ItLsTorch);
	daily_routine = Rtn_Start_200;
};

func void Rtn_Start_200()
{
	TA_Boss(8,0,16,0,"OCR_THORUS");
	TA_ThorusPracticeSword(16,0,17,0,"OCC_PALISADE_WALLCRACK");
	TA_Boss(17,0,23,0,"OCR_THORUS");
	TA_Sleep(23,0,8,0,"OCC_BARONS_UPPER_RIGHT_ROOM_BED1");
};

func void rtn_flee_200()
{
	TA_Stay(0,0,12,0,"WP_INTRO01");
	TA_Stay(12,0,24,0,"WP_INTRO01");
};

func void ThorusPracticeSword()
{
	if(C_Npc_IsNearestWP(self,"OCC_PALISADE_WALLCRACK"))
	{
		if(!Npc_HasReadiedMeleeWeapon(self))
		{
			AI_ReadyMeleeWeapon(self);
		};
		AI_AlignToWP(self);
		AI_PlayAni(self,"T_1HSFREE");
	};
};
func void ThorusPracticeSwordChooceWay()
{
	var int rnd;
	rnd = Hlp_Random(5);
	if(!rnd)
	{
		Print(ConcatStrings(IntToString(rnd),"OCC_CENTER_1"));
		AI_GotoWP(self,C_Npc_GetNextWPArr5(self,3,
			"OCC_CENTER_1","OCC_WELL_FIGHT01","OCC_PALISADE_WALLCRACK","",""));
	}
	else
	{
		Print(ConcatStrings(IntToString(rnd),"OCC_MERCS_ENTRANCE_1"));
		AI_GotoWP(self,C_Npc_GetNextWPArr5(self,3,
			"OCC_MERCS_ENTRANCE_1","OCC_WELL_RIGHT_MOVEMENT2","OCC_PALISADE_WALLCRACK","",""));
	};
};
func void ZS_ThorusPracticeSword()
{
	B_SetPerception(self);
	Npc_SetPercTime(self,3);
	var string strtPlace;
	var string trnPlace;
	var string wAnchor;
	strtPlace = "OCR_THORUS";
	trnPlace = "OCC_PALISADE_WALLCRACK";
	wAnchor = "OCC_WELL_FIGHT01";
	B_SetPerception(self);
	Npc_SetPercTime(self,1);
	AI_SetWalkMode(self,NPC_WALK);
/*
	if(distToWp > distToPrevWp)
		goto myWp
	else if(nextWpExist)
		prevWp = myWp
		myWp = nextWp
		goto myWp
	else
		
	end
*/
	
	
	
	
	ThorusPracticeSwordChooceWay();
	if(!Npc_HasEquippedMeleeWeapon(self))
	{
		CreateInvItem(self,itmw_trainsword);
		AI_EquipBestMeleeWeapon(self);
	};
};
func void ZS_ThorusPracticeSword_Loop()
{
//	AI_GotoWP(self,C_Npc_GetNextWPArr3(self,"OCR_THORUS","OCC_WELL_FIGHT01","OCC_PALISADE_WALLCRACK"));
	npc_main_loop(self);
	ThorusPracticeSwordChooceWay();
	ThorusPracticeSword();
};
func void ZS_ThorusPracticeSword_End()
{
	B_RemoveWeapon(self);
};