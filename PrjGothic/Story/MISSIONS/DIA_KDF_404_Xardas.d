
instance Info_Xardas_EXIT(C_Info)
{
	npc = KDF_404_Xardas;
	nr = 999;
	condition = Info_Xardas_EXIT_Condition;
	information = Info_Xardas_EXIT_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_Xardas_EXIT_Condition()
{
	return 1;
};

func void Info_Xardas_EXIT_Info()
{
	if(Npc_HasItems(self,demourizel))
	{
		Npc_RemoveInvItem(self,demourizel);
	};
	AI_StopProcessInfos(self);
};


instance Info_Xardas_DISTURB(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_DISTURB_Condition;
	information = Info_Xardas_DISTURB_Info;
	important = 1;
	permanent = 0;
};


func int Info_Xardas_DISTURB_Condition()
{
	if(!UrShak_SpokeOfUluMulu)
	{
		return TRUE;
	};
};

func void Info_Xardas_DISTURB_Info()
{
	B_WhirlAround(self,hero);
	AI_Output(self,hero,"Info_Xardas_DISTURB_14_01");	//Кто смеет отвлекать меня от моих исследований?
	AI_Output(hero,self,"Info_Xardas_DISTURB_15_02");	//Меня зовут...
	AI_Output(self,hero,"Info_Xardas_DISTURB_14_03");	//Неважно, как тебя зовут. Я не желаю этого знать.
	AI_Output(self,hero,"Info_Xardas_DISTURB_14_04");	//Гораздо важнее то, что за все это время никто не смог разгадать загадки моего голема. А ты это сделал.
};


instance Info_Xardas_OTHERS(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_OTHERS_Condition;
	information = Info_Xardas_OTHERS_Info;
	important = 0;
	permanent = 0;
	description = "Так к тебе приходили и другие?";
};


func int Info_Xardas_OTHERS_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_DISTURB))
	{
		return TRUE;
	};
};

func void Info_Xardas_OTHERS_Info()
{
	AI_Output(hero,self,"Info_Xardas_OTHERS_15_01");	//Так к тебе приходили и другие?
	AI_Output(self,hero,"Info_Xardas_OTHERS_14_02");	//Да, но их было мало. Когда они мне надоедали, я знакомил их с одним из моих созданий.
	AI_Output(hero,self,"Info_Xardas_OTHERS_15_03");	//Да, ты высоко ценишь свое уединение.
};


instance Info_Xardas_SATURAS(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_SATURAS_Condition;
	information = Info_Xardas_SATURAS_Info;
	important = 0;
	permanent = 0;
	description = "Меня прислал Сатурас. Нам нужна твоя помощь!";
};


func int Info_Xardas_SATURAS_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_DISTURB))
	{
		return TRUE;
	};
};

func void Info_Xardas_SATURAS_Info()
{
	AI_Output(hero,self,"Info_Xardas_SATURAS_15_01");	//Меня прислал Сатурас. Нам нужна твоя помощь!
	AI_Output(hero,self,"Info_Xardas_SATURAS_15_02");	//У магов Воды есть рудная гора, и они...
	AI_Output(self,hero,"Info_Xardas_SATURAS_14_03");	//Гора руды им никак не поможет!
	AI_Output(hero,self,"Info_Xardas_SATURAS_15_04");	//Не поможет?
	AI_Output(self,hero,"Info_Xardas_SATURAS_14_05");	//Нет!
};


instance Info_Xardas_KDW(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_KDW_Condition;
	information = Info_Xardas_KDW_Info;
	important = 0;
	permanent = 0;
	description = "Все маги Круга Огня мертвы!";
};


func int Info_Xardas_KDW_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_DISTURB))
	{
		return TRUE;
	};
};

func void Info_Xardas_KDW_Info()
{
	AI_Output(hero,self,"Info_Xardas_KDW_15_01");	//Все маги Круга Огня мертвы!
	AI_Output(hero,self,"Info_Xardas_KDW_15_02");	//Убиты по приказу Гомеза.
	AI_Output(self,hero,"Info_Xardas_KDW_14_03");	//Неудивительно. Я знал с самого начала, что этим невежественным болванам из замка, которыми командует Гомез, нельзя было доверять.
	AI_Output(self,hero,"Info_Xardas_KDW_14_04");	//Корристо и другие маги сами приблизили свою смерть, когда помогали Гомезу захватить власть.
};


instance Info_Xardas_SLEEPER(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_SLEEPER_Condition;
	information = Info_Xardas_SLEEPER_Info;
	important = 0;
	permanent = 0;
	description = "Тот, кого называют Спящим, на самом деле злой демон.";
};


func int Info_Xardas_SLEEPER_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_DISTURB))
	{
		return TRUE;
	};
};

func void Info_Xardas_SLEEPER_Info()
{
	AI_Output(hero,self,"Info_Xardas_SLEEPER_15_01");	//Тот, кого называют Спящим, на самом деле злой демон.
	AI_Output(hero,self,"Info_Xardas_SLEEPER_15_02");	//Об этом узнали Гуру из болотного Братства.
	AI_Output(hero,self,"Info_Xardas_SLEEPER_15_03");	//Маги Воды теперь уверены, что вся колония находится в опасности.
	AI_Output(self,hero,"Info_Xardas_SLEEPER_14_04");	//Все это очень опасно, но никто из этой колонии даже не догадывается, как они близки к смерти.
};


instance Info_Xardas_DANGER(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_DANGER_Condition;
	information = Info_Xardas_DANGER_Info;
	important = 0;
	permanent = 0;
	description = "Если взрыв рудной горы не сможет предотвратить эту опасность...";
};


func int Info_Xardas_DANGER_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_SLEEPER) && Npc_KnowsInfo(hero,Info_Xardas_SATURAS))
	{
		return TRUE;
	};
};

