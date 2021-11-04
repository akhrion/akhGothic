
instance Info_FindNPC_OC(C_Info)
{
	nr = 900;
	condition = Info_FindNPC_OC_Condition;
	information = Info_FindNPC_OC_Info;
	permanent = 1;
	description = "Где находится...";
};


func int Info_FindNPC_OC_Condition()
{
	return 1;
};

func void Info_FindNPC_OC_Info()
{
	var C_Npc diego;
	var C_Npc Thorus;
	Info_ClearChoices(Info_FindNPC_OC);
	Info_AddChoice(Info_FindNPC_OC,DIALOG_BACK,Info_FindNPC_OC_BACK);
	diego = Hlp_GetNpc(PC_Thief);
	if(diego.aivar[AIV_FINDABLE] == TRUE)
	{
		Info_AddChoice(Info_FindNPC_OC,"...Диего?",Info_FindNPC_OC_Diego);
	};
	Thorus = Hlp_GetNpc(GRD_200_Thorus);
	if(Thorus.aivar[AIV_FINDABLE] == TRUE)
	{
		Info_AddChoice(Info_FindNPC_OC,"...Торус?",Info_FindNPC_OC_Thorus);
	};
};

func void Info_FindNPC_OC_BACK()
{
	Info_ClearChoices(Info_FindNPC_OC);
};

func void Info_FindNPC_OC_Diego()
{
	var C_Npc diego;
	AI_Output(other,self,"Info_FindNPC_Diego_15_00");	//Где я могу найти Диего?
	diego = Hlp_GetNpc(PC_Thief);
	if(Npc_GetDistToNpc(self,diego) < PERC_DIST_INTERMEDIAT)
	{
		B_PointAtNpc(self,other,diego);
	}
	else if(self.guild == GIL_VLK)
	{
		if(self.voice == 1)
		{
			AI_Output(self,other,"Info_FindNPC_OC_Diego_01_01");	//Ты сможешь найти его у входа в замок. Он любит разговаривать с Торусом.
		}
		else if(self.voice == 2)
		{
			AI_Output(self,other,"Info_FindNPC_OC_Diego_02_01");	//Обычно он проводит день у входа в замок вместе с Торусом.
		}
		else if(self.voice == 3)
		{
			AI_Output(self,other,"Info_FindNPC_OC_Diego_03_01");	//Он стоит у ворот в замок. Он любит разговаривать с Торусом.
		}
		else if(self.voice == 4)
		{
			AI_Output(self,other,"Info_FindNPC_OC_Diego_04_01");	//Ты сможешь найти его у входа в замок. Он любит разговаривать с Торусом.
		};
	}
	else if(self.guild == GIL_GRD)
	{
		if(self.voice == 6)
		{
			AI_Output(self,other,"Info_FindNPC_OC_Diego_06_01");	//Ты сможешь найти его у входа в замок. Он любит разговаривать с Торусом.
		}
		else if(self.voice == 7)
		{
			AI_Output(self,other,"Info_FindNPC_OC_Diego_07_01");	//Он стоит у ворот в замок. Он любит разговаривать с Торусом.
		}
		else if(self.voice == 13)
		{
			AI_Output(self,other,"Info_FindNPC_OC_Diego_13_01");	//Ты сможешь найти его у входа в замок. Он любит разговаривать с Торусом.
		};
	}
	else if(self.guild == GIL_STT)
	{
		if(self.voice == 10)
		{
			AI_Output(self,other,"Info_FindNPC_OC_Diego_10_01");	//Ты сможешь найти его у входа в замок. Он любит разговаривать с Торусом.
		}
		else if(self.voice == 12)
		{
			AI_Output(self,other,"Info_FindNPC_OC_Diego_12_01");	//Ты сможешь найти его у входа в замок. Он любит разговаривать с Торусом.
		};
	};
	Info_ClearChoices(Info_FindNPC_OC);
};

func void Info_FindNPC_OC_Thorus()
{
	var C_Npc Thorus;
	AI_Output(other,self,"Info_FindNPC_OC_Thorus_15_00");	//Где я могу найти Торуса?
	Thorus = Hlp_GetNpc(GRD_200_Thorus);
	if(Npc_GetDistToNpc(self,Thorus) < PERC_DIST_INTERMEDIAT)
	{
		B_PointAtNpc(self,other,Thorus);
	}
	else if(self.guild == GIL_VLK)
	{
		if(self.voice == 1)
		{
			AI_Output(self,other,"Info_FindNPC_OC_Thorus_01_01");	//Днем он всегда стоит у ворот замка.
		}
		else if(self.voice == 2)
		{
			AI_Output(self,other,"Info_FindNPC_OC_Thorus_02_01");	//Обычно он стоит у входа в замок.
		}
		else if(self.voice == 3)
		{
			AI_Output(self,other,"Info_FindNPC_OC_Thorus_03_01");	//Обычно его можно найти у ворот в замок.
		}
		else if(self.voice == 4)
		{
			AI_Output(self,other,"Info_FindNPC_OC_Thorus_04_01");	//Днем он всегда стоит у ворот замка.
		};
	}
	else if(self.guild == GIL_GRD)
	{
		if(self.voice == 6)
		{
			AI_Output(self,other,"Info_FindNPC_OC_Thorus_06_01");	//Днем он всегда стоит у ворот замка.
		}
		else if(self.voice == 7)
		{
			AI_Output(self,other,"Info_FindNPC_OC_Thorus_07_01");	//Обычно его можно найти у ворот в замок.
		}
		else if(self.voice == 13)
		{
			AI_Output(self,other,"Info_FindNPC_OC_Thorus_13_01");	//Днем он всегда стоит у ворот замка.
		};
	}
	else if(self.guild == GIL_STT)
	{
		if(self.voice == 10)
		{
			AI_Output(self,other,"Info_FindNPC_OC_Thorus_10_01");	//Днем он всегда стоит у ворот замка.
		}
		else if(self.voice == 12)
		{
			AI_Output(self,other,"Info_FindNPC_OC_Thorus_12_01");	//Днем он всегда стоит у ворот замка.
		};
	};
	Info_ClearChoices(Info_FindNPC_OC);
};

func void B_AssignFindNpc_OC(var C_Npc slf)
{
	Info_FindNPC_OC.npc = Hlp_GetInstanceID(slf);
};

