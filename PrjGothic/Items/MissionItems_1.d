
instance MordragsRing(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = 250;
	visual = "ItMi_Ring_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_MordragsRing;
	on_unequip = UnEquip_MordragsRing;
	description = "Кольцо Мордрага";
	text[2] = NAME_Bonus_Dex;
	count[2] = 5;
	text[5] = NAME_Value;
	count[5] = value;
};


func void Equip_MordragsRing()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,5);
};

func void UnEquip_MordragsRing()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,-5);
};


instance SpecialJoint(C_Item)
{
	name = "Улучшенный 'Зов мечты'";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Joint3 * 10;
	visual = "SPECIALJOINT.3ds";
	material = MAT_LEATHER;
	scemeName = "JOINT";
	on_state[0] = UseSpecialJoint;
	description = name;
	text[0] = "Этот болотник действует гораздо";
	text[1] = "сильнее, чем обычный 'Зов мечты'.";
	text[3] = "Он приготовлен для Гуру Идола Тиона!";
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseSpecialJoint()
{
	AI_StartState(self,ZS_MagicSleep,1,"");
};


instance ItAt_DamLurker_01(C_Item)
{
	name = "Когти шныга с плотины";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Lurkerklaue * 5;
	visual = "ItAt_Lurker_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItWrOMMap(C_Item)
{
	name = "Карта";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWrOMMap.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = UseOMmap;
	description = "Карта дороги к Старой шахте";
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseOMmap()
{
	var int nDocID;
	nDocID = Doc_CreateMap();
	Doc_SetLevel(nDocID,"WORLD.ZEN");
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Map_OldMine.tga",1);
	Doc_Show(nDocID);
};


instance AltesSchwertVM(C_Item)
{
	name = "Старый меч";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 12;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 10;
	damageTotal = 12;
	damagetype = DAM_EDGE;
	visual = "ItMw_1H_Sword_Old_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance AltesSchwert(C_Item)
{
	name = "Старый меч";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 12;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 10;
	damageTotal = 12;
	damagetype = DAM_EDGE;
	visual = "ItMw_1H_Sword_Old_02.3DS";
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance JackalsSword(C_Item)
{
	name = "Меч Шакала";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	owner = Grd_201_Jackal;
	value = 27;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 20;
	damageTotal = 3;
	damagetype = DAM_EDGE;
	visual = "ItMw_1H_Sword_Short_05.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance KdW_Amulett(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = 100;
	visual = "ItMi_Amulet_Foki_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_kdw_amulett;
	on_unequip = unequip_kdw_amulett;
	description = "Амулет посланника магов Воды";
	text[2] = NAME_Bonus_ManaMax;
	count[2] = 5;
	text[5] = NAME_Value;
	count[5] = value;
};


func void equip_kdw_amulett()
{
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] + 5;
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + 5;
};

func void unequip_kdw_amulett()
{
	if(self.attribute[ATR_MANA] >= 5)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 5;
	}
	else
	{
		self.attribute[ATR_MANA] = 0;
	};
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - 5;
};


instance Cronos_Brief(C_Item)
{
	name = "Письмо";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseCronosBrief;
	scemeName = "MAP";
	description = "Письмо Кроноса к магам Огня";
};


func void UseCronosBrief()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters2.TGA",0);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0," ");
	Doc_PrintLine(nDocID,0,"Великий Мастер Корристо,");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,-1,"font_10_book.TGA");
	Doc_PrintLines(nDocID,0,"Сатурас, почтенный Мастер магов Круга Воды, просит Вас не отказать нам в поддержке. Я искренне надеюсь, что Вы разделяете наше стремление удерживать нарастающее недовольство среди жителей Старого и Нового лагерей в приемлемых рамках. Так как Вы заботитесь о поставках руды, мы можем ограничить деятельность воров Нового лагеря, действуя в Ваших интересах. Поэтому для Вас и для нас будет лучше, если Старый лагерь не будет препятствовать осуществлению нашего плана.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Жду Вашего скорого ответа.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Кронос, хранитель руды.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance Neks_Amulett(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = 50;
	visual = "ItMi_Amulet_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_Schutzamulett_Nek;
	on_unequip = UnEquip_Schutzamulett_Nek;
	description = "Амулет убитого стражника";
	text[1] = "На обратной стороне выбито имя 'Нек'";
	text[2] = NAME_Prot_Edge;
	count[2] = 5;
	text[5] = NAME_Value;
	count[5] = value;
};


func void Equip_Schutzamulett_Nek()
{
	self.protection[PROT_EDGE] += 5;
	self.protection[PROT_BLUNT] += 5;
};

func void UnEquip_Schutzamulett_Nek()
{
	self.protection[PROT_EDGE] -= 5;
	self.protection[PROT_BLUNT] -= 5;
};


instance RecruitJoint(C_Item)
{
	name = "Болотник для рудокопов";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 1;
	visual = "ItMiJoint.3ds";
	material = MAT_WOOD;
	scemeName = "JOINT";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance HealthWater(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 1500;
	visual = "ItFo_Potion_Yberion.3ds";
	material = MAT_GLAS;
	on_state[0] = usehealthwater;
	scemeName = "POTIONFAST";
	description = "Лечебное зелье Фортуно";
	text[1] = NAME_Bonus_ManaMax;
	count[1] = 10;
	text[2] = NAME_Bonus_HpMax;
	count[2] = 10;
	text[5] = NAME_Value;
	count[5] = value;
};


func void usehealthwater()
{
	Npc_ChangeAttribute(self,ATR_MANA_MAX,10);
	Npc_ChangeAttribute(self,ATR_HITPOINTS_MAX,10);
	Npc_ChangeAttribute(self,ATR_MANA,10);
	Npc_ChangeAttribute(self,ATR_HITPOINTS,10);
	PrintScreen("Макс. магическая и жизненная сила +10",-1,-1,"FONT_OLD_20_WHITE.TGA",_TIME_MESSAGE_RAISEATTRIBUTE);
};


instance TheList(C_Item)
{
	name = "Список";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	visual = "ITAR_SCROLL_01_EG.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = UseTheList;
	description = name;
	text[0] = "Ян, глава Старой шахты, занес в этот список";
	text[1] = "все необходимое для работы рудокопов.";
};


func void UseTheList()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"Список");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"20 буханок хлеба - не заплесневелого!");
	Doc_PrintLine(nDocID,0,"25-30 яблок");
	Doc_PrintLine(nDocID,0,"10 кусков сыра");
	Doc_PrintLine(nDocID,0,"1 черпак");
	Doc_PrintLine(nDocID,0,"1 щетка");
	Doc_PrintLine(nDocID,0,"5 кирок + 3 молотка");
	Doc_PrintLines(nDocID,0,"и много болотника - это же первый груз за этот месяц!");
	Doc_PrintLine(nDocID,0,"Груз должен быть доставлен послезавтра.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Ян");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance TheListNC(C_Item)
{
	name = "Список (дополненный)";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	visual = "ITAR_SCROLL_01_EG.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = UseTheListNC;
	description = name;
	text[0] = "Ян, глава Старой шахты, занес в этот список";
	text[1] = "все необходимое для работы рудокопов.";
	text[2] = "(Ларс добавил в него еще несколько пунктов.";
	text[3] = "Подделка высокого качества!)";
};


func void UseTheListNC()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"Список");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"20 буханок хлеба - не заплесневелого!");
	Doc_PrintLine(nDocID,0,"25-30 яблок");
	Doc_PrintLine(nDocID,0,"10 кусков сыра");
	Doc_PrintLine(nDocID,0,"1 черпак");
	Doc_PrintLine(nDocID,0,"1 щетка");
	Doc_PrintLine(nDocID,0,"5 кирок + 3 молотка");
	Doc_PrintLines(nDocID,0,"и много болотника - это же первый груз за этот месяц!");
	Doc_PrintLine(nDocID,0,"Груз должен быть доставлен послезавтра.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Ян");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Да, есть кое-что еще...");
	Doc_PrintLine(nDocID,0,"30 бутылок пива");
	Doc_PrintLine(nDocID,0,"5 бутылок вина");
	Doc_PrintLine(nDocID,0,"25 жареных окороков");
	Doc_PrintLine(nDocID,0,"полдюжины мечей");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance Lares_Ring(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = 50;
	visual = "ItMi_Ring_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_Lares_Ring;
	on_unequip = UnEquip_Lares_Ring;
	description = "Кольцо Ларса";
	text[2] = NAME_Bonus_Str;
	count[2] = 3;
	text[5] = NAME_Value;
	count[5] = value;
};