func void Info_Xardas_DANGER_Info()
{
	AI_Output(hero,self,"Info_Xardas_DANGER_15_01");	//Если взрыв рудной горы не сможет предотвратить эту опасность...
	AI_Output(self,hero,"Info_Xardas_DANGER_14_02");	//... Забудь об этой несчастной горе! Энергии ее взрыва никогда не хватит, чтобы разрушить Барьер.
	AI_Output(self,hero,"Info_Xardas_DANGER_14_03");	//Если бы Корристо и Сатурас потратили свое время на изучение Барьера, а не на свои никчемные ссоры, они бы сейчас знали то, что знаю я.
	AI_Output(hero,self,"Info_Xardas_DANGER_15_04");	//А что ты знаешь?
	AI_Output(self,hero,"Info_Xardas_DANGER_14_05");	//Со времени создания Барьера ни один из двенадцати сильнейших магов не потрудился задать себе вопрос, почему Барьер достиг таких огромных размеров.
};


instance Info_Xardas_BARRIER(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_BARRIER_Condition;
	information = Info_Xardas_BARRIER_Info;
	important = 0;
	permanent = 0;
	description = "Но тебе удалось найти на него ответ?";
};


func int Info_Xardas_BARRIER_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_DANGER))
	{
		return TRUE;
	};
};

func void Info_Xardas_BARRIER_Info()
{
	AI_Output(hero,self,"Info_Xardas_BARRIER_15_01");	//Но тебе удалось найти на него ответ?
	AI_Output(self,hero,"Info_Xardas_BARRIER_14_02");	//Что ж, одно можно сказать с уверенностью: ответ нужно искать под городом орков.
	AI_Output(hero,self,"Info_Xardas_BARRIER_15_03");	//Под городом орков?
	AI_Output(self,hero,"Info_Xardas_BARRIER_14_04");	//Орки не животные в обычном смысле. У них есть своя культура, и по древности она может сравниться с человеческой.
	AI_Output(self,hero,"Info_Xardas_BARRIER_14_05");	//Сотни лет назад пять орков-шаманов призвали могущественного демона, чтобы он помоги их племени победить врагов.
	AI_Output(hero,self,"Info_Xardas_BARRIER_15_06");	//А Спящий - имя этого демона?
	AI_Output(self,hero,"Info_Xardas_BARRIER_14_07");	//Это имя было дано ему орками гораздо позже. Но зачем они это сделали и почему они испытывают такой страх перед ним, я не знаю.
};


instance Info_Xardas_EVENT(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_EVENT_Condition;
	information = Info_Xardas_EVENT_Info;
	important = 0;
	permanent = 0;
	description = "Ты и правда этого не знаешь?";
};


func int Info_Xardas_EVENT_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_BARRIER))
	{
		return TRUE;
	};
};

func void Info_Xardas_EVENT_Info()
{
	AI_Output(hero,self,"Info_Xardas_EVENT_15_01");	//Ты и правда этого не знаешь?
	AI_Output(self,hero,"Info_Xardas_EVENT_14_02");	//Мне кажется, что ты сможешь... Нет, я хочу сам в этом убедиться, поэтому дам тебе одно задание.
	AI_Output(hero,self,"Info_Xardas_EVENT_15_03");	//Какое задание?
	AI_Output(self,hero,"Info_Xardas_EVENT_14_04");	//Слушай меня: один из шаманов был изгнан из города орков.
};


instance Info_Xardas_EVENTWHY(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_EVENTWHY_Condition;
	information = Info_Xardas_EVENTWHY_Info;
	important = 0;
	permanent = 0;
	description = "За что изгнан?";
};


func int Info_Xardas_EVENTWHY_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_EVENT))
	{
		return TRUE;
	};
};

func void Info_Xardas_EVENTWHY_Info()
{
	AI_Output(hero,self,"Info_Xardas_EVENTWHY_15_01");	//За что изгнан?
	AI_Output(self,hero,"Info_Xardas_EVENTWHY_14_02");	//Этого я тоже не знаю. Воин-орк, которого пытал мой демон, не успел мне ответить на этот вопрос.
};


instance Info_Xardas_EVENTHOW(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_EVENTHOW_Condition;
	information = Info_Xardas_EVENTHOW_Info;
	important = 0;
	permanent = 0;
	description = "А мое задание будет как-то связано с этим орком-шаманом?";
};


func int Info_Xardas_EVENTHOW_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_EVENT))
	{
		return TRUE;
	};
};

func void Info_Xardas_EVENTHOW_Info()
{
	AI_Output(hero,self,"Info_Xardas_EVENTHOW_15_01");	//А мое задание будет как-то связано с этим орком-шаманом?
	AI_Output(self,hero,"Info_Xardas_EVENTHOW_14_02");	//Да. Он расскажет тебе о Спящем то, что мне неизвестно.
	AI_Output(hero,self,"Info_Xardas_EVENTHOW_15_03");	//Мне кажется, орк не будет со мной разговаривать.
	AI_Output(self,hero,"Info_Xardas_EVENTHOW_14_04");	//Так ты хочешь, чтобы я помог тебе или нет?
	AI_Output(hero,self,"Info_Xardas_EVENTHOW_15_05");	//Конечно, хочу, но...
	AI_Output(self,hero,"Info_Xardas_EVENTHOW_14_06");	//Тогда не задавай больше таких вопросов!
	AI_Output(self,hero,"Info_Xardas_EVENTHOW_14_07");	//Найди этого шамана. Орки из города все еще сердятся на него, поэтому он, может быть, поговорит с тобой, прежде чем убить.
	AI_Output(hero,self,"Info_Xardas_EVENTHOW_15_08");	//Ты меня обнадежил!
};


instance Info_Xardas_EVENTWHERE(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_EVENTWHERE_Condition;
	information = Info_Xardas_EVENTWHERE_Info;
	important = 0;
	permanent = 0;
	description = "Где найти этого изгнанного шамана?";
};


