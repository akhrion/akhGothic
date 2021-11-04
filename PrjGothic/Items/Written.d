
instance ItWr_Book_Circle_01(C_Item)
{
	name = "������ ���� �����";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 50;
	visual = "ItWr_Book_Magic.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "������ ���� �����";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseItWr_Book_Circle_01;
};


func void UseItWr_Book_Circle_01()
{
	var int nDocID;
	var string text;
	var string Text_1;
	var string Text_2;
	text = ConcatStrings(NAME_Manakosten,IntToString(SPL_SENDCAST_LIGHT));
	Text_1 = ConcatStrings(NAME_Manakosten,IntToString(SPL_SENDCAST_THUNDERBOLT));
	Text_2 = ConcatStrings(NAME_Manakosten,IntToString(SPL_SENDCAST_FIREBOLT));
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"������ ���� �����");
	Doc_PrintLine(nDocID,0,"---------------");
	Doc_SetFont(nDocID,-1,"font_10_book.TGA");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"����� ���� �������� �������� ����������� ������������ ��� ����� � ������������ ���, ��� �������� ��� �������, ����������� ��������� ����. ����� ����� ����� �� ���� �������� ������ �������� � ������������� ���� ���������� ������������ ����. �������� ������ ������ �����, ��� ����� ������ ������������ ����������.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"����");
	Doc_PrintLine(nDocID,1,"---------------");
	Doc_PrintLines(nDocID,1,"������ ��� ������ �����. ��� ������� ���� ���������� ���.");
	Doc_PrintLine(nDocID,1,text);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"������� ������");
	Doc_PrintLine(nDocID,1,"---------------");
	Doc_PrintLines(nDocID,1,"������� ���������� �������.");
	Doc_PrintLine(nDocID,1,Text_1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"�������� ������");
	Doc_PrintLine(nDocID,1,"---------------");
	Doc_PrintLines(nDocID,1,"������� ����������� ����.");
	Doc_PrintLine(nDocID,1,Text_2);
	Doc_Show(nDocID);
	if(MANABOOK1 == FALSE)
	{
		B_RaiseAttribute(ATR_MANA_MAX,1);
		Npc_ChangeAttribute(self,ATR_MANA,1);
		MANABOOK1 = TRUE;
	};
};


instance ItWr_Book_Circle_02(C_Item)
{
	name = "������ ���� �����";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_Magic.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "������ ���� �����";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseItWr_Book_Circle_02;
};


func void UseItWr_Book_Circle_02()
{
	var int nDocID;
	var string Text_1;
	Text_1 = ConcatStrings(NAME_Manakosten,IntToString(SPL_HEALING_HP_PER_MP));
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"������ ���� �����");
	Doc_PrintLine(nDocID,0,"---------------");
	Doc_SetFont(nDocID,-1,"font_10_book.TGA");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"��� ���������� ������������ ���������� ������� ����� ����, ��� �� ����������. ������ �������� �������� �����.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"������ ���������� ���������� �������� � ���� ����� �������, ������� ���������� ���������� �����.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"���������");
	Doc_PrintLine(nDocID,1,"---------------");
	Doc_PrintLines(nDocID,1,"������ ������, ��� ���� �� ����������, ��� ��� ������� �� ���� �������. � �� �����, ��� �� ����� ����������� �������, � ���� ����� ����������� �������� ���� ����.");
	Doc_PrintLines(nDocID,1,"��� ���������� ����������� ����, ���������� ����.");
	Doc_PrintLine(nDocID,1,NAME_Spell_Invest);
	Doc_PrintLine(nDocID,1,Text_1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_Show(nDocID);
	if(MANABOOK2 == FALSE)
	{
		B_RaiseAttribute(ATR_MANA_MAX,1);
		Npc_ChangeAttribute(self,ATR_MANA,1);
		MANABOOK2 = TRUE;
	};
};


instance ItWr_Book_Circle_03(C_Item)
{
	name = "������ ���� �����";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 150;
	visual = "ItWr_Book_Magic.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "������ ���� �����";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseItWr_Book_Circle_03;
};


func void UseItWr_Book_Circle_03()
{
	var int nDocID;
	var string text;
	var string Text_1;
	var string Text_2;
	text = ConcatStrings(NAME_Manakosten,IntToString(SPL_SENDCAST_FIREBALL));
	Text_1 = ConcatStrings(NAME_Manakosten,IntToString(SPL_SENDCAST_ICECUBE));
	Text_2 = ConcatStrings(NAME_Manakosten,IntToString(SPL_SENDCAST_THUNDERBALL));
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"������ ���� �����");
	Doc_PrintLine(nDocID,0,"---------------");
	Doc_SetFont(nDocID,-1,"font_10_book.TGA");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"��������� ���������� ���������� ������������ ���������� ���������� ����. ��� ���������� ��������� ������������.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"������ ���������� ����������� �� ��� ���, ���� ��� ����� ����������� �� ��� ���� ���������� �������. ��� ���������� �������������� ������������.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"�������� ���");
	Doc_PrintLine(nDocID,1,"---------------");
	Doc_PrintLines(nDocID,1,"������ ��� ������ ����� ����. �������� ���, ��������� ���� ������.");
	Doc_PrintLine(nDocID,1,NAME_Spell_Load);
	Doc_PrintLine(nDocID,1,text);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"������� �����");
	Doc_PrintLine(nDocID,1,"---------------");
	Doc_PrintLines(nDocID,1,"������ ������������ � ������� �����. ��� ���������� ����� ����.");
	Doc_PrintLine(nDocID,1,Text_1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"������� ������");
	Doc_PrintLine(nDocID,1,"---------------");
	Doc_PrintLines(nDocID,1,"���, ��������� �� ���������� �������.");
	Doc_PrintLine(nDocID,1,Text_2);
	Doc_Show(nDocID);
	if(MANABOOK3 == FALSE)
	{
		B_RaiseAttribute(ATR_MANA_MAX,1);
		Npc_ChangeAttribute(self,ATR_MANA,1);
		MANABOOK3 = TRUE;
	};
};


instance ItWr_Book_Circle_04(C_Item)
{
	name = "��������� ���� �����";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 200;
	visual = "ItWr_Book_Magic.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "��������� ���� �����";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseItWr_Book_Circle_04;
};


func void UseItWr_Book_Circle_04()
{
	var int nDocID;
	var string text;
	var string Text_1;
	var string Text_2;
	text = ConcatStrings(NAME_Manakosten,IntToString(SPL_SENDCAST_FIRESTORM));
	Text_1 = ConcatStrings(NAME_Manakosten,IntToString(SPL_ZAPPED_DAMAGE_PER_SEC));
	Text_2 = ConcatStrings(NAME_Manakosten,IntToString(SPL_SENDCAST_DESTROYUNDEAD));
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"��������� ���� �����");
	Doc_PrintLine(nDocID,0,"---------------");
	Doc_SetFont(nDocID,-1,"font_10_book.TGA");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"����� ������������");
	Doc_PrintLine(nDocID,0,"---------------");
	Doc_PrintLines(nDocID,0,"������� �����������: �������� �� ��, ��� ���������� ��������� � ����, ��� ����� ���� ��������� ������, ��� �������� ���������� �����. ��� ���� ������� ���������� ����� �������������. ��� ���� �� ���������� �����������.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"�������� �����");
	Doc_PrintLine(nDocID,1,"---------------");
	Doc_PrintLines(nDocID,1,"��� ���������� ��������� ��� �������� ��� �� ������ ����������, � ����� ����������� �� ������, ������� ����� ����.");
	Doc_PrintLine(nDocID,1,NAME_Spell_Load);
	Doc_PrintLine(nDocID,1,text);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"������");
	Doc_PrintLine(nDocID,1,"---------------");
	Doc_PrintLines(nDocID,1,"���������� ��������� �� ������ ������. ��� ���� ������ ��������������, ���� ������� ��������� ��� ������������.");
	Doc_PrintLine(nDocID,1,Text_1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"����������� ������");
	Doc_PrintLine(nDocID,1,"---------------");
	Doc_PrintLines(nDocID,1,"��� ���������� ���������� ��������, ����������� �����.");
	Doc_PrintLine(nDocID,1,Text_2);
	Doc_Show(nDocID);
	if(MANABOOK4 == FALSE)
	{
		B_RaiseAttribute(ATR_MANA_MAX,1);
		Npc_ChangeAttribute(self,ATR_MANA,1);
		MANABOOK4 = TRUE;
	};
};


instance ItWr_Book_Circle_05(C_Item)
{
	name = "����� ���� �����";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 250;
	visual = "ItWr_Book_Magic.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "����� ���� �����";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseItWr_Book_Circle_05;
};


func void UseItWr_Book_Circle_05()
{
	var int nDocID;
	var string Text_1;
	var string Text_2;
	Text_1 = ConcatStrings(NAME_Manakosten,IntToString(SPL_SENDCAST_FIRERAIN));
	Text_2 = ConcatStrings(NAME_Manakosten,IntToString(SPL_SENDCAST_ICEWAVE));
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"����� ���� �����");
	Doc_PrintLine(nDocID,0,"---------------");
	Doc_SetFont(nDocID,-1,"font_10_book.TGA");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"�������� �����");
	Doc_PrintLine(nDocID,0,"---------------");
	Doc_PrintLines(nDocID,0,"���� ������������� ���� �������� ����� ����� ��������, ����������� � ���� ������ ����.");
	Doc_PrintLine(nDocID,0,Text_1);
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"������� �����");
	Doc_PrintLine(nDocID,1,"---------------");
	Doc_PrintLines(nDocID,1,"����� ����������� ���� ��������� ���� ����������� � ������������ �� �� �������� �����. ������ ��������� �����������, �� ��� ���� ���������� ������ ���� ��������� ����.");
	Doc_PrintLines(nDocID,1,"���������� ����� ����.");
	Doc_PrintLine(nDocID,1,Text_2);
	Doc_Show(nDocID);
	if(MANABOOK5 == FALSE)
	{
		B_RaiseAttribute(ATR_MANA_MAX,1);
		Npc_ChangeAttribute(self,ATR_MANA,1);
		MANABOOK5 = TRUE;
	};
};


