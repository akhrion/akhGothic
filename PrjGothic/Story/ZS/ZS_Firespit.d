
func void ZS_Firespit()
{
	PrintDebugNpc(PD_ZS_FRAME,"ZS_Firespit");
	B_SetPerception(self);
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,self.wp);
	AI_AlignToWP(self);
	AI_RemoveWeapon(self);
};

func void ZS_Firespit_Loop()
{
	var int spitreaktion;
	PrintDebugNpc(PD_ZS_LOOP,"ZS_Firespit_Loop");
	if(Npc_HasItems(self,ItLsTorchFirespit) <= 1)
	{
		CreateInvItem(self,ItLsTorchFirespit);
	};
	spitreaktion = Hlp_Random(100);
	if(spitreaktion >= 50)
	{
		AI_UseItemToState(self,ItLsTorchFirespit,5);
		AI_UseItemToState(self,ItLsTorchFirespit,-1);
	};
	AI_Wait(self,1);
};

func void ZS_Firespit_End()
{
	PrintDebugNpc(PD_ZS_FRAME,"ZS_Firespit_End");
	AI_UseItemToState(self,ItLsTorchFirespit,-1);
	AI_ContinueRoutine(self);
};