func int Info_Xardas_EVENTWHERE_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_EVENT))
	{
		return TRUE;
	};
};

func void Info_Xardas_EVENTWHERE_Info()
{
	AI_Output(hero,self,"Info_Xardas_EVENTWHERE_15_01");	//Где найти этого изгнанного шамана?
	AI_Output(self,hero,"Info_Xardas_EVENTWHERE_14_02");	//Иди на восток к старой крепости. Ее невозможно пропустить. Она стоит на вершине горы и видна даже издалека.
	AI_Output(hero,self,"Info_Xardas_EVENTWHERE_15_03");	//В нее можно войти просто так?
	AI_Output(self,hero,"Info_Xardas_EVENTWHERE_14_04");	//Она только называется крепостью, на самом деле это просто развалины. Она была покинута очень давно.
};


instance Info_Xardas_ACCEPT(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_ACCEPT_Condition;
	information = Info_Xardas_ACCEPT_Info;
	important = 0;
	permanent = 0;
	description = "Я расспрошу шамана и вернусь к тебе!";
};


func int Info_Xardas_ACCEPT_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_EVENTWHY) && Npc_KnowsInfo(hero,Info_Xardas_EVENTHOW) && Npc_KnowsInfo(hero,Info_Xardas_EVENTWHERE))
	{
		return TRUE;
	};
};

func void Info_Xardas_ACCEPT_Info()
{
	AI_Output(hero,self,"Info_Xardas_ACCEPT_15_01");	//Я расспрошу шамана и вернусь к тебе!
	AI_Output(self,hero,"Info_Xardas_ACCEPT_14_02");	//Мой слуга уже передал тебе руну телепортации, которая способна переносить своего обладателя в нижний зал.
	AI_Output(self,hero,"Info_Xardas_ACCEPT_14_03");	//Примени ее, когда тебе будет нужно вернуться сюда.
	B_Story_CordsPost();
	B_Story_FindOrcShaman();
	AI_StopProcessInfos(self);
};


instance Kdf_404_Xardas_SELLMAGICSTUFF(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Kdf_404_Xardas_SELLMAGICSTUFF_Condition;
	information = Kdf_404_Xardas_SELLMAGICSTUFF_Info;
	important = 0;
	permanent = 1;
	trade = 1;
	description = "Я хочу обрести магические знания.";
};


func int Kdf_404_Xardas_SELLMAGICSTUFF_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_ACCEPT))
	{
		return TRUE;
	};
};

func void Kdf_404_Xardas_SELLMAGICSTUFF_Info()
{
	AI_Output(other,self,"Kdf_404_Xardas_SELLMAGICSTUFF_Info_15_01");	//Я хочу обрести магические знания.
	if(Npc_HasItems(self,demourizel))
	{
		Npc_RemoveInvItem(self,demourizel);
	};
};


instance Info_Xardas_RETURN(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_RETURN_Condition;
	information = Info_Xardas_RETURN_Info;
	important = 0;
	permanent = 0;
	description = "Орк-шаман ответил на мои вопросы!";
};


func int Info_Xardas_RETURN_Condition()
{
	if(UrShak_SpokeOfUluMulu && !EnteredTemple)
	{
		return TRUE;
	};
};

func void Info_Xardas_RETURN_Info()
{
	AI_Output(hero,self,"Info_Xardas_RETURN_15_01");	//Орк-шаман ответил на мои вопросы!
	AI_Output(self,hero,"Info_Xardas_RETURN_14_02");	//Ну, и что же он рассказал?
	AI_Output(hero,self,"Info_Xardas_RETURN_15_03");	//Пять шаманов, которые призвали Спящего, построили ему подземный храм, вход в который находится в городе орков.
	AI_Output(self,hero,"Info_Xardas_RETURN_14_04");	//Правильно!
	AI_Output(hero,self,"Info_Xardas_RETURN_15_05");	//Он безжалостно вырвал их сердца и проклял их, и вынудил вечно охранять его, сделав их нежитью.
	AI_Output(self,hero,"Info_Xardas_RETURN_14_06");	//Отлично, дальше.
	AI_Output(hero,self,"Info_Xardas_RETURN_15_07");	//Орки запечатали храм и стали приносить жертвы, чтобы умиротворить демона.
	AI_Output(self,hero,"Info_Xardas_RETURN_14_08");	//Ты уже придумал, как можно войти в этот храм?
	AI_Output(hero,self,"Info_Xardas_RETURN_15_09");	//Да, есть один орк. Он...
	AI_Output(self,hero,"Info_Xardas_RETURN_14_10");	//Пожалуйста, без подробностей! Иди в этот подземный храм! Только там ты сможешь узнать, как разрушить Барьер!
	AI_Output(hero,self,"Info_Xardas_RETURN_15_11");	//Я тебя не понимаю!
	AI_Output(self,hero,"Info_Xardas_RETURN_14_12");	//Разве ты пришел ко мне не за тем, чтобы узнать, как уничтожить Барьер?
	AI_Output(hero,self,"Info_Xardas_RETURN_15_13");	//Да, но...
	AI_Output(self,hero,"Info_Xardas_RETURN_14_14");	//Так иди! Слишком много времени было потеряно впустую. Иди и найди то, что прячет подземный храм!
	B_Story_ReturnedFromUrShak();
};


instance Info_Xardas_FOUNDTEMPLE(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_FOUNDTEMPLE_Condition;
	information = Info_Xardas_FOUNDTEMPLE_Info;
	important = 0;
	permanent = 0;
	description = "Я знаю, как попасть в подземный храм!";
};


func int Info_Xardas_FOUNDTEMPLE_Condition()
{
	if(EnteredTemple)
	{
		return TRUE;
	};
};

