
instance PC_Hero(Npc_Default)
{
	name[0] = "Я";
	npcType = npctype_main;
	guild = GIL_None;
	level = 0;
	voice = 15;
	id = 0;
	exp = 0;
	exp_next = 500;
	lp = 0;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 5;
	attribute[ATR_MANA] = 5;
	attribute[ATR_HITPOINTS_MAX] = 40;
	attribute[ATR_HITPOINTS] = 40;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",4,1,"Hum_Head_Pony",9,0,-1);
	CreateInvItem(self,ItWr_Fire_Letter_01);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentValue(self,NPC_TALENT_1H,50);
};

instance PC_Hero_L2(Npc_Default)
{
	name[0] = "Я";
	npcType = npctype_main;
	guild = GIL_None;
	level = 2;
	voice = 15;
	id = 0;
	exp = 1500;
	exp_next = 3000;
	lp = 0;
	attribute[ATR_STRENGTH] = 13;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 5;
	attribute[ATR_MANA] = 5;
	attribute[ATR_HITPOINTS_MAX] = 64;
	attribute[ATR_HITPOINTS] = 64;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",4,1,"Hum_Head_Pony",9,0,vlk_armor_l);
	EquipItem(self,HeroSword20);
	CreateInvItems(self,ItAmArrow,50);
	EquipItem(self,HeroSword13);
	EquipItem(self,HeroBow13);
};

instance PC_Hero_L5(Npc_Default)
{
	name[0] = "Я";
	npcType = npctype_main;
	guild = GIL_None;
	level = 5;
	voice = 15;
	id = 0;
	exp = 7500;
	exp_next = 10500;
	lp = 0;
	attribute[ATR_STRENGTH] = 25;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 5;
	attribute[ATR_MANA] = 5;
	attribute[ATR_HITPOINTS_MAX] = 100;
	attribute[ATR_HITPOINTS] = 100;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",4,1,"Hum_Head_Pony",9,0,-1);
	EquipItem(self,HeroSword25);
	EquipItem(self,HeroBow13);
	CreateInvItems(self,ItAmArrow,50);
};

instance PC_Hero_L7(Npc_Default)
{
	name[0] = "Я";
	npcType = npctype_main;
	guild = GIL_ORG;
	level = 7;
	voice = 15;
	id = 0;
	exp = 14000;
	exp_next = 18000;
	lp = 0;
	attribute[ATR_STRENGTH] = 45;
	attribute[ATR_DEXTERITY] = 35;
	attribute[ATR_MANA_MAX] = 20;
	attribute[ATR_MANA] = 20;
	attribute[ATR_HITPOINTS_MAX] = 160;
	attribute[ATR_HITPOINTS] = 160;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",4,1,"Hum_Head_Pony",9,0,org_armor_h);
	Npc_SetTalentSkill(self,NPC_TALENT_PICKLOCK,1);
	Npc_SetTalentValue(self,NPC_TALENT_PICKLOCK,60);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,ItMw_1H_Sword_05);
	EquipItem(self,ItRw_Bow_Small_04);
	CreateInvItems(self,ItAmArrow,100);
	CreateInvItems(self,ItMiNugget,50);
	CreateInvItem(self,ItWrWorldmap);
	CreateInvItems(self,ItKeLockpick,30);
	CreateInvItems(self,ItLsTorch,20);
	CreateInvItems(self,ItFo_Potion_Health_03,20);
	CreateInvItems(self,ItFo_Potion_Mana_03,20);
};

instance PC_Hero_L11(Npc_Default)
{
	name[0] = "Я";
	npcType = npctype_main;
	guild = GIL_SLD;
	level = 11;
	voice = 15;
	id = 0;
	exp = 33000;
	exp_next = 39000;
	lp = 0;
	attribute[ATR_STRENGTH] = 60;
	attribute[ATR_DEXTERITY] = 45;
	attribute[ATR_MANA_MAX] = 50;
	attribute[ATR_MANA] = 50;
	attribute[ATR_HITPOINTS_MAX] = 220;
	attribute[ATR_HITPOINTS] = 220;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",4,1,"Hum_Head_Pony",9,0,sld_armor_h);
	Npc_SetTalentSkill(self,NPC_TALENT_PICKLOCK,1);
	Npc_SetTalentValue(self,NPC_TALENT_PICKLOCK,60);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	EquipItem(self,ItMw_1H_Sword_Long_05);
	EquipItem(self,ItRw_Bow_Long_02);
	CreateInvItems(self,ItAmArrow,100);
	CreateInvItems(self,ItMiNugget,400);
	CreateInvItems(self,ItKeLockpick,30);
	CreateInvItems(self,ItLsTorch,20);
};

