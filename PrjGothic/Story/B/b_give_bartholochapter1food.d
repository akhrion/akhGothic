
func void b_give_bartholochapter1food()
{
	var C_Npc npc;
	npc = Hlp_GetNpc(EBR_106_Bartholo);
	CreateInvItems(npc,ItFo_Potion_Health_01,5);
	CreateInvItems(npc,ItFoApple,5);
	CreateInvItems(npc,ItFo_wineberrys_01,7);
	CreateInvItems(npc,ItFoLoaf,8);
	CreateInvItems(npc,ItFoMutton,10);
	CreateInvItems(npc,ItFo_mutton_01,6);
	CreateInvItems(npc,ItFoCheese,8);
	CreateInvItems(npc,ItFoBeer,6);
	CreateInvItems(npc,ItFoWine,9);
	CreateInvItems(npc,ItMiJoint_2,4);
	CreateInvItems(npc,ItMiJoint_3,5);
};

func void b_give_bartholochapter2food()
{
	var C_Npc npc;
	npc = Hlp_GetNpc(EBR_106_Bartholo);
	CreateInvItems(npc,ItFo_Potion_Health_02,5);
};

func void b_give_bartholochapter3food()
{
	var C_Npc npc;
	npc = Hlp_GetNpc(EBR_106_Bartholo);
	CreateInvItems(npc,ItFo_Potion_Health_03,5);
};

