
func int G_CanSteal()
{
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKPOCKET))
	{
		if(other.npcType != npctype_friend)
		{
			return TRUE;
		}
		else
		{
			PrintScreen(_STR_MESSAGE_CANNOTSTEAL,-1,_YPOS_MESSAGE_CANNOTSTEAL,_STR_FONT_ONSCREEN,_TIME_MESSAGE_CANNOTSTEAL);
		};
	}
	else
	{
		PrintScreen("� �� ���� ���������� ����� �������.",-1,10,"FONT_OLD_10_WHITE.TGA",3);
	};
	return FALSE;
};

