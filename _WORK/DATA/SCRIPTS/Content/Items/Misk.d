
const int Value_MobsiItem = 3;
const int Value_SwordBlade = 80;
const int Value_SwordBladeHot = 64;
const int Value_SwordRawHot = 51;
const int Value_SwordRaw = 40;
const int Value_Dietrich = 10;
const int Value_Schl�ssel = 3;
const int Value_Joint1 = 8;
const int Value_Joint2 = 15;
const int Value_Joint3 = 20;
const int Value_Laute = 10;
const int Value_Erzbrocken = 1;
const int Value_Fackel = 2;
const int Value_Sumpfkraut = 8;
const int Value_Pfeife = 10;
const int Value_Rasiermesser = 5;
const int Value_M�nze = 0;
const int Value_Sch�ssel = 4;
const int Value_Kerzenst�nder = 10;
const int Value_Becher = 4;
const int Value_Pokal = 50;
const int Value_Besteck = 15;
const int Value_Pfanne = 10;
const int Value_Krug = 10;
const int Value_Amphore = 15;
const int Value_Statue = 15;
const int Value_Schwefel = 20;
const int Value_Quecksilber = 25;
const int Value_Salz = 10;
const int Value_�l = 15;
const int Value_Moleratfett = 5;
const int Value_Alcohol = 18;

instance ItKeLockpick(C_Item)
{
	name = "Dietrich";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Dietrich;
	visual = "ItKe_Lockpick_01.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = NAME_Value;
	count[4] = Value_Dietrich;
};

instance ItKeKey1(C_Item)
{
	name = "Schl�ssel";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = Value_Schl�ssel;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = NAME_Value;
	count[4] = Value_Schl�ssel;
};

instance ItKeKey2(C_Item)
{
	name = "Schl�ssel";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = Value_Schl�ssel;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = NAME_Value;
	count[4] = Value_Schl�ssel;
};

instance ItKeKey3(C_Item)
{
	name = "Schl�ssel";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = Value_Schl�ssel;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = NAME_Value;
	count[4] = Value_Schl�ssel;
};

instance ItKeKey4(C_Item)
{
	name = "Schl�ssel";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = Value_Schl�ssel;
	visual = "ItKe_Key_04.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = NAME_Value;
	count[4] = Value_Schl�ssel;
};

instance ItKeCavalorn01(C_Item)
{
	name = "Cavalorns Schl�ssel";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = Value_Schl�ssel;
	visual = "ItKe_Key_04.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = NAME_Value;
	count[4] = Value_Schl�ssel;
};

instance ItMiStomper(C_Item)
{
	name = "Krautstampfer";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_MobsiItem;
	visual = "ItMi_Stomper_01.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = NAME_Value;
	count[4] = Value_MobsiItem;
};

instance ItMiHammer(C_Item)
{
	name = "Hammer";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_MobsiItem;
	visual = "ItMi_Hammer_01.3DS";
	material = MAT_WOOD;
	description = name;
	text[4] = NAME_Value;
	count[4] = Value_MobsiItem;
};

instance ItMiScoop(C_Item)
{
	name = "Kochl�ffel";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_MobsiItem;
	visual = "ItMi_Scoop_01.3DS";
	material = MAT_WOOD;
	description = name;
	text[4] = NAME_Value;
	count[4] = Value_MobsiItem;
};

instance ItMiFlask(C_Item)
{
	name = "Laborflasche";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_MobsiItem;
	visual = "ItFo_Potion_Mana_02.3ds";
	material = MAT_GLAS;
	description = name;
	text[4] = NAME_Value;
	count[4] = Value_MobsiItem;
};

instance ItMiSwordraw(C_Item)
{
	name = "Rohstahl";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_SwordRaw;
	visual = "ItMi_SmithSword_Raw_01.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = NAME_Value;
	count[4] = value;
};

instance ItMiSwordrawhot(C_Item)
{
	name = "Gl�hender Stahl";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_SwordRawHot;
	visual = "ItMi_SmithSword_Rawhot_01.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = NAME_Value;
	count[4] = value;
};

instance ItMiSwordbladehot(C_Item)
{
	name = "Gl�hende Klinge";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_SwordBladeHot;
	visual = "ItMi_SmithSword_Bladehot_01.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = NAME_Value;
	count[4] = value;
};

instance ItMiSwordblade(C_Item)
{
	name = "Klinge";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_SwordBlade;
	visual = "ItMi_SmithSword_Blade_01.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = NAME_Value;
	count[4] = value;
};

instance ItLsTorchFirespit(C_Item)
{
	name = "Fackel";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_BURN | ITEM_TORCH;
	value = Value_MobsiItem;
	visual = "ITLSTORCHBURNING.ZEN";
	material = MAT_WOOD;
	scemeName = "FIRESPIT";
	description = name;
	text[4] = NAME_Value;
	count[4] = value;
};