func void Equip_Lares_Ring()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,3);
};

func void UnEquip_Lares_Ring()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,-3);
};


instance Heiltrank(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = 15;
	visual = "ItFo_Potion_Health_04.3ds";
	material = MAT_GLAS;
	on_state[0] = UseHeiltrank;
	scemeName = "POTIONFAST";
	description = "Зелье быстрого лечения";
	text[1] = NAME_Bonus_HP;
	count[1] = 30;
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseHeiltrank()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,30);
};


instance SpecialWater(C_Item)
{
	name = "Бутыль";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItFo_Potion_Yberion.3ds";
	material = MAT_GLAS;
	description = "Основа зелья Фортуно";
	text[5] = NAME_Value;
	count[5] = value;
};

instance KalomsRecipe(C_Item)
{
	name = "Рецепт Галома";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 60;
	visual = "HP0RECIPE.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Рецепт Галома";
	text[1] = NAME_Bonus_HP;
	count[1] = 30;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_KalomsRecipe;
};


func void Use_KalomsRecipe()
{
	var int nDocID;
	if(ALCHEMYACTIVE == FALSE)
	{
		PrintScreen("Необходимо изучение навыка алхимии!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,1);
		Doc_SetPage(nDocID,0,"letters2.TGA",0);
		Doc_SetFont(nDocID,-1,"font_10_book.tga");
		Doc_SetMargins(nDocID,-1,50,50,50,50,1);
		Doc_PrintLines(nDocID,0,"После изучения свойств ночной тьмы понял, как усилить целебный эффект. Листья нужно высушить на солнце, измельчить и высыпать в чистую воду. Кипятить не нужно. Это зелье не намного сильнее обычного целебного корня, но быстро в приготовлении и подойдет для употребления внутрь: поможет от внутреннего кровотечения или изжоги.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"- Галом");
		Doc_SetMargins(nDocID,-1,200,50,50,50,1);
		Doc_Show(nDocID);
		if(HP0RECIPE == FALSE)
		{
			PrintScreen("Изучен новый рецепт!",-1,12,"FONT_OLD_20_WHITE.TGA",4);
			B_LogEntry("Алхимия","Изучен рецепт зелья быстрого лечения (жизненная сила +30). Требуется: ночная тьма (1).");
			HP0RECIPE = TRUE;
		};
	};
};


instance ItWrWorldmap(C_Item)
{
	name = "Карта";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 50;
	visual = "ItWrWorldMap.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = UseWorldmap;
	description = "Карта колонии";
	text[0] = "К сожалению, здесь не хватает";
	text[1] = "области на юго-западе.";
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseWorldmap()
{
	var int nDocID;
	nDocID = Doc_CreateMap();
	Doc_SetLevel(nDocID,"WORLD.ZEN");
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Map_World.tga",1);
	Doc_Show(nDocID);
};


instance ItWrOCmap(C_Item)
{
	name = "Карта";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 40;
	visual = "ItWrOCMap.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = UseOCmap;
	description = "Схема Старого лагеря";
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseOCmap()
{
	var int nDocID;
	nDocID = Doc_CreateMap();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Map_OldCamp.tga",1);
	Doc_Show(nDocID);
};


instance ItWrNCmap(C_Item)
{
	name = "Карта";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 40;
	visual = "ItWrNCMap.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = UseNCmap;
	description = "Схема Нового лагеря";
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseNCmap()
{
	var int nDocID;
	nDocID = Doc_CreateMap();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Map_NewCamp.tga",1);
	Doc_Show(nDocID);
};


instance ItWrPSImap(C_Item)
{
	name = "Карта";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 40;
	visual = "ItWrPsiMap.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = UsePSImap;
	description = "Схема Болотного лагеря";
	text[5] = NAME_Value;
	count[5] = value;
};


func void UsePSImap()
{
	var int nDocID;
	nDocID = Doc_CreateMap();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Map_PSICamp.tga",1);
	Doc_Show(nDocID);
};


instance ItWrPinup(C_Item)
{
	name = "Набросок";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 60;
	visual = "ItWrPinup.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = UsePinUp;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};


func void UsePinUp()
{
	var int nDocID;
	nDocID = Doc_CreateMap();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Map_PinUp.tga",1);
	Doc_Show(nDocID);
};


instance ItWrDieVerurteilten(C_Item)
{
	name = "Приговоренные";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWrBook.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItWr_Fire_Letter_01(C_Item)
{
	name = "Запечатанное письмо";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseFireletter;
	scemeName = "MAPSEALED";
	description = "Запечатанное письмо магам Огня";
	text[1] = "Не вскрывать!";
};


func void UseFireletter()
{
	var int nDocID;
	CreateInvItem(hero,ItWr_Fire_Letter_02);
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters_fire.TGA",0);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0," ");
	Doc_PrintLine(nDocID,0,"Многоуважаемый Мастер Ксардас,");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,-1,"font_10_book.TGA");
	Doc_PrintLines(nDocID,0,"Ваше предыдущее письмо вызвало беспокойство среди магов. Мы посоветовались и в этом послании сообщаем Вам о нашем решении. Братство представляет собой большую опасность. Оно угрожает нашей торговле с королем, угрожает нашему королевству и Вашей жизни. Вам необходимо отправить к сектантам одного из своих людей, чтобы он разузнал, какой бог наделяет их силой и какими знаниями они обладают. Когда это станет известно, мы сообщим священнослужителям о том, что мы вместе отправим этого темного бога туда, откуда он явился. Наши ученые работают над древними манускриптами. Мы постараемся сообщить Вам все, что сможем узнать.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Да поможет нам Иннос!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ItWr_Fire_Letter_02(C_Item)
{
	name = "Вскрытое письмо";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWrScroll.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseFireletter2;
	scemeName = "MAP";
	description = "Письмо магам Огня";
};


func void UseFireletter2()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters_fire.TGA",0);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0," ");
	Doc_PrintLine(nDocID,0,"Многоуважаемый Мастер Ксардас,");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,-1,"font_10_book.TGA");
	Doc_PrintLines(nDocID,0,"Ваше предыдущее письмо вызвало беспокойство среди магов. Мы посоветовались и в этом послании сообщаем Вам о нашем решении. Братство представляет собой большую опасность. Оно угрожает нашей торговле с королем, угрожает нашему королевству и Вашей жизни. Вам необходимо отправить к сектантам одного из своих людей, чтобы он разузнал, какой бог наделяет их силой и какими знаниями они обладают. Когда это станет известно, мы сообщим священнослужителям о том, что мы вместе отправим этого темного бога туда, откуда он явился. Наши ученые работают над древними манускриптами. Мы постараемся сообщить Вам все, что сможем узнать.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Да поможет нам Иннос!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ItKe_Gomez_01(C_Item)
{
	name = "Ключ Гомеза";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_04.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Открывает сундук Гомеза.";
};

instance ItKey_RB_01(C_Item)
{
	name = "Ключ Лорда";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Открывает сундук Лорда.";
};

instance ITKEY_OB_SMITH_01(C_Item)
{
	name = "Железный ключ";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Найден в кузнице старого лагеря, во внутреннем кольце.";
};

instance ItKe_Storage_01(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Этот ключ я нашел на теле Бартоло.";
};

instance ItKe_Nek_01(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Найден на теле Нека.";
};

instance ItKe_OM_01(C_Item)
{
	name = "Ключ от сундука";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Место Сантино";
	text[1] = "Верхняя площадка для обмена";
	text[2] = "Старая шахта";
};

instance ItKe_OM_02(C_Item)
{
	name = "Ключ Аарона";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Открывает сундук Аарона";
	text[1] = "в Старой шахте.";
};

instance ItKe_OM_03(C_Item)
{
	name = "Ключ от склада";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Открывает сундуки";
	text[1] = "на складе в Старой шахте.";
};

instance ItKe_OM_04(C_Item)
{
	name = "Ключ от сундука";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_04.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Место Альберто";
	text[1] = "Нижняя площадка обмена";
};

instance ITKE_WEAPONRY(C_Item)
{
	name = "Ключ от оружейной";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_04.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Открывает сундуки";
	text[1] = "в оружейной замка Баронов.";
};

instance ItFo_OM_Beer_01(C_Item)
{
	name = "Крепкое пиво";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = 30;
	visual = "ItFo_Beer_02.3ds";
	material = MAT_GLAS;
	on_state[0] = UseStarkBeer;
	scemeName = "POTION";
	description = name;
	text[1] = NAME_Bonus_HpMax;
	count[1] = 1;
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseStarkBeer()
{
	B_RaiseAttribute(ATR_HITPOINTS_MAX,1);
	Npc_ChangeAttribute(self,ATR_HITPOINTS,1);
	if(Npc_IsPlayer(self))
	{
		if(STARKBEER == 0)
		{
			STARKBEER = 1;
		}
		else if(STARKBEER == 1)
		{
			STARKBEER = 2;
		}
		else if(STARKBEER == 2)
		{
			STARKBEER = 3;
		}
		else if(STARKBEER == 3)
		{
			STARKBEER = 4;
		}
		else if(STARKBEER == 4)
		{
			STARKBEER = 5;
			Mdl_ApplyOverlayMdsTimed(self,"HUMANS_DRUNKEN.MDS",60000);
		};
	};
};


var int riddle1;
var int riddle2;
var int riddle3;
var int riddle4;
var int riddle5;
var int riddle6;

instance theriddle1(C_Item)
{
	name = "Старая книга";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ITWR_BOOK_RIDDLE.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Хроманин";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Usetheriddle1;
};


func void Usetheriddle1()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Riddle_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Riddle_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Хроманин");
	Doc_PrintLine(nDocID,0,"-----------");
	Doc_SetFont(nDocID,-1,"font_10_book.TGA");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Тот, кто готов отказаться от всех земных страстей и следовать тропами правды, должен узнать, где сокрыт источник моей силы. Найдя его, он будет способен разрушить все, что соединяет его с этим миром, и покажет, что он готов принять знания Хроманина.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Мудрый пересматривает свои прошлые дела свысока, прежде чем начать что-то новое.");
	Doc_Show(nDocID);
	if(riddle1 == FALSE)
	{
		Log_CreateTopic(theriddle_log,LOG_MISSION);
		Log_SetTopicStatus(theriddle_log,LOG_RUNNING);
		B_LogEntry(theriddle_log,"Я взял у скелета-мага в туманной башне одну очень странную книгу. 'Хроманин'! Она содержит непонятные вещи. В ней написано, что таинственный Некто создал этот мир: ...Мудрый пересматривает свои прошлые дела свысока, прежде чем начать что-то новое... Да... Я еще ничего не понимаю, но, может быть, скоро что-нибудь прояснится.");
		Snd_Play("AMBIENTTONE_03_DARK");
		riddle1 = TRUE;
		RIDDLE1INSERT = TRUE;
	};
};


instance theriddle2(C_Item)
{
	name = "Старая книга";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ITWR_BOOK_RIDDLE.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Хроманин 2";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Usetheriddle2;
};


func void Usetheriddle2()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Riddle_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Riddle_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Хроманин");
	Doc_PrintLine(nDocID,0,"-----------");
	Doc_SetFont(nDocID,-1,"font_10_book.TGA");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"В приносимых ветрами видениях Хроманина открывалось передо мной будущее. За веру в него я готов был отдать все, но и этого было бы мало. Они потрясли меня до глубины души.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Что было разделено, снова станет единым, если разделение длится недолго.");
	Doc_Show(nDocID);
	if(riddle2 == FALSE)
	{
		B_GiveXP(300);
		B_LogEntry(theriddle_log,"Я нашел вторую книгу, на которой стоит слово 'Хроманин'. Она оказалась не менее загадочной... Что было разделено, снова станет единым, если разделение длится недолго...");
		Snd_Play("FoundRiddlersBook");
		riddle2 = TRUE;
		RIDDLE2INSERT = TRUE;
	};
};


instance theriddle3(C_Item)
{
	name = "Старая книга";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ITWR_BOOK_RIDDLE.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Хроманин 3";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Usetheriddle3;
};


func void Usetheriddle3()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Riddle_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Riddle_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Хроманин");
	Doc_PrintLine(nDocID,0,"-----------");
	Doc_SetFont(nDocID,-1,"font_10_book.TGA");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"О, боги древних времен. Возможно ли, чтобы такой человек, как я, недостойный, получил эту силу. Как велик страх потерять все, выказав малейшее слово сомнения.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Умный рыбак попробует найти удачу и на другом берегу моря.");
	Doc_Show(nDocID);
	if(riddle3 == FALSE)
	{
		B_GiveXP(500);
		B_LogEntry(theriddle_log,"Я нашел третью книгу. Кажется, я начинаю понимать, что хотел сказать ее автор... Умный рыбак попробует найти удачу и на другом берегу моря...");
		Snd_Play("FoundRiddlersBook");
		riddle3 = TRUE;
		RIDDLE3INSERT = TRUE;
	};
};


instance theriddle4(C_Item)
{
	name = "Старая книга";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ITWR_BOOK_RIDDLE.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Хроманин 4";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Usetheriddle4;
};


func void Usetheriddle4()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Riddle_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Riddle_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Хроманин");
	Doc_PrintLine(nDocID,0,"-----------");
	Doc_SetFont(nDocID,-1,"font_10_book.TGA");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Я даже не смею надеяться когда-нибудь самому пережить Хроманин. Прошли дни растрат и пустых слов. Теперь будет так просто достичь исполнения, и очень скоро я это сделаю.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Забыты дела тех, кто был когда-то на борту.");
	Doc_Show(nDocID);
	if(riddle4 == FALSE)
	{
		B_GiveXP(700);
		B_LogEntry(theriddle_log,"Книга четвертая. И зачем только я позволяю этим книжкам морочить мне голову... Забыты дела тех, кто был когда-то на борту...");
		Snd_Play("FoundRiddlersBook");
		riddle4 = TRUE;
		RIDDLE4INSERT = TRUE;
	};
};


instance theriddle5(C_Item)
{
	name = "Старая книга";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ITWR_BOOK_RIDDLE.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Хроманин 5";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Usetheriddle5;
};


func void Usetheriddle5()
{
	var int nDocID;
	var C_Npc riddler;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Riddle_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Riddle_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Хроманин");
	Doc_PrintLine(nDocID,0,"-----------");
	Doc_SetFont(nDocID,-1,"font_10_book.TGA");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Но я не буду вставать на этот путь один. Я должен буду разделить силу, сокрытую во мне, с достойным, который найдет меня. Надеюсь, мое ожидание не затянется надолго...");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Ты найдешь меня там, где все началось.");
	Doc_Show(nDocID);
	if(riddle5 == FALSE)
	{
		B_GiveXP(850);
		B_LogEntry(theriddle_log,"Кажется, это последняя книга. Интересно, с кем мне предстоит встретиться... Ты найдешь меня там, где все началось.");
		Snd_Play("FoundRiddlersBook");
		Wld_InsertNpc(Bau_940_Riddler,"");
		riddler = Hlp_GetNpc(Bau_940_Riddler);
		Npc_ChangeAttribute(riddler,ATR_HITPOINTS,-riddler.attribute[ATR_HITPOINTS_MAX]);
		riddle5 = TRUE;
	};
};


instance theriddle6(C_Item)
{
	name = "Старая книга";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ITWR_BOOK_RIDDLE.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Хроманин 6";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Usetheriddle6;
};


func void Usetheriddle6()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Riddle_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Riddle_R_Blood.tga",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,-1,"font_10_book.TGA");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_Show(nDocID);
	if(riddle6 == FALSE)
	{
		B_GiveXP(1000);
		B_LogEntry(theriddle_log,"Таинственный Некто мертв. Его убили какие-то демоны. Что-то связывало его с этими порождениями ада. Иначе он никогда не вернулся бы в это забытое богами место. Он не разделил со мной свою тайну, она умерла вместе с ним.");
		Log_SetTopicStatus(theriddle_log,LOG_SUCCESS);
		Snd_Play("FoundRiddler");
		Wld_InsertNpc(SkeletonMage,"OW_FOGDUNGEON_36_MOVEMENT");
		Wld_InsertNpc(SkeletonMage,"OW_FOGDUNGEON_37");
		Wld_InsertNpc(Skeleton,"OW_FOGDUNGEON_36_MOVEMENT");
		Wld_InsertNpc(Skeleton,"OW_FOGDUNGEON_36_MOVEMENT2");
		Wld_InsertNpc(SkeletonScout,"OW_FOGDUNGEON_36_MOVEMENT2");
		if(Npc_GetDistToWP(hero,"OW_FOGDUNGEON_36_MOVEMENT2") < 8000)
		{
			Wld_SpawnNpcRange(hero,SkeletonWarrior,2,30);
		};
		riddle6 = TRUE;
	};
};

