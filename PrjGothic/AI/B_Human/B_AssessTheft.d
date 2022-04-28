
func void B_GuardItemsAssessTheft()
{
	PrintDebugNpc(PD_ZS_Check,"B_GuardItemsAssessTheft");
	if(Npc_IsPlayer(other))
	{
		if(Hlp_IsValidItem(item) && !Hlp_IsValidNpc(victim))
		{
			if((item.flags & ITEM_DROPPED) == ITEM_DROPPED)
			{
				return;
			};
			if(C_NpcBelongsToOldCamp(self) && (Npc_GetTrueGuild(hero) == GIL_KDF))
			{
				return;
			};
			if(C_NpcBelongsToNewCamp(self) && (Npc_GetTrueGuild(hero) == GIL_KDW))
			{
				return;
			};
			if(Npc_CanSeeNpcFreeLOS(self,other))
			{
				B_Say(self,other,"$HANDSOFF");
				if(self.id != 1371)
				{
					Npc_SendPassivePerc(self,PERC_ASSESSWARN,self,other);
				};
				if(C_AmIStronger(self,other))
				{
					AI_Standup(self);
					AI_StartState(self,ZS_CatchThief,0,"");
				}
				else
				{
					AI_Wait(self,2);
					B_Say(self,other,"$YOUCANKEEPTHECRAP");
				};
			};
		};
	};
};

func void B_AssessTheft()
{
	var int other_guild;
	var int self_guild;
	var int item_ownerguild;
	if((self.aivar[AIV_ITEMSCHWEIN] == TRUE) || Npc_IsInState(self,ZS_ClearRoom) || Npc_IsInState(self,ZS_ClearRoomWait) || Npc_IsInState(self,ZS_ObserveSuspect))
	{
		B_GuardItemsAssessTheft();
	};
	PrintDebugNpc(PD_ZS_Check,"B_AssessTheft");
	other_guild = other.guild;
	self_guild = self.guild;
	if(!Npc_IsPlayer(other))
	{
		PrintDebugNpc(PD_ZS_Check,"...anderer Nsc hat ein Item aufgehoben");
		return;
	};
	AI_QuickLook(self,other);
	if(Npc_CanSeeNpc(self,other))
	{
		PrintDebugNpc(PD_ZS_Check,"...NSC kann den Dieb sehen!");
		if(Hlp_IsValidItem(item) && !Hlp_IsValidNpc(victim))
		{
			PrintDebugNpc(PD_ZS_Check,"...Item wurde aufgehoben!");
			item_ownerguild = item.ownerGuild;
			if(Npc_OwnedByNpc(item,self))
			{
				PrintDebugNpc(PD_ZS_Check,"...Item gehцrt NSC!");
				Npc_ClearAIQueue(self);
				C_LookAtNpc(self,other);
				AI_StartState(self,ZS_CatchThief,0,"");
				return;
			}
			else if(
				(Wld_GetGuildAttitude(self_guild,item_ownerguild) == ATT_FRIENDLY) &&
				(Wld_GetGuildAttitude(self_guild,other_guild) != ATT_FRIENDLY)
			)
			{
				B_FullStop(self);
				PrintDebugNpc(PD_ZS_Check,"Gilden-Bes.");
				C_LookAtNpc(self,other);
				AI_StartState(self,ZS_CatchThief,0,"");
				return;
			}
			else if(self.aivar[AIV_WANTEDITEM] == Hlp_GetInstanceID(item))
			{
				B_FullStop(self);
				PrintDebugNpc(PD_ZS_Check,"Wanted Item");
				if(C_AmIStronger(self,other) && !Wld_DetectItem(self,ITEM_MULTI))
				{
					PrintDebugNpc(PD_ZS_Check,"Wanted Item & Stronger");
					Npc_PerceiveAll(self);
					if(!Wld_DetectNpc(self,-1,ZS_GetBackItem,-1))
					{
						AI_StartState(self,ZS_GetBackItem,0,"");
					}
					else
					{
						AI_StartState(self,ZS_ObservePerson,0,"");
					};
				}
				else
				{
					Npc_ClearAIQueue(self);
					AI_QuickLook(self,other);
					B_Say(self,other,"$YOUCANKEEPTHECRAP");
					AI_ContinueRoutine(self);
				};
			};
		}
		else
		{
			return;
		};
	}
	else
	{
		PrintDebugNpc(PD_ZS_Check,"...NSC kann den Dieb NICHT sehen!");
	};
};