instance ItWr_Book_Circle_06(C_Item)
{
	name = "������ ���� �����";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 300;
	visual = "ItWr_Book_Magic2.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "������ ���� �����";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseItWr_Book_Circle_06;
};


func void UseItWr_Book_Circle_06()
{
	var int nDocID;
	var string text;
	text = ConcatStrings(NAME_Manakosten,IntToString(SPL_SENDCAST_BREATHOFDEATH));
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"������ ���� �����");
	Doc_PrintLine(nDocID,0,"---------------");
	Doc_SetFont(nDocID,-1,"font_10_book.TGA");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"������� ������");
	Doc_PrintLine(nDocID,0,"---------------");
	Doc_PrintLines(nDocID,0,"������� �������. ������ ����������� ����� �����, ��������� ��������� ����� ������.");
	Doc_PrintLine(nDocID,0,text);
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"����� ������");
	Doc_PrintLine(nDocID,1,"---------------");
	Doc_PrintLines(nDocID,1,"�������� �������� � ����, ���������� ������� �������.");
	Doc_PrintLines(nDocID,1,"����������� ������ ���� � ���, ��� ��� �������� ���� �������.");
	Doc_PrintLine(nDocID,1,"");
	Doc_Show(nDocID);
	if(MANABOOK6 == FALSE)
	{
		B_RaiseAttribute(ATR_MANA_MAX,1);
		Npc_ChangeAttribute(self,ATR_MANA,1);
		MANABOOK6 = TRUE;
	};
};


instance Goettergabe(C_Item)
{
	name = "��� �����";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "��� �����";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseGoettergabe;
};


func void UseGoettergabe()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"�����");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,-1,"font_10_book.TGA");
	Doc_PrintLine(nDocID,0,"��� �����");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"� ������� �������� ���� �������� ������� ����� � ������������� �����. �� ����� ������� ���������� ��� ��� �������? ��� ����� ����������� �����? ��� ����� �������������� ���� �� ���, ��� ��� ��������. ���� � �� �� ���� ������������, ����� ����� ��� ��������, ������� ��� ����������.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"�� ��� ������ ��� ����? ��� �������� ��, ��������� � � �� �� ����� ���������� ����� �����������? ����� ���� ��, ��� ��� ����. ����� ������ � �������������� ������� �����. ���� ����� ������ ������ ���������, � ���� ��� �������� ����������� �� ������������ � �������� ����� ��������� ��.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"������ ��� �����");
	Doc_Show(nDocID);
};


instance Geheimnisse_der_Zauberei(C_Item)
{
	name = "����� ����������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "����� ����������";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseGeheimnisse_der_Zauberei;
};


func void UseGeheimnisse_der_Zauberei()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"����� ����������");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"��� ��� �������� ���������� ���������� ����, � �� �� �����������. �� �������� ������������ ������ �� ��� ���������� ������� � ��������� �� ����� ����. �����, ����������� � ������� ��������� �����, ������ ����� �������� ���� ���, ����� �������� �����.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"���� ��� ���� �������� �������� ���������� ������, �����������, ��������� � ������� � ��� ������������ ���. � ������ ��������� ������������ ���� ������� ��������� ���� ��� �� ������ ���� � ���� ����, ������ � ���� �������� ����. �� �������� ���� �� �����������.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"������ ��� �����");
	Doc_Show(nDocID);
};


instance Machtvolle_Kunst(C_Item)
{
	name = "�������������� ���������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "�������������� ���������";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseMachtvolle_Kunst;
};


func void UseMachtvolle_Kunst()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"�������������� ���������");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"���� ��� ����������� � ��������� �����.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"� �������� ���������� ���� ����� ������������� ����������� ���� �������� �������. ������� ��� ����� � ���� ��� ������ ������. � ��� ����� � ��� ����� ����������, ����� ��� ����� ���������. �� ����� ���� ������ ����������� � ������������ � ����������� ����.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"�� ������ � ������, ���������� ������� � ������ ����. � ��� ���������� ���������� �� ����� � ������ �� ������� ��������. ���������� ������������ ���� - ��������� ���� ������� ����, ��� ��� ���� �������� ������ � ������ ����� ����� ������ ���, ������� �����-���� �������� ��������.");
	Doc_Show(nDocID);
};


instance Elementare_Arcanei(C_Item)
{
	name = "���������� ������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "���������� ������";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseElementare_Arcanei;
};


func void UseElementare_Arcanei()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"���������� ������");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"������������� ����� � ������������ � ������� ���������������.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"������ ���� ������������ ����� � �� ����� � ���� ���� ���� �����. ��� ����� �������, ��� ����� �������� ���������� ��������� ����. ��� ����� �������������� �� ������ ��������, ������� �� �������.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"���������� �������� � ����� ���� ������� � ����� ������ ��� �����, �� � ������� ����� ���������� ����������� ����� �����. ����������� ���� ��������� �� ������ ���� ������������� ���� �������� ��������������� ����, ��� ���������� ���� �������� � ����� ������ � ������ ��������, ������� ������ ����� ������������ � �������.");
	Doc_Show(nDocID);
};


instance Wahre_Macht(C_Item)
{
	name = "�������� ����";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "�������� ����";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseWahre_Macht;
};


func void UseWahre_Macht()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"�������� ����");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"������ ���� ������������");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"������ ���� �������� ���� �� �������� ��������. ������� ������������ ������ �� ������������ ����, �� �������� ���������, ��� �������� �� ��������� ������� � ������ ���� ��������.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"���� ��� ���� ������� ������, �� ������� � ���� ���������� ����� �� ������� ������ �������������, �� ����������� ��� �������� ���� ��������. �� ����� ���������� ������� ������� � ������������, ���� ����� ����� ������������� � ���� - ������ �� ������ ������ � ���� �� ����.");
	Doc_Show(nDocID);
};


instance Das_magische_Erz(C_Item)
{
	name = "���������� ����";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "���������� ����";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseDas_magische_Erz;
};


func void UseDas_magische_Erz()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"���������� ����");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"������ ���� ��� �����, ��� ��������, ����� ����� � ������ ��������. ��� ����� ������ ���� � ����. ��� �������� ���������� �������, �������� ��������������� ���������� � � �� �� ����� ����� � ���������. �� ���� ����, ���������� � ������ �������� ���� ��������, ������ ������ ������, � ������� �� ��������� �� ���� ������, ���������� �� ������� �����.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"��� ������ ���� ��� �������, ������� ���� �� ������� ����� ���. ������ � ����� ������� ������ ������ ������ �� ������ ����� ��������, � �� ���� ������� ��� �������� ����� ������. �� ���������� ���� ����� ����� ������. ����� ����� ��� ������ �� �� ������. �������, ����� ���� ���� �� ������ �������� ����� �����.");
	Doc_Show(nDocID);
};


instance Schlacht_um_Varant1(C_Item)
{
	name = "����� ��� �������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "����� ��� �������";
	text[0] = "��� 1";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseSchlacht_um_Varant1;
};


func void UseSchlacht_um_Varant1()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Red_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Red_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"... �� ������ ����� ����� ������� ������. �� ������ ���� ������ � ��� ���� �������� �� ����������� ����� ����� ��������� �����. �� ����� �� ������� ����� � ������, � ���� ��� ������ � ��������� ������������ � �������. �� �������� ����� ������ ������, � �������� �������. �� ����, ��� ��� ������ � ���� ����� ����� ��������� ��������� ������ � ������� ���, ����� ���� ������� � ������� �� ������...");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"... ������������ � ������� ��� �������������� ����. ��� ���������� ����� ���� �������� ������������, ����� ������ ��������� �� �����...");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"...������ ��� ����, ��� ����� �������, ��� ������� ������ � ���� ���. �� ����� �� ����� ���� ����������� �� ������� ����� ��������� ������ � �������� ���������� ����, ��� ������� � �����. ������ �� ����� ��������������� �������� � ���������� ��������� ������� ���������� �������� ������ ������...");
	Doc_Show(nDocID);
};


instance Schlacht_um_Varant2(C_Item)
{
	name = "����� ��� �������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "����� ��� �������";
	text[0] = "��� 2";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseSchlacht_um_Varant2;
};


func void UseSchlacht_um_Varant2()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Red_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Red_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"����� ����� ��� ��������. ������, ����������� ����������, ��� ��������� ����������. ������ ����� ����� �� ���������� �� ����� �������, � �������� ����� ��������� ����� ������������ � ����������� �������. � ������������� ����������� �������� ��� ������, �������� ��������� ������, ����� ��������� ������������ �������. �� ������ ��������� ��������� ��������.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"�� ������ ��� ������ ������ � ������. ��������� ������� ���������� � �����������. ��, ���� �� ������ ��������� �������, ������ ��� � �������. ������� ������� ������� �� ����� ��������� �� ������������ ���������. ��� ������ ���� �������� ��������� �������� ��, ������� �������� �� ������ � ������� �� ������ �� ������. ��������� ������� ��������� �� ������� �� ����� ������. �� ��� ��������.");
	Doc_Show(nDocID);
};


instance Myrtanas_Lyrik(C_Item)
{
	name = "������ �������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "������ �������";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseMyrtanas_Lyrik;
};


