
func void B_Story_GotUluMulu()
{
	CreateInvItem(hero,UluMulu);
	B_LogEntry(CH4_UluMulu,"У меня все получилось. Я принес Тарроку то, что он просил, и он сделал мне Улу-Мулу. Надеюсь, орки действительно уважают традиции и не трогают тех, кто носит этот знак.");
	Log_SetTopicStatus(CH4_UluMulu,LOG_SUCCESS);
	B_GiveXP(XP_GotUluMulu);
	FreemineOrc_LookingUlumulu = LOG_SUCCESS;
};

