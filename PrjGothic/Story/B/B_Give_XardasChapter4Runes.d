
func void B_Give_XardasChapter4Runes()
{
	var C_Npc npc;
	npc = Hlp_GetNpc(KDF_404_Xardas);
	CreateInvItem(npc,itarrune_6_1_destroyundead);
	CreateInvItem(npc,itarrune_2_2_fireball);
	CreateInvItem(npc,itarrune_2_3_firestorm);
	CreateInvItems(npc,ItArScrollSummonSkeletons,3);
	CreateInvItems(npc,ItArScrollArmyOfDarkness,2);
	CreateInvItems(npc,ItArScrollDestroyUndead,4);
	CreateInvItem(npc,ItWr_Book_Circle_06);
	CreateInvItem(npc,alchemy_master);
};

func void B_Give_XardasChapter5Runes()
{
	var C_Npc npc;
	npc = Hlp_GetNpc(KDF_404_Xardas);
	CreateInvItem(npc,Amulett_der_Macht);
	CreateInvItem(npc,Amulett_der_Erleuchtung);
	CreateInvItem(npc,itarrune_2_4_firerain);
	CreateInvItems(npc,ItArScrollSummonGolem,2);
	CreateInvItems(npc,ItArScrollSummonDemon,2);
};

