
func void zs_miltensescape()
{
	AI_SetWalkMode(self,NPC_RUN);
	AI_GotoWP(self,"NC_PATH40");
	CreateInvItem(self,ItArScrollTeleport5);
	AI_TurnToNPC(self,hero);
	AI_ReadySpell(self,SPL_Teleport5,0);
	AI_Wait(self,0.5);
	Npc_ExchangeRoutine(self,"Reunion");
};

func void zs_miltensescape_loop()
{
	Snd_Play("MFX_TELEPORT_INVEST");
	AI_PlayAni(self,"T_STAND_2_TELEPORT");
	AI_Wait(self,2);
	AI_PlayAni(self,"T_TELEPORT_RANDOM");
	AI_Teleport(self,"LOCATION_02_04");
	SLD_726_Soeldner.aivar[AIV_WASDEFEATEDBYSC] = TRUE;
	Npc_ExchangeRoutine(SLD_726_Soeldner,"START");
	AI_StartState(SLD_726_Soeldner,ZS_Unconscious,0,"");
	B_SetPermAttitude(SLD_726_Soeldner,ATT_HOSTILE);
	B_ClearImmortal(SLD_726_Soeldner);
	AI_TurnToNPC(SLD_723_Soeldner,SLD_726_Soeldner);
	AI_TurnToNPC(SLD_732_Soeldner,SLD_726_Soeldner);
	AI_TurnToNPC(Kdw_603_Nefarius,SLD_726_Soeldner);
};

func void zs_miltensescape_end()
{
};

