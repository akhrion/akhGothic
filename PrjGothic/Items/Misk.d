
const int Value_MobsiItem = 2;
const int Value_SwordBlade = 60;
const int Value_SwordBladeHot = 50;
const int Value_SwordRawHot = 15;
const int Value_SwordRaw = 10;
const int Value_Dietrich = 10;
const int Value_Schlьssel = 2;
const int Value_Joint1 = 8;
const int Value_Joint2 = 10;
const int Value_Joint3 = 16;
const int Value_Laute = 10;
const int Value_Erzbrocken = 1;
const int Value_Fackel = 5;
const int Value_Sumpfkraut = 4;
const int Value_Pfeife = 4;
const int Value_Rasiermesser = 2;
const int Value_Mьnze = 0;
const int Value_Schьssel = 2;
const int Value_Kerzenstдnder = 2;
const int Value_Becher = 2;
const int Value_Pokal = 10;
const int Value_Besteck = 6;
const int Value_Pfanne = 2;
const int Value_Krug = 2;
const int Value_Amphore = 2;
const int Value_Statue = 4;
const int Value_Schwefel = 6;
const int Value_Quecksilber = 8;
const int Value_Salz = 10;
const int Value_Цl = 8;
const int Value_Moleratfett = 5;
const int Value_Alcohol = 18;

instance ItKeLockpick(C_Item)
{
	name = "Отмычка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Dietrich;
	visual = "ItKe_Lockpick_01.3ds";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = Value_Dietrich;
};

instance ItKeKey1(C_Item)
{
	name = "Ключ";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = Value_Schlьssel;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
};

instance ItKeKey2(C_Item)
{
	name = "Ключ";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = Value_Schlьssel;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
};

instance ItKeKey3(C_Item)
{
	name = "Ключ";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = Value_Schlьssel;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
};

instance ItKeKey4(C_Item)
{
	name = "Ключ";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = Value_Schlьssel;
	visual = "ItKe_Key_04.3ds";
	material = MAT_METAL;
	description = name;
};

instance ItKeCavalorn01(C_Item)
{
	name = "Ключ Кавалорна";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_04.3ds";
	material = MAT_METAL;
	description = name;
};

instance ItMiStomper(C_Item)
{
	name = "Пест";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_MobsiItem;
	visual = "ItMi_Stomper_01.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = Value_MobsiItem;
};

instance ItMiHammer(C_Item)
{
	name = "Молоток";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_MobsiItem;
	visual = "ItMi_Hammer_01.3DS";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_Value;
	count[5] = Value_MobsiItem;
};

instance ItMiScoop(C_Item)
{
	name = "Черпак";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_MobsiItem;
	visual = "ItMi_Scoop_01.3DS";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_Value;
	count[5] = Value_MobsiItem;
};

