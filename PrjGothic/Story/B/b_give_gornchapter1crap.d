
func void b_give_gornchapter1crap()
{
	var C_Npc npc;
	npc = Hlp_GetNpc(PC_Fighter);
	CreateInvItems(npc,ItMiNugget,200);
	CreateInvItems(npc,ItFoWine,10);
	CreateInvItems(npc,ItFoLoaf,20);
	CreateInvItems(npc,ItFoMutton,21);
	CreateInvItems(npc,ItFo_mutton_01,9);
	CreateInvItems(npc,ItFoCheese,18);
	CreateInvItems(npc,ItFoBeer,16);
	CreateInvItems(npc,ItFo_Potion_Health_01,10);
	CreateInvItems(npc,ItFo_Potion_Mana_01,5);
	CreateInvItems(npc,ItKeLockpick,5);
	CreateInvItem(npc,alchemy_hp3_priced);
};

func void b_give_gornchapter2crap()
{
	var C_Npc npc;
	npc = Hlp_GetNpc(PC_Fighter);
	CreateInvItems(npc,ItMiNugget,300);
	CreateInvItems(npc,ItFo_Potion_Health_02,10);
	CreateInvItems(npc,ItFo_Potion_Mana_02,5);
};

func void b_give_gornchapter3crap()
{
	var C_Npc npc;
	npc = Hlp_GetNpc(PC_Fighter);
	CreateInvItems(npc,ItMiNugget,400);
	CreateInvItems(npc,ItFo_Potion_Health_03,10);
	CreateInvItems(npc,ItFo_Potion_Mana_03,5);
};

func void b_give_gornchapter4crap()
{
	var C_Npc npc;
	npc = Hlp_GetNpc(PC_Fighter);
	CreateInvItems(npc,ItMiNugget,500);
	CreateInvItems(npc,ItFo_Potion_Haste_01,5);
};

func void b_give_gornchapter5crap()
{
	var C_Npc npc;
	npc = Hlp_GetNpc(PC_Fighter);
	CreateInvItems(npc,ItMiNugget,700);
	CreateInvItems(npc,ItFo_Potion_Haste_02,10);
};

