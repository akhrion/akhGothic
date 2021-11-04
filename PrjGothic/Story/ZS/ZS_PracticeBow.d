
func void ZS_PracticeBow()
{
	var C_Item rangedweapon;
	var float aimtime;
	PrintDebugNpc(PD_TA_FRAME,"ZS_PracticeBow");
	B_SetPerception(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(!Hlp_StrCmp(self.wp,Npc_GetNearestWP(self)))
	{
		AI_GotoWP(self,self.wp);
	};
	if(Wld_IsFPAvailable(self,"PRACTICEBOW"))
	{
		AI_GotoFP(self,"PRACTICEBOW");
		AI_AlignToFP(self);
	};
	if(Npc_HasEquippedRangedWeapon(self))
	{
		rangedweapon = Npc_GetEquippedRangedWeapon(self);
		aimtime = IntToFloat(Hlp_Random(2) + 3);
		if(rangedweapon.munition == ItAmBolt)
		{
			if(Npc_HasItems(self,ItAmBolt) == 0)
			{
				CreateInvItem(self,ItAmBolt);
			};
			AI_ReadyRangedWeapon(self);
			AI_PlayAni(self,"T_CBOWWALK_2_CBOWAIM");
			AI_Wait(self,aimtime);
		}
		else if(rangedweapon.munition == ItAmArrow)
		{
			if(Npc_HasItems(self,ItAmArrow) == 0)
			{
				CreateInvItem(self,ItAmArrow);
			};
			AI_ReadyRangedWeapon(self);
			AI_PlayAni(self,"T_BOWWALK_2_BOWAIM");
			AI_Wait(self,aimtime);
		};
	}
	else
	{
		CreateInvItem(self,ItAmBolt);
		CreateInvItem(self,ItAmArrow);
		AI_EquipBestRangedWeapon(self);
		AI_StartState(self,zs_practicebow_checkequippedweapon,1,"");
	};
};

func void ZS_PracticeBow_Loop()
{
	var C_Item rangedweapon;
	var float aimtime;
	PrintDebugNpc(PD_TA_LOOP,"ZS_PracticeBow_Loop");
	rangedweapon = Npc_GetReadiedWeapon(self);
	aimtime = IntToFloat(Hlp_Random(2) + 3);
	self.aivar[AIV_ITEMFREQ] = Hlp_Random(60) + 60;
	if(Npc_GetStateTime(self) >= self.aivar[AIV_ITEMFREQ])
	{
		AI_RemoveWeapon(self);
		B_Bored(self);
		AI_Wait(self,1);
		B_Bored(self);
		AI_Wait(self,aimtime);
		B_Bored(self);
		AI_Wait(self,2);
		AI_StartState(self,ZS_PracticeBow,1,"");
	}
	else if(rangedweapon.munition == ItAmBolt)
	{
		AI_PlayAni(self,"T_CBOWAIM");
		AI_PlayAni(self,"T_CBOWRELOAD");
		Snd_Play3d(self,"CROSSBOWSHOOT");
		AI_Wait(self,aimtime);
	}
	else if(rangedweapon.munition == ItAmArrow)
	{
		AI_PlayAni(self,"T_BOWAIM");
		AI_PlayAni(self,"T_BOWRELOAD");
		Snd_Play3d(self,"BOWSHOOT");
		AI_Wait(self,aimtime);
	};
};

func void ZS_PracticeBow_End()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_PracticeBow_End");
	AI_Wait(self,1);
	AI_RemoveWeapon(self);
};

func void zs_practicebow_checkequippedweapon()
{
	Npc_RemoveInvItem(self,ItAmBolt);
	Npc_RemoveInvItem(self,ItAmArrow);
	if(Npc_HasEquippedRangedWeapon(self))
	{
		AI_StartState(self,ZS_PracticeBow,1,"");
	}
	else
	{
		AI_StartState(self,ZS_Stand,1,"");
	};
};

