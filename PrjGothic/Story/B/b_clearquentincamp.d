
func void b_clearquentincamp()
{
	if(!Npc_IsDead(Org_858_Quentin))
	{
		B_KillNpc(Org_858_Quentin);
	};
	if(!Npc_IsDead(Org_863_Raeuber))
	{
		B_KillNpc(Org_863_Raeuber);
	};
	if(!Npc_IsDead(Org_864_Raeuber))
	{
		B_KillNpc(Org_864_Raeuber);
	};
	if(!Npc_IsDead(Org_865_Raeuber))
	{
		B_KillNpc(Org_865_Raeuber);
	};
	if(!Npc_IsDead(Org_866_Raeuber))
	{
		B_KillNpc(Org_866_Raeuber);
	};
	if(!Npc_IsDead(Org_867_Raeuber))
	{
		B_KillNpc(Org_867_Raeuber);
	};
	if(!Npc_IsDead(Org_868_Raeuber))
	{
		B_KillNpc(Org_868_Raeuber);
	};
	if(!Npc_IsDead(Org_869_Raeuber))
	{
		B_KillNpc(Org_869_Raeuber);
	};
	if(!Npc_IsDead(Org_870_Raeuber))
	{
		B_KillNpc(Org_870_Raeuber);
	};
	if(!Npc_IsDead(Org_871_Raeuber))
	{
		B_KillNpc(Org_871_Raeuber);
	};
	if(!Npc_IsDead(Org_874_Raeuber))
	{
		B_KillNpc(Org_874_Raeuber);
	};
	if(!Npc_IsDead(Org_861_Killian) && (Stooges_Fled == TRUE))
	{
		B_KillNpc(Org_861_Killian);
	};
	if(!Npc_IsDead(Org_860_Renyu) && (Stooges_Fled == TRUE))
	{
		B_KillNpc(Org_860_Renyu);
	};
	if(!Npc_IsDead(Org_862_Jacko) && (Stooges_Fled == TRUE))
	{
		B_KillNpc(Org_862_Jacko);
	};
	if(!Npc_IsDead(org_899_alex))
	{
		B_KillNpc(org_899_alex);
	};
	if(!Npc_IsDead(org_898_alex))
	{
		B_KillNpc(org_898_alex);
	};
	if(!Npc_IsDead(ORG_857_Calash) && Npc_KnowsInfo(hero,info_calash_dia3))
	{
		B_KillNpc(ORG_857_Calash);
	};
	B_ExchangeRoutine(EBR_101_Scar,"qc");
	B_ExchangeRoutine(GRD_240_Gardist,"qc");
	B_ExchangeRoutine(GRD_241_Gardist,"qc");
	B_ExchangeRoutine(GRD_242_Gardist,"qc");
	B_ExchangeRoutine(GRD_245_Gardist,"qc");
	B_ExchangeRoutine(vlk_595_buddler,"start");
	B_ExchangeRoutine(vlk_596_buddler,"start");
	B_ExchangeRoutine(vlk_597_buddler,"start");
};

