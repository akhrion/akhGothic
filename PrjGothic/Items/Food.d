
const int Value_Bugmeat = 0;
const int HP_Bugmeat = 1;
const int Value_Apfel = 4;
const int HP_Apfel = 8;
const int Value_Weintrauben = 6;
const int HP_Weintrauben = 8;
const int Value_Wasser = 2;
const int HP_Wasser = 10;
const int Value_Bier = 10;
const int HP_Bier = 3;
const int Value_Wein = 12;
const int HP_Wein = 5;
const int Value_Reisschnaps = 14;
const int HP_Reisschnaps = 7;
const int Value_Reis = 4;
const int HP_Reis = 10;
const int Value_Wurzelsuppe = 2;
const int HP_Wurzelsuppe = 7;
const int Value_Ragout = 4;
const int HP_Ragout = 9;
const int Value_CrawlerSuppe = 10;
const int HP_CrawlerSuppe = 15;
const int Value_FleischRoh = 4;
const int HP_FleischRoh = 6;
const int Value_Brot = 8;
const int HP_Brot = 12;
const int Value_K�se = 10;
const int HP_K�se = 15;
const int Value_Fleisch = 8;
const int HP_Fleisch = 15;
const int Value_Schinken = 12;
const int HP_Schinken = 18;
const int Value_Waldbeeren = 4;
const int HP_Waldbeeren = 10;
const int Value_Flammendorn = 6;
const int HP_Flammendorn = 12;
const int Value_Seraphis = 6;
const int HP_Seraphis = 5;
const int Value_Velayis = 8;
const int HP_Velayis = 16;
const int Value_Bergmoos = 50;
const int HP_Bergmoos = 18;
const int Value_Grabmoos = 70;
const int HP_Grabmoos = 20;
const int Value_Nachtschatten = 10;
const int HP_Nachtschatten = 22;
const int Value_Mondschatten = 10;
const int HP_Mondschatten = 24;
const int Value_Orkblatt = 12;
const int HP_Orkblatt = 26;
const int Value_Eichenblatt = 14;
const int HP_Eichenblatt = 28;
const int Value_H�llenpilz = 2;
const int HP_H�llenpilz = 6;
const int Value_Sklavenbrot = 8;
const int HP_Sklavenbrot = 15;
const int Value_Heilkr�uter1 = 14;
const int HP_Heilkr�uter1 = 30;
const int Value_Heilkr�uter2 = 18;
const int HP_Heilkr�uter2 = 39;
const int Value_Heilkr�uter3 = 24;
const int HP_Heilkr�uter3 = 49;
const int Value_Trollkirsche = 10;
const int HP_Trollkirsche = -20;
const int Value_Blutbuche = 2;
const int Mana_Blutbuche = 5;
const int Value_Turmeiche = 8;
const int Mana_Turmeiche = 10;
const int Value_Rabenkraut = 12;
const int Mana_Rabenkraut = 15;
const int Value_Dunkelkraut = 16;
const int Mana_Dunkelkraut = 20;
const int Value_Steimwurzel = 20;
const int Mana_Steinwurzel = 25;
const int Value_Drachenwurzel = 20;
const int Mana_Drachenwurzel = 30;

instance ItAt_Meatbug_01(C_Item)
{
	name = "���� ����";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Bugmeat;
	visual = "ItAt_Meatbug_01.3DS";
	material = MAT_LEATHER;
	scemeName = "FOOD";
	on_state[0] = UseBugmeat_01;
	description = name;
	text[0] = "���..";
	text[4] = "����? �� ��� ����� ������� �� �����, �������";
	text[5] = "����� � ������ ����..";
};


func void UseBugmeat_01()
{
	isTasteMeatBug = true;
	var int amount;
	amount = Npc_HasItems(self,ItAt_Meatbug_01) - 1;
	CreateInvItems(self,ItAt_Meatbug_02,amount);
	Npc_RemoveInvItems(self,ItAt_Meatbug_01,amount);
	amount = Npc_HasItems(Meatbug,ItAt_Meatbug_01);
	Npc_RemoveInvItems(Meatbug,ItAt_Meatbug_01,amount);
	CreateInvItems(Meatbug,ItAt_Meatbug_02,amount);
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Bugmeat);
};