func void Info_Xardas_FOUNDTEMPLE_Info()
{
	AI_Output(other,self,"Info_Xardas_FOUNDTEMPLE_15_01");	//Я знаю, как попасть в подземный храм!
	AI_Output(self,other,"Info_Xardas_FOUNDTEMPLE_14_02");	//Уже знаешь... Удивительно!
	AI_Output(self,other,"Info_Xardas_FOUNDTEMPLE_14_03");	//Ты стал очень силен! Сильнее, чем кто-либо из живущих внутри Барьера.
	AI_Output(self,other,"Info_Xardas_FOUNDTEMPLE_14_04");	//Скорее всего, ты и есть тот герой, о котором говорится в пророчествах орков!
};


instance Info_Xardas_PROPHECY(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_PROPHECY_Condition;
	information = Info_Xardas_PROPHECY_Info;
	important = 0;
	permanent = 0;
	description = "Пророчества? О чем ты?";
};


func int Info_Xardas_PROPHECY_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_FOUNDTEMPLE))
	{
		return TRUE;
	};
};

func void Info_Xardas_PROPHECY_Info()
{
	AI_Output(other,self,"Info_Xardas_PROPHECY_15_01");	//Пророчества? О чем ты?
	AI_Output(self,other,"Info_Xardas_PROPHECY_14_02");	//В древних книгах орков, написанных до того, как был запечатан храм, упоминается 'Священный Враг'.
	AI_Output(other,self,"Info_Xardas_PROPHECY_15_03");	//Священный Враг?
	AI_Output(self,other,"Info_Xardas_PROPHECY_14_04");	//Тот, кто придет и навсегда уничтожит Спящего!
	AI_Output(other,self,"Info_Xardas_PROPHECY_15_05");	//Так обо мне говорилось в каком-то древнем пророчестве? Наверное, ты ошибаешься!
	AI_Output(self,other,"Info_Xardas_PROPHECY_14_06");	//Может быть... а может и нет!
};


instance Info_Xardas_LOADSWORD(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_LOADSWORD_Condition;
	information = Info_Xardas_LOADSWORD_Info;
	important = 0;
	permanent = 0;
	description = "Я нашел один очень странный меч.";
};


func int Info_Xardas_LOADSWORD_Condition()
{
	if(Npc_HasItems(hero,Mythrilklinge))
	{
		return TRUE;
	};
};

func void Info_Xardas_LOADSWORD_Info()
{
	AI_Output(other,self,"Info_Xardas_LOADSWORD_15_01");	//Я нашел один очень странный меч.
	AI_Output(self,other,"Info_Xardas_LOADSWORD_14_02");	//Покажи-ка его мне.
	b_printtrademsg1("Отдан необычный меч.");
	CreateInvItem(self,demourizel);
	AI_EquipBestMeleeWeapon(self);
	AI_ReadyMeleeWeapon(self);
	AI_PlayAni(self,"T_1HSINSPECT");
	AI_RemoveWeapon(self);
	AI_UnequipWeapons(self);
	AI_Output(self,other,"Info_Xardas_LOADSWORD_14_03");	//Интересно... на нем написано 'УРИЗЕЛЬ'.
	AI_Output(self,other,"Info_Xardas_LOADSWORD_14_04");	//Я уже слышал легенды об этом мече. Это древнее оружие, которое появилось тысячи лет назад.
	AI_Output(self,other,"Info_Xardas_LOADSWORD_14_05");	//Меч выкован из неизвестного нам металла. Никто не знает, кто был его создателем.
	AI_Output(self,other,"Info_Xardas_LOADSWORD_14_06");	//Думаю, он обладает огромной силой, но сейчас я не чувствую в нем магической энергии.
	b_printtrademsg2("Получен УРИЗЕЛЬ.");
	Npc_RemoveInvItem(hero,Mythrilklinge);
	CreateInvItem(hero,Mythrilklinge01);
};


instance Info_Xardas_LOADSWORD01(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_LOADSWORD01_Condition;
	information = Info_Xardas_LOADSWORD01_Info;
	important = 0;
	permanent = 0;
	description = "УРИЗЕЛЬ обладает огромной силой?";
};


func int Info_Xardas_LOADSWORD01_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_LOADSWORD))
	{
		return TRUE;
	};
};

func void Info_Xardas_LOADSWORD01_Info()
{
	if(Npc_HasItems(self,demourizel))
	{
		Npc_RemoveInvItem(self,demourizel);
	};
	AI_Output(other,self,"Info_Xardas_LOADSWORD01_15_01");	//УРИЗЕЛЬ обладает огромной силой?
	AI_Output(self,other,"Info_Xardas_LOADSWORD01_14_02");	//В книгах говорится о том, что этот меч способен пробить любой доспех и справиться с любым защитным заклинанием.
	AI_Output(other,self,"Info_Xardas_LOADSWORD01_15_03");	//Как могло такое оружие попасть к оркам?
	AI_Output(self,other,"Info_Xardas_LOADSWORD01_14_04");	//Давным-давно орки сумели выкрасть его у могучего воина. Они не могли его использовать, поэтому они его хорошо спрятали.
	AI_Output(other,self,"Info_Xardas_LOADSWORD01_15_05");	//Все же не так хорошо, как хотели!
};


instance Info_Xardas_LOADSWORD02(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_LOADSWORD02_Condition;
	information = Info_Xardas_LOADSWORD02_Info;
	important = 0;
	permanent = 0;
	description = "А можно ли восстановить силу этого меча?";
};


func int Info_Xardas_LOADSWORD02_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_LOADSWORD01))
	{
		return TRUE;
	};
};