func void UseMyrtanas_Lyrik()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Red_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Red_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"    �����");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"                  ��������");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"������� ���, �� ������ ���������");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"��-�������� ������ ����� ����������.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"� ������ � ����� �������� �����,");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"� ������� ����� ������ ������.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"� �������� ���, ������� ����, ����");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"��������� ���������� ������ ������,");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"����������� �� ��� ������ �����,");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"��� ������� �� ������ ������� �����.");
	Doc_PrintLines(nDocID,1,"");
	Doc_Show(nDocID);
};


instance Lehren_der_Goetter1(C_Item)
{
	name = "������ ����� - ��� 1";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "������ �����";
	text[0] = "��� 1";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseLehren_der_Goetter1;
};


func void UseLehren_der_Goetter1()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Red_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Red_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"������ ����� �����, ��� �� �� �� ����, ����� ����� ���� ��������. ������ ������ �����, ��� �� �� �� ����, ����� ������ ���������. ������ ������, ��� ��� ���� �������.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"����� ������: �� ���������� � ������ ������, ���� ���� �� ������ ������ �� ������, ��� ������ �������������� ������ � ��������. � ���������� ������, ���� � �����. ���� ������ ������, ������ ���� ������ ����. �������� ��� ��������� �� ���� ���������.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"����� �������: ������� � ����, ��� ���� ������ ��� ����, ����� ������� �������. ����� � ��� ������, ����� �������� �� ������, ��� ������ ������� ��������. ������� � �������� ��������� �� ���� ���������.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"����� �������: ���, ��� ��������� ������ ������� �������������� � ���� �����, ����� ������� ����. ��� ���� ������� ����, ��������� � ������, � ��� ������� ��������� � ������� �����.");
	Doc_Show(nDocID);
};


instance Lehren_der_Goetter2(C_Item)
{
	name = "������ ����� - ��� 2";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "������ �����";
	text[0] = "��� 2";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseLehren_der_Goetter2;
};


func void UseLehren_der_Goetter2()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Red_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Red_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"�� ���� �� ���, �� ����, � ����� ����� �� ���������� ����� ���. �� ��� ���� ������ �����, � ��� ���� ������� ���. ����� ������� ���� �����. �� ����� ����� �� ����� ���� � ����� ������, � ����� �� ������ ������. �� ��� ���� ��� ��� ��� ������� �����. ����� ����� ������� ����� ���� � ������ �������. ������ ������ ���� ����. � ����� � ��� ������ ����. ����� ������� �� ���� ������ ����� � ������ �������. ������ ������� ����� ��������� �������, ������, ���������������� � ��������. � ��� ����� ������� ������ ����������.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"� �� ����� �������� ����� ��� ��������������� ������� � ����� �� ��� �����. ������ �� ����������� �� �����, ��� ��� �� �������� ������ ��� ����� ������������ � �������� �����, ����� ��������� ��� �����. � ����� �� �������� ���� ��������, ����� �� ���������� ������ ��� ������. �� ������� ���� ����� �� ��������� �� ������ �����. ������ ����������� ������ �������, � �� ���� ���������� �� �������� � ��� ������: '��� �� ����������� ���, ��� ����� �� ����� ��� ��� ������� �� ����'. � �� ������ ������ � ���� � ����� �� �����.");
	Doc_Show(nDocID);
};


instance Lehren_der_Goetter3(C_Item)
{
	name = "������ ����� - ��� 3";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "������ �����";
	text[0] = "��� 3";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseLehren_der_Goetter3;
};


func void UseLehren_der_Goetter3()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Red_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Red_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"����� ��� ����� ����������� ������� ��� � ������������� � ���. ��������� �� ��� �� ������� ����������� ������� ������� ������. �� ������ �� ������. � �� ������� ���� ����� �������� ��� �� ������ �������, � ���������� ��� ������� ���� ����� �� ����������. ��� ���� �������� ������ � ������������ ����� ���������. �� ��� ��� ���� ����� ����� �����, � �� ��� ���� �� �� �����. � ����� ���� �� ���� ���, ��� ��� ���������. �� ��������, ��� ��� ���������� �� ���������� ���, ������� ������ ���� ��������� �����.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"���� ����� ������� � �������, � �������� �������. �� ���� ������ �� ��� ���� ���������� ������������� ����� �������. � ����� ��� �������� � �������, � �� �������� �� ������ � ����� ������������. ������ ������ ���������, � �������� ������������ �����. ������������ � ���������� ����� ����� �� ����� ��� �����. ��� ����������� �����. ���, ��� ���������� �� ��������, ������� ������ ����, � ���������� ������ ���������� ������ ����.");
	Doc_Show(nDocID);
};


instance Jagd_und_Beute(C_Item)
{
	name = "��������� ������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "��������� ������";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseJagd_und_Beute;
};


func void UseJagd_und_Beute()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"��� ����� �������� ������ �����, � ��� ������ ���������� �������, ����� ������� ����� ��������� �����. ������� ����� ������ �� ������ �����. ������ ����� ������� � ����� ������� ����� ������ ���������� � �����. �� ��� ��� �� ������� � ���, ��� ��� ����� ���������. ���������� ��������� ������, ������� ������������ ������, ��� ������� ��������� � �������! ����� ������� ����������� � ��������������.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"��������� ����� � ����� �������� �� ������ ������ ������� ��������, �� � ����� ������� �������� �����. �� ������ ���� ������� �������� �� ���������� ������ ���������, �, ��������, ��� �� ��������� � � �������. ����� �������������� ���������� ��� ����� � �����? ������ ���������� ��� �������������� � �������� �������� �� ���� ���������� ����������� ���������.");
	Doc_Show(nDocID);
};


instance Kampfkunst(C_Item)
{
	name = "��������� �����";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "��������� �����";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseKampfkunst;
};


func void UseKampfkunst()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"� ������� ���� ����������� ��� ������ ������� ������� �������� ��������� �����.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"������ � ������������ ���� ������ ������� ������ ��������, ��������� ���������������� � �������, � ����� ������������. ��� ������ ���� ������ �������������� ���� �������� � ���������� ��������� ����, ����� ��������� ������� �������� ���� �����������.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"�������� ������ � �������� ���� �������� ������ ��������.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"��� ���������� ����� �������� ������� �� ��� ����������� ���������. ��������� ��������, � ��� ���������, �� ������ ���� ���������� ����������: �������� ���������� ���� � ���������������� �������� ����.");
	Doc_Show(nDocID);
};


instance Die_Gruft(C_Item)
{
	name = "������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "������";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = usegruft;
};


func void usegruft()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Gruft_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Gruft_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLines(nDocID,0,". . . . . . . . . . . . . . . . . . . . . . . . . . . . ������� ����� � �������. . . . . . . . . . . . . �� ���?. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . ");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLines(nDocID,1,". . . . . . . . . . . . . . ��� ��� 1920. ������ �������� ����������� �� ������������, �� �����.. ����� �� ���������.. � ������, �� ������� �������. . . . . . . . . . . . . . . . . . . . . . �����. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 250");
	Doc_Show(nDocID);
};


instance Astronomie(C_Item)
{
	name = "����������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "����������";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseAstronomie;
};


func void UseAstronomie()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"� ������ ��������� ������� � ��� ������ ��������: �����, ����, ����� � ������, ������� ������ � � �� ������ - ����������� ���� �������. �������� ����� �������� ����� ���.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"� ����������� �������� ������� �������� ����� ���������. ��� ���� ��������� ��� � ������ ������, ������������ �����, ��� ���������� ���� �������� ������� �� ������� ��������. � ��� �������� ������� ������ ����.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"����� ��������� ������, ��� �����, �� ������� ��� ��������� ������ ������ �� ��������� � ��������, �� ������ ���������, �� ���� �� ����� ������� �����, ��� ��� ��� �������� ��� ��, ��� � ������ �������.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"��� ����������� ��������� ������� ���� ������������ ���� ����, ����� ����� ��������� ��������� ���.");
	Doc_Show(nDocID);
};


instance Rezepturen(C_Item)
{
	name = "������� �����";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "������� �����";
	text[0] = "��� 1";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseRezepturen;
};


func void UseRezepturen()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"������� ����������:");
	Doc_PrintLine(nDocID,0,"----------------");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"������� � ��� ����� ������ �����. ��� �������� ������� �� ����. ���� ��� �������� � �����, ������� �������� ������ ������ ����, ��� ������ ��� ��������. �� ���������� ���������! ������ � �������� �������� ���� �� �����.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"�����, ��������� � ������������� ���� ����� ������, � �������� ������� ��������, ��������� �������� ����. ������ � �������� ��������������. ��� ���� ������, ��� ��� ��������, ��� ���� �������� - ��� ������.");
	Doc_Show(nDocID);
};


instance Rezepturen2(C_Item)
{
	name = "������� �����";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "������� �����";
	text[0] = "��� 2";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseRezepturen2;
};


func void UseRezepturen2()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"���� ��������");
	Doc_PrintLine(nDocID,0,"--------------------");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"������ � ����� �������� ������ ������ ��������, ������ �� ������������ ����� ����. ������� ��� ���� �� ������������, ���� ��� ������� - ��� ����� ���������. �������� ����� ����: ��� ������ ������ ���������� �����������. ��� ������������� ���� ����������� ����� ��������������� ������ ������ - ������.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"��� ������, ��� ������� ���������� ��������� ���������� ���� � ����, � ���� ��������. ��� ������������ ����� ��� � ������� ��� ���. � ��������� �� ���� ������� ������� ����� �������� � �������, � ��� ����� � �������� ������.");
	Doc_Show(nDocID);
};


instance TagebuchOT(C_Item)
{
	name = "�������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "�������";
	text[0] = "������ ����������� �����.";
	text[1] = "� ��� �� ������� �������.";
	on_state[0] = UseTagebuchOT;
};