instance ItAt_Meatbug_02(C_Item)
{
	name = "���� ����";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Bugmeat;
	visual = "ItAt_Meatbug_01.3DS";
	material = MAT_LEATHER;
	scemeName = "FOOD";
	on_state[0] = UseBugmeat_02;
	description = name;
	text[0] = "����� ��������, ��.. � ��� ��������?";
	text[4] = "����? �� ��� ����� ������� �� �����, �������";
	text[5] = "����� � ������ ����..";
};

func void UseBugmeat_02()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Bugmeat);
};

instance ItFoApple(C_Item)
{
	name = "������";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Apfel;
	visual = "ItFo_Apple_01.3ds";
	material = MAT_LEATHER;
	scemeName = "FOOD";
	on_state[0] = UseApple;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Apfel;
	text[5] = NAME_Value;
	count[5] = Value_Apfel;
};


func void UseApple()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Apfel);
};


instance ItFo_wineberrys_01(C_Item)
{
	name = "����������� ������";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Weintrauben;
	visual = "ItFo_wineberrys_01.3ds";
	on_state[0] = Usewineberrys;
	scemeName = "FOOD";
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Weintrauben;
	text[5] = NAME_Value;
	count[5] = Value_Weintrauben;
};


func void Usewineberrys()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Weintrauben);
};


instance ItFoLoaf(C_Item)
{
	name = "����";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Brot;
	visual = "ItFo_Loaf_01.3ds";
	scemeName = "FOODHUGE";
	on_state[0] = UseLoaf;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Brot;
	text[5] = NAME_Value;
	count[5] = Value_Brot;
};


func void UseLoaf()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Brot);
};


instance ItFoMutton(C_Item)
{
	name = "������� ����";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Fleisch;
	visual = "ItFo_CookedMutton_01.3ds";
	scemeName = "MEAT";
	on_state[0] = UseMutton;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Fleisch;
	text[5] = NAME_Value;
	count[5] = Value_Fleisch;
};


func void UseMutton()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Fleisch);
};


instance ItFoMuttonRaw(C_Item)
{
	name = "����� ����";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_FleischRoh;
	visual = "ItFo_RawMutton_01.3ds";
	scemeName = "MEAT";
	on_state[0] = UseMuttonRaw;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_FleischRoh;
	text[5] = NAME_Value;
	count[5] = Value_FleischRoh;
};


func void UseMuttonRaw()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_FleischRoh);
};


instance ItFo_mutton_01(C_Item)
{
	name = "������";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Schinken;
	visual = "ItFo_mutton_01.3ds";
	scemeName = "FOODHUGE";
	on_state[0] = UseMutton1;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Schinken;
	text[5] = NAME_Value;
	count[5] = Value_Schinken;
};


func void UseMutton1()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Schinken);
};


instance ItFoCheese(C_Item)
{
	name = "���";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_K�se;
	visual = "ItFo_Cheese_01.3ds";
	scemeName = "FOODHUGE";
	on_state[0] = UseCheese;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_K�se;
	text[5] = NAME_Value;
	count[5] = Value_K�se;
};


func void UseCheese()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_K�se);
};


instance ItFoRice(C_Item)
{
	name = "���";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Reis;
	visual = "ItFo_Rice_01.3ds";
	scemeName = "RICE";
	on_state[0] = UseRice;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Reis;
	text[5] = NAME_Value;
	count[5] = Value_Reis;
};


func void UseRice()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Reis);
};


instance ItFoSoup(C_Item)
{
	name = "��� �� ��������";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Wurzelsuppe;
	visual = "ItFo_Soup_01.3ds";
	scemeName = "RICE";
	on_state[0] = UseSoup;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Wurzelsuppe;
	text[5] = NAME_Value;
	count[5] = Value_Wurzelsuppe;
};


func void UseSoup()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Wurzelsuppe);
};


instance ItFoMeatbugragout(C_Item)
{
	name = "���� �� �����";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Ragout;
	visual = "ItFo_Meatbugragout_01.3ds";
	material = MAT_LEATHER;
	scemeName = "RICE";
	on_state[0] = UseMeatbugragout;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Ragout;
	text[5] = NAME_Value;
	count[5] = Value_Ragout;
};


func void UseMeatbugragout()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Ragout);
};