instance PC_Hero_L13(Npc_Default)
{
	name[0] = "Я";
	npcType = npctype_main;
	guild = GIL_SLD;
	level = 13;
	voice = 15;
	id = 0;
	exp = 45500;
	exp_next = 52500;
	lp = 0;
	attribute[ATR_STRENGTH] = 65;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_MANA_MAX] = 50;
	attribute[ATR_MANA] = 50;
	attribute[ATR_HITPOINTS_MAX] = 250;
	attribute[ATR_HITPOINTS] = 250;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",4,1,"Hum_Head_Pony",9,0,sld_armor_h);
	Npc_SetTalentSkill(self,NPC_TALENT_PICKPOCKET,1);
	Npc_SetTalentValue(self,NPC_TALENT_PICKPOCKET,60);
	Npc_SetTalentSkill(self,NPC_TALENT_SNEAK,1);
	Npc_SetTalentSkill(self,NPC_TALENT_PICKLOCK,1);
	Npc_SetTalentValue(self,NPC_TALENT_PICKLOCK,60);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	EquipItem(self,ItMw_1H_Sword_Broad_01);
	EquipItem(self,ItRw_Bow_Long_04);
	CreateInvItems(self,ItAmArrow,100);
	CreateInvItems(self,ItMiNugget,400);
	CreateInvItems(self,ItKeLockpick,50);
	CreateInvItems(self,ItLsTorch,20);
};

instance HeroSword13(C_Item)
{
	name = "Изношенный меч";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = 27;
	damage[DAM_INDEX_BARRIER] = 13;
	damagetype = DAM_EDGE;
	range = 100;
	visual = "ItMw1hSwordold01.3DS";
};

instance HeroSword20(C_Item)
{
	name = "Меч";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = 31;
	damage[DAM_INDEX_BARRIER] = 20;
	damagetype = DAM_EDGE;
	range = 100;
	visual = "ItMw1hSword01.3DS";
};

instance HeroSword25(C_Item)
{
	name = "Меч";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = 31;
	damage[DAM_INDEX_BARRIER] = 25;
	damagetype = DAM_EDGE;
	range = 100;
	visual = "ItMw1hSword01.3DS";
};

instance HeroBow13(C_Item)
{
	name = "Длинный лук";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = 35;
	damage[DAM_INDEX_BARRIER] = 13;
	damagetype = DAM_POINT;
	munition = ItAmArrow;
	visual = "ItRwLongbow.mms";
};

instance XP_Map(C_Item)
{
	name = "Карта опыта";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 1000;
	visual = "ItWr_Map_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	text[1] = "Бонус к руде:";
	count[1] = 1000;
	text[2] = "Бонус к очкам обучения:";
	count[2] = 10;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_XP_Map;
};


func void Use_XP_Map()
{
	CreateInvItems(self,ItMiNugget,1000);
	hero.lp = hero.lp + 10;
	PrintScreen("+1000 кусков руды, +10 очков обучения",-1,-1,"font_old_20_white.tga",3);
};


instance D36TESTBOOK(C_Item)
{
	name = "Книга тестов";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 36;
	visual = "ITWR_BOOK_ALCHEMY.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	text[0] = "Gothic Russobit-M Fix";
	text[1] = ConcatStrings(IntToString(FIX_VERSION_START)," версия от 19/02/2021");
	text[2] = ConcatStrings(IntToString(FIX_VERSION_SAVE)," версия в сохранении");
	on_state[0] = use_d36testbook;
};


func void use_d36testbook()
{
};


instance ALCHEMYKIT(C_Item)
{
	name = "Набор юного алхимика";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 36;
	visual = "ITWR_BOOK_ALCHEMY.3ds";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	on_state[0] = use_alchemykit;
};


func void use_alchemykit()
{
	hero.lp = hero.lp + 10;
	CreateInvItem(self,alchemybook);
	CreateInvItem(self,alchemy_hp1);
	CreateInvItem(self,alchemy_hp2);
	CreateInvItem(self,alchemy_hp3);
	CreateInvItem(self,alchemy_hpmax);
	CreateInvItem(self,alchemy_mp1);
	CreateInvItem(self,alchemy_mp2);
	CreateInvItem(self,alchemy_mp3);
	CreateInvItem(self,alchemy_mpmax);
	CreateInvItem(self,alchemy_dex);
	CreateInvItem(self,alchemy_str);
	CreateInvItem(self,alchemy_egg);
	CreateInvItem(self,alchemy_fortuno);
	CreateInvItem(self,alchemy_master);
	CreateInvItem(self,alchemy_joint2);
	CreateInvItem(self,alchemy_joint3);
	CreateInvItem(self,KalomsRecipe);
	CreateInvItems(self,ItMiFlask,20);
	CreateInvItems(self,ItFo_Plants_Berrys_01,5);
	CreateInvItems(self,ItFo_Plants_Nightshadow_01,5);
	CreateInvItems(self,ItFo_Plants_Herb_01,5);
	CreateInvItems(self,ItFo_Plants_Herb_02,5);
	CreateInvItems(self,ItFo_Plants_Herb_03,5);
	CreateInvItems(self,ItFo_Plants_Seraphis_01,5);
	CreateInvItems(self,ItFo_Plants_RavenHerb_01,5);
	CreateInvItems(self,ItFo_Plants_Stoneroot_01,5);
	CreateInvItems(self,ItFo_Plants_mountainmoos_01,5);
	CreateInvItems(self,ItFo_Plants_mushroom_01,5);
	CreateInvItems(self,ItFo_Plants_Nightshadow_02,5);
	CreateInvItems(self,ItFo_Plants_OrcHerb_02,5);
	CreateInvItems(self,ItFo_Plants_mountainmoos_02,5);
	CreateInvItems(self,ItFo_Plants_Trollberrys_01,5);
	CreateInvItems(self,ItFo_Plants_RavenHerb_02,5);
	CreateInvItems(self,ItFo_Plants_Stoneroot_02,5);
	CreateInvItems(self,ItFo_Plants_Flameberry_01,5);
	CreateInvItems(self,ItAt_Crawlerqueen,9);
	CreateInvItems(self,ItMi_Plants_Swampherb_01,18);
	CreateInvItems(self,ItMi_Alchemy_Alcohol_01,5);
	CreateInvItems(self,ItFo_Plants_Bloodwood_01,5);
	CreateInvItems(self,itfo_plants_deadleaf,5);
};