func void Info_Xardas_LOADSWORD02_Info()
{
	AI_Output(other,self,"Info_Xardas_LOADSWORD02_15_01");	//А можно ли восстановить силу этого меча?
	AI_Output(self,other,"Info_Xardas_LOADSWORD02_14_02");	//Да, но тебе нужно будет найти достаточно сильный источник магической энергии.
	AI_Output(other,self,"Info_Xardas_LOADSWORD02_15_03");	//Такой сильный, что с его помощью можно было бы уничтожить Барьер?
	AI_Output(self,other,"Info_Xardas_LOADSWORD02_14_04");	//Да, наверное, такой...
	AI_Output(self,other,"Info_Xardas_LOADSWORD02_14_05");	//Кроме того, нужно прочесть особое заклинание, которое передаст оружию энергию этого источника.
	AI_Output(self,other,"Info_Xardas_LOADSWORD02_14_06");	//Я смогу его написать, но для этого мне понадобится время.
	B_Story_ShowedUrizielToXardas();
};


instance Info_Xardas_BETTERARMOR(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_BETTERARMOR_Condition;
	information = Info_Xardas_BETTERARMOR_Info;
	important = 0;
	permanent = 0;
	description = "А я пока пойду и поищу себе доспехи получше.";
};


func int Info_Xardas_BETTERARMOR_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_LOADSWORD02))
	{
		return TRUE;
	};
};

func void Info_Xardas_BETTERARMOR_Info()
{
	var C_Item armor;
	var int armorInstance;
	AI_Output(other,self,"Info_Xardas_BETTERARMOR_15_01");	//А я пока пойду и поищу себе доспехи получше.
	armor = Npc_GetEquippedArmor(hero);
	armorInstance = Hlp_GetInstanceID(armor);
	if(armorInstance == crw_armor_h)
	{
		AI_Output(other,self,"Info_Xardas_BETTERARMOR_15_02");	//Этот доспех из панцирных пластин ползунов сильно пострадал после битвы в подземном храме.
	}
	else if((armorInstance == kdw_armor_h) || (armorInstance == kdw_armor_l))
	{
		AI_Output(other,self,"Info_Xardas_BETTERARMOR_15_03");	//Эти синие лохмотья больше не смогут меня защитить. Особенно после битвы в подземном храме.
	}
	else
	{
		AI_Output(other,self,"Info_Xardas_BETTERARMOR_15_04");	//После битвы с нежитью в подземном храме мои доспехи пришли в негодность.
	};
	AI_Output(self,other,"Info_Xardas_BETTERARMOR_14_05");	//Попробуй обследовать мою старую башню.
	AI_Output(other,self,"Info_Xardas_BETTERARMOR_15_06");	//Твою старую башню?
	AI_Output(self,other,"Info_Xardas_BETTERARMOR_14_07");	//Во время одного из землетрясений она погрузилась в одно из озер на востоке. Ее шпили до сих пор видны из воды.
	AI_Output(self,other,"Info_Xardas_BETTERARMOR_14_08");	//Там ты можешь найти некоторые артефакты. У меня не было времени забрать их.
	AI_Output(other,self,"Info_Xardas_BETTERARMOR_15_09");	//Как туда попасть?
	AI_Output(self,other,"Info_Xardas_BETTERARMOR_14_10");	//После землетрясения я там ни разу не был, тебе придется выяснить это самому.
	AI_Output(self,other,"Info_Xardas_BETTERARMOR_14_11");	//Вот этот ключ должен тебе пригодиться. Он открывает один из сундуков, в котором я хранил самые ценные вещи.
	b_printtrademsg1("Получен ключ Ксардаса.");
	CreateInvItems(hero,ItKe_SunkenTower,1);
	B_Story_ExploreSunkenTower();
};


instance Info_Xardas_OREARMOR(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_OREARMOR_Condition;
	information = Info_Xardas_OREARMOR_Info;
	important = 1;
	permanent = 0;
};


func int Info_Xardas_OREARMOR_Condition()
{
	if(Npc_HasItems(hero,ore_armor_m) || Npc_HasItems(hero,ore_armor_h))
	{
		return TRUE;
	};
};

func void Info_Xardas_OREARMOR_Info()
{
	var C_Item armor;
	var int armorInstance;
	armor = Npc_GetEquippedArmor(hero);
	armorInstance = Hlp_GetInstanceID(armor);
	if((armorInstance == ore_armor_m) || (armorInstance == ore_armor_h))
	{
		AI_Output(self,other,"Info_Xardas_OREARMOR_14_02");	//Вижу, тебе удалось найти железные доспехи.
	}
	else
	{
		AI_Output(self,other,"Info_Xardas_OREARMOR_14_01");	//А, ты нашел железные доспехи.
	};
	AI_Output(other,self,"Info_Xardas_OREARMOR_15_03");	//Да, я нашел их в одном из сундуков в затонувшей башне.
	AI_Output(self,other,"Info_Xardas_OREARMOR_14_04");	//Он принадлежал тому герою, который сражался с УРИЗЕЛЕМ против орков.
	AI_Output(other,self,"Info_Xardas_OREARMOR_15_05");	//Надеюсь, я буду более удачлив, чем он.
};


instance Info_Xardas_FORMULA(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_FORMULA_Condition;
	information = Info_Xardas_FORMULA_Info;
	important = 0;
	permanent = 0;
	description = "Ты написал заклинание для передачи энергии рудной горы УРИЗЕЛЮ?";
};


func int Info_Xardas_FORMULA_Condition()
{
	if(Npc_HasItems(hero,ore_armor_m) || Npc_HasItems(hero,ore_armor_h) || Npc_HasItems(hero,itarrune_1_3_teleport1))
	{
		return TRUE;
	};
};

