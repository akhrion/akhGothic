
func void ZS_PracticeSword()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_PracticeSword");
	if(!Npc_HasItems(self,itmw_trainsword))
	{
		CreateInvItem(self,itmw_trainsword);
	};
	B_SetPerception(self);
	AI_UnequipWeapons(self);
	AI_EquipBestMeleeWeapon(self);
	AI_EquipBestRangedWeapon(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(!Hlp_StrCmp(self.wp,Npc_GetNearestWP(self)))
	{
		AI_GotoWP(self,self.wp);
	};
	AI_ReadyMeleeWeapon(self);
};

func void ZS_PracticeSword_Loop()
{
	PrintDebugNpc(PD_TA_LOOP,"ZS_PracticeSword_Loop");
	AI_GotoWP(self,self.wp);
	AI_AlignToWP(self);
	AI_PlayAni(self,"T_1HSFREE");
};

func void ZS_PracticeSword_End()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_PracticeSword_End");
	B_FullStop(self);
	B_RemoveWeapon(self);
	AI_UnequipWeapons(self);
	AI_EquipBestMeleeWeapon(self);
	AI_EquipBestRangedWeapon(self);
};

