
func void ZS_WakeUp()
{
	var int portalguild;
	PrintDebugNpc(PD_ZS_FRAME,"ZS_WakeUp");
	AI_UseMob(self,"BED",-1);
	AI_UseMob(self,"BEDLOW",-1);
	AI_UseMob(self,"BEDHIGH",-1);
	B_ResetFaceExpression(self);
	C_ZSInit();
	B_SetPerception(self);
	Npc_PercDisable(self,PERC_OBSERVEINTRUDER);
	Npc_PercEnable(self,PERC_ASSESSENTERROOM,B_ClearRoomEnterRoom);
	Npc_PercEnable(self,PERC_ASSESSUSEMOB,B_ClearRoomUseMob);
	Npc_PercDisable(self,PERC_ASSESSCALL);
	portalguild = Wld_GetPlayerPortalGuild();
	if(((self.guild == portalguild) || (Wld_GetGuildAttitude(self.guild,portalguild) == ATT_FRIENDLY)) && (Npc_GetAttitude(self,other) != ATT_FRIENDLY))
	{
		PrintDebugNpc(PD_ZS_Check,"...Spieler im Raum des NSCs!");
		B_AssessEnterRoom();
	}
	else
	{
		if(Npc_CanSeeNpcFreeLOS(self,other))
		{
			AI_TurnToNPC(self,other);
			B_Say(self,other,"$YOUDISTURBEDMYSLUMBER");
		}
		else
		{
			B_LookAround();
			B_Say(self,NULL,"$WHATSTHAT");
		};
		AI_Wait(self,3);
		B_ObserveIntruder();
	};
};

