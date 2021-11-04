func void ZS_AssessDisgusting()
{
	Npc_PerceiveAll(self);
	var int rnd;
	if(self.guild == (GIL_VLK | GIL_SFB))
	{
		rnd = Hlp_Random(10);
		if(!rnd)
		{
			B_FullStop(self);
			B_SayOverlay(self,NULL,"$DIEMONSTER");
			Npc_SetTarget(self,other);
			AI_StartState(self,ZS_Attack,1,"");
		};
	}
	else if(self.guild == GIL_STT)
	{
		rnd = Hlp_Random(100);
		if(!rnd)
		{
			B_FullStop(self);
			B_SayOverlay(self,NULL,"$DIEMONSTER");
			Npc_SetTarget(self,other);
			AI_StartState(self,ZS_Attack,1,"");
		};
	}
	else if(self.guild == GIL_BAB)
	{
		B_FullStop(self);
		B_CallGuards();
		AI_StartState(self,ZS_Flee,1,"");
	};
};
