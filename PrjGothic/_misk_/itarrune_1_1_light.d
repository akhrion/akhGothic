
instance ITARRUNE_1_1_LIGHT(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 300;
	visual = "ItAr_Rune_42.3ds";
	material = MAT_STONE;
	spell = SPL_LIGHT;
	mag_circle = 1;
	description = "Свет";
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_LIGHT;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArScrollLight(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 5;
	visual = "ItAr_Scroll_32_EG.3DS";
	material = MAT_LEATHER;
	spell = SPL_LIGHT;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_LIGHT;
	description = "Свет";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_LIGHT;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITARRUNE_2_1_FIREBOLT(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 300;
	visual = "ItAr_Rune_23.3ds";
	material = MAT_STONE;
	spell = SPL_FIREBOLT;
	mag_circle = 1;
	description = "Огненная стрела";
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_FIREBOLT;
	text[2] = NAME_Dam_Fire;
	count[2] = SPL_DAMAGE_FIREBOLT;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArScrollFirebolt(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 30;
	visual = "ItAr_Scroll_35.3DS";
	material = MAT_LEATHER;
	spell = SPL_FIREBOLT;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_FIREBOLT;
	description = "Огненная стрела";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_FIREBOLT;
	text[2] = NAME_Dam_Fire;
	count[2] = SPL_DAMAGE_FIREBOLT;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITARRUNE_2_2_FIREBALL(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 700;
	visual = "ItAr_Rune_26.3ds";
	material = MAT_STONE;
	spell = SPL_FIREBALL;
	mag_circle = 3;
	description = "Огненный шар";
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_ManakostenMax;
	count[1] = SPL_SENDCAST_FIREBALL;
	text[2] = "Огненный урон (за ед. маг. силы):";
	count[2] = SPL_DAMAGE_FIREBALL;
	text[4] = NAME_Spell_Load;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArScrollFireball(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 70;
	visual = "ItAr_Scroll_27.3DS";
	material = MAT_LEATHER;
	spell = SPL_FIREBALL;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_FIREBALL;
	description = "Огненный шар";
	text[1] = NAME_ManakostenMax;
	count[1] = SPL_SENDCAST_FIREBALL;
	text[2] = "Огненный урон (за ед. маг. силы):";
	count[2] = SPL_DAMAGE_FIREBALL;
	text[4] = NAME_Spell_Load;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITARRUNE_2_3_FIRESTORM(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 1100;
	visual = "ItAr_Rune_24.3ds";
	material = MAT_STONE;
	spell = SPL_FIRESTORM;
	mag_circle = 4;
	description = "Огненный шторм";
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_ManakostenMax;
	count[1] = SPL_SENDCAST_FIRESTORM;
	text[2] = "Огненный урон (за ед. маг. силы):";
	count[2] = SPL_DAMAGE_FIRESTORM;
	text[4] = NAME_Spell_Load;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArScrollFirestorm(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 110;
	visual = "ItAr_Scroll_36.3DS";
	material = MAT_LEATHER;
	spell = SPL_FIRESTORM;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_FIRESTORM;
	description = "Огненный шторм";
	text[1] = NAME_ManakostenMax;
	count[1] = SPL_SENDCAST_FIRESTORM;
	text[2] = "Огненный урон (за ед. маг. силы):";
	count[2] = SPL_DAMAGE_FIRESTORM;
	text[4] = NAME_Spell_Load;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITARRUNE_2_4_FIRERAIN(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 1300;
	visual = "ItAr_Rune_25.3ds";
	material = MAT_STONE;
	spell = SPL_FIRERAIN;
	mag_circle = 5;
	description = "Огненный дождь";
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_FIRERAIN;
	text[2] = NAME_Dam_Fire;
	count[2] = SPL_DAMAGE_FIRERAIN;
	text[5] = NAME_Value;
	count[5] = value;
};

instance TEST_ITARRUNE_2_4_FIRERAININV(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 1300;
	visual = "ItAr_Rune_25.3ds";
	material = MAT_STONE;
	spell = SPL_FIRERAININV;
	mag_circle = 5;
	description = "Огненный дождь инвестируемый ТЕСТ";
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_FIRERAIN;
	text[2] = NAME_Dam_Fire;
	count[2] = SPL_DAMAGE_FIRERAIN;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArScrollFirerain(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 130;
	visual = "ItAr_Scroll_28.3DS";
	material = MAT_LEATHER;
	spell = SPL_FIRERAIN;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_FIRERAIN;
	description = "Огненный дождь";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_FIRERAIN;
	text[2] = NAME_Dam_Fire;
	count[2] = SPL_DAMAGE_FIRERAIN;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITARRUNE_1_3_TELEPORT1(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	visual = "ItAr_Rune_38.3ds";
	material = MAT_STONE;
	spell = SPL_Teleport1;
	description = "Телепортация к магам Огня";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_TELEPORT;
};

instance ItArScrollTeleport1(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	visual = "ItAr_Scroll_38.3DS";
	material = MAT_LEATHER;
	spell = SPL_Teleport1;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_TELEPORT;
	description = "Телепортация к магам Огня";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_TELEPORT;
};

instance ITARRUNE_1_4_TELEPORT2(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	visual = "ItAr_Rune_40.3ds";
	material = MAT_STONE;
	spell = SPL_Teleport2;
	description = "Телепортация к магам Воды";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_TELEPORT;
};

instance ItArScrollTeleport2(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	visual = "ItAr_Scroll_40.3DS";
	material = MAT_LEATHER;
	spell = SPL_Teleport2;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_TELEPORT;
	description = "Телепортация к магам Воды";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_TELEPORT;
};

instance ITARRUNE_1_6_TELEPORT3(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	visual = "ItAr_Rune_41.3ds";
	material = MAT_STONE;
	spell = SPL_Teleport3;
	description = "Телепортация к некроманту";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_TELEPORT;
};

instance ItArScrollTeleport3(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	visual = "ItAr_Scroll_39.3DS";
	material = MAT_LEATHER;
	spell = SPL_Teleport3;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_TELEPORT;
	description = "Телепортация к некроманту";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_TELEPORT;
};

instance ItArScrollTeleport4(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	visual = "ItAr_Scroll_43_EG.3DS";
	material = MAT_LEATHER;
	spell = SPL_Teleport4;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_TELEPORT;
	description = "Орочье заклинание";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_TELEPORT;
};

instance ITARRUNE_1_5_TELEPORT5(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	visual = "ItAr_Rune_39.3ds";
	material = MAT_STONE;
	spell = SPL_Teleport5;
	description = "Телепортация в Болотный лагерь";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_TELEPORT;
};

instance ItArScrollTeleport5(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	visual = "ItAr_Scroll_37.3DS";
	material = MAT_LEATHER;
	spell = SPL_Teleport5;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_TELEPORT;
	description = "Телепортация в Болотный лагерь";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_TELEPORT;
};

instance ITARRUNE_1_2_HEAL(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 500;
	visual = "ItAr_Rune_27.3ds";
	material = MAT_STONE;
	spell = SPL_HEAL;
	mag_circle = 2;
	description = "Лечение";
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_HealingPerMana;
	count[1] = SPL_HEALING_HP_PER_MP;
	text[4] = NAME_Spell_Invest;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArScrollHeal(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 50;
	visual = "ItAr_Scroll_33_EG.3DS";
	material = MAT_LEATHER;
	spell = SPL_HEAL;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_HEALING_HP_PER_MP;
	description = "Лечение";
	text[1] = NAME_HealingPerMana;
	count[1] = SPL_HEALING_HP_PER_MP;
	text[2] = NAME_Mana_needed;
	count[2] = SPL_HEALING_HP_PER_MP;
	text[4] = NAME_Spell_Invest;
	text[5] = NAME_Value;
	count[5] = value;
};
//AKH WORKING MAGIC
//wont work.. game crash..
//Если пытаться расширить кол-во спелов выше 60, то крашит.
//Почему-то свитки не исчезают после каста..
//Уже не крашит: как-же дохуя различных файлов в создании спела.. и из-за TXT_SPELLS[59]..
instance ItArScrollHealNearby(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 50;
	visual = "ItAr_Scroll_33_EG.3DS";
	material = MAT_LEATHER;
	spell = SPL_HEALNEARBY;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_HEALING_HP_PER_MP;
	description = TXT_SPELLS[54];
	text[1] = NAME_HealingPerMana;
	count[1] = SPL_HEALING_HP_PER_MP;
	text[2] = NAME_Mana_needed;
	count[2] = SPL_HEALING_HP_PER_MP;
	text[4] = NAME_Spell_Invest;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItArScrollHealNearby2(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 50;
	visual = "ItAr_Scroll_33_EG.3DS";
	material = MAT_LEATHER;
	spell = SPL_HEALNEARBY2;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_HEALING_HP_PER_MP;
	description = TXT_SPELLS[54];
	text[1] = NAME_HealingPerMana;
	count[1] = SPL_HEALING_HP_PER_MP;
	text[2] = NAME_Mana_needed;
	count[2] = SPL_HEALING_HP_PER_MP;
	text[4] = NAME_Spell_Invest;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArScrollTrfBloodfly(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 300;
	visual = "ITAR_SCROLL_02_EG.3DS";
	material = MAT_LEATHER;
	spell = SPL_TRF_BLOODFLY;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_TRF_BLOODFLY;
	description = "Превращение в шершня";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_TRF_BLOODFLY;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArScrollTrfCrawler(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 300;
	visual = "ItAr_Scroll_04.3DS";
	material = MAT_LEATHER;
	spell = SPL_TRF_CRAWLER;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_TRF_CRAWLER;
	description = "Превращение в ползуна";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_TRF_CRAWLER;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArScrollTrfLurker(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 300;
	visual = "ItAr_Scroll_02.3DS";
	material = MAT_LEATHER;
	spell = SPL_TRF_LURKER;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_TRF_LURKER;
	description = "Превращение в шныга";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_TRF_LURKER;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArScrollTrfMeatbug(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 300;
	visual = "ItAr_Scroll_03.3DS";
	material = MAT_LEATHER;
	spell = SPL_TRF_MEATBUG;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_TRF_MEATBUG;
	description = "Превращение в мясного жука";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_TRF_MEATBUG;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArScrollTrfMolerat(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 300;
	visual = "ItAr_Scroll_05.3DS";
	material = MAT_LEATHER;
	spell = SPL_TRF_MOLERAT;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_TRF_MOLERAT;
	description = "Превращение в кротокрыса";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_TRF_MOLERAT;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArScrollTrfOrcdog(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 300;
	visual = "ItAr_Scroll_11.3DS";
	material = MAT_LEATHER;
	spell = SPL_TRF_ORCDOG;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_TRF_ORCDOG;
	description = "Превращение в орочью собаку";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_TRF_ORCDOG;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArScrollTrfScavenger(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 300;
	visual = "ItAr_Scroll_07.3DS";
	material = MAT_LEATHER;
	spell = SPL_TRF_SCAVENGER;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_TRF_SCAVENGER;
	description = "Превращение в падальщика";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_TRF_SCAVENGER;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArScrollTrfShadowbeast(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 300;
	visual = "ItAr_Scroll_06.3DS";
	material = MAT_LEATHER;
	spell = SPL_TRF_SHADOWBEAST;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_TRF_SHADOWBEAST;
	description = "Превращение в мракориса";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_TRF_SHADOWBEAST;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArScrollTrfSnapper(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 300;
	visual = "ItAr_Scroll_30_EG.3DS";
	material = MAT_LEATHER;
	spell = SPL_TRF_SNAPPER;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_TRF_SNAPPER;
	description = "Превращение в глорха";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_TRF_SNAPPER;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArScrollTrfWaran(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 300;
	visual = "ItAr_Scroll_10.3DS";
	material = MAT_LEATHER;
	spell = SPL_TRF_WARAN;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_TRF_WARAN;
	description = "Превращение в ящерицу";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_TRF_WARAN;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArScrollTrfWolf(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 300;
	visual = "ItAr_Scroll_09.3DS";
	material = MAT_LEATHER;
	spell = SPL_TRF_WOLF;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_TRF_WOLF;
	description = "Превращение в волка";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_TRF_WOLF;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITARRUNE_3_5_CHAINLIGHTNING(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 700;
	visual = "ItAr_Rune_19.3ds";
	material = MAT_STONE;
	spell = SPL_CHAINLIGHTNING;
	mag_circle = 4;
	description = "Молния";
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_DamagePerSec;
	count[1] = SPL_ZAPPED_DAMAGE_PER_SEC;
	text[4] = NAME_Spell_Invest;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArScrollChainLightning(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 70;
	visual = "ItAr_Scroll_31.3DS";
	material = MAT_LEATHER;
	spell = SPL_CHAINLIGHTNING;
	description = "Молния";
	text[1] = NAME_DamagePerSec;
	count[1] = SPL_ZAPPED_DAMAGE_PER_SEC;
	text[4] = NAME_Spell_Invest;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITARRUNE_3_1_THUNDERBOLT(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 500;
	visual = "ItAr_Rune_18.3ds";
	material = MAT_STONE;
	spell = SPL_THUNDERBOLT;
	mag_circle = 1;
	description = "Ледяная стрела";
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_THUNDERBOLT;
	text[2] = NAME_Dam_Magic;
	count[2] = SPL_DAMAGE_THUNDERBOLT;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArScrollThunderbolt(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 50;
	visual = "ItAr_Scroll_20.3DS";
	material = MAT_LEATHER;
	spell = SPL_THUNDERBOLT;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_THUNDERBOLT;
	description = "Ледяная стрела";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_THUNDERBOLT;
	text[2] = NAME_Dam_Magic;
	count[2] = SPL_DAMAGE_THUNDERBOLT;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITARRUNE_3_2_THUNDERBALL(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 900;
	visual = "ItAr_Rune_20.3ds";
	material = MAT_STONE;
	spell = SPL_THUNDERBALL;
	mag_circle = 3;
	description = "Шаровая молния";
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_ManakostenMax;
	count[1] = SPL_SENDCAST_THUNDERBALL;
	text[2] = "Магический урон (за ед. маг. силы):";
	count[2] = SPL_DAMAGE_THUNDERBALL;
	text[4] = NAME_Spell_Load;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArScrollThunderball(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 90;
	visual = "ItAr_Scroll_01.3DS";
	material = MAT_LEATHER;
	spell = SPL_THUNDERBALL;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_THUNDERBALL;
	description = "Шаровая молния";
	text[1] = NAME_ManakostenMax;
	count[1] = SPL_SENDCAST_THUNDERBALL;
	text[2] = "Магический урон (за ед. маг. силы):";
	count[2] = SPL_DAMAGE_THUNDERBALL;
	text[4] = NAME_Spell_Load;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITARRUNE_3_3_ICECUBE(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 700;
	visual = "ItAr_Rune_21.3ds";
	material = MAT_STONE;
	spell = SPL_ICECUBE;
	mag_circle = 3;
	description = "Ледяная глыба";
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_ICECUBE;
	text[2] = NAME_Damage;
	count[2] = SPL_FREEZE_DAMAGE;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArScrollIcecube(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 70;
	visual = "ItAr_Scroll_25.3DS";
	material = MAT_LEATHER;
	spell = SPL_ICECUBE;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_ICECUBE;
	description = "Ледяная глыба";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_ICECUBE;
	text[2] = NAME_Damage;
	count[2] = SPL_FREEZE_DAMAGE;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITARRUNE_3_4_ICEWAVE(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 1100;
	visual = "ItAr_Rune_22.3ds";
	material = MAT_STONE;
	spell = SPL_ICEWAVE;
	mag_circle = 5;
	description = "Ледяная волна";
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_ICEWAVE;
	text[2] = NAME_Damage;
	count[2] = SPL_FREEZE_DAMAGE;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArScrollIceWave(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 110;
	visual = "ItAr_Scroll_30.3DS";
	material = MAT_LEATHER;
	spell = SPL_ICEWAVE;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_ICEWAVE;
	description = "Ледяная волна";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_ICEWAVE;
	text[2] = NAME_Damage;
	count[2] = SPL_FREEZE_DAMAGE;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArScrollSummonDemon(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 550;
	visual = "ItAr_Scroll_18.3DS";
	material = MAT_LEATHER;
	spell = SPL_SUMMONDEMON;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_SUMMONDEMON;
	description = "Призыв демона";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_SUMMONDEMON;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArScrollSummonSkeletons(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 350;
	visual = "ItAr_Scroll_23.3DS";
	material = MAT_LEATHER;
	spell = SPL_SUMMONSKELETON;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_SUMMONSKELETON;
	description = "Призыв скелетов";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_SUMMONSKELETON;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArScrollSummonGolem(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 450;
	visual = "ITAR_SCROLL_23_EG.3DS";
	material = MAT_LEATHER;
	spell = SPL_SUMMONGOLEM;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_SUMMONGOLEM;
	description = "Призыв голема";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_SUMMONGOLEM;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArScrollArmyOfDarkness(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 666;
	visual = "ItAr_Scroll_13_EG.3DS";
	material = MAT_LEATHER;
	spell = SPL_ARMYOFDARKNESS;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_ARMYOFDARKNESS;
	description = "Армия тьмы";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_ARMYOFDARKNESS;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITARRUNE_6_2_ARMYOFDARKNESS(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 6660;
	visual = "ItAr_Rune_13.3ds";
	material = MAT_STONE;
	spell = SPL_ARMYOFDARKNESS;
	mag_circle = 6;
	description = "Армия тьмы";
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_ARMYOFDARKNESS;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITARRUNE_6_1_DESTROYUNDEAD(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 1100;
	visual = "ItAr_Rune_15.3ds";
	material = MAT_STONE;
	spell = SPL_DESTROYUNDEAD;
	mag_circle = 4;
	description = "Уничтожение нежити";
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_DESTROYUNDEAD;
	text[2] = NAME_Dam_Magic;
	count[2] = SPL_DAMAGE_DESTROYUNDEAD;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArScrollDestroyUndead(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 110;
	visual = "ItAr_Scroll_15_EG.3DS";
	material = MAT_LEATHER;
	spell = SPL_DESTROYUNDEAD;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_DESTROYUNDEAD;
	description = "Уничтожение нежити";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_DESTROYUNDEAD;
	text[2] = NAME_Dam_Magic;
	count[2] = SPL_DAMAGE_DESTROYUNDEAD;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITARRUNE_5_5_WINDFIST(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 500;
	visual = "ItAr_Rune_06.3ds";
	material = MAT_STONE;
	spell = SPL_WINDFIST;
	mag_circle = 2;
	description = "Кулак ветра";
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_ManakostenMax;
	count[1] = SPL_SENDCAST_WINDFIST;
	text[2] = "Урон от падения (за ед. маг. силы):";
	count[2] = SPL_DAMAGE_WINDFIST;
	text[4] = NAME_Spell_Load;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArScrollWindfist(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 50;
	visual = "ItAr_Scroll_12.3DS";
	material = MAT_LEATHER;
	spell = SPL_WINDFIST;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_WINDFIST;
	description = "Кулак ветра";
	text[1] = NAME_ManakostenMax;
	count[1] = SPL_SENDCAST_WINDFIST;
	text[2] = "Урон от падения (за ед. маг. силы):";
	count[2] = SPL_DAMAGE_WINDFIST;
	text[4] = NAME_Spell_Load;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITARRUNE_5_6_STORMFIST(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 900;
	visual = "ItAr_Rune_07.3ds";
	material = MAT_STONE;
	spell = SPL_STORMFIST;
	mag_circle = 4;
	description = "Шторм";
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_ManakostenMax;
	count[1] = SPL_SENDCAST_STORMFIST;
	text[2] = "Урон от падения (за ед. маг. силы):";
	count[2] = SPL_DAMAGE_STORMFIST;
	text[4] = NAME_Spell_Load;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArScrollStormfist(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 90;
	visual = "ItAr_Scroll_17.3DS";
	material = MAT_LEATHER;
	spell = SPL_STORMFIST;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_STORMFIST;
	description = "Шторм";
	text[1] = NAME_ManakostenMax;
	count[1] = SPL_SENDCAST_STORMFIST;
	text[2] = "Урон от падения (за ед. маг. силы):";
	count[2] = SPL_DAMAGE_STORMFIST;
	text[4] = NAME_Spell_Load;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITARRUNE_5_0_TELEKINESIS(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 700;
	visual = "ItAr_Rune_05.3ds";
	material = MAT_STONE;
	spell = SPL_TELEKINESIS;
	mag_circle = 3;
	description = "Телекинез";
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_ManaPerSec;
	count[1] = 1;
	text[4] = NAME_Spell_Invest;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArScrollTelekinesis(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 70;
	visual = "ItAr_Scroll_13.3DS";
	material = MAT_LEATHER;
	spell = SPL_TELEKINESIS;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = 5;
	description = "Телекинез";
	text[1] = NAME_ManaPerSec;
	count[1] = 1;
	text[2] = NAME_Mana_needed;
	count[2] = cond_value[2];
	text[4] = NAME_Spell_Invest;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITARRUNE_5_1_CHARM(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 700;
	visual = "ItAr_Rune_10.3ds";
	material = MAT_STONE;
	spell = SPL_CHARM;
	mag_circle = 3;
	description = "Чары";
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_CHARM;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArScrollCharm(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 70;
	visual = "ItAr_Scroll_10_EG.3DS";
	material = MAT_LEATHER;
	spell = SPL_CHARM;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_CHARM;
	description = "Чары";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_CHARM;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITARRUNE_5_2_SLEEP(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 500;
	visual = "ItAr_Rune_09.3ds";
	material = MAT_STONE;
	spell = SPL_SLEEP;
	mag_circle = 2;
	description = "Сон";
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_SLEEP;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArScrollSleep(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 50;
	visual = "ItAr_Scroll_09_EG.3DS";
	material = MAT_LEATHER;
	spell = SPL_SLEEP;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_SLEEP;
	description = "Сон";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_SLEEP;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITARRUNE_5_7_PYROKINESIS(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 700;
	visual = "ItAr_Rune_04.3ds";
	material = MAT_STONE;
	spell = SPL_PYROKINESIS;
	mag_circle = 3;
	description = "Пирокинез";
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_DamagePerSec;
	count[1] = SPL_PYRO_DAMAGE_PER_SEC;
	text[4] = NAME_Spell_Invest;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArScrollPyrokinesis(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 70;
	visual = "ItAr_Scroll_29_EG.3DS";
	material = MAT_LEATHER;
	spell = SPL_PYROKINESIS;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = 10;
	description = "Пирокинез";
	text[1] = NAME_DamagePerSec;
	count[1] = SPL_PYRO_DAMAGE_PER_SEC;
	text[4] = NAME_Spell_Invest;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITARRUNE_5_3_CONTROL(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 900;
	visual = "ItAr_Rune_02.3ds";
	material = MAT_STONE;
	spell = SPL_CONTROL;
	mag_circle = 4;
	description = "Контроль";
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArScrollControl(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 90;
	visual = "ItAr_Scroll_08.3DS";
	material = MAT_LEATHER;
	spell = SPL_CONTROL;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = 5;
	description = "Контроль";
	text[1] = NAME_Manakosten;
	count[1] = 5;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArScrollFear(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 250;
	visual = "ItAr_Scroll_11_EG.3DS";
	material = MAT_LEATHER;
	spell = SPL_FEAR;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_FEAR;
	description = "Страх";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_FEAR;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArScrollBerzerk(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 200;
	visual = "ItAr_Scroll_22.3DS";
	material = MAT_LEATHER;
	spell = SPL_BERZERK;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_BERZERK;
	description = "Гнев";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_BERZERK;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITARRUNE_6_3_BREATHOFDEATH(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	value = 1500;
	visual = "ItAr_Rune_12.3ds";
	material = MAT_STONE;
	spell = SPL_BREATHOFDEATH;
	mag_circle = 6;
	description = "Дыхание смерти";
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_BREATHOFDEATH;
	text[2] = NAME_Dam_Magic;
	count[2] = SPL_DAMAGE_BREATHOFDEATH;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItArScrollShrink(C_Item)
{
	name = NAME_Spruchrolle;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = 1000;
	visual = "ItAr_Scroll_15.3DS";
	material = MAT_LEATHER;
	spell = SPL_SHRINK;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_SENDCAST_SHRINK;
	description = "Уменьшение монстра";
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_SHRINK;
	text[5] = NAME_Value;
	count[5] = value;
};