instance ItFoCrawlersoup(C_Item)
{
	name = "��� � ����� ��������";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_CrawlerSuppe;
	visual = "ItFo_Crawlersoup_01.3ds";
	material = MAT_LEATHER;
	on_state[0] = UseCrawlersoup;
	scemeName = "RICE";
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_CrawlerSuppe;
	text[5] = NAME_Value;
	count[5] = Value_CrawlerSuppe;
};


func void UseCrawlersoup()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_CrawlerSuppe);
};


instance ItFo_Potion_Water_01(C_Item)
{
	name = "����";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Wasser;
	visual = "ItFo_Potion_Water_01.3ds";
	material = MAT_GLAS;
	on_state[0] = UseWaterPotion;
	scemeName = "POTION";
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Wasser;
	text[5] = NAME_Value;
	count[5] = Value_Wasser;
};


func void UseWaterPotion()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Wasser);
};


instance ItFoBeer(C_Item)
{
	name = "����";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Bier;
	visual = "ItFo_Beer_01.3ds";
	material = MAT_GLAS;
	on_state[0] = UseBooze;
	scemeName = "POTION";
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Reisschnaps;
	text[5] = NAME_Value;
	count[5] = Value_Bier;
};

instance ItFoWine(C_Item)
{
	name = "����";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Wein;
	visual = "ItFo_Wine_01.3ds";
	material = MAT_LEATHER;
	on_state[0] = UseBooze;
	scemeName = "POTION";
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Reisschnaps;
	text[5] = NAME_Value;
	count[5] = Value_Wein;
};

instance ItFoBooze(C_Item)
{
	name = "������� �����";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Reisschnaps;
	visual = "ItFo_Booze_01.3ds";
	material = MAT_GLAS;
	on_state[0] = UseBooze;
	scemeName = "POTION";
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Reisschnaps;
	text[5] = NAME_Value;
	count[5] = Value_Reisschnaps;
};


func void UseBooze()
{
	if(Npc_IsPlayer(self) && (hero.attribute[ATR_HITPOINTS] == hero.attribute[ATR_HITPOINTS_MAX]))
	{
		Mdl_ApplyOverlayMdsTimed(self,"HUMANS_DRUNKEN.MDS",50000);
	};
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Reisschnaps);
};


instance ItFo_Plants_Berrys_01(C_Item)
{
	name = "������ �����";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Waldbeeren;
	visual = "ItFo_Plants_Berrys_01.3ds";
	material = MAT_WOOD;
	on_state[0] = UseBerrys;
	scemeName = "FOOD";
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Waldbeeren;
	text[5] = NAME_Value;
	count[5] = Value_Waldbeeren;
};


func void UseBerrys()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Waldbeeren);
	PrintDebugNpc(PD_ITEM_MOBSI,"� �� �����.");
};


instance ItFo_Plants_Flameberry_01(C_Item)
{
	name = "�������� �����";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Flammendorn;
	visual = "ItFo_Plants_Flameberry_01.3ds";
	material = MAT_WOOD;
	on_state[0] = Useflame;
	scemeName = "FOOD";
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Flammendorn;
	text[5] = NAME_Value;
	count[5] = Value_Flammendorn;
};


func void Useflame()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Flammendorn);
	PrintDebugNpc(PD_ITEM_MOBSI,"� �� �������� �����.");
};


instance ItFo_Plants_Seraphis_01(C_Item)
{
	name = "�������";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Seraphis;
	visual = "ItFo_Plants_Seraphis_01.3ds";
	material = MAT_WOOD;
	on_state[0] = Useseraphis;
	scemeName = "FOOD";
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Seraphis;
	text[5] = NAME_Value;
	count[5] = Value_Seraphis;
};


func void Useseraphis()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Seraphis);
	PrintDebugNpc(PD_ITEM_MOBSI,"� �� �������.");
};


instance ItFo_Plants_Velayis_01(C_Item)
{
	name = "������";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Velayis;
	visual = "ItFo_Plants_Flameberry_02.3ds";
	material = MAT_WOOD;
	on_state[0] = UseVelayis;
	scemeName = "FOOD";
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Velayis;
	text[5] = NAME_Value;
	count[5] = Value_Velayis;
};


func void UseVelayis()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Velayis);
	PrintDebugNpc(PD_ITEM_MOBSI,"� �� ������.");
};


