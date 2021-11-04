
instance ItWrTemplemap(C_Item)
{
	name = "Карта";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 30;
	visual = "ItWrTempleMap.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = UseTemplemap;
	description = "Схема храма";
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseTemplemap()
{
	var int nDocID;
	nDocID = Doc_CreateMap();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Map_Temple.tga",1);
	Doc_Show(nDocID);
};


instance ItMiAlarmhorn(C_Item)
{
	name = "Рог";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 6;
	visual = "ItMi_Alarmhorn_01.3DS";
	material = MAT_WOOD;
	scemeName = "HORN";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_Stuff_Idol_Sleeper_01(C_Item)
{
	name = "Статуэтка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItMi_Stuff_Idol_Sleeper_01.3DS";
	material = MAT_CLAY;
	description = name;
	text[0] = "Статуэтка какого-то бесформенного существа";
	text[1] = "в маске с шестью большими шипами.";
};

instance Weltenspalter(C_Item)
{
	name = "Раскалывающий миры";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_CROSSBOW | ITEM_MISSION;
	material = MAT_METAL;
	value = 900;
	damageTotal = 50;
	damagetype = DAM_EDGE;
	range = 140;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMi_SleeperKey_01.3DS";
	description = name;
	mag_circle = 7;
	text[0] = "Это меч бессмертного";
	text[1] = "орка-жреца Варраг-Хашора.";
	text[2] = "Меч был испорчен временем";
	text[3] = "и стал непригоден!";
	text[4] = "Быть может, его можно использовать";
	text[5] = "как-то иначе.";
};

instance Lichtbringer(C_Item)
{
	name = "Несущий свет";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_CROSSBOW | ITEM_MISSION;
	material = MAT_METAL;
	value = 900;
	damageTotal = 50;
	damagetype = DAM_EDGE;
	range = 140;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMi_SleeperKey_01.3DS";
	description = name;
	mag_circle = 7;
	text[0] = "Это меч бессмертного";
	text[1] = "орка-жреца Варраг-Казорга.";
	text[2] = "Меч был испорчен временем";
	text[3] = "и стал непригоден!";
	text[4] = "Быть может, его можно использовать";
	text[5] = "как-то иначе.";
};

instance Zeitenklinge(C_Item)
{
	name = "Клинок времен";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_CROSSBOW | ITEM_MISSION;
	material = MAT_METAL;
	value = 900;
	damageTotal = 50;
	damagetype = DAM_EDGE;
	range = 140;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMi_SleeperKey_01.3DS";
	description = name;
	mag_circle = 7;
	text[0] = "Это меч бессмертного";
	text[1] = "орка-жреца Варраг-Унхилькта.";
	text[2] = "Меч был испорчен временем";
	text[3] = "и стал непригоден!";
	text[4] = "Быть может, его можно использовать";
	text[5] = "как-то иначе.";
};

instance Daemonenstreich(C_Item)
{
	name = "Удар демона";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_CROSSBOW | ITEM_MISSION;
	material = MAT_METAL;
	value = 900;
	damageTotal = 50;
	damagetype = DAM_EDGE;
	range = 140;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMi_SleeperKey_01.3DS";
	description = name;
	mag_circle = 7;
	text[0] = "Это меч бессмертного";
	text[1] = "орка-жреца Варраг-Руушка.";
	text[2] = "Меч был испорчен временем";
	text[3] = "и стал непригоден!";
	text[4] = "Быть может, его можно использовать";
	text[5] = "как-то иначе.";
};

instance Bannklinge(C_Item)
{
	name = "Клинок проклятий";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_CROSSBOW | ITEM_MISSION;
	material = MAT_METAL;
	value = 900;
	damageTotal = 50;
	damagetype = DAM_EDGE;
	range = 140;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMi_SleeperKey_01.3DS";
	description = name;
	mag_circle = 7;
	text[0] = "Это меч бессмертного";
	text[1] = "орка-жреца Граш-Варраг-Арушата.";
	text[2] = "Меч был испорчен временем";
	text[3] = "и стал непригоден!";
	text[4] = "Быть может, его можно использовать";
	text[5] = "как-то иначе.";
};

instance Mythrilklinge(C_Item)
{
	name = "Необычный меч";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 900;
	damageTotal = 10;
	damagetype = DAM_EDGE;
	range = 160;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMw_2H_Sword_Sleeper_01.3DS";
	description = name;
	text[0] = "Очень красивый меч.";
	text[1] = "На клинке выгравированы древние руны.";
	text[2] = "Может быть, Ксардас сможет их прочитать!";
	text[3] = "Лучше я сначала узнаю, что это за оружие,";
	text[4] = "а пока буду носить его с собой.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance Mythrilklinge01(C_Item)
{
	name = "УРИЗЕЛЬ";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 1000;
	damageTotal = 90;
	damagetype = DAM_EDGE;
	range = 180;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 120;
	visual = "ItMw_2H_Sword_Sleeper_01.3DS";
	description = name;
	text[0] = "Этот древний меч называется УРИЗЕЛЬ.";
	text[1] = "Раньше он обладал огромной силой,";
	text[2] = "но она была утеряна.";
	text[3] = NAME_Damage;
	count[3] = damageTotal;
	text[4] = NAME_Str_needed;
	count[4] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance Mythrilklinge02(C_Item)
{
	name = "УРИЗЕЛЬ";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 10000;
	damagetype = DAM_EDGE | DAM_FIRE | DAM_MAGIC;
	damage[DAM_INDEX_EDGE] = 90;
	damage[DAM_INDEX_FIRE] = 30;
	damage[DAM_INDEX_MAGIC] = 120;
	range = 180;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 120;
	visual = "ItMw_2H_Sword_Sleeper_02.3DS";
	description = name;
	text[0] = "Это меч УРИЗЕЛЬ, заряженный qeq wewqe qeqw eqe qweqw e";
	text[1] = "энергией магической руды.";
	text[2] = NAME_Dam_Magic;
	count[2] = damage[DAM_INDEX_MAGIC];
	text[3] = NAME_Dam_Fire;
	count[3] = damage[DAM_INDEX_FIRE];
	text[4] = NAME_Str_needed;
	count[4] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance Mythrilklinge03(C_Item)
{
	name = "УРИЗЕЛЬ";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 8000;
	damageTotal = 90;
	damagetype = DAM_EDGE;
	range = 180;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 120;
	visual = "ItMw_2H_Sword_Sleeper_01.3DS";
	description = name;
	text[0] = "Магический драгоценный камень был";
	text[1] = "изъят. Меч все еще очень хорош,";
	text[2] = "но теперь не обладает магической силой.";
	text[3] = NAME_Damage;
	count[3] = damageTotal;
	text[4] = NAME_Str_needed;
	count[4] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance DEMOURIZEL(C_Item)
{
	name = "УРИЗЕЛЬ";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 1;
	damageTotal = 115;
	damagetype = DAM_EDGE;
	range = 0;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 1;
	visual = "ItMw_2H_Sword_Sleeper_01.3DS";
	description = name;
};

instance Scroll4Milten(C_Item)
{
	name = "Перенос энергии";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "Заклинание переноса энергии на меч.";
	text[1] = "Я не могу его использовать.";
};

instance ItKe_SunkenTower(C_Item)
{
	name = "Ключ Ксардаса";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Открывает сундуки";
	text[1] = "в затонувшей башне.";
};

instance DungeonKey(C_Item)
{
	name = "Ключ от подземелья";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Открывает тюремные камеры";
	text[1] = "в Старом лагере.";
};

instance ITARRUNE_6_6_URIZIELRUNE(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10000;
	visual = "ItAr_Rune_14.3ds";
	material = MAT_STONE;
	spell = SPL_MASSDEATH;
	mag_circle = 6;
	description = "Волна смерти УРИЗЕЛЯ";
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_MASSDEATH;
	text[2] = NAME_Dam_Magic;
	count[2] = SPL_DAMAGE_MASSDEATH;
	text[3] = "Эта магическая руна содержит";
	text[4] = "древнюю силу меча УРИЗЕЛЬ.";
	text[5] = NAME_Value;
	count[5] = value;
};