func void Info_Xardas_FORMULA_Info()
{
	AI_Output(other,self,"Info_Xardas_FORMULA_15_01");	//Ты уже написал заклинание для передачи энергии рудной горы УРИЗЕЛЮ?
	AI_Output(self,other,"Info_Xardas_FORMULA_14_02");	//Да, оно уже готово. Но один ты не сможешь его прочесть.
	AI_Output(other,self,"Info_Xardas_FORMULA_15_03");	//Почему?
	AI_Output(self,other,"Info_Xardas_FORMULA_14_04");	//Его должен прочитать сильный маг, в то время как ты будешь держать меч над источником энергии.
	AI_Output(other,self,"Info_Xardas_FORMULA_15_05");	//Что ж, мне придется найти того, кто сможет мне помочь.
	AI_Output(self,other,"Info_Xardas_FORMULA_14_06");	//Возьми заклинание и верни мечу всю его былую силу. Она тебе понадобится!
	b_printtrademsg1("Получено заклинание переноса энергии.");
	CreateInvItem(hero,Scroll4Milten);
	B_Story_LoadSword();
};


instance Info_Xardas_ALTRUNE(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_ALTRUNE_Condition;
	information = Info_Xardas_ALTRUNE_Info;
	important = 0;
	permanent = 0;
	description = "Но как маг я не смогу использовать УРИЗЕЛЬ!";
};


func int Info_Xardas_ALTRUNE_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_FORMULA) && ((Npc_GetTrueGuild(hero) == GIL_KDW) || (Npc_GetTrueGuild(hero) == GIL_DMB) || (Npc_GetTrueGuild(hero) == GIL_KDF) || (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 1) || Npc_KnowsInfo(hero,KDF_402_Corristo_AUFNAHME)))
	{
		return TRUE;
	};
};

func void Info_Xardas_ALTRUNE_Info()
{
	AI_Output(other,self,"Info_Xardas_ALTRUNE_15_01");	//Но как маг я не смогу использовать УРИЗЕЛЬ!
	AI_Output(self,other,"Info_Xardas_ALTRUNE_14_02");	//Я знаю один способ...
	AI_Output(self,other,"Info_Xardas_ALTRUNE_14_03");	//Но сначала восстанови силу меча. Потом я расскажу тебе об этом.
	Log_CreateTopic(GE_URIZELRUNE,LOG_NOTE);
	B_LogEntry(GE_URIZELRUNE,"Во время нашей последней встречи Ксардас упомянул о том, что силу УРИЗЕЛЯ могут использовать даже маги. Но он расскажет мне об этом только после того, как я заряжу меч.");
};

instance Info_Xardas_ALTRUNEBOW(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_ALTRUNEBOW_Condition;
	information = Info_Xardas_ALTRUNEBOW_Info;
	important = 0;
	permanent = 0;
	description = "Но как лучник я не смогу использовать УРИЗЕЛЬ!";
};


func int Info_Xardas_ALTRUNEBOW_Condition()
{
	if(
		Npc_KnowsInfo(hero,Info_Xardas_FORMULA)
	&&	hero.attribute[ATR_DEXTERITY] > 50
	)
	{
		return TRUE;
	};
};

func void Info_Xardas_ALTRUNEBOW_Info()
{
	AI_Output(other,self,"Info_Xardas_ALTRUNEBOW_NULL_01");	//Но как лучник я не смогу использовать УРИЗЕЛЬ!
	AI_Output(self,other,"Info_Xardas_ALTRUNE_14_02");	//Я знаю один способ...
	AI_Output(self,other,"Info_Xardas_ALTRUNE_14_03");	//Но сначала восстанови силу меча. Потом я расскажу тебе об этом.
	Log_CreateTopic(GE_URIZELRUNE,LOG_NOTE);
	B_LogEntry(GE_URIZELRUNE,"Во время нашей последней встречи Ксардас упомянул о том, что силу УРИЗЕЛЯ могут использовать даже лучники. Но он расскажет мне об этом только после того, как я заряжу меч.");
};


instance Info_Xardas_SWORDLOADED(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_SWORDLOADED_Condition;
	information = Info_Xardas_SWORDLOADED_Info;
	important = 0;
	permanent = 0;
	description = "Я зарядил УРИЗЕЛЬ!";
};


func int Info_Xardas_SWORDLOADED_Condition()
{
	if(Npc_HasItems(hero,Mythrilklinge02))
	{
		return TRUE;
	};
};

func void Info_Xardas_SWORDLOADED_Info()
{
	AI_Output(other,self,"Info_Xardas_SWORDLOADED_15_01");	//Я зарядил УРИЗЕЛЬ!
	AI_Output(self,other,"Info_Xardas_SWORDLOADED_14_02");	//Невероятно! Меч снова столь же силен, как и в день своего создания. Теперь у тебя есть один из самых мощных мечей в мире!
	Wld_InsertItem(ItArScrollTeleport4,"OW_ORC_SHAMAN_ROOM2");
};


instance Info_Xardas_MAKERUNE(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_MAKERUNE_Condition;
	information = Info_Xardas_MAKERUNE_Info;
	important = 0;
	permanent = 0;
	description = "Ты говорил, что я смогу использовать УРИЗЕЛЬ, даже будучи магом.";
};

func int Info_Xardas_MAKERUNE_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_ALTRUNE) && Npc_KnowsInfo(hero,Info_Xardas_SWORDLOADED))
	{
		return TRUE;
	};
};

func void Info_Xardas_MAKERUNE_Info()
{
	AI_Output(other,self,"Info_Xardas_MAKERUNE_15_01");	//Ты говорил, что я смогу использовать УРИЗЕЛЬ, даже если буду магом.
	AI_Output(self,other,"Info_Xardas_MAKERUNE_14_02");	//Посмотри на него. Его самая важная деталь - синий мерцающий камень на клинке.
	AI_Output(self,other,"Info_Xardas_MAKERUNE_14_03");	//Он хранит в себе всю силу меча.
	AI_Output(self,other,"Info_Xardas_MAKERUNE_14_04");	//Если я выну этот камень, я смогу сделать из него руну, которая будет обладать всеми свойствами меча.
	AI_Output(other,self,"Info_Xardas_MAKERUNE_15_05");	//Магическую руну из УРИЗЕЛЯ?
	AI_Output(self,other,"Info_Xardas_MAKERUNE_14_06");	//Эта руна поможет победить твоих врагов так же, как это сделал бы меч.
	AI_Output(self,other,"Info_Xardas_MAKERUNE_14_07");	//Но есть одно условие: лишь маги Шестого Круга могут использовать такую могущественную руну!
};