instance ItFo_Plants_mountainmoos_01(C_Item)
{
	name = "������ ���";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Bergmoos;
	visual = "ItFo_Plants_mountainmoos_01.3ds";
	material = MAT_WOOD;
	on_state[0] = Usemoos;
	scemeName = "FOOD";
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Bergmoos;
	text[5] = NAME_Value;
	count[5] = Value_Bergmoos;
};


func void Usemoos()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Bergmoos);
	PrintDebugNpc(PD_ITEM_MOBSI,"� �� ���.");
};


instance ItFo_Plants_mountainmoos_02(C_Item)
{
	name = "��������� ���";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Grabmoos;
	visual = "ItFo_Plants_mountainmoos_02.3ds";
	material = MAT_WOOD;
	on_state[0] = Usemoos2;
	scemeName = "FOOD";
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Grabmoos;
	text[5] = NAME_Value;
	count[5] = Value_Grabmoos;
};


func void Usemoos2()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Grabmoos);
	PrintDebugNpc(PD_ITEM_MOBSI,"� �� ��������� ���.");
};


instance ItFo_Plants_Nightshadow_01(C_Item)
{
	name = "������ ����";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Nachtschatten;
	visual = "ItFo_Plants_Nightshadow_01.3ds";
	material = MAT_WOOD;
	on_state[0] = Usenight;
	scemeName = "FOOD";
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Nachtschatten;
	text[5] = NAME_Value;
	count[5] = Value_Nachtschatten;
};


func void Usenight()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Nachtschatten);
	PrintDebugNpc(PD_ITEM_MOBSI,"� �� ������ ����.");
};


instance ItFo_Plants_Nightshadow_02(C_Item)
{
	name = "������ ����";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Mondschatten;
	visual = "ItFo_Plants_Moonshadow.3ds";
	material = MAT_WOOD;
	on_state[0] = Usemoon;
	scemeName = "FOOD";
	description = name;
	text[1] = NAME_Bonus_Mana;
	count[1] = HP_Mondschatten;
	text[5] = NAME_Value;
	count[5] = Value_Mondschatten;
};


func void Usemoon()
{
	Npc_ChangeAttribute(self,ATR_MANA,HP_Mondschatten);
	PrintDebugNpc(PD_ITEM_MOBSI,"� �� ������ ����.");
};


instance ItFo_Plants_OrcHerb_01(C_Item)
{
	name = "������ ����";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Orkblatt;
	visual = "ItFo_Plants_OrcHerb_01.3ds";
	material = MAT_WOOD;
	on_state[0] = Useorc;
	scemeName = "FOOD";
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Orkblatt;
	text[5] = NAME_Value;
	count[5] = Value_Orkblatt;
};


func void Useorc()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Orkblatt);
	PrintDebugNpc(PD_ITEM_MOBSI,"� �� ������ ����.");
};


instance ItFo_Plants_OrcHerb_02(C_Item)
{
	name = "������� ����";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Eichenblatt;
	visual = "ItFo_Plants_OakHerb.3ds";
	material = MAT_WOOD;
	on_state[0] = Useorc2;
	scemeName = "FOOD";
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Eichenblatt;
	text[5] = NAME_Value;
	count[5] = Value_Eichenblatt;
};


func void Useorc2()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Eichenblatt);
	PrintDebugNpc(PD_ITEM_MOBSI,"� �� ������� ����.");
};


instance ItFo_Plants_mushroom_01(C_Item)
{
	name = "������ ����";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_H�llenpilz;
	visual = "ItFo_Plants_mushroom_01.3ds";
	material = MAT_WOOD;
	on_state[0] = Usemush;
	scemeName = "FOOD";
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_H�llenpilz;
	text[5] = NAME_Value;
	count[5] = Value_H�llenpilz;
};


func void Usemush()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_H�llenpilz);
	PrintDebugNpc(PD_ITEM_MOBSI,"� �� ������ ����.");
};


instance ItFo_Plants_mushroom_02(C_Item)
{
	name = "������� ����";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Sklavenbrot;
	visual = "ItFo_Plants_mushroom_02.3ds";
	material = MAT_WOOD;
	on_state[0] = Usemush2;
	scemeName = "FOOD";
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Sklavenbrot;
	text[5] = NAME_Value;
	count[5] = Value_Sklavenbrot;
};


func void Usemush2()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Sklavenbrot);
	PrintDebugNpc(PD_ITEM_MOBSI,"� �� ������� ����.");
};