instance FIX(C_Item)
{
	name = "Лекарство от бага";
	mainflag = ITEM_KAT_POTIONS;
	flags = 0;
	value = 36;
	visual = "ItMiFlask.3ds";
	material = MAT_GLAS;
	scemeName = "POTIONFAST";
	on_state[0] = use_fix;
};


func void use_fix()
{
	Npc_SetTalentSkill(hero,NPC_TALENT_REGENERATE,0);
	Npc_SetTalentSkill(hero,NPC_TALENT_FIREMASTER,0);
};


instance TestChameleon(Npc_Default)
{
	name[0] = "00";
	npcType = npctype_main;
	guild = GIL_None;
	level = 0;
	voice = 15;
	exp = 0;
	exp_next = 500;
	lp = 0;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 5;
	attribute[ATR_MANA] = 5;
	attribute[ATR_HITPOINTS_MAX] = 40;
	attribute[ATR_HITPOINTS] = 40;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,0,"Hum_Head_Pony",0,0,-1);
	CreateInvItem(self,ItWr_Fire_Letter_01);
	daily_routine = TestChameleon_Rtn;
};
func void TestChameleon_Rtn()
{
	TA(self,0,0,ZS_TestChameleon,"");
};
func void ZS_TestChameleon()
{
	Npc_PercEnable(self,PERC_ASSESSTALK,TestChameleon_ChangeColor);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,TestChameleon_Disapire);
	Npc_SetPercTime(self,2);
};
func void ZS_TestChameleon_Loop()
{
};
func void ZS_TestChameleon_End()
{
};
func void TestChameleon_ChangeColor()
{
	var int t;var int tc;var int h;var int hc;
	Mdl_SetVisualBody(self,"hum_body_Naked0",t,tc,"Hum_Head_Thief",h,hc,-1);
	self.name[0] = IntToString(t);
	t +=1;tc +=1;h+=1;hc+=1;
};
func void TestChameleon_Disapire()
{
	AI_Teleport(self,"WP_INTRO01");
	self.attribute[ATR_HITPOINTS] = 0;
};
instance TestNSC01(Npc_Default)
{
	name[0] = "NSC01";
	npcType = npctype_main;
	guild = GIL_None;
	level = 0;
	voice = 15;
	exp = 0;
	exp_next = 500;
	lp = 0;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 5;
	attribute[ATR_MANA] = 5;
	attribute[ATR_HITPOINTS_MAX] = 40;
	attribute[ATR_HITPOINTS] = 40;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,0,"Hum_Head_Pony",0,0,-1);
	CreateInvItem(self,ItWr_Fire_Letter_01);
	daily_routine = TestNSC01_Rtn;
};
func void TestNSC01_Rtn()
{
	TA(self,2,22,ZS_TestNSC01,"");
};
func void ZS_TestNSC01()
{
	Npc_PercEnable(self,PERC_ASSESSTALK,TestNSC01_AssTalk);
	Npc_SetPercTime(self,2);
};
func void ZS_TestNSC01_Loop()
{
};
func void ZS_TestNSC01_End()
{
};
func void TestNSC01_AssTalk()
{
	Npc_SetTarget(self,TestNSC02);
	Npc_GetTarget(self);
	Print(other.name);
	if(Npc_GetAttitude(self,other))
	{
		Npc_SetAttitude(self,ATT_HOSTILE);
	}
	else
	{
		Npc_SetAttitude(self,ATT_FRIENDLY);
	};
	B_AssessEnemy();
};
instance TestNSC02(Npc_Default)
{
	name[0] = "NSC02";
	npcType = npctype_main;
	guild = GIL_None;
	level = 0;
	voice = 15;
	exp = 0;
	exp_next = 500;
	lp = 0;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 5;
	attribute[ATR_MANA] = 5;
	attribute[ATR_HITPOINTS_MAX] = 40;
	attribute[ATR_HITPOINTS] = 40;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,0,"Hum_Head_Pony",0,0,-1);
	CreateInvItem(self,ItWr_Fire_Letter_01);
	daily_routine = TestNSC01_Rtn;
};