instance Info_Xardas_MAKEBOW(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_MAKEBOW_Condition;
	information = Info_Xardas_MAKEBOW_Info;
	important = 0;
	permanent = 0;
	description = "Ты говорил, что я смогу использовать УРИЗЕЛЬ, даже будучи лучником.";
};

func int Info_Xardas_MAKEBOW_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_ALTRUNEBOW) && Npc_KnowsInfo(hero,Info_Xardas_SWORDLOADED))
	{
		return TRUE;
	};
};

func void Info_Xardas_MAKEBOW_Info()
{
	AI_Output(other,self,"Info_Xardas_MAKEBOW_NULL_01");	//Ты говорил, что я смогу использовать УРИЗЕЛЬ, даже не имея столько силы.
	AI_Output(self,other,"Info_Xardas_MAKERUNE_14_02");	//Посмотри на него. Его самая важная деталь - синий мерцающий камень на клинке.
	AI_Output(self,other,"Info_Xardas_MAKERUNE_14_03");	//Он хранит в себе всю силу меча.
	AI_Output(self,other,"Info_Xardas_MAKEBOW_NULL_04");	//Если перенести этот камень в подходящий лук, тоо.. это может сработать.
	AI_Output(self,other,"Info_Xardas_MAKEBOW_NULL_05");	//Лук получит свойства камня, а стрелы.. впрочем я не знаю сработает-ли это.. оружие может просто не выдержать силы камня.
	AI_Output(self,other,"Info_Xardas_MAKEBOW_NULL_06");	//Постарайся найти подходящее вместилище.
};


instance Info_Xardas_MAKERUNEDOIT(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_MAKERUNEDOIT_Condition;
	information = Info_Xardas_MAKERUNEDOIT_Info;
	important = 0;
	permanent = 1;
	description = "Хорошо, возьми камень из УРИЗЕЛЯ!";
};


func int Info_Xardas_MAKERUNEDOIT_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_MAKERUNE) && Npc_HasItems(hero,Mythrilklinge02))
	{
		return TRUE;
	};
};

func void Info_Xardas_MAKERUNEDOIT_Info()
{
	AI_Output(other,self,"Info_Xardas_MAKERUNEDOIT_15_01");	//Хорошо, возьми камень из УРИЗЕЛЯ!
	if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) < 6)
	{
		AI_Output(self,other,"Info_Xardas_MAKERUNEDOIT_14_02");	//Но ты еще не посвящен в Шестой Круг магии!
	};
	AI_Output(self,other,"Info_Xardas_MAKERUNEDOIT_14_03");	//Это будет необратимое изменение меча. Ты действительно хочешь, чтобы я вынул камень?
	Info_ClearChoices(Info_Xardas_MAKERUNEDOIT);
	Info_AddChoice(Info_Xardas_MAKERUNEDOIT,"Да, я хочу этого!",Info_Xardas_MAKERUNE_YES);
	Info_AddChoice(Info_Xardas_MAKERUNEDOIT,"Нет, не нужно этого делать!",Info_Xardas_MAKERUNE_NO);
};

instance Info_Xardas_MAKEBOWDOIT(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_MAKEBOWDOIT_Condition;
	information = Info_Xardas_MAKEBOWDOIT_Info;
	important = 0;
	permanent = 1;
	description = "Хорошо, перенеси камень УРИЗЕЛЯ в этот лук!";
};


func int Info_Xardas_MAKEBOWDOIT_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_MAKEBOW) && Npc_HasItems(hero,Mythrilklinge02))
	{
		return TRUE;
	};
};

func void Info_Xardas_MAKEBOWDOIT_Info()
{
	AI_Output(other,self,"Info_Xardas_MAKEBOWDOIT_NULL_01");	//Хорошо, перенеси камень УРИЗЕЛЯ в этот лук!
	AI_Output(self,other,"Info_Xardas_MAKERUNEDOIT_14_03");	//Это будет необратимое изменение меча. Ты действительно хочешь, чтобы я вынул камень?
	Info_ClearChoices(Info_Xardas_MAKEBOWDOIT);
	Info_AddChoice(Info_Xardas_MAKEBOWDOIT,"Да, я хочу этого!",Info_Xardas_MAKEBOW_YES);
	Info_AddChoice(Info_Xardas_MAKEBOWDOIT,"Нет, не нужно этого делать!",Info_Xardas_MAKEBOW_NO);
};

func void Info_Xardas_MAKERUNE_YES()
{
	Info_ClearChoices(Info_Xardas_MAKERUNEDOIT);
	AI_Output(other,self,"Info_Xardas_MAKERUNEDOIT_15_04");	//Да, я хочу этого!
	b_printtrademsg1("Отдан заряженный УРИЗЕЛЬ.");
	AI_Output(self,other,"Info_Xardas_MAKERUNEDOIT_14_05_01");	//Я сделаю, как ты просишь.
	CreateInvItem(self,demourizel);
	AI_EquipBestMeleeWeapon(self);
	AI_ReadyMeleeWeapon(self);
	AI_PlayAni(self,"T_PRACTICEMAGIC4");
	AI_RemoveWeapon(self);
	AI_UnequipWeapons(self);
	AI_Output(self,other,"Info_Xardas_MAKERUNEDOIT_14_05_02");	//Вот, возьми меч и руну!
	b_printtrademsg2("Получен УРИЗЕЛЬ и руна Волны смерти.");
	Npc_RemoveInvItem(hero,Mythrilklinge02);
	CreateInvItems(hero,itarrune_6_6_urizielrune,1);
	CreateInvItems(hero,Mythrilklinge03,1);
	B_LogEntry(GE_URIZELRUNE,"Ксардас отделил магический камень от меча УРИЗЕЛЯ. Теперь вся сила меча перейдет в руну, сделанную из этого камня.");
};