instance ItMiLute(C_Item)
{
	name = "Laute";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Laute;
	visual = "ItMi_Lute_01.3DS";
	material = MAT_WOOD;
	scemeName = "LUTE";
	on_state[0] = UseLute;
	description = name;
	text[4] = NAME_Value;
	count[4] = value;
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
	name = "Palmwedel";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_MobsiItem;
	visual = "ItMi_Wedel_01.3ds";
	material = MAT_LEATHER;
	scemeName = "COOLAIR";
	description = name;
	text[4] = NAME_Value;
	count[4] = value;
};

instance ItMiBrush(C_Item)
{
	name = "B�rste";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_MobsiItem;
	visual = "ItMi_Brush_01.3ds";
	material = MAT_GLAS;
	scemeName = "BRUSH";
	description = name;
	text[4] = NAME_Value;
	count[4] = value;
};

instance ItMiJoint_1(C_Item)
{
	name = "Gr�ner Novize";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Joint1;
	visual = "ItMi_Joint_01.3ds";
	material = MAT_WOOD;
	scemeName = "JOINT";
	on_state[0] = UseItMiJoint_1;
	description = name;
	text[4] = NAME_Value;
	count[4] = value;
};


func void UseItMiJoint_1()
{
	if(Npc_IsPlayer(self))
	{
		self.voicePitch = 4;
		if((Firstjoint == FALSE) && Npc_IsPlayer(self))
		{
			B_GiveXP(5);
			Firstjoint = TRUE;
			self.voicePitch = 4;
		};
	};
};


instance ItMiJoint_2(C_Item)
{
	name = "Schwarzer Weiser";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Joint2;
	visual = "ItMi_Joint_01.3ds";
	material = MAT_WOOD;
	scemeName = "JOINT";
	on_state[0] = UseItMiJoint_2;
	description = name;
	text[4] = NAME_Value;
	count[4] = value;
};


func void UseItMiJoint_2()
{
	if(Npc_IsPlayer(self))
	{
		self.voicePitch = 4;
		if((Secondjoint == FALSE) && Npc_IsPlayer(self))
		{
			B_GiveXP(10);
			Secondjoint = TRUE;
		};
	};
};


instance ItMiJoint_3(C_Item)
{
	name = "Traumruf";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Joint3;
	visual = "ItMi_Joint_01.3ds";
	material = MAT_WOOD;
	scemeName = "JOINT";
	on_state[0] = UseItMiJoint_3;
	description = name;
	text[4] = NAME_Value;
	count[4] = value;
};


func void UseItMiJoint_3()
{
	if(Npc_IsPlayer(self))
	{
		self.voicePitch = 4;
		if((Thirdjoint == FALSE) && Npc_IsPlayer(self))
		{
			Npc_ChangeAttribute(self,ATR_MANA_MAX,2);
			PrintScreen("Mana +2",-1,-1,"FONT_OLD_20_WHITE.TGA",3);
			Thirdjoint = TRUE;
			self.voicePitch = 4;
		};
	};
};


instance ItMiNugget(C_Item)
{
	name = "Erzbrocken";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Erzbrocken;
	visual = "ItMi_Nugget_01.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = NAME_Value;
	count[4] = value;
};

instance ItLsTorch(C_Item)
{
	name = "Fackel";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_BURN | ITEM_TORCH | ITEM_MULTI;
	value = Value_Fackel;
	visual = "ItLs_Torch_01.3ds";
	material = MAT_WOOD;
	description = name;
	text[4] = NAME_Value;
	count[4] = value;
};

instance ItLsTorchburning(C_Item)
{
	name = "Brennende Fackel";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_BURN | ITEM_TORCH;
	value = 0;
	visual = "ITLSTORCHBURNING.ZEN";
	material = MAT_WOOD;
	description = name;
};

instance ItLsTorchburned(C_Item)
{
	name = "Fackel";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_BURN | ITEM_TORCH | ITEM_MULTI;
	value = 0;
	visual = "ItLs_Torchburned_01.3ds";
	material = MAT_WOOD;
	description = name;
};

instance ItMi_Plants_Swampherb_01(C_Item)
{
	name = "Sumpfkraut";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Sumpfkraut;
	visual = "ItMi_Plants_Swampherb_01.3ds";
	material = MAT_WOOD;
	description = name;
	text[4] = NAME_Value;
	count[4] = value;
};

instance ITMI_PLANTS_RICE_01(C_Item)
{
	name = "Reispflanze";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Sumpfkraut;
	visual = "ItMi_Plants_Swampherb_01.3ds";
	material = MAT_WOOD;
	description = name;
	text[4] = NAME_Value;
	count[4] = value;
};

instance ItMi_Stuff_Pipe_01(C_Item)
{
	name = "Pfeife";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Pfeife;
	visual = "ItMi_Stuff_Pipe_01.3DS";
	material = MAT_WOOD;
	description = name;
	text[4] = NAME_Value;
	count[4] = value;
};

