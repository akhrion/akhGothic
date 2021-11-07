func void B_AssessOthersDamage()
{
	var int josef;josef = Hlp_GetInstanceID(GRD_238_Gardist);
	PrintDebug("B_AssessOthersDamage..");
	if(josef == Hlp_GetInstanceID(self))
	{
		if(Hlp_GetInstanceID(other) == Hlp_GetInstanceID(hero))
		{
			Print("B_AssessOthersDamage HERO");
			if(
				Hlp_GetInstanceID(victim) == Hlp_GetInstanceID(OrcDogAgressive1)
			||	Hlp_GetInstanceID(victim) == Hlp_GetInstanceID(OrcDogAgressive2)
			||	Hlp_GetInstanceID(victim) == Hlp_GetInstanceID(OrcDogAgressive3)
			)
			{
				Josef_IsSCHelpWithOrcDogs = true;
			};
		};
	};
};