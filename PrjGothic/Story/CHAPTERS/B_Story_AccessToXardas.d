
func void B_Story_AccessToXardas()
{
	CreateInvItem(hero,itarrune_1_6_teleport3);
	B_LogEntry(CH4_FindXardas,"Я нашел сердца всех трех големов и отдал их демону-охраннику. Взамен он дал мне Руну Телепортации. Посмотрим, куда она меня перенесет.");
	B_GiveXP(XP_DeliveredGolemhearts);
	FindGolemHearts = 4;
};