instance ItFo_Plants_Herb_01(C_Item)
{
	name = "�������� �����";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Heilkr�uter1;
	visual = "ItFo_Plants_Herb_01.3ds";
	material = MAT_WOOD;
	on_state[0] = UsePlants1;
	scemeName = "FOOD";
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Heilkr�uter1;
	text[5] = NAME_Value;
	count[5] = Value_Heilkr�uter1;
};


func void UsePlants1()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Heilkr�uter1);
	PrintDebugNpc(PD_ITEM_MOBSI,"� �� �������� �����.");
};


instance ItFo_Plants_Herb_02(C_Item)
{
	name = "�������� ��������";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Heilkr�uter2;
	visual = "ItFo_Plants_Herb_02.3ds";
	material = MAT_WOOD;
	on_state[0] = UsePlants2;
	scemeName = "FOOD";
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Heilkr�uter2;
	text[5] = NAME_Value;
	count[5] = Value_Heilkr�uter2;
};


func void UsePlants2()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Heilkr�uter2);
	PrintDebugNpc(PD_ITEM_MOBSI,"� �� �������� �����.");
};


instance ItFo_Plants_Herb_03(C_Item)
{
	name = "�������� ������";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Heilkr�uter3;
	visual = "ItFo_Plants_Herb_03.3ds";
	material = MAT_WOOD;
	on_state[0] = UsePlants3;
	scemeName = "FOOD";
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Heilkr�uter3;
	text[5] = NAME_Value;
	count[5] = Value_Heilkr�uter3;
};


func void UsePlants3()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Heilkr�uter3);
	PrintDebugNpc(PD_ITEM_MOBSI,"� �� �������� �����.");
};


instance ItFo_Plants_Bloodwood_01(C_Item)
{
	name = "������ ����";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Blutbuche;
	visual = "ItFo_Plants_Bloodwood_01.3ds";
	material = MAT_WOOD;
	on_state[0] = Useblood;
	scemeName = "FOOD";
	description = name;
	text[1] = NAME_Bonus_Mana;
	count[1] = Mana_Blutbuche;
	text[5] = NAME_Value;
	count[5] = Value_Blutbuche;
};


func void Useblood()
{
	Npc_ChangeAttribute(self,ATR_MANA,Mana_Blutbuche);
	PrintDebugNpc(PD_ITEM_MOBSI,"� �� ������ ����.");
};


instance ItFo_Plants_Towerwood_01(C_Item)
{
	name = "���� ������";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = 100;
	visual = "ItFo_Plants_Honey_01.3ds";
	material = MAT_WOOD;
	on_state[0] = usehoneycomb;
	scemeName = "FOODHUGE";
	description = name;
	text[1] = "������ ���������� ���������������.";
	text[2] = "�������� ������� ���!";
	text[5] = NAME_Value;
	count[5] = 100;
};


func void usehoneycomb()
{
	if(HONEYCOMB == 0)
	{
		HONEYCOMB = 1;
		PrintScreen("������� ���: 1/5",-1,40,"FONT_OLD_20_WHITE.TGA",5);
		Log_CreateTopic("���� �������",LOG_NOTE);
		B_LogEntry("���� �������","� ����� ���� ������ � ����� ����������� �� ���� �� ���. �������� ������!");
		B_GiveXP(200);
	}
	else if(HONEYCOMB == 1)
	{
		HONEYCOMB = 2;
		PrintScreen("������� ���: 2/5",-1,40,"FONT_OLD_20_WHITE.TGA",5);
		B_LogEntry("���� �������","������ ������ ��������� ��� �������!");
		B_GiveXP(300);
	}
	else if(HONEYCOMB == 2)
	{
		HONEYCOMB = 3;
		PrintScreen("������� ���: 3/5",-1,40,"FONT_OLD_20_WHITE.TGA",5);
		B_LogEntry("���� �������","���� ������ ����. ����, ��� �� ��� ������ �����.");
		B_GiveXP(400);
	}
	else if(HONEYCOMB == 3)
	{
		HONEYCOMB = 4;
		PrintScreen("������� ���: 4/5",-1,40,"FONT_OLD_20_WHITE.TGA",5);
		B_LogEntry("���� �������","��������� �������. �����, ������ ���������� ������� � ������� ���� ����?");
		B_GiveXP(500);
	}
	else if(HONEYCOMB == 4)
	{
		HONEYCOMB = 5;
		PrintScreen("������� ���: 5/5",-1,40,"FONT_OLD_20_WHITE.TGA",5);
		B_LogEntry("���� �������","�����, ���� ��� ����� ����������. � � ������ �������� ���� �������!");
		B_GiveXP(600);
		Snd_Play("BLO_WARN_A1");
	}
	else if(HONEYCOMB == 5)
	{
		B_GiveXP(100);
	};
};


