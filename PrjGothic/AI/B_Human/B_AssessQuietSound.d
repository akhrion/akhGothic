//akh working
func void B_AssessQuietSound()
{
	//work with SC and Items only
	//NPC won't processing
	PrintDebugNpc(PD_ZS_FRAME,"B_AssessQuietSound");
	PrintDebugNpc(PD_ZS_FRAME,"В этой асеске не хватает обработки стрейфа, бэк-степа и прыжков.. абуз");	
	PrintGlobals(PD_ZS_FRAME);
//	if(Npc_GetDistToItem(self,item) > PERC_DIST_DIALOG)
//	{
//		PrintDebugNpc(PD_ZS_FRAME,"... to far");
//		return;
//	};
	if(Npc_CanSeeSource(self))
	{
		PrintDebugNpc(PD_ZS_Check,"...kann Gerдuschquelle sehen!");
		if(Snd_IsSourceNpc(self))
		{
			PrintDebugNpc(PD_ZS_Check,"...Gerдuschquelle ist SC!");
			if(Npc_GetTempAttitude(self,other) == ATT_HOSTILE)
			{
				PrintDebugNpc(PD_ZS_Check,"...SC ist HOSTILE!");
				Npc_ClearAIQueue(self);
				AI_StartState(self,ZS_AssessEnemy,0,"");
			};
		};
	}
	else
	{
		PrintDebugNpc(PD_ZS_Check,"...kann NICHT Gerдuschquelle sehen!");
//		Npc_ClearAIQueue(self);
		AI_StartState(self,ZS_AssessQuietSound,0,"");
	};
};

