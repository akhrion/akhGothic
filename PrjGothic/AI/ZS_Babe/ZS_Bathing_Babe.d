
func void ZS_Bathing_Babe()
{
	PrintDebug("Enter ZS_Bathing_Babe () ");
	B_SetBabeDefaultPerceptions();
	AI_SetWalkMode(self,NPC_WALK);
	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == 0)
	{
		AI_GotoWP(self,self.wp);
	};
	PrintDebug("Suche Badewanne !");
	if(Wld_IsMobAvailable(self,"BATHTUB"))
	{
		PrintDebug("Wanne gefunden! Gehe baden");
		if(!Npc_HasItems(self,bab_armor_nude))
		{
			CreateInvItem(self,bab_armor_nude);
		};
		AI_EquipBestArmor(self);
		AI_UseMob(self,"BATHTUB",1);
		Mdl_ApplyRandomAni(self,"S_BATHTUB_S1","T_BATHTUB_RANDOM1");
		Mdl_ApplyRandomAni(self,"S_BATHTUB_S1","T_BATHTUB_RANDOM2");
		Mdl_ApplyRandomAniFreq(self,"S_BATHTUB_S1",3);
	}
	else
	{
		PrintDebug("No BATHTUB-Mobsi found !");
	};
};

func void ZS_Bathing_Babe_Loop()
{
	npc_main_loop(self);
};

func void ZS_Bathing_Babe_End()
{
	PrintDebug("Enter ZS_Bathing_Babe_End() ");
	AI_UseMob(self,"BATHTUB",-1);
	AI_UnequipArmor(self);
	if(Npc_HasItems(self,bab_armor_nude))
	{
		Npc_RemoveInvItem(self,bab_armor_nude);
	};
};