instance ItFo_Plants_RavenHerb_01(C_Item)
{
	name = "������� �����";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Rabenkraut;
	visual = "ItFo_Plants_RavenHerb_01.3ds";
	material = MAT_WOOD;
	on_state[0] = Useraven;
	scemeName = "FOOD";
	description = name;
	text[1] = NAME_Bonus_Mana;
	count[1] = Mana_Rabenkraut;
	text[5] = NAME_Value;
	count[5] = Value_Rabenkraut;
};


func void Useraven()
{
	Npc_ChangeAttribute(self,ATR_MANA,Mana_Rabenkraut);
	PrintDebugNpc(PD_ITEM_MOBSI,"� �� ������� �����.");
};


instance ItFo_Plants_RavenHerb_02(C_Item)
{
	name = "������ ����";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Dunkelkraut;
	visual = "ItFo_Plants_DarkHerb.3ds";
	material = MAT_WOOD;
	on_state[0] = Useraven2;
	scemeName = "FOOD";
	description = name;
	text[1] = NAME_Bonus_Mana;
	count[1] = Mana_Dunkelkraut;
	text[5] = NAME_Value;
	count[5] = Value_Dunkelkraut;
};


func void Useraven2()
{
	Npc_ChangeAttribute(self,ATR_MANA,Mana_Dunkelkraut);
	PrintDebugNpc(PD_ITEM_MOBSI,"� �� ������ ����.");
};


instance ItFo_Plants_Stoneroot_01(C_Item)
{
	name = "�������� ������";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Steimwurzel;
	visual = "ItFo_Plants_Stoneroot_01.3ds";
	material = MAT_WOOD;
	on_state[0] = Useroot;
	scemeName = "FOOD";
	description = name;
	text[1] = NAME_Bonus_Mana;
	count[1] = Mana_Steinwurzel;
	text[5] = NAME_Value;
	count[5] = Value_Steimwurzel;
};


func void Useroot()
{
	Npc_ChangeAttribute(self,ATR_MANA,Mana_Steinwurzel);
	PrintDebugNpc(PD_ITEM_MOBSI,"� �� �������� ������.");
};


instance ItFo_Plants_Stoneroot_02(C_Item)
{
	name = "�������� ������";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Drachenwurzel;
	visual = "ItFo_Plants_Dragonroot.3ds";
	material = MAT_WOOD;
	on_state[0] = Useroot2;
	scemeName = "FOOD";
	description = name;
	text[1] = NAME_Bonus_Mana;
	count[1] = Mana_Drachenwurzel;
	text[5] = NAME_Value;
	count[5] = Value_Drachenwurzel;
};


func void Useroot2()
{
	Npc_ChangeAttribute(self,ATR_MANA,Mana_Drachenwurzel);
	PrintDebugNpc(PD_ITEM_MOBSI,"� �� �������� ������.");
};


instance ItFo_Plants_Trollberrys_01(C_Item)
{
	name = "����� �������";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Trollkirsche;
	visual = "ItFo_Plants_Trollberrys_01.3ds";
	material = MAT_WOOD;
	on_state[0] = UseTrollberrys;
	scemeName = "FOOD";
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Trollkirsche;
	text[5] = NAME_Value;
	count[5] = Value_Trollkirsche;
};


func void UseTrollberrys()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Trollkirsche);
	PrintDebugNpc(PD_ITEM_MOBSI,"� �� ����� �������.");
};


instance ITFO_PLANTS_DEADLEAF(C_Item)
{
	name = "������� ����";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = 50;
	visual = "ItFo_Plants_Deadleaf.3ds";
	material = MAT_WOOD;
	on_state[0] = usedeadleaf;
	scemeName = "FOOD";
	description = name;
	text[1] = NAME_Bonus_Mana;
	count[1] = 35;
	text[5] = NAME_Value;
	count[5] = 50;
};


func void usedeadleaf()
{
	Npc_ChangeAttribute(self,ATR_MANA,35);
};

