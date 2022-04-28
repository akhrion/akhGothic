
func void B_AssessUseMob()
{
	var string detectedMob;
	var C_Npc sld1;
	var C_Npc sld2;
	PrintDebugNpc(PD_ZS_FRAME,"B_AssessUseMob");
	detectedMob = Npc_GetDetectedMob(other);
	PrintDebugNpc(PD_ZS_Check,detectedMob);
	sld1 = Hlp_GetNpc(SLD_723_Soeldner);
	sld2 = Hlp_GetNpc(SLD_732_Soeldner);
	if(
		(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(sld1)) ||
		(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(sld2))
	)
	{
		return;
	};
	if(Npc_CanSeeNpc(self,other))
	{
		if(Npc_IsDetectedMobOwnedByNpc(other,self) || Npc_IsDetectedMobOwnedByGuild(other,self.guild))
		{
			PrintDebugNpc(PD_ZS_Check,"...MOB gehцrt NSC oder seiner Gilde!");
			if((Npc_GetPermAttitude(self,other) == ATT_FRIENDLY) || (self.guild == other.guild))
			{
				PrintDebugNpc(PD_ZS_Check,"...Manipulator ist FRIENDLY oder in gleicher Gilde!");
				if((self.flags != NPC_FLAG_IMMORTAL) && (self.id != 834) && (self.id != 830))
				{
					B_Say(self,other,"$HandsOff");
				};
			}
			else if(self.id != 834)
			{
				PrintGlobals(PD_ZS_Check);
				Npc_SetTempAttitude(self,ATT_HOSTILE);
				Npc_ClearAIQueue(self);
				B_WhirlAround(self,other);
				B_Say(self,other,"$IWillTeachYouRespectForForeignProperty");
				AI_SetWalkMode(self,NPC_RUN);
				Npc_SetTarget(self,other);
				AI_StartState(self,ZS_Attack,0,"");
			};
		}
		else
		{
			PrintDebugNpc(PD_ZS_DETAIL,"not my MoB");
		};
	}
	else
	{
		PrintDebugNpc(PD_ZS_DETAIL,"kann SC nicht sehen");
	};
};

