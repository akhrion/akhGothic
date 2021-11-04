
func void B_Babe_RefuseTalk()
{
	PrintDebugNpc(PD_ZS_FRAME,"B_Babe_RefuseTalk");
	if(((Hlp_GetInstanceID(Gur_1205_Chani) == Hlp_GetInstanceID(self)) || (Hlp_GetInstanceID(Gur_1207_Natalia) == Hlp_GetInstanceID(self))) && (Kapitel == 3))
	{
		B_Say(self,other,"$CRY");
	}
	else
	{
		B_Say(self,other,"$NOTNOW");
	};
	AI_StopLookAt(self);
};