func void Info_Xardas_MAKEBOW_YES()
{
	Info_ClearChoices(Info_Xardas_MAKEBOWDOIT);
	AI_Output(other,self,"Info_Xardas_MAKERUNEDOIT_15_04");	//Да, я хочу этого!
	b_printtrademsg1("Отдан заряженный УРИЗЕЛЬ.");
	AI_Output(self,other,"Info_Xardas_MAKERUNEDOIT_14_05_01");	//Я сделаю, как ты просишь.
	CreateInvItem(self,demourizel);
	AI_EquipBestMeleeWeapon(self);
	AI_ReadyMeleeWeapon(self);
	AI_PlayAni(self,"T_PRACTICEMAGIC4");
	AI_RemoveWeapon(self);
	AI_UnequipWeapons(self);
	AI_Output(self,other,"Info_Xardas_MAKEBOWDOIT_NULL_05_02");	//Вот, возьми меч и лук!
	b_printtrademsg2("Получен УРИЗЕЛЬ и лук с камнем.");
	Npc_RemoveInvItem(hero,Mythrilklinge02);
	CreateInvItems(hero,ItRw_Bow_Urizel,1);
	CreateInvItems(hero,Mythrilklinge03,1);
	B_LogEntry(GE_URIZELRUNE,"Ксардас отделил магический камень от меча УРИЗЕЛЯ. И соединил его с новым оружием. Теперь сила камня наделяет лук небывалой энергией.");
};

func void Info_Xardas_MAKERUNE_NO()
{
	Info_ClearChoices(Info_Xardas_MAKERUNEDOIT);
	AI_Output(other,self,"Info_Xardas_MAKERUNEDOIT_15_06");	//Нет, не нужно этого делать!
	AI_Output(self,other,"Info_Xardas_MAKERUNEDOIT_14_07");	//Да будет так. Пусть меч сохранит свою магическую силу.
};

func void Info_Xardas_MAKEBOW_NO()
{
	Info_ClearChoices(Info_Xardas_MAKEBOWDOIT);
	AI_Output(other,self,"Info_Xardas_MAKERUNEDOIT_15_06");	//Нет, не нужно этого делать!
	AI_Output(self,other,"Info_Xardas_MAKERUNEDOIT_14_07");	//Да будет так. Пусть меч сохранит свою магическую силу.
};


instance INFO_XARDAS_LOADSWORD09_0(C_Info)
{
	npc = KDF_404_Xardas;
	condition = info_xardas_loadsword09_0_condition;
	information = info_xardas_loadsword09_0_info;
	important = 0;
	permanent = 0;
	description = "Ты можешь научить меня чему-нибудь?";
};


func int info_xardas_loadsword09_0_condition()
{
	if(EnteredTemple && ((Npc_GetTrueGuild(hero) == GIL_KDW) || (Npc_GetTrueGuild(hero) == GIL_KDF) || Npc_KnowsInfo(hero,KDF_402_Corristo_AUFNAHME)))
	{
		return TRUE;
	};
};

func void info_xardas_loadsword09_0_info()
{
	AI_Output(other,self,"Info_Xardas_LOADSWORD09_15_01");	//Ты можешь научить меня чему-нибудь?
	AI_Output(self,other,"Info_Xardas_LOADSWORD09_14_02");	//Я посвящу тебя в тайны Шестого Круга магии.
	Log_CreateTopic(GE_TeacherOW,LOG_NOTE);
	B_LogEntry(GE_TeacherOW,"Ксардас сможет открыть для меня тайны последнего, Шестого Круга магии.");
};


instance Info_Xardas_LOADSWORD09(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_LOADSWORD09_Condition;
	information = Info_Xardas_LOADSWORD09_Info;
	important = 0;
	permanent = 1;
	description = B_BuildLearnString(NAME_LearnMage_6,LPCOST_TALENT_MAGE_6,0);
};


func int Info_Xardas_LOADSWORD09_Condition()
{
	if(Npc_KnowsInfo(hero,info_xardas_loadsword09_0) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) < 6))
	{
		return TRUE;
	};
};

func void Info_Xardas_LOADSWORD09_Info()
{
	AI_Output(other,self,"GRD_205_Scorpio_CROSSBOW2_OK_15_01");	//Начнем прямо сейчас.
	if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 5)
	{
		if(B_GiveSkill(other,NPC_TALENT_MAGE,6,LPCOST_TALENT_MAGE_6))
		{
			AI_Output(self,other,"Info_Xardas_LOADSWORD09_14_03");	//Знай же, что только сильнейшие маги могут пройти посвящение в Шестой Круг. Это смогут сделать те, чья жизнь подчинена одному знаку.
			AI_Output(self,other,"Info_Xardas_LOADSWORD09_14_04");	//Твой знак - объединение стихий.
			AI_Output(self,other,"Info_Xardas_LOADSWORD09_14_05");	//Овладев знаниями Шестого Круга, ты сможешь читать заклинания любой руны.
			AI_Output(self,other,"Info_Xardas_LOADSWORD09_14_06");	//Но не забывай, что не магия служит тебе, а ты - магии.
			b_printtrademsg1("Получена мантия темного искусства.");
			CreateInvItem(self,itarrune_6_2_armyofdarkness);
			CreateInvItem(hero,dmb_armor_m);
			hero.guild = GIL_DMB;
			Npc_SetTrueGuild(hero,GIL_DMB);
			AI_StopProcessInfos(self);
		};
	}
	else
	{
		AI_Output(self,other,"Info_Xardas_LOADSWORD09_14_07");	//Нет, ты еще не готов. У тебя есть талант, но не хватает опыта. Иди к Сатурасу, он поможет тебе.
		AI_StopProcessInfos(self);
	};
};

