
func int Spell_Logic_Control(var int manaInvested)
{
	PrintDebugNpc(PD_MAGIC,"Spell_Logic_Control");
	if(!Npc_IsInState(other,ZS_Controlled))
	{
		PrintDebugNpc(PD_MAGIC,"npc is valid...");
		PrintDebugNpc(PD_MAGIC,"manainvested 0...starting ZS_PsiDefense on npc");
		Npc_ChangeAttribute(self,ATR_MANA,-1);
		if(!Npc_IsInState(other,ZS_PsiDefense))
		{
			B_FullStop(other);
			AI_StartState(other,ZS_PsiDefense,1,"");
		};
		if(other.flags != NPC_FLAG_IMMORTAL)
		{
			PrintDebugNpc(PD_MAGIC,"npc is not immortal, sub mana");
			if(manaInvested >= other.level)
			{
				PrintDebugNpc(PD_MAGIC,"controlled success, starting states");
				AI_StartState(self,ZS_PC_Controlling,0,"");
				Npc_SetActiveSpellInfo(self,1);
				Npc_ChangeAttribute(self,ATR_MANA,1);
				return SPL_SENDCAST;
			};
			return SPL_NEXTLEVEL;
		}
		else if(manaInvested >= 1)
		{
			PrintDebugNpc(PD_MAGIC,"npc is immortal");
			B_SayOverlay(self,other,"$AARGH_1");
			AI_PlayAni(self,"T_PSI_VICTIM");
			AI_Wait(self,3.5);
			return SPL_DONTINVEST;
		};
		return SPL_NEXTLEVEL;
	}
	else
	{
		PrintDebugNpc(PD_MAGIC,"npc is not valid...");
		return SPL_SENDSTOP;
	};
	return SPL_DONTINVEST;
};

