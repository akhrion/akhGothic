
instance ItWr_GolemBook1(C_Item)
{
	name = "Арканум Голум - Том I";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = UseGolemBook1;
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseGolemBook1()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"АРКАНУМ ГОЛУМ - Том I");
	Doc_PrintLine(nDocID,0,"=====================");
	Doc_PrintLines(nDocID,0,"(Магия големов)");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Только тот, кому хотя бы однажды удалось встретиться с этим созданием, сможет понять, с каким интересом встречает это магическое существо любознательного путешественника.");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"Каменный голем");
	Doc_PrintLine(nDocID,1,"------------");
	Doc_PrintLines(nDocID,1,"Эти каменные великаны почти неуязвимы в бою. Мечи, топоры, стрелы не причиняют им никакого ущерба.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Единственный достоверный рассказ о победе над каменным големом был записан одним солдатом. Его удалось победить боевым молотом.");
	Doc_Show(nDocID);
};


instance ItWr_GolemBook2(C_Item)
{
	name = "Арканум Голум - Том II";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = UseGolemBook2;
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseGolemBook2()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"АРКАНУМ ГОЛУМ - Том II");
	Doc_PrintLine(nDocID,0,"======================");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Ледяной голем");
	Doc_PrintLine(nDocID,0,"---------");
	Doc_PrintLines(nDocID,0,"Ледяные големы подобны каменным. Они полностью состоят изо льда. Все знакомое нам оружие просто соскальзывает по его телу, не причиняя никакого вреда.");
	Doc_PrintLines(nDocID,0,"Искателям приключений следует знать, что дыхание этого голема очень опасно. Если подойти к нему слишком близко, он может превратить вас в ледяную колонну.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLines(nDocID,1,"Один из магов огня рассказывал о встрече с ледяным големом. Кажется, ему было легко справиться с этим чудовищем.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Огненный голем");
	Doc_PrintLine(nDocID,1,"------------");
	Doc_PrintLines(nDocID,1,"Как говорят, эти огненные создания могут одним своим прикосновением превратить свою жертву в пылающий факел.");
	Doc_PrintLines(nDocID,1,"Год назад группа охотников столкнулась с одним из этих чудовищ. Исход битвы неизвестен, но некоторые утверждают, что молнии и лед смогли усмирить адское создание.");
	Doc_Show(nDocID);
};


instance ItWrWorldmap_Orc(C_Item)
{
	name = "Карта";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWrWorldMap_Orc.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = UseWorldmap_Orc;
	description = "Карта колонии (дополненная)";
	text[0] = "Орк-шаман Ур-Шак дорисовал на этой";
	text[1] = "карте земли орков!";
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseWorldmap_Orc()
{
	var int nDocID;
	nDocID = Doc_CreateMap();
	Doc_SetLevel(nDocID,"WORLD.ZEN");
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Map_World_Orc.tga",1);
	Doc_Show(nDocID);
};


instance ItKe_Freemine(C_Item)
{
	name = "Ключ";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = "Ключ от Свободной шахты";
};

instance OrcMedicine(C_Item)
{
	name = "Снадобье орка";
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "itmi_alchemy_stoneoil_02.3DS";
	material = MAT_GLAS;
	on_state[0] = UseOrcMedicine;
	scemeName = "POTION";
	description = name;
	text[1] = "Действие: неизвестно";
};


func void UseOrcMedicine()
{
	if(C_NpcIsOrc(self))
	{
		Print("ORK DRINKEN");
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	}
	else
	{
//		Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
		Mdl_SetModelScale(self,1.3,1.15,1.1);
		Mdl_SetModelFatness(self,1.5);
		//Альтернатива:
		//Зелье не убивает, а отнимает статы
		//Частично статы возвращаются после нахождения второго зелья и возвращения его Орку-рабу.
		//Окончательно статы возвращаются после сна.
	};
};


instance UluMulu(C_Item)
{
	name = "Улу-Мулу";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	value = 1000;
	damageTotal = 35;
	damagetype = DAM_EDGE;
	range = 140;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMi_Amulet_Ulumulu_02.3ds";
	visual_skin = 0;
	material = MAT_WOOD;
	description = name;
	text[0] = "Великий знак силы и достоинства.";
	text[1] = "Его хозяин может не бояться орков!";
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