func void UseTagebuchOT()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"���� 23.");
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLines(nDocID,0,"� ������� ���� �������.");
	Doc_PrintLines(nDocID,0,"�����, ������ ��� �������� ��� ���, � ��� ��� ��� ��� ��������� ���� � ��������� ��������.");
	Doc_PrintLines(nDocID,0,"������ ����� �������, � ��� ����� �� ����� ������. ��� �������� ����, ��� ����� ����� � ������!");
	Doc_PrintLines(nDocID,0,"� ����� ������, �� ���� �� ����������!");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"���� 28.");
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLines(nDocID,0,"�� ������ ���������� ������ ������ ������ ����.");
	Doc_PrintLines(nDocID,0,"�� ��� �������� �������� ������, �� � �� ��� ��� �� ����, ����� ��� ��� �����.");
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"���� 67.");
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLines(nDocID,1,"���-�� ��������� ���, ��� � ���� �����-������� ������ ��� ������, �� ��� �� ��� ����� �����?");
	Doc_PrintLines(nDocID,1,"��� � ����� ���, �������� ��� ������ ������. ��� �� ��� �������� ��������� �� ���� ���� �����.");
	Doc_PrintLine(nDocID,1,"");
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"���� 78.");
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLines(nDocID,1,"��� ����� � ����� �� ��� � �������� ����� �����. �� ��� �������� ���� �� �������.");
	Doc_PrintLines(nDocID,1,"� ����� ������. ���� ������� ����� �������� �����. ����� ����, �� ����-������ ����������.");
	Doc_Show(nDocID);
};


instance ItWr_Bloodfly_01(C_Item)
{
	name = "������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 150;
	visual = "ItWr_Book_02_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "������";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseItWr_Bloodfly_01;
};


func void UseItWr_Bloodfly_01()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"������");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,-1,"font_10_book.TGA");
	Doc_PrintLines(nDocID,0,"�� ���, ��� ����� ��������� �����, � ������ �����, ������� �������� ������, ������������ ������� ������ ����. ��� ������� ���� ������ ���� � �������� �� �����.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"���� ������� � ������ ������ ��������� ��������� � ����� �������������� ��� ������������� ���������� �����. ��������� ���������� ��� ������ �� ������ � ������ �����������.");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"������ ���� �� ���� ������ �������� ������, �� � �������� �������� ��� ������ ����������. ����� ������� �������� ������, ����� ����� �������� ��� �� ���������� ������, � ��������� ������. ��������� ��� ����� ����� ����, ��� ������ �����.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_Show(nDocID);
	if((HONEYCOMB < 5) && (HONEYCOMBBOOK == 0))
	{
		Log_CreateTopic("���� �������",LOG_NOTE);
		B_LogEntry("���� �������","�� ����� ��� ������� � ����� ��� ���������� �������� �� ���. �������� ����� �������, ������� �����.");
		HONEYCOMBBOOK = 1;
	};
	if(Knows_GetBFSting == FALSE)
	{
		b_learn_trophies_sting();
	};
};


instance BALORONOTE(C_Item)
{
	name = "������ ������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 0;
	visual = "ITAR_SCROLL_01_EG.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "������ ������";
	on_state[0] = usebaloronote;
};


func void usebaloronote()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"  - 5 �����");
	Doc_PrintLine(nDocID,0,"  - 2 ������� ������");
	Doc_PrintLine(nDocID,0,"  - 5 ������� ����");
	Doc_PrintLine(nDocID,0,"  - 3 ������� �����");
	Doc_PrintLine(nDocID,0,"  - 2 ����� ����");
	Doc_PrintLine(nDocID,0,"  - 2 ������ ���������");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
	if(SLD_753_Baloro_SC_besorgt_den_Kram == LOG_RUNNING)
	{
		B_LogEntry(Baloros_Waffe,"������ �� ������� ��������� �� ��������� �����. ������ � �� �����, ����� ������ �� ������ ���.");
		Log_SetTopicStatus(Baloros_Waffe,LOG_FAILED);
		SLD_753_Baloro_SC_besorgt_den_Kram = LOG_FAILED;
	};
};


instance QUENTINNOTE(C_Item)
{
	name = "�������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 0;
	visual = "ITAR_SCROLL_01_EG.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "������� ��������";
	on_state[0] = usequentinnote;
};


func void usequentinnote()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLines(nDocID,0,"�����, ������� ������� ����� ������ ������. ���� ������� ���� - ������ ��������, ������� ����� ������ ��������� ���������� �� ������ ���������. ��������� �������� �� ���� ���������� ����, ��� ������������� - �����������! ��� ���������� �������� ������ ����� � ����� �������.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"  - �������");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
	if((QUENTIN_GANG_QUEST_STARTED != LOG_RUNNING) && (QUENTIN_GANG_QUEST_STARTED != LOG_SUCCESS) && (QUENTIN_GANG_QUEST_STARTED != LOG_FAILED) && !Npc_IsDead(Org_858_Quentin))
	{
		QUENTIN_GANG_QUEST_STARTED = LOG_RUNNING;
		Log_CreateTopic(QUENTIN_GANG,LOG_MISSION);
		Log_SetTopicStatus(QUENTIN_GANG,LOG_RUNNING);
		B_LogEntry(QUENTIN_GANG,"������, ��� ���������� ����� ������ ������ - �� ��, �� ���� ���� ������. �� ����� ���� ��� �� ���� �����, � �������� �� ������ ��������... ��� ������� �������� �� ������� � ���������, ��� ��������� ��� �����.");
	};
};


instance CALASHNOTE(C_Item)
{
	name = "������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = "������ ��� ������";
	text[1] = "����� ��� �� ������.";
	on_state[0] = usecalashnote;
};


func void usecalashnote()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLines(nDocID,0,"�����! ����� ����� ����� ������, ������� ����� ��� ������ � �����. ��������� ��� ��� ������� � ������ ��� ����, ����� �������� �� ��� ��������!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"  - �������");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
	CreateInvItem(hero,calashnote2);
	if(Npc_KnowsInfo(hero,info_calash_dia1))
	{
		B_LogEntry(QUENTIN_GANG,"������ �������, ������ ����� �������� ����� ������. ������� ������� ���� � � ������ �������� ������ ���������� ������ ����! � ��������!");
	}
	else
	{
		B_LogEntry(QUENTIN_GANG,"������� ������� ����! ���� �� � ����� � ������ ���������, �� ��� �� ��������� �� ��� ����������. � ��������!");
	};
};


instance CALASHNOTE2(C_Item)
{
	name = "�������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 0;
	visual = "ITAR_SCROLL_01_EG.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "������ ��� ������";
	on_state[0] = usecalashnote2;
};


func void usecalashnote2()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLines(nDocID,0,"�����! ����� ����� ����� ������, ������� ����� ��� ������ � �����. ��������� ��� ��� ������� � ������ ��� ����, ����� �������� �� ��� ��������!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"  - �������");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ALCH200(C_Item)
{
	name = "������ �������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 200;
	visual = "ITWR_BOOK_ALCHEMY.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "������ �������";
	text[1] = "��������� ������� ��������� ������������.";
	text[2] = "(��������� 10 ����� ��������)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = usealchemybook;
};

instance ALCHEMYBOOK(C_Item)
{
	name = "������ �������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 600;
	visual = "ITWR_BOOK_ALCHEMY.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "������ �������";
	text[1] = "��������� ������� ��������� ������������.";
	text[2] = "(��������� 10 ����� ��������)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = usealchemybook;
};


func void usealchemybook()
{
	var int nDocID;
	if((hero.lp < 10) && (ALCHEMYACTIVE == FALSE))
	{
		PrintScreen("������������ ����� ��������!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else if((hero.lp >= 10) || (ALCHEMYACTIVE == TRUE))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Alchemy_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Alchemy_R.tga",0);
		Doc_SetFont(nDocID,-1,"font_15_book.tga");
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"������ �������");
		Doc_SetFont(nDocID,-1,"font_10_book.TGA");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"������ ������� � ���������� �������� �����. ������� ������ ����� ��� ����� ��������� �����, ����� �������� ��� ���������� � ���������� ��� �� ���������. ���� ���������� ������ ������� � �������, ����� �������� �������� � ���������� ���������.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"��� �������� ������� ������� ��������� ������ ������� �� ������: ��� ����� �������� �������� ������� ������������ ������ ������������ �������. ����������� ����������� ���������");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLines(nDocID,1,"������� ��� ������� ������ ��������, ���������� ��� ��������� ���������� �� �����������!");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"��� ������� ����� ���������� ������ ��������, ������� ����� ����� � ��������� ���� ��� ����. � ��� ����� � �������������� �������� ��� ������� ��������� �����������: ��� ��� ���� ���. ������� ������ �������� �������� ��������� � ����� ��������� �������� � ������� ������ ��������.");
		Doc_Show(nDocID);
		if(ALCHEMYACTIVE == FALSE)
		{
			Log_CreateTopic("�������",LOG_NOTE);
			B_LogEntry("�������","� ����� ����� � �������� � ������� ����������� ��� ������������� �����. ������ ����� ������ �������.");
			PrintScreen("������ ����� �������!",-1,11,"FONT_OLD_20_WHITE.TGA",4);
			hero.lp = hero.lp - 10;
			ALCHEMYACTIVE = TRUE;
			Npc_SetTalentSkill(hero,NPC_TALENT_REGENERATE,1);
			if(Npc_HasItems(KDF_405_Torrez,alchemybook))
			{
				Npc_RemoveInvItem(KDF_405_Torrez,alchemybook);
			};
			if(Npc_HasItems(KDW_604_Cronos,alchemybook))
			{
				Npc_RemoveInvItem(KDW_604_Cronos,alchemybook);
			};
			if(Npc_HasItems(NOV_1357_Fortuno,alchemybook))
			{
				Npc_RemoveInvItem(NOV_1357_Fortuno,alchemybook);
			};
			if(Npc_HasItems(STT_329_Dexter,alchemybook))
			{
				Npc_RemoveInvItem(STT_329_Dexter,alchemybook);
			};
			if(Npc_HasItems(KDW_605_Riordian,alchemybook))
			{
				Npc_RemoveInvItem(KDW_605_Riordian,alchemybook);
			};
		};
	};
};


