
func void B_SpecialCombatDamageReaction()
{
	PrintDebugNpc(PD_ZS_FRAME,"B_SpecialCombatDamageReaction");
	if(self.id == 2999)
	{
		self.aivar[AIV_MISSION1] = self.aivar[AIV_MISSION1] + 1;
		if(self.aivar[AIV_MISSION1] >= HighPriest_MaxHit)
		{
			PrintDebugNpc(PD_ZS_Check,"...Hohepriester 5mal getroffen!");
			hero.aivar[AIV_IMPORTANT] = TRUE;
			Npc_SetTempAttitude(self,ATT_NEUTRAL);
			Npc_SetPermAttitude(self,ATT_NEUTRAL);
			B_FullStop(self);
			AI_ContinueRoutine(self);
		};
		AI_ContinueRoutine(self);
	};
	var C_ITEM itm;
	itm = Npc_GetReadiedWeapon(other);
	if(Hlp_GetInstanceID(itm) == Hlp_GetInstanceID(ItAmD0))
	{
		self.aivar[AIV_MISSION1] += 1;
		if(self.aivar[AIV_MISSION1] < 2)
		{
			AI_Output(self,NULL,"Dichlophos_NULL_0"); //�� ��� � ��� �����?!!
			AI_ContinueRoutine(self);
		}
		else if(self.aivar[AIV_MISSION1] < 3)
		{
			AI_Output(self,NULL,"Dichlophos_NULL_1"); //��� ��� �������� � ���� ���� �������� � � ������ ���� ���!
		}
		else
		{
			AI_Output(self,NULL,"Dichlophos_NULL_2"); //������ �����!!!
			//���������� ������� ������-�� ��������� � ��������� ������������� ������� ����� AI_OutputSVM_Overlay ��.. � �� ��� ��� ������ ��������..
			Npc_SetTarget(self,other);
			AI_StartState(self,ZS_Attack,1,"");
		};
	};
};

