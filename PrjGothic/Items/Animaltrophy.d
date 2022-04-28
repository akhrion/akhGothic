
const int Value_WaranClaws = 10;
const int Value_WaranHaut = 30;
const int Value_WaranTeeth = 4;
const int Value_LurkerClaws = 30;
const int Value_LurkerHaut = 30;
const int Value_SnapperClaws = 25;
const int Value_SnapperHaut = 70;
const int Value_SnapperTeeth = 10;
const int Value_RazorClaws = 40;
const int Value_RazorHaut = 100;
const int Value_RazorTeeth = 10;
const int Value_Zдhne = 10;
const int Value_Zuhne = 10;
const int Value_Krallen = 8;
const int Value_Wolfsfell = 10;
const int Value_Orkhundfell = 20;
const int Value_Panzerplatte = 20;
const int Value_Crawlerzangen = 10;
const int Value_Shadowbeastfell = 400;
const int Value_Lurkerklaue = 10;
const int Value_Sumpfhaihaut = 200;
const int Value_Trollfell = 300;
const int Value_Flьgel = 8;
const int Value_Flugel = 8;
const int Value_Stachel = 10;
const int Value_Feuerzunge = 100;
const int Value_Sumpfhaizдhne = 100;
const int Value_Sumpfhaizuhne = 100;
const int Value_Shadowbeasthorn = 100;
const int Value_Trollhauer = 100;
const int Value_Steinherz = 300;
const int Value_Feuerherz = 300;
const int Value_Eisherz = 300;
const int Value_Eistueck = 100;

