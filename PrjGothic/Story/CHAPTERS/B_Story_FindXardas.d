
func void B_Story_FindXardas()
{
	Log_CreateTopic(CH4_FindXardas,LOG_MISSION);
	Log_SetTopicStatus(CH4_FindXardas,LOG_RUNNING);
	B_LogEntry(CH4_FindXardas,"После убийства магов Круга Огня остался еще один способ взорвать рудную гору. Сатурас сказал, что Барьер создавали тринадцать магов, а не двенадцать, как все думали.");
	B_LogEntry(CH4_FindXardas,"Тринадцатого мага звали Ксардас. Сейчас он живет в землях орков, в своей башне. Я вызвался найти его и попросить о помощи.");
	Wld_InsertNpc(XardasDemon,"DT_E1_06");
	Wld_InsertNpc(KDF_404_Xardas,"DT_E3_07");
	B_Give_XardasChapter4Runes();
	FindXardas = TRUE;
};

