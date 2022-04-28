//AKH IMPROVE
//Добавить новую формулу
//Функция названа некорректно - она действует по принципу уменьшения сенсы, а не по принципу увеличения маскировки.
//Но сенса уменьшается только по отношению к игроку.. всех остальных подопытный будет ощущать в штатном режиме.
//slf - is a npc, which sense will be fixed
//oth - is the Player
func int akh_Stealth(var C_Npc slf, var C_Npc oth)
{
	if(Npc_IsPlayer(oth))
	{
		if(
			(slf.guild < GIL_SEPERATOR_HUM) ||
			(slf.guild > GIL_SEPERATOR_ORC)
		)
		{
			//НПС чел или орк
			if(
				slf.senses_range - oth.attribute[ATR_DEXTERITY] * 10 <
				Npc_GetDistToNpc(slf,oth)
			)
			{
				//НПС не видит, не слышит, не чуит игрока
				return true;
			};
		}
		else
		{
			//НПС мобарик
			if(
				(
					slf.aivar[AIV_PCISSTRONGER] - 
					(
						Npc_GetTalentSkill(oth,NPC_TALENT_FIREMASTER) * 200 +
						oth.attribute[ATR_DEXTERITY] * 2
					)
				) <	Npc_GetDistToNpc(slf,oth)
			)
			{
				//Игрок вне зоны доступа.. мы неопознаны, вне зоны доступа, мы ищем воздуха, вне зоны доступа мыы ЫИ! ps. понадеемся, что код не тегируется таргет системами, а-то понабегут и в предложку мне полетит.. уу мамааа амама криминааал мама ама криминаал аа это фифти сент? или кто это? забыл
				return true;
			};
		};
	};	
	return false;
};