instance ItAt_Teeth_01(C_Item)
{
	name = "Клыки";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Zuhne;
	visual = "ItAt_Teeth_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_Wolf_Teeth_01(C_Item)
{
	name = "Волчьи клыки";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Zuhne;
	visual = "ItAt_Teeth_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_Wolf_Teeth_Verkohlt_01(C_Item)
{
	name = "Обугленные волчьи клыки";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Zuhne;
	visual = "ItAt_Teeth_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_Wolf_01(C_Item)
{
	name = "Шкура волка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Wolfsfell;
	visual = "ItAt_Wolf_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_Wolf_Fur_01(C_Item)
{
	name = "Шкура волка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Wolfsfell;
	visual = "ItAt_Wolf_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_Wolf_Fur_Good_01(C_Item)
{
	name = "Отличная шкура волка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Wolfsfell * 2;
	visual = "ItAt_Wolf_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_Wolf_Fur_Dissected_01(C_Item)
{
	name = "Изрезанная шкура волка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Wolfsfell / 5;
	visual = "ItAt_Wolf_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_Wolf_Fur_Torn_01(C_Item)
{
	name = "Порванная шкура волка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Wolfsfell / 3;
	visual = "ItAt_Wolf_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_Wolf_Fur_Fired_01(C_Item)
{
	name = "Подпаленная шкура волка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Wolfsfell / 2;
	visual = "ItAt_Wolf_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_Wolf_Fur_Burned_01(C_Item)
{
	name = "Обгоревшая шкура волка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Wolfsfell / 5;
	visual = "ItAt_Wolf_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_Wolf_Fur_BD_01(C_Item)
{
	name = "Плохая шкура волка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Wolfsfell / 10;
	visual = "ItAt_Wolf_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "Обгоревшая и изрезанная шкура волка";
	text[1] = "даже не знаю - кому такая может понадобиться..";
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_Wolf_Fur_BD_02(C_Item)
{
	name = "Плохая шкура волка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Wolfsfell / 5;
	visual = "ItAt_Wolf_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "Подпаленная и изрезанная шкура волка";
	text[1] = "даже не знаю - кому такая может понадобиться..";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_Wolf_Fur_Verkohlt_01(C_Item)
{
	name = "Сгоревшая шкура волка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 0;
	visual = "ItAt_Wolf_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_OrcDog_Teeth_01(C_Item)
{
	name = "Клыки варга";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Zuhne;
	visual = "ItAt_Teeth_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_OrcDog_Teeth_Verkohlt_01(C_Item)
{
	name = "Обугленные клыки варга";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Zuhne;
	visual = "ItAt_Teeth_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_OrcDog_Fur_01(C_Item)
{
	name = "Шкура варга";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Wolfsfell;
	visual = "ItAt_Wolf_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_OrcDog_Fur_Good_01(C_Item)
{
	name = "Отличная шкура варга";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Wolfsfell * 2;
	visual = "ItAt_Wolf_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_OrcDog_Fur_Dissected_01(C_Item)
{
	name = "Изрезанная шкура варга";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Wolfsfell / 5;
	visual = "ItAt_Wolf_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_OrcDog_Fur_Torn_01(C_Item)
{
	name = "Порванная шкура варга";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Wolfsfell / 3;
	visual = "ItAt_Wolf_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_OrcDog_Fur_Fired_01(C_Item)
{
	name = "Подпаленная шкура варга";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Wolfsfell / 2;
	visual = "ItAt_Wolf_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_OrcDog_Fur_Burned_01(C_Item)
{
	name = "Обгоревшая шкура варга";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Wolfsfell / 5;
	visual = "ItAt_Wolf_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_OrcDog_Fur_BD_01(C_Item)
{
	name = "Плохая шкура варга";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Wolfsfell / 10;
	visual = "ItAt_Wolf_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "Обгоревшая и изрезанная шкура волка";
	text[1] = "даже не знаю - кому такая может понадобиться..";
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_OrcDog_Fur_BD_02(C_Item)
{
	name = "Плохая шкура варга";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Wolfsfell / 5;
	visual = "ItAt_Wolf_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "Подпаленная и изрезанная шкура волка";
	text[1] = "даже не знаю - кому такая может понадобиться..";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_OrcDog_Fur_Verkohlt_01(C_Item)
{
	name = "Сгоревшая шкура варга";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 0;
	visual = "ItAt_Wolf_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_ShadowBeast_Horn_01(C_Item)
{
	name = "Осколок рога мракориса";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Shadowbeasthorn / 5;
	visual = "ItAt_Shadowbeast_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_ShadowBeast_Horn_02(C_Item)
{
	name = "Рог мракориса";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Shadowbeasthorn;
	visual = "ItAt_Shadowbeast_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_ShadowBeast_Teeth_01(C_Item)
{
	name = "Клык мракориса";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Zuhne;
	visual = "ItAt_Teeth_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_ShadowBeast_Teeth_Verkohlt_01(C_Item)
{
	name = "Обугленный клык мракориса";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Zuhne;
	visual = "ItAt_Teeth_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_ShadowBeast_Fur_01(C_Item)
{
	name = "Шкура мракориса";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Wolfsfell;
	visual = "ItAt_Shadowbeast_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_ShadowBeast_Fur_Good_01(C_Item)
{
	name = "Отличная шкура мракориса";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Wolfsfell * 2;
	visual = "ItAt_Shadowbeast_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_ShadowBeast_Fur_Dissected_01(C_Item)
{
	name = "Изрезанная шкура мракориса";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Wolfsfell / 5;
	visual = "ItAt_Shadowbeast_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_ShadowBeast_Fur_Torn_01(C_Item)
{
	name = "Порванная шкура мракориса";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Wolfsfell / 3;
	visual = "ItAt_Shadowbeast_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_ShadowBeast_Fur_Fired_01(C_Item)
{
	name = "Подпаленная шкура мракориса";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Wolfsfell / 2;
	visual = "ItAt_Shadowbeast_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_ShadowBeast_Fur_Burned_01(C_Item)
{
	name = "Обгоревшая шкура мракориса";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Wolfsfell / 5;
	visual = "ItAt_Shadowbeast_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_ShadowBeast_Fur_BD_01(C_Item)
{
	name = "Плохая шкура мракориса";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Wolfsfell / 10;
	visual = "ItAt_Shadowbeast_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "Обгоревшая и изрезанная шкура мракориса";
	text[1] = "даже не знаю - кому такая может понадобиться..";
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_ShadowBeast_Fur_BD_02(C_Item)
{
	name = "Плохая шкура мракориса";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Wolfsfell / 5;
	visual = "ItAt_Shadowbeast_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "Подпаленная и изрезанная шкура мракориса";
	text[1] = "даже не знаю - кому такая может понадобиться..";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_ShadowBeast_Fur_Verkohlt_01(C_Item)
{
	name = "Сгоревшая шкура мракориса";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 0;
	visual = "ItAt_Shadowbeast_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_Troll_Teeth_Broken_01(C_Item)
{
	name = "Осколок зуба тролля";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Trollhauer / 5;
	visual = "ItAt_Troll_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_Troll_Teeth_01(C_Item)
{
	name = "Зуб тролля";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Trollhauer;
	visual = "ItAt_Troll_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_Troll_Teeth_Verkohlt_Broken_01(C_Item)
{
	name = "Обугленный осколок зуба тролля";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Trollhauer / 5;
	visual = "ItAt_Troll_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_Troll_Teeth_Verkohlt_01(C_Item)
{
	name = "Обугленный зуб тролля";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Trollhauer;
	visual = "ItAt_Troll_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_Troll_Fur_01(C_Item)
{
	name = "Шкура тролля";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Trollfell;
	visual = "ItAt_Troll_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_Troll_Fur_Good_01(C_Item)
{
	name = "Отличная шкура тролля";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Trollfell * 2;
	visual = "ItAt_Troll_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_Troll_Fur_Dissected_01(C_Item)
{
	name = "Изрезанная шкура тролля";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Trollfell / 5;
	visual = "ItAt_Troll_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_Troll_Fur_Torn_01(C_Item)
{
	name = "Порванная шкура тролля";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Trollfell / 3;
	visual = "ItAt_Troll_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_Troll_Fur_Fired_01(C_Item)
{
	name = "Подпаленная шкура тролля";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Trollfell / 2;
	visual = "ItAt_Troll_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_Troll_Fur_Burned_01(C_Item)
{
	name = "Обгоревшая шкура тролля";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Trollfell / 5;
	visual = "ItAt_Troll_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_Troll_Fur_BD_01(C_Item)
{
	name = "Плохая шкура тролля";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Trollfell / 10;
	visual = "ItAt_Troll_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "Обгоревшая и изрезанная шкура тролля";
	text[1] = "даже не знаю - кому такая может понадобиться..";
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_Troll_Fur_BD_02(C_Item)
{
	name = "Плохая шкура тролля";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Trollfell / 5;
	visual = "ItAt_Troll_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "Подпаленная и изрезанная шкура тролля";
	text[1] = "даже не знаю - кому такая может понадобиться..";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_Troll_Fur_Verkohlt_01(C_Item)
{
	name = "Сгоревшая шкура тролля";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 0;
	visual = "ItAt_Troll_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_Wolf_02(C_Item)
{
	name = "Шкура орочьей собаки";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Orkhundfell;
	visual = "ItAt_Wolf_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_Waran_01(C_Item)
{
	name = "Язык огненной ящерицы";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Feuerzunge;
	visual = "ItAt_Waran_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_Claws_01(C_Item)
{
	name = "Когти";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Krallen;
	visual = "ItAt_Claws_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_Waran_Claws_01(C_Item)
{
	name = "Когти варана";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_WaranClaws;
	visual = "ItAt_Claws_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_Waran_Claws_Verkohlt_01(C_Item)
{
	name = "Обугленные когти варана";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_WaranClaws / 3;
	visual = "ItAt_Claws_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_Waran_Teeth(C_Item)
{
	name = "Зубы варана";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_WaranTeeth;
	visual = "ItAt_Claws_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_Waran_Hide(C_Item)
{
	name = "Варанья кожа";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_WaranHaut;
	visual = "ItAt_Lurker_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_Waran_Hide_Dissected(C_Item)
{
	name = "Полоски вараньей кожи";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_WaranHaut / 8;
	visual = "ItAt_Lurker_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_Crawler_02(C_Item)
{
	name = "Панцирная пластина ползуна-воина";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Panzerplatte;
	visual = "ItAt_Crawler_02.3DS";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_Crawler_01(C_Item)
{
	name = "Челюсти ползуна";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Crawlerzangen;
	visual = "ItAt_Crawler_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_Shadow_01(C_Item)
{
	name = "Шкура мракориса";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 0;
	visual = "ItAt_Shadowbeast_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_Shadow_02(C_Item)
{
	name = "Рог мракориса";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 0;
	visual = "ItAt_Shadowbeast_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_Lurker_01(C_Item)
{
	name = "Коготь шныга";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Lurkerklaue;
	visual = "ItAt_Lurker_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_Lurker_02(C_Item)
{
	name = "Шкура шныга";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_LurkerHaut;
	visual = "ItAt_Lurker_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_Lurker_Claws(C_Item)
{
	name = "Когти шныга";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_LurkerClaws;
	visual = "ItAt_Lurker_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_Lurker_Claws_Verkohlt(C_Item)
{
	name = "Обугленные когти шныга";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_LurkerClaws / 3;
	visual = "ItAt_Lurker_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_Lurker_Hide(C_Item)
{
	name = "Шкура шныга";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_LurkerHaut;
	visual = "ItAt_Lurker_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_Lurker_Hide_Dissected(C_Item)
{
	name = "Полоски шныговой кожи";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_LurkerHaut / 8;
	visual = "ItAt_Lurker_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_Snapper_Claws(C_Item)
{
	name = "Когти снеппера";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_SnapperClaws;
	visual = "ItAt_Lurker_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_Snapper_Claws_Verkohlt(C_Item)
{
	name = "Обугленные когти снеппера";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_SnapperClaws / 3;
	visual = "ItAt_Lurker_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_Snapper_Hide(C_Item)
{
	name = "Кожа снеппера";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_SnapperHaut;
	visual = "ItAt_Lurker_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_Snapper_Hide_Dissected(C_Item)
{
	name = "Полоски снепперовой кожи";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_SnapperHaut / 8;
	visual = "ItAt_Lurker_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_Snapper_Teeth(C_Item)
{
	name = "Зубы снеппера";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_SnapperTeeth;
	visual = "ItAt_Claws_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_Snapper_Teeth_Verkohlt(C_Item)
{
	name = "Обугленные зубы снеппера";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_SnapperTeeth / 3;
	visual = "ItAt_Claws_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_Razor_Claws(C_Item)
{
	name = "Когти штека";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_RazorClaws;
	visual = "ItAt_Lurker_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_Razor_Claws_Verkohlt(C_Item)
{
	name = "Обугленные когти штека";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_RazorClaws / 3;
	visual = "ItAt_Lurker_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_Razor_Hide(C_Item)
{
	name = "Кожа штека";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_RazorHaut;
	visual = "ItAt_Lurker_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_Razor_Hide_Dissected(C_Item)
{
	name = "Полоски штековой кожи";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_RazorHaut / 8;
	visual = "ItAt_Lurker_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_Razor_Teeth(C_Item)
{
	name = "Зубы штека";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_RazorTeeth;
	visual = "ItAt_Claws_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_Razor_Teeth_Verkohlt(C_Item)
{
	name = "Обугленные зубы штека";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_RazorTeeth / 3;
	visual = "ItAt_Claws_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_Troll_02(C_Item)
{
	name = "Клык тролля";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Trollhauer;
	visual = "ItAt_Troll_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_Troll_01(C_Item)
{
	name = "Шкура тролля";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Trollfell;
	visual = "ItAt_Troll_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_Swampshark_01(C_Item)
{
	name = "Шкура болотожора";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Sumpfhaihaut;
	visual = "ItAt_Swampshark_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_Swampshark_02(C_Item)
{
	name = "Клык болотожора";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Sumpfhaizuhne;
	visual = "ItAt_Swampshark_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_Bloodfly_01(C_Item)
{
	name = "Крылья";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Flugel;
	visual = "ItAt_Bloodfly_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_Bloodfly_02(C_Item)
{
	name = "Жало шершня";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Stachel;
	visual = "ItAt_Bloodfly_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_StoneGolem_01(C_Item)
{
	name = "Сердце каменного голема";
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	spell = SPL_WINDFIST;
	value = Value_Steinherz;
	visual = "ItAt_StoneGolem_01.3DS";
	material = MAT_STONE;
	description = name;
	text[0] = "Это сердце добыто из тела";
	text[1] = "убитого каменного голема.";
	text[2] = "Оно обладает силой отбрасывать противника";
	text[3] = "на большое расстояние.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_FireGolem_01(C_Item)
{
	name = "Сердце огненного голема";
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	spell = SPL_FIREBALL;
	value = Value_Feuerherz;
	visual = "ItAt_FireGolem_01.3DS";
	material = MAT_STONE;
	description = name;
	text[0] = "Это сердце добыто из тела";
	text[1] = "убитого огненного голема.";
	text[2] = "Оно обладает силой сжигать";
	text[3] = "противника заживо.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_IceGolem_01(C_Item)
{
	name = "Сердце ледяного голема";
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	spell = SPL_ICECUBE;
	value = Value_Eisherz;
	visual = "ItAt_IceGolem_01.3DS";
	material = MAT_STONE;
	description = name;
	text[0] = "Это сердце добыто из тела";
	text[1] = "убитого ледяного голема.";
	text[2] = "Оно обладает силой превращать";
	text[3] = "противника в ледяную глыбу.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_IceGolem_02(C_Item)
{
	name = "Осколок ледяного голема";
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	spell = SPL_THUNDERBOLT;
	value = Value_Eistueck;
	visual = "ItAt_IceGolem_01.3DS";
	material = MAT_STONE;
	description = name;
	text[0] = "Это осколок от тела";
	text[1] = "убитого ледяного голема.";
	text[5] = NAME_Value;
	count[5] = value;
};

