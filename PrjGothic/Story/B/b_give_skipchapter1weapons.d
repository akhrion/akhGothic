
func void b_give_skipchapter1weapons()
{
	var C_Npc npc;
	npc = Hlp_GetNpc(Grd_211_Skip);
	CreateInvItems(npc,ItKeLockpick,10);
	CreateInvItem(npc,ItMw_1H_Sword_01);
	CreateInvItem(npc,ItMw_1H_Sword_02);
	CreateInvItem(npc,ItMw_1H_Sledgehammer_01);
	CreateInvItems(npc,ItMiNugget,200);
	CreateInvItems(npc,ItAmArrow,100);
	CreateInvItems(npc,ItAmBolt,100);
	CreateInvItems(npc,Heiltrank,5);
};

func void B_Give_SkipChapter2Weapons()
{
	var C_Npc npc;
	npc = Hlp_GetNpc(Grd_211_Skip);
	CreateInvItems(npc,ItKeLockpick,10);
	CreateInvItem(npc,ItMw_1H_Sword_03);
	CreateInvItem(npc,ItMw_1H_Sword_04);
	CreateInvItems(npc,Heiltrank,10);
	CreateInvItems(npc,ItFo_Potion_Health_02,5);
	CreateInvItems(npc,ItMiNugget,200);
	CreateInvItems(npc,ItAmArrow,100);
	CreateInvItems(npc,ItAmBolt,100);
};

func void B_Give_SkipChapter3Weapons()
{
	var C_Npc npc;
	npc = Hlp_GetNpc(Grd_211_Skip);
	CreateInvItems(npc,ItKeLockpick,20);
	CreateInvItem(npc,ItMw_1H_Sword_Long_01);
	CreateInvItem(npc,ItMw_1H_Sword_Long_02);
	CreateInvItem(npc,ItMw_1H_Sword_Long_03);
	CreateInvItems(npc,ItAmArrow,100);
	CreateInvItems(npc,ItAmBolt,100);
	CreateInvItems(npc,ItMiNugget,600);
};