instance ItMi_Stuff_Barbknife_01(C_Item)
{
	name = "Rasiermesser";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Rasiermesser;
	visual = "ItMi_Stuff_Barbknife_01.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = NAME_Value;
	count[4] = value;
};

instance ItMi_Stuff_OldCoin_01(C_Item)
{
	name = "M�nze";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_M�nze;
	visual = "ItMi_Stuff_OldCoin_01.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = NAME_Value;
	count[4] = value;
};

instance ItMi_Stuff_OldCoin_02(C_Item)
{
	name = "M�nze";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_M�nze;
	visual = "ItMi_Stuff_OldCoin_01.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = NAME_Value;
	count[4] = value;
};

instance ItMi_Stuff_Plate_01(C_Item)
{
	name = "Sch�ssel";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Sch�ssel;
	visual = "ItMi_Stuff_Plate_01.3DS";
	material = MAT_CLAY;
	description = name;
	text[4] = NAME_Value;
	count[4] = value;
};

instance ItMi_Stuff_Candel_01(C_Item)
{
	name = "Kerzenst�nder";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Kerzenst�nder;
	visual = "ItMi_Stuff_Candel_01.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = NAME_Value;
	count[4] = value;
};

instance ItMi_Stuff_Cup_01(C_Item)
{
	name = "Becher";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Becher;
	visual = "ItMi_Stuff_Cup_01.3DS";
	material = MAT_CLAY;
	description = name;
	text[4] = NAME_Value;
	count[4] = value;
};

instance ItMi_Stuff_Cup_02(C_Item)
{
	name = "Pokal";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Pokal;
	visual = "ItMi_Stuff_Cup_02.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = NAME_Value;
	count[4] = value;
};

instance ItMi_Stuff_Silverware_01(C_Item)
{
	name = "Besteck";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Besteck;
	visual = "ItMi_Stuff_Silverware_01.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = NAME_Value;
	count[4] = value;
};

instance ItMi_Stuff_Pan_01(C_Item)
{
	name = "Pfanne";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Pfanne;
	visual = "ItMi_Stuff_Pan_01.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = NAME_Value;
	count[4] = value;
};

instance ItMi_Stuff_Mug_01(C_Item)
{
	name = "Krug";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Krug;
	visual = "ItMi_Stuff_Mug_01.3DS";
	material = MAT_CLAY;
	description = name;
	text[4] = NAME_Value;
	count[4] = value;
};

instance ItMi_Stuff_Amphore_01(C_Item)
{
	name = "Amphore";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Amphore;
	visual = "ItMi_Stuff_Amphore_01.3DS";
	material = MAT_CLAY;
	description = name;
	text[4] = NAME_Value;
	count[4] = value;
};

instance ItMi_Stuff_Idol_Ogront_01(C_Item)
{
	name = "Statue";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Statue;
	visual = "ItMi_Stuff_Idol_Ogront_01.3DS";
	material = MAT_CLAY;
	description = name;
	text[4] = NAME_Value;
	count[4] = value;
};

instance ItMi_Alchemy_Sulphur_01(C_Item)
{
	name = "Schwefel";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Schwefel;
	visual = "ItMi_Alchemy_Sulphur_01.3DS";
	material = MAT_CLAY;
	description = name;
	text[4] = NAME_Value;
	count[4] = value;
};

instance ItMi_Alchemy_Quicksilver_01(C_Item)
{
	name = "Quecksilber";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Quecksilber;
	visual = "ItMi_Alchemy_Quicksilver_01.3DS";
	material = MAT_CLAY;
	description = name;
	text[4] = NAME_Value;
	count[4] = value;
};

instance ItMi_Alchemy_Salt_01(C_Item)
{
	name = "Salz";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Salz;
	visual = "ItMi_Alchemy_Salt_01.3DS";
	material = MAT_CLAY;
	description = name;
	text[4] = NAME_Value;
	count[4] = value;
};

instance ItMi_Alchemy_Syrianoil_01(C_Item)
{
	name = "Syrianisches �l";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_�l;
	visual = "ItMi_Alchemy_Syrianoil_01.3DS";
	material = MAT_CLAY;
	description = name;
	text[4] = NAME_Value;
	count[4] = value;
};

instance ItMi_Alchemy_Moleratlubric_01(C_Item)
{
	name = "Moleratfett";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Moleratfett;
	visual = "ItMi_Alchemy_Moleratlubric_01.3DS";
	material = MAT_CLAY;
	description = name;
	text[4] = NAME_Value;
	count[4] = value;
};

instance ItMi_Alchemy_Alcohol_01(C_Item)
{
	name = "Reiner Alkohol";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Alcohol;
	visual = "ItMi_Alchemy_Alcohol_01.3DS";
	material = MAT_CLAY;
	description = name;
	text[4] = NAME_Value;
	count[4] = value;
};

