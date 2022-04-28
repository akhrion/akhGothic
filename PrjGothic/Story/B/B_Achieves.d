func void Achieve_Forsage()
{
	if(SC_Jumped())
	{
		Achieve_Forsage_JumpCounter +=1;
		if(
			!Achieve_Forsage_Done
		&&	Achieve_Forsage_JumpCounter > Achieve_Forsage_JumpAmount
		)
		{
			Achieve_Forsage_Done = true;
			B_PrintB(TXT_Achieve_Forsage);
			Log_CreateTopic(ACHIEVES_TITLE, LOG_NOTE);
			Log_AddEntry(ACHIEVES_TITLE,TXT_Achieve_Forsage);
		}
		else if(
			!Achieve_Forsage2_Done
		&&	Achieve_Forsage_JumpCounter > Achieve_Forsage2_JumpAmount
		)
		{
			Achieve_Forsage2_Done = true;
			B_PrintB(TXT_Achieve_Forsage2);
			Log_CreateTopic(ACHIEVES_TITLE, LOG_NOTE);
			Log_AddEntry(ACHIEVES_TITLE,TXT_Achieve_Forsage2);
		};
	}
	else
	{
		Achieve_Forsage_JumpCounter = 0;
	};
};
func void Achieve_Jumper()
{
	if(SC_Jumped() && Achieve_Jumper_JumpCounter < Achieve_Jumper_JumpAmount)
	{
		Achieve_Jumper_JumpCounter +=1;
		if(
			!Achieve_Jumper_Done
		&&	Achieve_Jumper_JumpCounter == Achieve_Jumper_JumpAmount
		)
		{
			Achieve_Jumper_Done = true;
			B_PrintB(TXT_Achieve_Jumper);
			Log_CreateTopic(ACHIEVES_TITLE, LOG_NOTE);
			Log_AddEntry(ACHIEVES_TITLE,TXT_Achieve_Jumper);
		};
	};
};
func void Achieve_Savior(var C_NPC npc_)
{
	if(
		Game_GetChapter() > 3
	&&	!Achieve_Savior_Done
	&&	C_NpcIsWorker(npc_)
	)
	{
		Achieve_Savior_KillCounter +=1;
		if(Achieve_Savior_KillCounter > Achieve_Savior_KillAmount)
		{
			Achieve_Savior_Done = true;
			B_PrintB(TXT_Achieve_Savior);
			Log_CreateTopic(ACHIEVES_TITLE, LOG_NOTE);
			Log_AddEntry(ACHIEVES_TITLE,TXT_Achieve_Savior);
		};
	};
};
