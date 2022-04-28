
instance ItWrFocusmapPsi(C_Item)
{
	name = "Карта";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 15;
	visual = "ItWrFocusMapPsi.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = UseFocusmapPsi;
	description = "Карта Юбериона";
	text[1] = "На этой карте отмечена дорога";
	text[2] = "к юнитору, который нужен Юбериону";
	text[3] = "для вызова Спящего.";
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseFocusmapPsi()
{
	var int nDocID;
	nDocID = Doc_CreateMap();
	Doc_SetLevel(nDocID,"WORLD.ZEN");
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Map_World_FocusPSI.tga",1);
	Doc_Show(nDocID);
};


instance Focus_1(C_Item)
{
	name = "Юнитор";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItMi_Focus_01.3ds";
	material = MAT_STONE;
	description = "Юнитор со скалы";
	text[1] = "Один из пяти юниторов, которые использовались";
	text[2] = "для создания магического Барьера.";
};

instance ItMi_Stuff_Gearwheel_01(C_Item)
{
	name = "Шестеренка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItMi_Stuff_Gearwheel_01.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Она находилась в старом прессе,";
	text[1] = "в одной из покинутых штолен";
	text[2] = "Старой шахты.";
};

instance ItAt_Crawlerqueen(C_Item)
{
	name = "Яйцо ползуна";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 100;
	visual = "ItAt_Crawlerqueen.3ds";
	material = MAT_LEATHER;
	description = name;
	text[0] = "Эти яйца отложила";
	text[1] = "королева ползунов.";
	text[2] = "Они содержат вещество,";
	text[3] = "которое гораздо сильнее слюны ползунов.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItWrFokusbuch(C_Item)
{
	name = "Альманах";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_Almanac.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = UseItWrFokusbuch;
	description = name;
	text[0] = "Эта древняя волшебная книга содержит";
	text[1] = "множество заклинаний, которые читаются";
	text[2] = "при использовании юниторов.";
};


func void UseItWrFokusbuch()
{
	var int nDocID;
	if((Wissen_Almanach == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(50);
		Wissen_Almanach = TRUE;
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"Глава 23");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,-1,"font_10_book.TGA");
	Doc_PrintLine(nDocID,0,"Объединение силы");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Постоянно растущая магическая энергия, которую содержат камни, освобождается во время чтения заклинания. Будет ли это происходить постепенно или за один раз, решать магу.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Как только юнитор лишится энергии, он станет пустым.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Слова силы, которые позволят освободить энергию юнитора, может прочитать любой маг, знающий древние магические арканы. Он также сможет зарядить этой энергией новый артефакт. Это гораздо легче, чем познание тайн мудрых.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Но зарядить пустой юнитор сможет только избранный. Это служит знаком высочайшего дара богов.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"А теперь освободи свое сердце, чтобы принять слова древней силы.");
	Doc_Show(nDocID);
};