instance ItMiFlask(C_Item)
{
	name = "Флакон";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 5;
	visual = "ItMiFlask.3ds";
	material = MAT_GLAS;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMiSwordraw(C_Item)
{
	name = "Сырая сталь";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_SwordRaw;
	visual = "ItMi_SmithSword_Raw_01.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMiSwordrawhot(C_Item)
{
	name = "Раскаленная сталь";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_SwordRawHot;
	visual = "ItMi_SmithSword_Rawhot_01.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMiSwordbladehot(C_Item)
{
	name = "Раскаленный клинок";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_SwordBladeHot;
	visual = "ItMi_SmithSword_Bladehot_01.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMiSwordblade(C_Item)
{
	name = "Клинок";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_SwordBlade;
	visual = "ItMi_SmithSword_Blade_01.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItLsTorchFirespit(C_Item)
{
	name = "Факел";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_BURN | ITEM_TORCH;
	value = Value_MobsiItem;
	visual = "ITLSTORCHBURNING.ZEN";
	material = MAT_WOOD;
	scemeName = "FIRESPIT";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMiLute(C_Item)
{
	name = "Лютня";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Laute;
	visual = "ItMi_Lute_01.3DS";
	material = MAT_WOOD;
	scemeName = "LUTE";
	on_state[0] = UseLute;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseLute()
{
	if((Play_Lute == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(10);
		Play_Lute = TRUE;
	};
};


instance ItMiWedel(C_Item)
{
	name = "Пальмовый веер";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_MobsiItem;
	visual = "ItMi_Wedel_01.3ds";
	material = MAT_LEATHER;
	scemeName = "COOLAIR";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMiBrush(C_Item)
{
	name = "Щетка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_MobsiItem;
	visual = "ItMi_Brush_01.3ds";
	material = MAT_GLAS;
	scemeName = "BRUSH";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMiJoint_1(C_Item)
{
	name = "Новичок";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Joint1;
	visual = "ItMi_Joint_01.3ds";
	material = MAT_LEATHER;
	scemeName = "JOINT";
	on_state[0] = UseItMiJoint_1;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseItMiJoint_1()
{
	if((Firstjoint == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(5);
		Firstjoint = TRUE;
	};
};


instance ItMiJoint_2(C_Item)
{
	name = "Северный темный";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Joint2;
	visual = "ItMi_Joint_01.3ds";
	material = MAT_LEATHER;
	scemeName = "JOINT";
	on_state[0] = UseItMiJoint_2;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseItMiJoint_2()
{
	if((Secondjoint == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(10);
		Secondjoint = TRUE;
	};
};


instance ItMiJoint_3(C_Item)
{
	name = "Зов мечты";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Joint3;
	visual = "ItMi_Joint_01.3ds";
	material = MAT_LEATHER;
	scemeName = "JOINT";
	on_state[0] = UseItMiJoint_3;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

func void changeAttributesjoint3()
{
	//Квест для болотного лагеря: регулярно посещай духовные практики и ты раскроешь всю силу данной функции.. третья стена рушится. или четвертая..
	//А вообще.. с этими косяками можно целый ритуал забацать..
	//Только надо всё грамотно обмозговать ;) по, что красуется ниже - детский сад ;)
	//Кстати вы не задумывались о том, что количество LP может быть равно и 50 за уровень..
	//Вы не задумывались о том, что ГГ на старте может идти и убивать Тролля.. держа его в идиотском станлоке
	//Да даже орка можно заколупать приноровившись и это на лвл ван..РПГ-игра.. помоему выглядит чрезвычайно сыро.
	//Но я просто сетую.. так-то мне Готика очень нравится, но не думаю, что ребаланс это испортит.
	//А может и испортит.
	B_RaiseAttribute(ATR_MANA_MAX,2);
	Npc_ChangeAttribute(self,ATR_MANA,2);
	Npc_ChangeAttribute(self,ATR_STRENGTH,2);
	Npc_ChangeAttribute(self,ATR_DEXTERITY,2);
	Npc_ChangeAttribute(self,ATR_HITPOINTS_MAX,-6);
	Npc_ChangeAttribute(self,ATR_HITPOINTS,-6);
};
var int night; var int morning; var int middle; var int evening;
func void changeAttributesjoint3_Condition(){
	var int today; today = Wld_GetDay();
	if(Wld_IsTime(0,0,6,0))
	{
		if(night < today)
		{
			night = today;
			changeAttributesjoint3();
		};
	} else if(Wld_IsTime(6,0,12,0))
	{
		if(morning < today)
		{
			morning = today;
			changeAttributesjoint3();
		};
	} else if(Wld_IsTime(12,0,18,0))
	{
		if(middle < today)
		{
			middle = today;
			changeAttributesjoint3();
		};
	} else {
		if(evening < today)
		{
			evening = today;
			changeAttributesjoint3();
		};
	};
};

func void UseItMiJoint_3()
{
	if(
		Npc_IsPlayer(self) &&
		self.guild == GIL_NOV ||
		self.guild == GIL_TPL ||
		self.guild == GIL_GUR
	){
		changeAttributesjoint3_Condition();
	};

};


instance ItMiNugget(C_Item)
{
	name = "Кусок руды";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Erzbrocken;
	visual = "ItMi_Nugget_01.3ds";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItLsTorch(C_Item)
{
	name = "Факел";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_BURN | ITEM_TORCH | ITEM_MULTI;
	value = Value_Fackel;
	visual = "ItLs_Torch_01.3ds";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItLsTorchburning(C_Item)
{
	name = "Горящий факел";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_BURN | ITEM_TORCH;
	value = 0;
	visual = "ITLSTORCHBURNING.ZEN";
	material = MAT_WOOD;
	description = name;
};

instance ItLsTorchburned(C_Item)
{
	name = "Сгоревший факел";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 0;
	visual = "ItLs_Torchburned_01.3ds";
	material = MAT_WOOD;
	description = name;
};

instance ItMi_Plants_Swampherb_01(C_Item)
{
	name = "Болотник";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Sumpfkraut;
	visual = "ItMi_Plants_Swampherb_01.3ds";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_Stuff_Pipe_01(C_Item)
{
	name = "Трубка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Pfeife;
	visual = "ItMi_Stuff_Pipe_01.3DS";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_Stuff_Barbknife_01(C_Item)
{
	name = "Бритвенный нож";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Rasiermesser;
	visual = "ItMi_Stuff_Barbknife_01.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_Stuff_OldCoin_01(C_Item)
{
	name = "Старая монета";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Mьnze;
	visual = "ItMi_Stuff_OldCoin_01.3DS";
	material = MAT_METAL;
	description = name;
};

instance ItMi_Stuff_Plate_01(C_Item)
{
	name = "Тарелка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Schьssel;
	visual = "ItMi_Stuff_Plate_01.3DS";
	material = MAT_CLAY;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_Stuff_Candel_01(C_Item)
{
	name = "Свеча";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Kerzenstдnder;
	visual = "ItMi_Stuff_Candel_01.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_Stuff_Cup_01(C_Item)
{
	name = "Бокал";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Becher;
	visual = "ItMi_Stuff_Cup_01.3DS";
	material = MAT_CLAY;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_Stuff_Cup_02(C_Item)
{
	name = "Кубок";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Pokal;
	visual = "ItMi_Stuff_Cup_02.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_Stuff_Silverware_01(C_Item)
{
	name = "Столовый набор";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Besteck;
	visual = "ItMi_Stuff_Silverware_01.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_Stuff_Pan_01(C_Item)
{
	name = "Сковорода";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Pfanne;
	visual = "ItMi_Stuff_Pan_01.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_Stuff_Mug_01(C_Item)
{
	name = "Кружка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Krug;
	visual = "ItMi_Stuff_Mug_01.3DS";
	material = MAT_CLAY;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_Stuff_Amphore_01(C_Item)
{
	name = "Амфора";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Amphore;
	visual = "ItMi_Stuff_Amphore_01.3DS";
	material = MAT_CLAY;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_Stuff_Idol_Ogront_01(C_Item)
{
	name = "Фигурка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Statue;
	visual = "ItMi_Stuff_Idol_Ogront_01.3DS";
	material = MAT_CLAY;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_Alchemy_Sulphur_01(C_Item)
{
	name = "Сера";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Schwefel;
	visual = "ItMi_Alchemy_Sulphur_01.3DS";
	material = MAT_CLAY;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_Alchemy_Quicksilver_01(C_Item)
{
	name = "Ртуть";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Quecksilber;
	visual = "ItMi_Alchemy_Quicksilver_01.3DS";
	material = MAT_CLAY;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	scemeName = "MAP";
	on_state[0] = Use_ItMi_Alchemy_Quicksilver_01;
};

instance ItMi_Alchemy_Ash_01(C_Item)
{
	name = "Пепел";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Pfeife;
	visual = "ItMi_Alchemy_Salt_01.3DS";
//	visual = "ItMi_Alchemy_Ash_01.3DS";
	material = MAT_CLAY;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_Alchemy_Salt_01(C_Item)
{
	name = "Соль";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Salz;
	visual = "ItMi_Alchemy_Salt_01.3DS";
	material = MAT_CLAY;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_Alchemy_Syrianoil_01(C_Item)
{
	name = "Масло";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Цl;
	visual = "ItMi_Alchemy_Syrianoil_01.3DS";
	material = MAT_CLAY;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_Alchemy_Moleratlubric_01(C_Item)
{
	name = "Жир кротокрыса";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Moleratfett;
	visual = "ItMi_Alchemy_Moleratlubric_01.3DS";
	material = MAT_CLAY;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_Alchemy_Alcohol_01(C_Item)
{
	name = "Чистый спирт";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Alcohol;
	visual = "ItMi_Alchemy_Alcohol_01.3DS";
	material = MAT_CLAY;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITKE_QUENTIN(C_Item)
{
	name = "Ключ Квентина";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_04.3ds";
	material = MAT_METAL;
	description = name;
};

instance ITKE_GILBERT(C_Item)
{
	name = "Дубликат ключа";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Его дал мне Гилберт";
};

instance ORIK_KEY(C_Item)
{
	name = "Ключ Орика";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
};

instance ITKE_TOWER_01(C_Item)
{
	name = "Ключ";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
//	text = "111111111 222222 33333 44444 5555  66666 77  77 77 788 88 88 88 899 9 9";
	text[0] = "Я нашел его на столе повора";
	text[1] = "во внутреннем кольце Старого лагеря";
	
};

instance ITKE_YBERION(C_Item)
{
	name = "Ключ Юбериона";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
};

instance ALEXSTUFF(C_Item)
{
	name = "Маскировка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "grdl.3ds";
	material = MAT_LEATHER;
	description = name;
	text[1] = "Вещи, нужные для побега Алекса:";
	text[2] = "одежда стражника и короткий меч.";
};

instance WEEDPACK(C_Item)
{
	name = "Пакет с травой";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 100;
	visual = "ItMi_Packet.3ds";
	material = MAT_LEATHER;
	on_state[0] = UseWEEDPACK;
	scemeName = "MAP";
	description = name;
	text[1] = "Урожай сборщиков болотника.";
	text[2] = "Сайфер хорошо за него заплатит.";
	text[3] = "Или-же все-таки отнести его Галому..";
	text[5] = NAME_Value;
	count[5] = value;
};

func void UseWEEDPACK()
{
	if(Npc_IsPlayer(self))
	{
		Npc_RemoveInvItem(self,weedpack);
		CreateInvItems(self,ItMi_Plants_Swampherb_01,50);
	};
};


instance FAKEITEM(C_Item)
{
	name = " ";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 0;
	visual = "fakeitem.3ds";
	material = MAT_LEATHER;
	scemeName = "USEFAKEITEM";
	on_state[0] = usefakeitem;
	description = name;
};


func void usefakeitem()
{
	PrintScreen(SCREENMESSAGE,-1,37,"FONT_OLD_10_WHITE.TGA",3);
};


instance FAKEITEM2(C_Item)
{
	name = " ";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 0;
	visual = "fakeitem.3ds";
	material = MAT_LEATHER;
	scemeName = "USEFAKEITEM";
	on_state[0] = usefakeitem2;
	description = name;
};


func void usefakeitem2()
{
	PrintScreen(SCREENMESSAGE2,-1,40,"FONT_OLD_10_WHITE.TGA",3);
};

instance ItAmScavengerSoul(C_ITEM)
{
};
instance ItAmD0(C_ITEM)
{
	name = "Дихлофос0 Меч";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_WOOD;
	value = 0;
	damageTotal = 0;
//	damagetype = DAM_BLUNT;
	range = 300;
//	cond_atr[2] = ATR_STRENGTH;
//	cond_value[2] = 5;
	visual = "ItMi_Stuff_Amphore_01.3DS";
	
};
instance ItAmD1(C_ITEM)
{
	name = "Дихлофос1 Гореть";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_BURN;
	material = MAT_WOOD;
	value = 0;
	damageTotal = 0;
//	damagetype = DAM_BLUNT;
	range = 100;
//	cond_atr[2] = ATR_STRENGTH;
//	cond_value[2] = 5;
	visual = "ItMi_Stuff_Amphore_01.3DS";
	
};
instance ItAmD2(C_ITEM)
{
	name = "Дихлофос2 Бросок";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_THROW;
	material = MAT_WOOD;
	value = 0;
	damageTotal = 0;
//	damagetype = DAM_BLUNT;
	range = 100;
//	cond_atr[2] = ATR_STRENGTH;
//	cond_value[2] = 5;
	visual = "ItMi_Stuff_Amphore_01.3DS";
	
};
instance ItAmD3(C_ITEM)
{
	name = "Дихлофос3 Миссия";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_MISSION;
	material = MAT_WOOD;
	value = 0;
	damageTotal = 0;
//	damagetype = DAM_BLUNT;
	range = 100;
//	cond_atr[2] = ATR_STRENGTH;
//	cond_value[2] = 5;
	visual = "ItMi_Stuff_Amphore_01.3DS";
	
};
instance ItAmD4(C_ITEM)
{
	name = "Дихлофос4 Мульти";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_MULTI;
	material = MAT_WOOD;
	value = 0;
	damageTotal = 0;
//	damagetype = DAM_BLUNT;
	range = 100;
//	cond_atr[2] = ATR_STRENGTH;
//	cond_value[2] = 5;
	visual = "ItMi_Stuff_Amphore_01.3DS";
	
};
instance ItAmD5(C_ITEM)
{
	name = "Дихлофос5 Кольцо";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_RING;
	material = MAT_WOOD;
	value = 0;
	damageTotal = 0;
//	damagetype = DAM_BLUNT;
	range = 100;
//	cond_atr[2] = ATR_STRENGTH;
//	cond_value[2] = 5;
	visual = "ItMi_Stuff_Amphore_01.3DS";
	
};
