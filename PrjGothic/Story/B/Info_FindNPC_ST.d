
instance Info_FindNPC_ST(C_Info)
{
	nr = 900;
	condition = Info_FindNPC_ST_Condition;
	information = Info_FindNPC_ST_Info;
	permanent = 1;
	description = "Где находится...";
};


func int Info_FindNPC_ST_Condition()
{
	return 1;
};

func void Info_FindNPC_ST_Info()
{
	var C_Npc CorAngar;
	var C_Npc CorKalom;
	var C_Npc YBerion;
	Info_ClearChoices(Info_FindNPC_ST);
	Info_AddChoice(Info_FindNPC_ST,DIALOG_BACK,Info_FindNPC_ST_BACK);
	CorAngar = Hlp_GetNpc(GUR_1202_CorAngar);
	if(CorAngar.aivar[AIV_FINDABLE] == TRUE)
	{
		Info_AddChoice(Info_FindNPC_ST,"...Кор Ангар?",Info_FindNPC_ST_CorAngar);
	};
	CorKalom = Hlp_GetNpc(GUR_1201_CorKalom);
	if((CorKalom.aivar[AIV_FINDABLE] == TRUE) && (CorAngar_GotoOGY != TRUE))
	{
		Info_AddChoice(Info_FindNPC_ST,"...Кор Галом?",Info_FindNPC_ST_CorKalom);
	};
	YBerion = Hlp_GetNpc(GUR_1200_YBerion);
	if((YBerion.aivar[AIV_FINDABLE] == TRUE) && (Kapitel < 3))
	{
		Info_AddChoice(Info_FindNPC_ST,"...Юберион?",Info_FindNPC_ST_YBerion);
	};
};

func void Info_FindNPC_ST_BACK()
{
	Info_ClearChoices(Info_FindNPC_ST);
};

func void Info_FindNPC_ST_CorAngar()
{
	var C_Npc CorAngar;
	AI_Output(other,self,"Info_FindNPC_ST_CorAngar_15_00");	//Где я могу найти Кор Ангара?
	CorAngar = Hlp_GetNpc(GUR_1202_CorAngar);
	if(Npc_GetDistToNpc(self,CorAngar) < PERC_DIST_INTERMEDIAT)
	{
		B_PointAtNpc(self,other,CorAngar);
	}
	else if(self.guild == GIL_NOV)
	{
		if(self.voice == 2)
		{
			AI_Output(self,other,"Info_FindNPC_ST_CorAngar_02_01");	//Тренировочная площадка для стражей находится на втором уровне. Обычно он проводит там весь день.
		}
		else if(self.voice == 3)
		{
			AI_Output(self,other,"Info_FindNPC_ST_CorAngar_03_01");	//На втором уровне находится тренировочная площадка для стражей. Там он тренирует наших воинов.
		}
		else if(self.voice == 5)
		{
			AI_Output(self,other,"Info_FindNPC_ST_CorAngar_05_01");	//На втором уровне находится большая тренировочная площадка. Там ты и сможешь его найти.
		};
	}
	else if(self.guild == GIL_TPL)
	{
		if(self.voice == 8)
		{
			AI_Output(self,other,"Info_FindNPC_ST_CorAngar_08_01");	//На втором уровне находится большая тренировочная площадка. Там ты и сможешь его найти.
		}
		else if(self.voice == 13)
		{
			AI_Output(self,other,"Info_FindNPC_ST_CorAngar_13_01");	//На втором уровне находится большая тренировочная площадка. Там ты и сможешь его найти.
		};
	};
	Info_ClearChoices(Info_FindNPC_ST);
};

func void Info_FindNPC_ST_CorKalom()
{
	var C_Npc CorKalom;
	AI_Output(other,self,"Info_FindNPC_ST_CorKalom_15_00");	//Где я могу найти Кор Галома?
	CorKalom = Hlp_GetNpc(GUR_1201_CorKalom);
	if(Npc_GetDistToNpc(self,CorKalom) < PERC_DIST_INTERMEDIAT)
	{
		B_PointAtNpc(self,other,CorKalom);
	}
	else if(self.guild == GIL_NOV)
	{
		if(self.voice == 2)
		{
			AI_Output(self,other,"Info_FindNPC_ST_CorKalom_02_01");	//Лаборатория находится на втором уровне рядом с холмом, на котором стоит храм. Он работает там днем и ночью.
		}
		else if(self.voice == 3)
		{
			AI_Output(self,other,"Info_FindNPC_ST_CorKalom_03_01");	//Недалеко от Храма на втором уровне стоит его лаборатория. Он целыми днями работает там.
		}
		else if(self.voice == 5)
		{
			AI_Output(self,other,"Info_FindNPC_ST_CorKalom_05_01");	//На втором уровне расположена лаборатория. Он работает там днем и ночью.
		};
	}
	else if(self.guild == GIL_TPL)
	{
		if(self.voice == 8)
		{
			AI_Output(self,other,"Info_FindNPC_ST_CorKalom_08_01");	//На втором уровне расположена лаборатория. Он работает там днем и ночью.
		}
		else if(self.voice == 13)
		{
			AI_Output(self,other,"Info_FindNPC_ST_CorKalom_13_01");	//На втором уровне расположена лаборатория. Он работает там днем и ночью.
		};
	};
	Info_ClearChoices(Info_FindNPC_ST);
};

func void Info_FindNPC_ST_YBerion()
{
	var C_Npc YBerion;
	AI_Output(other,self,"Info_FindNPC_ST_YBerion_15_00");	//Где я могу найти Юбериона?
	YBerion = Hlp_GetNpc(GUR_1200_YBerion);
	if(Npc_GetDistToNpc(self,YBerion) < PERC_DIST_INTERMEDIAT)
	{
		B_PointAtNpc(self,other,YBerion);
	}
	else if(self.guild == GIL_NOV)
	{
		if(self.voice == 2)
		{
			AI_Output(self,other,"Info_FindNPC_ST_YBerion_02_01");	//Просвещенный живет в уединении у подножия холма. Он выходит к людям лишь по особым случаям.
		}
		else if(self.voice == 3)
		{
			AI_Output(self,other,"Info_FindNPC_ST_YBerion_03_01");	//Наш Учитель живет уединенно под сенью нашего Храма. Он выходит к нам только в особых случаях.
		}
		else if(self.voice == 5)
		{
			AI_Output(self,other,"Info_FindNPC_ST_YBerion_05_01");	//Наш Учитель живет в уединении недалеко от Храма. Он выходит к нам только в особых случаях.
		};
	}
	else if(self.guild == GIL_TPL)
	{
		if(self.voice == 8)
		{
			AI_Output(self,other,"Info_FindNPC_ST_YBerion_08_01");	//Наш Учитель живет в уединении недалеко от Храма. Он выходит к нам только в особых случаях.
		}
		else if(self.voice == 13)
		{
			AI_Output(self,other,"Info_FindNPC_ST_YBerion_13_01");	//Наш Учитель живет в уединении недалеко от Храма. Он выходит к нам только в особых случаях.
		};
	};
	Info_ClearChoices(Info_FindNPC_ST);
};

func void B_AssignFindNpc_ST(var C_Npc slf)
{
	Info_FindNPC_ST.npc = Hlp_GetInstanceID(slf);
};

