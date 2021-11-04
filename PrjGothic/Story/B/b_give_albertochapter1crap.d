
func void b_give_albertochapter1crap()
{
	var C_Npc npc;
	npc = Hlp_GetNpc(STT_300_Alberto);
	CreateInvItems(npc,ItFoApple,9);
	CreateInvItems(npc,ItFoBeer,5);
	CreateInvItems(npc,ItFo_Potion_Health_01,5);
	CreateInvItems(npc,ItFo_Potion_Health_02,5);
	CreateInvItems(npc,ItMiNugget,93);
	CreateInvItems(npc,ItAmArrow,80);
	CreateInvItem(npc,alchemy_hp2_priced);
};