instance ALCHEMY_HP1(C_Item)
{
	name = "������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 0;
	visual = "HP1RECIPE.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "������ �������� ���������";
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Essenz;
	on_state[0] = usehp1recipe;
};


func void usehp1recipe()
{
	var int nDocID;
	if(ALCHEMYACTIVE == FALSE)
	{
		PrintScreen("���������� �������� ������ �������!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,1);
		Doc_SetPage(nDocID,0,"letters.TGA",0);
		Doc_SetFont(nDocID,-1,"font_10_book.tga");
		Doc_SetMargins(nDocID,-1,50,50,50,50,1);
		Doc_PrintLines(nDocID,0,"�������� ����� - ����� ������� �������� ��������, ������� ����� ����� ��� ������. �� ������ ��� ������� ������, ����� �������� �����-���� ��������� ��������, �� ��� ����� ������ ����� ���� �� ��������� �������. ���� ������ �������� �����, �� �� ���������� ������ ����� ������� �������� ���������.");
		Doc_SetMargins(nDocID,-1,200,50,50,50,1);
		Doc_Show(nDocID);
		if(HP1RECIPE == FALSE)
		{
			PrintScreen("������ ����� ������!",-1,12,"FONT_OLD_20_WHITE.TGA",4);
			B_LogEntry("�������","������ ������ �������� ��������� (��������� ���� +50). ���������: �������� ����� (1).");
			HP1RECIPE = TRUE;
		};
	};
};


instance ALCHEMY_HP2(C_Item)
{
	name = "������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 0;
	visual = "HP2RECIPE.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "������ ��������� ���������";
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Extrakt;
	on_state[0] = usehp2recipe;
};


func void usehp2recipe()
{
	var int nDocID;
	if(ALCHEMYACTIVE == FALSE)
	{
		PrintScreen("���������� �������� ������ �������!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,1);
		Doc_SetPage(nDocID,0,"letters.TGA",0);
		Doc_SetFont(nDocID,-1,"font_10_book.tga");
		Doc_SetMargins(nDocID,-1,50,50,50,50,1);
		Doc_PrintLines(nDocID,0,"�������� �������� ������ ��������� �� ����� ��� ������� ����� ��� � ������� ����� � ����� ��������. �� ��������� ������� ����� �������� �������� ���������: ��� ����� ��������� �� ���.");
		Doc_SetMargins(nDocID,-1,200,50,50,50,1);
		Doc_Show(nDocID);
		if(HP2RECIPE == FALSE)
		{
			PrintScreen("������ ����� ������!",-1,12,"FONT_OLD_20_WHITE.TGA",4);
			B_LogEntry("�������","������ ������ ��������� ��������� (��������� ���� +70). ���������: �������� �������� (1).");
			HP2RECIPE = TRUE;
		};
	};
};


instance ALCHEMY_HP3(C_Item)
{
	name = "������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 0;
	visual = "HP3RECIPE.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "������ ����� ���������";
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Elixier;
	on_state[0] = usehp3recipe;
};


func void usehp3recipe()
{
	var int nDocID;
	if(ALCHEMYACTIVE == FALSE)
	{
		PrintScreen("���������� �������� ������ �������!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,1);
		Doc_SetPage(nDocID,0,"letters.TGA",0);
		Doc_SetFont(nDocID,-1,"font_10_book.tga");
		Doc_SetMargins(nDocID,-1,50,50,50,50,1);
		Doc_PrintLines(nDocID,0,"������ �������� ������ ��������� �������� �� �����, ����� ����� ��� ����� ��������� �������� � ����������� ����� ��������� - ����� ����������� �������� ������ ��������� ��� ��� ������. ��������� ������ ������ � ���������� �������� � ������� � �������� �� ��������� ������.");
		Doc_SetMargins(nDocID,-1,200,50,50,50,1);
		Doc_Show(nDocID);
		if(HP3RECIPE == FALSE)
		{
			PrintScreen("������ ����� ������!",-1,12,"FONT_OLD_20_WHITE.TGA",4);
			B_LogEntry("�������","������ ������ ����� ��������� (��������� ���� +100). ���������: �������� ������ (1).");
			HP3RECIPE = TRUE;
		};
	};
};


instance ALCHEMY_MP1(C_Item)
{
	name = "������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 0;
	visual = "MP1RECIPE.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "������ �������� ���������� �������";
	text[1] = NAME_Bonus_Mana;
	count[1] = Mana_Essenz;
	on_state[0] = usemp1recipe;
};


func void usemp1recipe()
{
	var int nDocID;
	if(ALCHEMYACTIVE == FALSE)
	{
		PrintScreen("���������� �������� ������ �������!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,1);
		Doc_SetPage(nDocID,0,"letters.TGA",0);
		Doc_SetFont(nDocID,-1,"font_10_book.tga");
		Doc_SetMargins(nDocID,-1,50,50,50,50,1);
		Doc_PrintLines(nDocID,0,"������ �� ��� �����, ��� ������� �������� ����������� ����������. ��� �� ���� �� ����� �� ������� ��� ���������� ����, �� ��� ������� ��������� �� ���� ����� �������� �������� ���������� �������: �������� ����� �� �������, ���������� � ������ � ��������.");
		Doc_SetMargins(nDocID,-1,200,50,50,50,1);
		Doc_Show(nDocID);
		if(MP1RECIPE == FALSE)
		{
			PrintScreen("������ ����� ������!",-1,12,"FONT_OLD_20_WHITE.TGA",4);
			B_LogEntry("�������","������ ������ �������� ���������� ������� (���������� ���� +30). ���������: ������� (1).");
			MP1RECIPE = TRUE;
		};
	};
};


instance ALCHEMY_MP2(C_Item)
{
	name = "������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 0;
	visual = "MP2RECIPE.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "������ ��������� ���������� �������";
	text[1] = NAME_Bonus_Mana;
	count[1] = Mana_Extrakt;
	on_state[0] = usemp2recipe;
};


func void usemp2recipe()
{
	var int nDocID;
	if(ALCHEMYACTIVE == FALSE)
	{
		PrintScreen("���������� �������� ������ �������!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,1);
		Doc_SetPage(nDocID,0,"letters.TGA",0);
		Doc_SetFont(nDocID,-1,"font_10_book.tga");
		Doc_SetMargins(nDocID,-1,50,50,50,50,1);
		Doc_PrintLines(nDocID,0,"������ ������� ����� ������ � ������ ������: � �������, � ���� ����. ������� ����� ����� �������� � �������� �������, ������ � �������: ��� ����� �������� �������� ���������� �������.");
		Doc_SetMargins(nDocID,-1,200,50,50,50,1);
		Doc_Show(nDocID);
		if(MP2RECIPE == FALSE)
		{
			PrintScreen("������ ����� ������!",-1,12,"FONT_OLD_20_WHITE.TGA",4);
			B_LogEntry("�������","������ ������ ��������� ���������� ������� (���������� ���� +50). ���������: ������� ����� (1).");
			MP2RECIPE = TRUE;
		};
	};
};


instance ALCHEMY_MP3(C_Item)
{
	name = "������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 0;
	visual = "MP3RECIPE.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "������ ����� ���������� �������";
	text[1] = NAME_Bonus_Mana;
	count[1] = Mana_Elixier;
	on_state[0] = usemp3recipe;
};


func void usemp3recipe()
{
	var int nDocID;
	if(ALCHEMYACTIVE == FALSE)
	{
		PrintScreen("���������� �������� ������ �������!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,1);
		Doc_SetPage(nDocID,0,"letters.TGA",0);
		Doc_SetFont(nDocID,-1,"font_10_book.tga");
		Doc_SetMargins(nDocID,-1,50,50,50,50,1);
		Doc_PrintLines(nDocID,0,"����� �� ����� ������� ���������� �������� ��������� �������� ������. ������ �� ����� ������ ������ ����� ����� ��������, ������� ������� �����, ������� � �������� ������� ����������� ����� �������������� ���������� �������. ��������� ���������� �������� �������� �������, ��� � ������������� ������������ ����� ������� � ������. �� ����� ����, ��� ������ ��������� ������ ������.");
		Doc_SetMargins(nDocID,-1,200,50,50,50,1);
		Doc_Show(nDocID);
		if(MP3RECIPE == FALSE)
		{
			PrintScreen("������ ����� ������!",-1,12,"FONT_OLD_20_WHITE.TGA",4);
			B_LogEntry("�������","������ ������ ����� ���������� ������� (���������� ���� +70). ���������: �������� ������ (1).");
			MP3RECIPE = TRUE;
		};
	};
};


instance ALCHEMY_MPMAX(C_Item)
{
	name = "������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 0;
	visual = "MPMAXRECIPE.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "������ �������� ���� ����";
	text[1] = NAME_Bonus_ManaMax;
	count[1] = ManaMax_Essenz;
	on_state[0] = usempmaxrecipe;
};


func void usempmaxrecipe()
{
	var int nDocID;
	if(ALCHEMYACTIVE == FALSE)
	{
		PrintScreen("���������� �������� ������ �������!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,1);
		Doc_SetPage(nDocID,0,"letters.TGA",0);
		Doc_SetFont(nDocID,-1,"font_10_book.tga");
		Doc_SetMargins(nDocID,-1,50,50,50,50,1);
		Doc_PrintLines(nDocID,0,"������ ����� ����� ������� ������������ ����� � ������������� �� ��� ����������� ������������. ����� ����������� ���, ����� ��� �����������: ������ ��� � ������ ����. ������������ �������� ���������� � ������ ���� � ������������ ����� ���� ����� � ������ �����. ����� �� ���������, ��������� ����� �������� �������� ������ ���� ����� ����� ��������� ����������.");
		Doc_SetMargins(nDocID,-1,200,50,50,50,1);
		Doc_Show(nDocID);
		if(MPMAXRECIPE == FALSE)
		{
			PrintScreen("������ ����� ������!",-1,12,"FONT_OLD_20_WHITE.TGA",4);
			B_LogEntry("�������","������ ������ �������� ���� ���� (������������ ���������� ���� +5). ���������: ������ ��� (1) � ������ ���� (1).");
			MPMAXRECIPE = TRUE;
		};
	};
};


instance ALCHEMY_HPMAX(C_Item)
{
	name = "������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 0;
	visual = "HPMAXRECIPE.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "������ �������� �����";
	text[1] = NAME_Bonus_HpMax;
	count[1] = HPMax_Essenz;
	on_state[0] = usehpmaxrecipe;
};


func void usehpmaxrecipe()
{
	var int nDocID;
	if(ALCHEMYACTIVE == FALSE)
	{
		PrintScreen("���������� �������� ������ �������!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,1);
		Doc_SetPage(nDocID,0,"letters.TGA",0);
		Doc_SetFont(nDocID,-1,"font_10_book.tga");
		Doc_SetMargins(nDocID,-1,50,50,50,50,1);
		Doc_PrintLines(nDocID,0,"��� ��������, ����������� ��������� ����, ����� ������� ������� ����. ����� ����������� �������� ��������������� ������, ������������ ������ ���. ������ ����������� ���������� ��� ����������� � ����� � ����� � ������������ ����� ��������. �� ���������� ��������� � ������� �� ���������� ����: ����� ��� ��������������� � ������� ����� ������ ���� � ������.");
		Doc_SetMargins(nDocID,-1,200,50,50,50,1);
		Doc_Show(nDocID);
		if(HPMAXRECIPE == FALSE)
		{
			PrintScreen("������ ����� ������!",-1,12,"FONT_OLD_20_WHITE.TGA",4);
			B_LogEntry("�������","������ ������ �������� ����� (������������ ��������� ���� +5). ���������: ������ ��� (1) � ������� ���� (1).");
			HPMAXRECIPE = TRUE;
		};
	};
};


instance ALCHEMY_DEX(C_Item)
{
	name = "������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 0;
	visual = "DEXRECIPE.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "������ �������� ��������";
	text[1] = NAME_Bonus_Dex;
	count[1] = DEX_Essenz;
	on_state[0] = usedexrecipe;
};


func void usedexrecipe()
{
	var int nDocID;
	if(ALCHEMYACTIVE == FALSE)
	{
		PrintScreen("���������� �������� ������ �������!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,1);
		Doc_SetPage(nDocID,0,"letters.TGA",0);
		Doc_SetFont(nDocID,-1,"font_10_book.tga");
		Doc_SetMargins(nDocID,-1,50,50,50,50,1);
		Doc_PrintLines(nDocID,0,"��� �������� �������� ���������� ���������� ��������� ���. ����� ���������� ���� ������ ����� ������� � ���� ����� ������ ����. ����� ���������� ���� ������������, ���������� ����� ���������� ���������� ������� ����� � ����� ������. ������ � ����� ��������� ����� �������������� �������� �������� ����� �������. ������ ��������� � �� ������������ �� � ����!");
		Doc_SetMargins(nDocID,-1,200,50,50,50,1);
		Doc_Show(nDocID);
		if(DEXRECIPE == FALSE)
		{
			PrintScreen("������ ����� ������!",-1,12,"FONT_OLD_20_WHITE.TGA",4);
			if(DIFF_HARD == TRUE)
			{
				B_LogEntry("�������","������ ������ �������� �������� (�������� +1). ���������: ��������� ��� (1), ����� ������� (1) � ������ ���� (1).");
			}
			else
			{
				B_LogEntry("�������","������ ������ �������� �������� (�������� +3). ���������: ��������� ��� (1), ����� ������� (1) � ������ ���� (1).");
			};
			DEXRECIPE = TRUE;
		};
	};
};


instance ALCHEMY_STR(C_Item)
{
	name = "������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 0;
	visual = "STRRECIPE.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "������ �������� ����";
	text[1] = NAME_Bonus_Str;
	count[1] = STR_Essenz;
	on_state[0] = usestrrecipe;
};


func void usestrrecipe()
{
	var int nDocID;
	if(ALCHEMYACTIVE == FALSE)
	{
		PrintScreen("���������� �������� ������ �������!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,1);
		Doc_SetPage(nDocID,0,"letters.TGA",0);
		Doc_SetFont(nDocID,-1,"font_10_book.tga");
		Doc_SetMargins(nDocID,-1,50,50,50,50,1);
		Doc_PrintLines(nDocID,0,"��� � ��� ������ ����� � �������������� ���������, ����� ����������� ���������� ��������� ���. � ���� ����������� ����� �������� ������ � ���� �������� �����. ���������� ����� �������, ���� �� ���������� ���������� ������ ����. ��� ��������, ��� �������� ������ ��������� ����� ���� ���� � �����.");
		Doc_SetMargins(nDocID,-1,200,50,50,50,1);
		Doc_Show(nDocID);
		if(STRRECIPE == FALSE)
		{
			PrintScreen("������ ����� ������!",-1,12,"FONT_OLD_20_WHITE.TGA",4);
			if(DIFF_HARD == TRUE)
			{
				B_LogEntry("�������","������ ������ �������� ���� (���� +1). ���������: ��������� ��� (1), �������� ������ (1) � �������� ����� (1).");
			}
			else
			{
				B_LogEntry("�������","������ ������ �������� ���� (���� +3). ���������: ��������� ��� (1), �������� ������ (1) � �������� ����� (1).");
			};
			STRRECIPE = TRUE;
		};
	};
};


instance ALCHEMY_EGG(C_Item)
{
	name = "������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "EGGRECIPE.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "������ ����� �� ��� �������� ��������";
	text[1] = NAME_Bonus_ManaMax;
	count[1] = ManaMax_ElixierEgg;
	on_state[0] = useeggrecipe;
};


func void useeggrecipe()
{
	var int nDocID;
	if(ALCHEMYACTIVE == FALSE)
	{
		PrintScreen("���������� �������� ������ �������!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,1);
		Doc_SetPage(nDocID,0,"letters.TGA",0);
		Doc_SetFont(nDocID,-1,"font_10_book.tga");
		Doc_SetMargins(nDocID,-1,50,50,50,50,1);
		Doc_PrintLines(nDocID,0,"���������! ���� ��������� ������ ������! ������ ����� �� �������� ������� �����, ���������� ������ ��� ������� �������, �� �������� �� �������� �������� ����������� ������� ������... � ��� �������� ��� ���� �������, ��� ������ ��������� �� ���. �� ������, ��� ����� ������� �������� ��� ����� ����� ����������� � ����� ��������, � ��� �� ������ ���� ��� ����� ���������. ����������� � ����������� ����� � ����� ������ � ������� ��� ������� ���, ������� ������� �����. ");
		Doc_PrintLines(nDocID,0,"�� ���� ��������, ��� ������ ����� ����� ��� ���� � ����� �������� ���������: �������� ������, ����������� ������� �������, ������ � ������ ������������ � ����������, � ����� �������. ����� ����������� �������� �������� � ����� ��������� �������� ����������� ������.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"�� �������� � ����� ������!");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"- �����");
		Doc_SetMargins(nDocID,-1,200,50,50,50,1);
		Doc_Show(nDocID);
		if(EGGRECIPE == FALSE)
		{
			PrintScreen("������ ����� ������!",-1,12,"FONT_OLD_20_WHITE.TGA",4);
			B_LogEntry("�������","������ ������ ����� �� ��� �������� �������� (������������ ���������� ���� +10). ���������: ���� �������� (3) � �������� (6).");
			EGGRECIPE = TRUE;
		};
	};
};


instance ALCHEMY_FORTUNO(C_Item)
{
	name = "������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "YBRECIPE.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "������ ��������� ����� �������";
	text[1] = NAME_Bonus_ManaMax;
	count[1] = 10;
	text[2] = NAME_Bonus_HpMax;
	count[2] = 10;
	on_state[0] = usefortunorecipe;
};


func void usefortunorecipe()
{
	var int nDocID;
	if(ALCHEMYACTIVE == FALSE)
	{
		PrintScreen("���������� �������� ������ �������!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,1);
		Doc_SetPage(nDocID,0,"letters2.TGA",0);
		Doc_SetFont(nDocID,-1,"font_10_book.tga");
		Doc_SetMargins(nDocID,-1,50,50,50,50,1);
		Doc_PrintLines(nDocID,0,"������ �� ������� ����� ���, ������� ����� � ����. ����� ������� ��� � ��������� � ������� � ������ ��������.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"������ ����� � ���������� �� ������� ������, � ������� ������� ���������� � ������������ ������ ����.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"- �������");
		Doc_SetMargins(nDocID,-1,200,50,50,50,1);
		Doc_Show(nDocID);
		if(FORTUNORECIPE == FALSE)
		{
			PrintScreen("������ ����� ������!",-1,12,"FONT_OLD_20_WHITE.TGA",4);
			B_LogEntry("�������","������ ������ ��������� ����� ������� (������������ ���������� � ��������� ���� +10). ���������: ������� ���� (1), ������ ����� (1) � ������ ���� (1).");
			FORTUNORECIPE = TRUE;
		};
	};
};


instance ALCHEMY_MASTER(C_Item)
{
	name = "������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1200;
	visual = "MASTERRECIPE.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "������ ����� ����";
	text[1] = NAME_Bonus_Dex;
	count[1] = 4;
	text[2] = NAME_Bonus_Str;
	count[2] = 4;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = usemasterrecipe;
};


func void usemasterrecipe()
{
	var int nDocID;
	if(ALCHEMYACTIVE == FALSE)
	{
		PrintScreen("���������� �������� ������ �������!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,1);
		Doc_SetPage(nDocID,0,"letters2.TGA",0);
		Doc_SetFont(nDocID,-1,"font_10_book.tga");
		Doc_SetMargins(nDocID,-1,50,50,50,50,1);
		Doc_PrintLines(nDocID,0,"������ �� �������� ���� � �������� ����� ������� ���������, ������ �� � ����� ������. �������������� ���������� ������� �� ������� �������� ����, � �������� �������� ��������� ��������� ����������. �������, ����� ������ �� �������� ��� ����� ������� ����� ��-�� �� ������������.");
		Doc_SetMargins(nDocID,-1,200,50,50,50,1);
		Doc_Show(nDocID);
		if(MASTERRECIPE == FALSE)
		{
			PrintScreen("������ ����� ������!",-1,12,"FONT_OLD_20_WHITE.TGA",4);
			B_LogEntry("�������","������ ������ ����� ���� (�������� � ���� +4). ���������: �������� �������� (1) � �������� ���� (1).");
			MASTERRECIPE = TRUE;
		};
	};
};


instance ALCHEMY_HP1_PRICED(C_Item)
{
	name = "������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "HP1RECIPE.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "������ �������� ���������";
	text[1] = NAME_Bonus_HP;
	count[1] = 50;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = usehp1recipe_priced;
};

instance ALCHEMY_HP2_PRICED(C_Item)
{
	name = "������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 200;
	visual = "HP2RECIPE.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "������ ��������� ���������";
	text[1] = NAME_Bonus_HP;
	count[1] = 70;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = usehp2recipe_priced;
};

instance ALCHEMY_HP3_PRICED(C_Item)
{
	name = "������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 300;
	visual = "HP3RECIPE.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "������ ����� ���������";
	text[1] = NAME_Bonus_HP;
	count[1] = 100;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = usehp3recipe_priced;
};

instance ALCHEMY_MP1_PRICED(C_Item)
{
	name = "������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "MP1RECIPE.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "������ �������� ���������� �������";
	text[1] = NAME_Bonus_Mana;
	count[1] = 30;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = usemp1recipe_priced;
};

instance ALCHEMY_MP2_PRICED(C_Item)
{
	name = "������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 200;
	visual = "MP2RECIPE.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "������ ��������� ���������� �������";
	text[1] = NAME_Bonus_Mana;
	count[1] = 50;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = usemp2recipe_priced;
};

instance ALCHEMY_MP3_PRICED(C_Item)
{
	name = "������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 300;
	visual = "MP3RECIPE.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "������ ����� ���������� �������";
	text[1] = NAME_Bonus_Mana;
	count[1] = 70;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = usemp3recipe_priced;
};

instance ALCHEMY_MPMAX_PRICED(C_Item)
{
	name = "������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 600;
	visual = "MPMAXRECIPE.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "������ �������� ���� ����";
	text[1] = NAME_Bonus_ManaMax;
	count[1] = 5;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = usempmaxrecipe_priced;
};

instance ALCHEMY_JOINT2(C_Item)
{
	name = "������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 40;
	visual = "JOINTRECIPE.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "������ '��������� �������'";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = usejoint2recipe;
};

instance ALCHEMY_JOINT3(C_Item)
{
	name = "������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 80;
	visual = "JOINTRECIPE.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "������ '���� �����'";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = usejoint3recipe;
};


func void usehp1recipe_priced()
{
	var int nDocID;
	if(ALCHEMYACTIVE == FALSE)
	{
		PrintScreen("���������� �������� ������ �������!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,1);
		Doc_SetPage(nDocID,0,"letters2.TGA",0);
		Doc_SetFont(nDocID,-1,"font_10_book.tga");
		Doc_SetMargins(nDocID,-1,50,50,50,50,1);
		Doc_PrintLines(nDocID,0,"������� �� '������� ����� ����, ����� � ��������' ������, 562 �.");
		Doc_PrintLines(nDocID,0,"-------------------");
		Doc_PrintLines(nDocID,0,"...����������� ������ �������� �����. �� �� �������� ������� ������������� ����������� ��������. ���������, ��� ������, ������ � ����� �������� ������� ������, ���� �� �������� �� ������.");
		Doc_PrintLines(nDocID,0," ");
		Doc_PrintLines(nDocID,0,"...���������� ������� ��� ���� �������. � ������� ������� � ������ ���������� ������ �� ��������� ������������ ������������ ������. ���������� ������ � ����������� ������, �������� ������� ���� � �������� �� ������� �� �������. ��������� ������������ �������� � ������ ������� ����������� ������ � ������� ������. ��������� ����� � ��������� ���� � ������. ������������ �������, ���� ���������� �� ������� ���������� ����������� ����. �������� ��������� ������ � ������������.");
		Doc_PrintLines(nDocID,0," ");
		Doc_PrintLines(nDocID,0,"����������. ���������� ����� ���������� ��� ����, ����� ��������� ���������� ����� ������� ��������. ����� ������� ������������ ������ � ���������� �������� �������� �������� ����� � ������.");
		Doc_SetMargins(nDocID,-1,200,50,50,50,1);
		Doc_Show(nDocID);
		if(HP1RECIPE == FALSE)
		{
			PrintScreen("������ ����� ������!",-1,12,"FONT_OLD_20_WHITE.TGA",4);
			B_LogEntry("�������","������ ������ �������� ��������� (��������� ���� +50). ���������: �������� ����� (1).");
			HP1RECIPE = TRUE;
		};
	};
};

func void usehp2recipe_priced()
{
	var int nDocID;
	if(ALCHEMYACTIVE == FALSE)
	{
		PrintScreen("���������� �������� ������ �������!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,1);
		Doc_SetPage(nDocID,0,"letters2.TGA",0);
		Doc_SetFont(nDocID,-1,"font_10_book.tga");
		Doc_SetMargins(nDocID,-1,50,50,50,50,1);
		Doc_PrintLines(nDocID,0,"������� �� '������� ����� ����, ����� � ��������' ������, 562 �.");
		Doc_PrintLines(nDocID,0,"-------------------");
		Doc_PrintLines(nDocID,0,"...����������� ��� ���������� �������� ��������. ���������, ����� ���������� ������������ �������� ���������, ��� ����� �������� �� ��������� ������� ����.");
		Doc_PrintLines(nDocID,0," ");
		Doc_PrintLines(nDocID,0,"...������������ ����� �������� �������� � ����� � ������� ���������, ������� ���� �� �������� � ���������� �������. ����� ��������� �� �������, � �������� ����� �������� �������� � ������� � ������� ���� ���, ����� �� ��� �� �������. ����������� �� ����� ��������� ���� �� ��� ���, ���� �� ���������� ���� � �����. � ����������� ������ ��������� ������� � ���� ��� ������ ������ ����...");
		Doc_PrintLines(nDocID,0," ");
		Doc_PrintLines(nDocID,0,"����������. ���������� �� ��������� ���������� ������� � ���������� ����. ���������� ����� ������� ���� ������ ������������ � ���� � �������� �������� ����������� ��������������.");
		Doc_SetMargins(nDocID,-1,200,50,50,50,1);
		Doc_Show(nDocID);
		if(HP2RECIPE == FALSE)
		{
			PrintScreen("������ ����� ������!",-1,12,"FONT_OLD_20_WHITE.TGA",4);
			B_LogEntry("�������","������ ������ ��������� ��������� (��������� ���� +70). ���������: �������� �������� (1).");
			HP2RECIPE = TRUE;
		};
	};
};

func void usehp3recipe_priced()
{
	var int nDocID;
	if(ALCHEMYACTIVE == FALSE)
	{
		PrintScreen("���������� �������� ������ �������!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,1);
		Doc_SetPage(nDocID,0,"letters2.TGA",0);
		Doc_SetFont(nDocID,-1,"font_10_book.tga");
		Doc_SetMargins(nDocID,-1,50,50,50,50,1);
		Doc_PrintLines(nDocID,0,"������� �� '������� ����� ����, ����� � ��������' ������, 562 �.");
		Doc_PrintLines(nDocID,0,"-------------------");
		Doc_PrintLines(nDocID,0,"...��������� �������� ������ �������� ������. �������, ��� ��� ������ ������ ����� ����������� � ���� �� ��������� �����������. ��� ������� ��� �������� �� ������������.");
		Doc_PrintLines(nDocID,0," ");
		Doc_PrintLines(nDocID,0,"�������� �������� �� ������� � �������� ��� ������� �������. ���������� � ������ �� ��������� ��������� ����� ����������� �������� � ��������� � �������. ��� �������� � �������������� ������� ����� � ������� ��������� ������� ���� �������� �� �������� � �������� �� �������, � ����� ��������� ���� ���������� ������ � ����������� ���������� �������, ����� �������� ������ ���� ��������������� ������� � ����� � ����� ���������. ���������� �������� ��������� ����� � ��������� ��� � ����...");
		Doc_PrintLines(nDocID,0," ");
		Doc_PrintLines(nDocID,0,"����������. ��������, ������ ����� ��������, ���� ������������ ������ �������� ������� �� ������� � ���������� ������ ��������.");
		Doc_SetMargins(nDocID,-1,200,50,50,50,1);
		Doc_Show(nDocID);
		if(HP3RECIPE == FALSE)
		{
			PrintScreen("������ ����� ������!",-1,12,"FONT_OLD_20_WHITE.TGA",4);
			B_LogEntry("�������","������ ������ ����� ��������� (��������� ���� +100). ���������: �������� ������ (1).");
			HP3RECIPE = TRUE;
		};
	};
};

func void usemp1recipe_priced()
{
	var int nDocID;
	if(ALCHEMYACTIVE == FALSE)
	{
		PrintScreen("���������� �������� ������ �������!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,1);
		Doc_SetPage(nDocID,0,"letters2.TGA",0);
		Doc_SetFont(nDocID,-1,"font_10_book.tga");
		Doc_SetMargins(nDocID,-1,50,50,50,50,1);
		Doc_PrintLines(nDocID,0,"������� �� '������� ����� ����, ����� � ��������' ������, 562 �.");
		Doc_PrintLines(nDocID,0,"-------------------");
		Doc_PrintLines(nDocID,0,"...������ ����� ������������ � ������� �������. ��� ����������� ������ ����� ����� ��������...");
		Doc_PrintLines(nDocID,0," ");
		Doc_PrintLines(nDocID,0,"�������� ��� ����������� ������ ���������� ������� � ����� ������� �� �����. ��������� ����� �� �������, �������� ����� �� ������� � ������� �����. �� ��������� ���������� �����. ���������� �������� ������ ������������ � ������ ����. ������� ����� � ����, ��� ������ ������������ ����������� ������. ����� ������ ������ � ����� ���� ��������� ��� � ������� ��� ��������.");
		Doc_PrintLines(nDocID,0," ");
		Doc_PrintLines(nDocID,0,"����������. ��������� ��������� ������� �������� � �����. ������ ���� ���������� ����� �������� � ��������� ������ ����� � ��������, ������ �������� �� ���� ������ ����� ���� ������������ ��� ������������� �������� �������.");
		Doc_SetMargins(nDocID,-1,200,50,50,50,1);
		Doc_Show(nDocID);
		if(MP1RECIPE == FALSE)
		{
			PrintScreen("������ ����� ������!",-1,12,"FONT_OLD_20_WHITE.TGA",4);
			B_LogEntry("�������","������ ������ �������� ���������� ������� (���������� ���� +30). ���������: ������� (1).");
			MP1RECIPE = TRUE;
		};
	};
};

func void usemp2recipe_priced()
{
	var int nDocID;
	if(ALCHEMYACTIVE == FALSE)
	{
		PrintScreen("���������� �������� ������ �������!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,1);
		Doc_SetPage(nDocID,0,"letters2.TGA",0);
		Doc_SetFont(nDocID,-1,"font_10_book.tga");
		Doc_SetMargins(nDocID,-1,50,50,50,50,1);
		Doc_PrintLines(nDocID,0,"������� �� '������� ����� ����, ����� � ��������' ������, 562 �.");
		Doc_PrintLines(nDocID,0,"-------------------");
		Doc_PrintLines(nDocID,0,"...������ �� ���� �������� ��������, ��� ��� ���������� ���� ����� ������������ � ������� �����...");
		Doc_PrintLines(nDocID,0," ");
		Doc_PrintLines(nDocID,0,"��������� ���������� ������� ������ �������� �����, �������� � ��� ������� ������ � ������� � �������� ����. ��������� ������ �������� �� �������� �������� ��������� � ������ � ��������� � ������ � �����. ��������� ����� ����� �� �����, ���������� ������� � ��������� �� �������. ��������� ����� �������� ��������� � ������� � ������� ����. �� ���� ����������� ����, � ��� ������ ������ ���������������� ��������� ����� ��������... � ���������� �������� �������� ������� ���������� ���� � ��������� �����������.");
		Doc_PrintLines(nDocID,0," ");
		Doc_PrintLines(nDocID,0,"����������. ����������� � ����� ������������ ������� ����� �������� � ������������� ��������, � ��������� ��������� �������.");
		Doc_SetMargins(nDocID,-1,200,50,50,50,1);
		Doc_Show(nDocID);
		if(MP2RECIPE == FALSE)
		{
			PrintScreen("������ ����� ������!",-1,12,"FONT_OLD_20_WHITE.TGA",4);
			B_LogEntry("�������","������ ������ ��������� ���������� ������� (���������� ���� +50). ���������: ������� ����� (1).");
			MP2RECIPE = TRUE;
		};
	};
};

func void usemp3recipe_priced()
{
	var int nDocID;
	if(ALCHEMYACTIVE == FALSE)
	{
		PrintScreen("���������� �������� ������ �������!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,1);
		Doc_SetPage(nDocID,0,"letters2.TGA",0);
		Doc_SetFont(nDocID,-1,"font_10_book.tga");
		Doc_SetMargins(nDocID,-1,50,50,50,50,1);
		Doc_PrintLines(nDocID,0,"������� �� '������� ����� ����, ����� � ��������' ������, 562 �.");
		Doc_PrintLines(nDocID,0,"-------------------");
		Doc_PrintLines(nDocID,0,"...��� �������� �������� ����� ���������� ������� �������� � �������� ������. ��� ������������� ����������� ����� ������� � ���� ��������� �������� ��������.");
		Doc_PrintLines(nDocID,0," ");
		Doc_PrintLines(nDocID,0,"��������� ������� � �������� ��� � ���������� ������ ����� �������, ����� �������� ����������� � �������. ������� �������� ����� � ��������� ����������� ������ � ��������� �����������. ������� ����� � �������� �������� �� �������. ������� ����� ��� �������� � �������� ������� ��� ����������� � ��� ������ ��� �����������. ���������� ����� ������� ���������� � ������� ���������� ����.");
		Doc_PrintLines(nDocID,0," ");
		Doc_PrintLines(nDocID,0,"����������. ������������ �������� ����� ��������� ����� ����� �������� � ������ ��������.");
		Doc_SetMargins(nDocID,-1,200,50,50,50,1);
		Doc_Show(nDocID);
		if(MP3RECIPE == FALSE)
		{
			PrintScreen("������ ����� ������!",-1,12,"FONT_OLD_20_WHITE.TGA",4);
			B_LogEntry("�������","������ ������ ����� ���������� ������� (���������� ���� +70). ���������: �������� ������ (1).");
			MP3RECIPE = TRUE;
		};
	};
};

func void usempmaxrecipe_priced()
{
	var int nDocID;
	if(ALCHEMYACTIVE == FALSE)
	{
		PrintScreen("���������� �������� ������ �������!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,1);
		Doc_SetPage(nDocID,0,"letters2.TGA",0);
		Doc_SetFont(nDocID,-1,"font_10_book.tga");
		Doc_SetMargins(nDocID,-1,50,50,50,50,1);
		Doc_PrintLines(nDocID,0,"������� �� '������� ����� ����, ����� � ��������' ������, 562 �.");
		Doc_PrintLines(nDocID,0,"-------------------");
		Doc_PrintLines(nDocID,0,"...� ������ ���������� ����� ��� �������� ���������� ������������ ����� ���� ������������ ���������� ������� ��� � ������ ����.");
		Doc_PrintLines(nDocID,0," ");
		Doc_PrintLines(nDocID,0,"...��� ������� ��������� ����������� ���� � ��������� � �������. ��� �������� ������ ����� �������� ������ ������ ���� ������� ��������� ����� �������. ����������� ��� � ����� ��� �����������. ����� ��� ������� ����������, � ����� ������� � ����� ����. ���� �������� ����, ����� �������� ������� ������ ���� ������� � �������� �� � �����. ������� ����� � ���������� ���������� ���... � ���������� �������� �������� ������ ���������� ����...");
		Doc_PrintLines(nDocID,0," ");
		Doc_PrintLines(nDocID,0,"����������. ������ ��� ���������, ��� �� ����������� ������, � �� ������� �� ����, ���. ������������ ���������� ����� �������� � ������������� ��������, ������� ����� ����������� �� ������� ���� ��������������.");
		Doc_SetMargins(nDocID,-1,200,50,50,50,1);
		Doc_Show(nDocID);
		if(MPMAXRECIPE == FALSE)
		{
			PrintScreen("������ ����� ������!",-1,12,"FONT_OLD_20_WHITE.TGA",4);
			B_LogEntry("�������","������ ������ �������� ���� ���� (������������ ���������� ���� +5). ���������: ������ ��� (1) � ������ ���� (1).");
			MPMAXRECIPE = TRUE;
		};
	};
};

func void usejoint2recipe()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters2.TGA",0);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLines(nDocID,0,"��� ������� ����! ��� ������������� ����� ������� ������ �����: �� ��� � ������ ��������� ����������� � ����� �� ������ ���������� � ������������. ���������� ���������� ������������ �� ������.");
	Doc_PrintLine(nDocID,0," ");
	Doc_PrintLine(nDocID,0," ");
	Doc_PrintLine(nDocID,0," ");
	Doc_PrintLine(nDocID,0,"     - �������");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
	JOINT2RECIPE = TRUE;
};

func void usejoint3recipe()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters2.TGA",0);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLines(nDocID,0,"������ ����. ��� ������������� ����� ������� ������ ������� �����. �� ����� �������� � ������� � ������� � ������������ ����������.");
	Doc_PrintLines(nDocID,0,"����� � ������ �� ���� �������� ��������, �� ����� ������ ����� ������ ������� �� ����.");
	Doc_PrintLine(nDocID,0," ");
	Doc_PrintLine(nDocID,0," ");
	Doc_PrintLine(nDocID,0,"     - �������");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
	JOINT3RECIPE = TRUE;
};

