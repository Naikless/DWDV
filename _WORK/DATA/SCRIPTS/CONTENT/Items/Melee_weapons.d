
const int Value_1H_Sword_01 = 100;

instance ItMw_1H_Club_01(C_Item)
{
	name = "Knüppel";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 2;
	damageTotal = 5;
	damagetype = DAM_BLUNT;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 5;
	visual = "ItMw_1H_Club_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Poker_01(C_Item)
{
	name = "Schürhaken";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 3;
	damageTotal = 6;
	damagetype = DAM_BLUNT;
	range = 50;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 5;
	visual = "ItMw_1H_Poker_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Sickle_01(C_Item)
{
	name = "Sichel";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_METAL;
	value = 4;
	damageTotal = 7;
	damagetype = DAM_EDGE;
	range = 50;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 5;
	visual = "ItMw_1H_Sickle_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMwPickaxe(C_Item)
{
	name = "Spitzhacke";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 4;
	damageTotal = 10;
	damagetype = DAM_EDGE;
	range = 60;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 5;
	visual = "ItMw_2H_Pickaxe_01.3DS";
	material = MAT_WOOD;
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Sledgehammer_01(C_Item)
{
	name = "Schmiedehammer";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 5;
	damageTotal = 10;
	damagetype = DAM_BLUNT;
	range = 30;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 5;
	visual = "ItMw_1H_Sledgehammer_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Mace_Light_01(C_Item)
{
	name = "Keule";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 5;
	damageTotal = 8;
	damagetype = DAM_BLUNT;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 5;
	visual = "ItMw_1H_Mace_Light_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Hatchet_01(C_Item)
{
	name = "Handaxt";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 6;
	damageTotal = 9;
	damagetype = DAM_EDGE;
	range = 30;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 5;
	visual = "ItMw_1H_Hatchet_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Sword_Old_01(C_Item)
{
	name = "Rostiges Schwert";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 10;
	damageTotal = 5;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 5;
	visual = "ItMw_1H_Sword_Old_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Nailmace_01(C_Item)
{
	name = "Nagelkeule";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 13;
	damageTotal = 11;
	damagetype = DAM_BLUNT;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 5;
	visual = "ItMw_1H_Nailmace_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Sword_Short_01(C_Item)
{
	name = "Kurzschwert";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 15;
	damageTotal = 12;
	damagetype = DAM_EDGE;
	range = 50;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 12;
	visual = "ItMw_1H_Sword_Short_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Sword_Short_02(C_Item)
{
	name = "Bauernwehr";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 22;
	damageTotal = 14;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 14;
	visual = "ItMw_1H_Sword_Short_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Sword_Short_03(C_Item)
{
	name = "Lurkerbiß";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 30;
	damageTotal = 16;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 16;
	visual = "ItMw_1H_Sword_Short_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Sword_Short_04(C_Item)
{
	name = "Wundendorn";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 35;
	damageTotal = 18;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 18;
	visual = "ItMw_1H_Sword_Short_04.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Sword_Short_05(C_Item)
{
	name = "Buddlerzucht";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 40;
	damageTotal = 20;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 20;
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

instance ItMw_1H_Axe_Old_01(C_Item)
{
	name = "Verwitterte Axt";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_METAL;
	value = 25;
	damageTotal = 15;
	damagetype = DAM_EDGE;
	range = 50;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 10;
	visual = "ItMw_1H_Axe_Old_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Scythe_01(C_Item)
{
	name = "Schnitter";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 25;
	damageTotal = 15;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 15;
	visual = "ItMw_1H_Scythe_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Staff_01(C_Item)
{
	name = "Kampfstab";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 60;
	damageTotal = 40;
	damagetype = DAM_BLUNT;
	range = 130;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 20;
	visual = "ItMw_2H_Staff_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Staff_02(C_Item)
{
	name = "Richtstab";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 100;
	damageTotal = 35;
	damagetype = DAM_EDGE;
	range = 110;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 25;
	visual = "ItMw_2H_Staff_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Staff_03(C_Item)
{
	name = "Priesterstab";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 200;
	damageTotal = 50;
	damagetype = DAM_BLUNT;
	range = 130;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMw_2H_Staff_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_LightGuardsSword_03(C_Item)
{
	name = "Leichtes Gardeschwert";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 60;
	damageTotal = 25;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 25;
	visual = "ItMw_1H_Sword_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_1H_LIGHTGUARDSSWORD_03_SMITH(C_Item)
{
	name = "Leichtes Gardeschwert";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 70;
	damageTotal = 30;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMw_1H_Sword_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Mace_01(C_Item)
{
	name = "Streitkolben";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 55;
	damageTotal = 25;
	damagetype = DAM_BLUNT;
	range = 60;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 20;
	visual = "ItMw_1H_Mace_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_1H_MACE_01_SMITH(C_Item)
{
	name = "Streitkolben";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 65;
	damageTotal = 30;
	damagetype = DAM_BLUNT;
	range = 60;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 25;
	visual = "ItMw_1H_Mace_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Mace_02(C_Item)
{
	name = "Stachelkeule";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 65;
	damageTotal = 27;
	damagetype = DAM_BLUNT;
	range = 60;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 22;
	visual = "ItMw_1H_Mace_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Mace_03(C_Item)
{
	name = "Blutfliegenstachel";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 75;
	damageTotal = 30;
	damagetype = DAM_BLUNT;
	range = 60;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 25;
	visual = "ItMw_1H_Mace_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Mace_04(C_Item)
{
	name = "Stahlzunge";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 85;
	damageTotal = 33;
	damagetype = DAM_BLUNT;
	range = 60;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 27;
	visual = "ItMw_1H_Mace_04.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_1H_MACE_04_SMITH(C_Item)
{
	name = "Stahlzunge";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 95;
	damageTotal = 38;
	damagetype = DAM_BLUNT;
	range = 60;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 32;
	visual = "ItMw_1H_Mace_04.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Sword_01(C_Item)
{
	name = "Grobes Schwert";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = Value_1H_Sword_01;
	damageTotal = 20;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 20;
	visual = "ItMw_1H_Sword_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_1H_SWORD_01_SMITH(C_Item)
{
	name = "Grobes Schwert";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 110;
	damageTotal = 25;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 25;
	visual = "ItMw_1H_Sword_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Sword_02(C_Item)
{
	name = "Richtschwert";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 95;
	damageTotal = 33;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 33;
	visual = "ItMw_1H_Sword_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Sword_03(C_Item)
{
	name = "Gardeschwert";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 100;
	damageTotal = 35;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 35;
	visual = "ItMw_1H_Sword_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_1H_SWORD_03_SMITH(C_Item)
{
	name = "Gardeschwert";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 120;
	damageTotal = 40;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 40;
	visual = "ItMw_1H_Sword_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Sword_04(C_Item)
{
	name = "Kampfschwert";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 130;
	damageTotal = 36;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 36;
	visual = "ItMw_1H_Sword_04.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Sword_05(C_Item)
{
	name = "Kriegsschwert";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 150;
	damageTotal = 37;
	damagetype = DAM_EDGE;
	range = 80;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 37;
	visual = "ItMw_1H_Sword_05.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_1H_SWORD_05_SMITH(C_Item)
{
	name = "Kriegsschwert";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 160;
	damageTotal = 42;
	damagetype = DAM_EDGE;
	range = 80;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 42;
	visual = "ItMw_1H_Sword_05.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Mace_War_01(C_Item)
{
	name = "Morgenstern";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 125;
	damageTotal = 35;
	damagetype = DAM_BLUNT;
	range = 60;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMw_1H_Mace_War_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_1H_MACE_WAR_01_SMITH(C_Item)
{
	name = "Morgenstern";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 125;
	damageTotal = 40;
	damagetype = DAM_BLUNT;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 35;
	visual = "ItMw_1H_Mace_War_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Mace_War_02(C_Item)
{
	name = "Stahlgeflecht";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 130;
	damageTotal = 36;
	damagetype = DAM_BLUNT;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 31;
	visual = "ItMw_1H_Mace_War_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_1H_MACE_WAR_02_SMITH(C_Item)
{
	name = "Stahlgeflecht";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 140;
	damageTotal = 41;
	damagetype = DAM_BLUNT;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 36;
	visual = "ItMw_1H_Mace_War_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Mace_War_03(C_Item)
{
	name = "Steinbrecher";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 150;
	damageTotal = 37;
	damagetype = DAM_BLUNT;
	range = 60;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 32;
	visual = "ItMw_1H_Mace_War_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_1H_MACE_WAR_03_SMITH(C_Item)
{
	name = "Steinbrecher";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 160;
	damageTotal = 42;
	damagetype = DAM_BLUNT;
	range = 60;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 37;
	visual = "ItMw_1H_Mace_War_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Mace_War_04(C_Item)
{
	name = "Herzensbrecher";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 600;
	damageTotal = 40;
	damagetype = DAM_BLUNT;
	range = 60;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMw_1H_Mace_War_04.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Sword_Long_01(C_Item)
{
	name = "Langschwert";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 640;
	damageTotal = 40;
	damagetype = DAM_EDGE;
	range = 90;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 40;
	visual = "ItMw_1H_Sword_Long_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Sword_Long_02(C_Item)
{
	name = "Furchtbringer";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 680;
	damageTotal = 42;
	damagetype = DAM_EDGE;
	range = 90;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 42;
	visual = "ItMw_1H_Sword_Long_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Sword_Long_03(C_Item)
{
	name = "Hassbringer";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 800;
	damageTotal = 44;
	damagetype = DAM_EDGE;
	range = 90;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 44;
	visual = "ItMw_1H_Sword_Long_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Sword_Long_04(C_Item)
{
	name = "Siegbringer";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 860;
	damageTotal = 46;
	damagetype = DAM_EDGE;
	range = 90;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 46;
	visual = "ItMw_1H_Sword_Long_04.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Sword_Long_05(C_Item)
{
	name = "Todbringer";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 920;
	damageTotal = 50;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 50;
	visual = "ItMw_1H_Sword_Long_05.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Warhammer_01(C_Item)
{
	name = "Orkhammer";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_METAL;
	value = 1000;
	damageTotal = 50;
	damagetype = DAM_BLUNT;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 40;
	visual = "ItMw_1H_Warhammer_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Warhammer_02(C_Item)
{
	name = "Kriegshammer";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_METAL;
	value = 1000;
	damageTotal = 50;
	damagetype = DAM_BLUNT;
	range = 60;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 40;
	visual = "ItMw_1H_Warhammer_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Warhammer_03(C_Item)
{
	name = "Götterhammer";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_METAL;
	value = 1350;
	damageTotal = 55;
	damagetype = DAM_BLUNT;
	range = 60;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 40;
	visual = "ItMw_1H_Warhammer_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Axe_01(C_Item)
{
	name = "Axt";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 150;
	damageTotal = 40;
	damagetype = DAM_EDGE;
	range = 60;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 35;
	visual = "ItMw_1H_Axe_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_1H_AXE_01_SMITH(C_Item)
{
	name = "Axt";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 160;
	damageTotal = 45;
	damagetype = DAM_EDGE;
	range = 60;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 40;
	visual = "ItMw_1H_Axe_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Axe_02(C_Item)
{
	name = "Schädelspalter";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 1200;
	damageTotal = 55;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 45;
	visual = "ItMw_1H_Axe_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Axe_03(C_Item)
{
	name = "Knochenbrecher";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 1350;
	damageTotal = 55;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 40;
	visual = "ItMw_1H_Axe_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Sword_Broad_01(C_Item)
{
	name = "Breitschwert";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 1350;
	damageTotal = 55;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 50;
	visual = "ItMw_1H_Sword_Broad_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Sword_Broad_02(C_Item)
{
	name = "Kriegerurteil";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 1400;
	damageTotal = 65;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 60;
	visual = "ItMw_1H_Sword_Broad_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Sword_Broad_03(C_Item)
{
	name = "Sturmgeflüster";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 1400;
	damageTotal = 70;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 65;
	visual = "ItMw_1H_Sword_Broad_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Sword_Broad_04(C_Item)
{
	name = "Gardistenhand";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 1600;
	damageTotal = 75;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 70;
	visual = "ItMw_1H_Sword_Broad_04.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_1H_SWORD_BROAD_04_SMITH(C_Item)
{
	name = "Gardistenhand";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 1650;
	damageTotal = 80;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 75;
	visual = "ItMw_1H_Sword_Broad_04.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Sword_Old_01(C_Item)
{
	name = "Rostiger Zweihänder";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 1400;
	damageTotal = 55;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 55;
	visual = "ItMw_2H_Sword_Old_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Sword_Bastard_01(C_Item)
{
	name = "Rostiges Bastardschwert";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 1250;
	damageTotal = 48;
	damagetype = DAM_EDGE;
	range = 90;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 48;
	visual = "ItMw_1H_Sword_Bastard_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Sword_Bastard_02(C_Item)
{
	name = "Schlachter";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 1700;
	damageTotal = 80;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 75;
	visual = "ItMw_1H_Sword_Bastard_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Sword_Bastard_03(C_Item)
{
	name = "Vollstrecker";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 1800;
	damageTotal = 85;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 80;
	visual = "ItMw_1H_Sword_Bastard_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_1H_Sword_Bastard_04(C_Item)
{
	name = "Berserkerwort";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 1900;
	damageTotal = 90;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 85;
	visual = "ItMw_1H_Sword_Bastard_04.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Axe_Old_01(C_Item)
{
	name = "Alte Streitaxt";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_METAL;
	value = 1700;
	damageTotal = 65;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 55;
	visual = "ItMw_2H_Axe_Old_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Axe_Old_02(C_Item)
{
	name = "Bluternter";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_METAL;
	value = 1800;
	damageTotal = 70;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 60;
	visual = "ItMw_2H_Axe_Old_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Axe_Old_03(C_Item)
{
	name = "Alter Richter";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_METAL;
	value = 1800;
	damageTotal = 75;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 65;
	visual = "ItMw_2H_Axe_Old_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Sword_Light_01(C_Item)
{
	name = "Leichter Zweihänder";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 1500;
	damageTotal = 60;
	damagetype = DAM_EDGE;
	range = 110;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 60;
	visual = "ItMw_2H_Sword_Light_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_2H_SWORD_LIGHT_01_SMITH(C_Item)
{
	name = "Leichter Zweihänder";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 1600;
	damageTotal = 65;
	damagetype = DAM_EDGE;
	range = 110;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 65;
	visual = "ItMw_2H_Sword_Light_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Sword_Light_02(C_Item)
{
	name = "Hüterklinge";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 1700;
	damageTotal = 65;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 65;
	visual = "ItMw_2H_Sword_Light_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_2H_SWORD_LIGHT_02_SMITH(C_Item)
{
	name = "Hüterklinge";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 1750;
	damageTotal = 70;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 70;
	visual = "ItMw_2H_Sword_Light_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Sword_Light_03(C_Item)
{
	name = "Söldnerklinge";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 1800;
	damageTotal = 70;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 65;
	visual = "ItMw_2H_Sword_Light_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_2H_SWORD_LIGHT_03_SMITH(C_Item)
{
	name = "Söldnerklinge";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 1850;
	damageTotal = 75;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 70;
	visual = "ItMw_2H_Sword_Light_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Sword_Light_04(C_Item)
{
	name = "Königsklinge";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 1800;
	damageTotal = 70;
	damagetype = DAM_EDGE;
	range = 110;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 70;
	visual = "ItMw_2H_Sword_Light_04.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_2H_SWORD_LIGHT_04_SMITH(C_Item)
{
	name = "Königsklinge";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 1850;
	damageTotal = 75;
	damagetype = DAM_EDGE;
	range = 110;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 75;
	visual = "ItMw_2H_Sword_Light_04.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Sword_Light_05(C_Item)
{
	name = "Dämonenklinge";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 1900;
	damageTotal = 75;
	damagetype = DAM_EDGE;
	range = 120;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 75;
	visual = "ItMw_2H_Sword_Light_05.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Axe_light_01(C_Item)
{
	name = "Leichte Streitaxt";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_METAL;
	value = 1900;
	damageTotal = 75;
	damagetype = DAM_EDGE;
	range = 80;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 65;
	visual = "ItMw_2H_Axe_light_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_2H_AXE_LIGHT_01_SMITH(C_Item)
{
	name = "Leichte Streitaxt";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_METAL;
	value = 2000;
	damageTotal = 80;
	damagetype = DAM_EDGE;
	range = 80;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 70;
	visual = "ItMw_2H_Axe_light_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Axe_light_02(C_Item)
{
	name = "Donnerschlag";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_METAL;
	value = 2000;
	damageTotal = 80;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 65;
	visual = "ItMw_2H_Axe_light_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Axe_light_03(C_Item)
{
	name = "Schmetterschlag";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_METAL;
	value = 2520;
	damageTotal = 80;
	damagetype = DAM_EDGE;
	range = 80;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 70;
	visual = "ItMw_2H_Axe_light_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Sword_01(C_Item)
{
	name = "Zweihänder";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 2000;
	damageTotal = 80;
	damagetype = DAM_EDGE;
	range = 110;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 80;
	visual = "ItMw_2H_Sword_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_2H_SWORD_01_SMITH(C_Item)
{
	name = "Zweihänder";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 2050;
	damageTotal = 85;
	damagetype = DAM_EDGE;
	range = 110;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 85;
	visual = "ItMw_2H_Sword_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Sword_02(C_Item)
{
	name = "Heldenschneide";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 2000;
	damageTotal = 80;
	damagetype = DAM_EDGE;
	range = 110;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 80;
	visual = "ItMw_2H_Sword_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Sword_03(C_Item)
{
	name = "Blutschneide";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 2000;
	damageTotal = 85;
	damagetype = DAM_EDGE;
	range = 110;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 80;
	visual = "ItMw_2H_Sword_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Sword_Heavy_01(C_Item)
{
	name = "Schwerer Zweihänder";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 2100;
	damageTotal = 85;
	damagetype = DAM_EDGE;
	range = 120;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 85;
	visual = "ItMw_2H_Sword_Heavy_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Sword_Heavy_02(C_Item)
{
	name = "Zornstahl";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 2200;
	damageTotal = 90;
	damagetype = DAM_EDGE;
	range = 110;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 85;
	visual = "ItMw_2H_Sword_Heavy_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_2H_SWORD_HEAVY_02_SMITH(C_Item)
{
	name = "Zornstahl";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 2250;
	damageTotal = 95;
	damagetype = DAM_EDGE;
	range = 110;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 90;
	visual = "ItMw_2H_Sword_Heavy_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Sword_Heavy_03(C_Item)
{
	name = "Grimmstahl";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 2200;
	damageTotal = 90;
	damagetype = DAM_EDGE;
	range = 120;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 90;
	visual = "ItMw_2H_Sword_Heavy_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Sword_Heavy_04(C_Item)
{
	name = "Rachestahl";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 2300;
	damageTotal = 95;
	damagetype = DAM_EDGE;
	range = 110;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 90;
	visual = "ItMw_2H_Sword_Heavy_04.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Axe_Heavy_01(C_Item)
{
	name = "Streitaxt";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_METAL;
	value = 2100;
	damageTotal = 85;
	damagetype = DAM_EDGE;
	range = 80;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 75;
	visual = "ItMw_2H_Axe_Heavy_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_2H_AXE_HEAVY_01_SMITH(C_Item)
{
	name = "Streitaxt";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_METAL;
	value = 2200;
	damageTotal = 90;
	damagetype = DAM_EDGE;
	range = 80;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 80;
	visual = "ItMw_2H_Axe_Heavy_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Axe_Heavy_02(C_Item)
{
	name = "Kriegerstimme";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_METAL;
	value = 2200;
	damageTotal = 95;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 85;
	visual = "ItMw_2H_Axe_Heavy_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_2H_AXE_HEAVY_02_SMITH(C_Item)
{
	name = "Kriegerstimme";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_METAL;
	value = 2300;
	damageTotal = 100;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 90;
	visual = "ItMw_2H_Axe_Heavy_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Axe_Heavy_03(C_Item)
{
	name = "Barbarenfaust";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_METAL;
	value = 2300;
	damageTotal = 100;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 90;
	visual = "ItMw_2H_Axe_Heavy_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2H_Axe_Heavy_04(C_Item)
{
	name = "Trollfaust";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_METAL;
	value = 2300;
	damageTotal = 100;
	damagetype = DAM_EDGE;
	range = 90;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 90;
	visual = "ItMw_2H_Axe_Heavy_04.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw2hOrcSword01(C_Item)
{
	name = "Krush Varrok";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 30;
	damageTotal = 45;
	damagetype = DAM_EDGE;
	range = 110;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 25;
	visual = "ItMw_2H_OrcSword_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw2hOrcAxe01(C_Item)
{
	name = "Krush Pach";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_METAL;
	value = 35;
	damageTotal = 50;
	damagetype = DAM_EDGE;
	range = 110;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMw_2H_OrcAxe_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw2hOrcAxe02(C_Item)
{
	name = "Krush UrRok";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_METAL;
	value = 38;
	damageTotal = 55;
	damagetype = DAM_EDGE;
	range = 120;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 35;
	visual = "ItMw_2H_OrcAxe_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw2hOrcAxe03(C_Item)
{
	name = "Krush Agash";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_METAL;
	value = 40;
	damageTotal = 60;
	damagetype = DAM_EDGE;
	range = 120;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 40;
	visual = "ItMw_2H_OrcAxe_03.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw2hOrcAxe04(C_Item)
{
	name = "Krush BrokDar";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_METAL;
	value = 43;
	damageTotal = 65;
	damagetype = DAM_EDGE;
	range = 130;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 45;
	visual = "ItMw_2H_OrcAxe_04.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw2hOrcMace01(C_Item)
{
	name = "Krush Karrok";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 50;
	damageTotal = 75;
	damagetype = DAM_BLUNT;
	range = 140;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 50;
	visual = "ItMw_2H_OrcMace_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRwOrcstaff(C_Item)
{
	name = "Grachtnakk";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 0;
	damageTotal = 0;
	damagetype = DAM_BLUNT;
	visual = "ItRw_2H_Orcstaff_01.3DS";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRwUdOrcstaff(C_Item)
{
	name = "ShaBaNakk";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 0;
	damageTotal = 0;
	damagetype = DAM_BLUNT;
	visual = "ItRw_2H_Orcstaff_01.3DS";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_1H_SWORD_SHORT_06(C_Item)
{
	name = "Rostige Snapperkralle";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 50;
	damageTotal = 10;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 10;
	visual = "DB_ItMw_1H_Sword_Short_Rep_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_2H_SWORD_04(C_Item)
{
	name = "Schattenspalter";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 2500;
	damageTotal = 105;
	damagetype = DAM_EDGE;
	range = 110;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 90;
	visual = "DB_ItMw_2H_Sword_Smith_01.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_1H_SWORD_BASTARD_06(C_Item)
{
	name = "Todesgeflüster";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 2100;
	damageTotal = 95;
	damagetype = DAM_EDGE;
	range = 100;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 90;
	visual = "DB_Itmw_1H_Sword_Bastard_Smith_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance SCORPIO_CROSSBOW(C_Item)
{
	name = "Leichte Armbrust";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW | ITEM_MULTI;
	material = MAT_WOOD;
	value = 150;
	damageTotal = 60;
	damagetype = DAM_POINT;
	munition = ItAmBolt;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItRwCrossbow1.mms";
	owner = GRD_205_Scorpio;
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance FLETCHER_SWORD(C_Item)
{
	name = "Leichtes Gardeschwert";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 40;
	damageTotal = 25;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 25;
	visual = "ItMw_1H_Sword_01.3DS";
	owner = GRD_255_Fletcher;
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance SLYS_SWORD(C_Item)
{
	name = "Buddlerzucht";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 30;
	damageTotal = 20;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 20;
	visual = "ItMw_1H_Sword_Short_05.3DS";
	owner = STT_315_Sly;
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance RODRIGUEZ_STAFF(C_Item)
{
	name = "Kampfstab";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI;
	material = MAT_WOOD;
	value = 50;
	damageTotal = 40;
	damagetype = DAM_BLUNT;
	range = 130;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 20;
	visual = "ItMw_2H_Staff_01.3DS";
	owner = KDF_400_Rodriguez;
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

