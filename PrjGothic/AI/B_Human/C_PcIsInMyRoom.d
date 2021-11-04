
func int C_PCIsInMyRoom()
{
	var C_Npc owner;
	var int portalowner;
	PrintDebugNpc(PD_ZS_FRAME,"C_PCIsInMyRoom");
	owner = Wld_GetPlayerPortalOwner();
	portalowner = Wld_GetPlayerPortalGuild();
	if((self == owner) || (Wld_GetGuildAttitude(self.guild,portalowner) == ATT_FRIENDLY))
	{
		return 1;
	};
	return 0;
};

func int c_pcinmyroomisthief()
{
	var C_Npc portalowner;
	var int portalownerguild;
	PrintDebugNpc(PD_ZS_FRAME,"C_PCInMyRoomIsThief");
	portalowner = Wld_GetPlayerPortalOwner();
	portalownerguild = Wld_GetPlayerPortalGuild();
	if(Npc_CanSeeNpcFreeLOS(self,hero))
	{
		if((self == portalowner) || (Wld_GetGuildAttitude(self.guild,portalownerguild) == ATT_FRIENDLY))
		{
			if((Wld_GetGuildAttitude(hero.guild,portalownerguild) != ATT_FRIENDLY) && (self.npcType != npctype_friend) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && (portalownerguild != GIL_None))
			{
				return 1;
			};
			if((portalownerguild == GIL_EBR) && (hero.guild != GIL_GRD) && (hero.guild != GIL_KDF))
			{
				return 1;
			};
		};
	};
	return 0;
};

