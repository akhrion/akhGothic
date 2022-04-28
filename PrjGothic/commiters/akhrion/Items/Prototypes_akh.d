prototype prot_akh_itemBow_ext(C_ITEM_EXT)
{
	name = "";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	damagetype = DAM_POINT;
	munition = ItAmArrow;
	quality = "1.2";
	description = name;
	text[1] = "Тугость тетивы:";
	text[2] = getConcatSIS("Процент ловкости идущей в урон: ",count[2], "%");
	text[5] = getConcatSIS(NAME_Value, value, " руды");
};

//AKH WORKING
prototype prot_akh_itemBow(C_ITEM)
{
	//Из-за ограничений даедалуса придётся изменить реализацию.
	//Урон будет зависить от процента крита.
	//Крит может быть больше 100 - до 100 охотник узнаёт главные места противника и потому урон значительно возрастает
	//			но после 100 урон возрастает слабее и контролируется функцией.
	//Ловкость влияет только на дисстанцию стрельбы. Но мы всё ещё можем на лук поставить -ATR_DEXTERITY..
	name = "";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	damagetype = DAM_POINT;
	damageTotal = 100;
	munition = ItAmArrow;
	description = name;
	text[1] = "Тугость тетивы:";
	text[2] = getConcatSIS("Процент ловкости идущей в урон: ",count[2], "%");// инициализация через константы
	text[5] = getConcatSIS(NAME_Value, value, " руды");	//value and остальное через константы.. мне не совсем
															//нравится такое решение, но как иначе?
};