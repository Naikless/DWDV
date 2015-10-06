
instance ItWrTemplemap(C_Item)
{
	name = "Karte";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 30;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = UseTemplemap;
	description = "Skizze des Tempels";
	text[4] = NAME_Value;
	count[4] = value;
};


func void UseTemplemap()
{
	var int nDocID;
	nDocID = Doc_CreateMap();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Map_Temple.tga",1);
	Doc_Show(nDocID);
};


instance ItMiAlarmhorn(C_Item)
{
	name = "Horn";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 9;
	visual = "ItMi_Alarmhorn_01.3DS";
	material = MAT_WOOD;
	scemeName = "HORN";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_Stuff_Idol_Sleeper_01(C_Item)
{
	name = "Statuette";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItMi_Stuff_Idol_Sleeper_01.3DS";
	material = MAT_CLAY;
	description = name;
	text[0] = "Diese Figur stellt ein unförmiges Wesen dar,";
	text[1] = "das eine Maske trägt.";
	text[2] = "Die Maske wird von 6 großen Stacheln umsäumt";
};

instance Weltenspalter(C_Item)
{
	name = "Weltenspalter";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 900;
	damageTotal = 90;
	damagetype = DAM_EDGE;
	range = 140;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMi_SleeperKey_01.3DS";
	description = name;
	text[0] = "Dies war das Schwert des untoten";
	text[1] = "Ork-Priesters Varrag-Hashor.";
	text[2] = "Die Waffe ist im Laufe der Jahre";
	text[3] = "unbrauchbar geworden!";
	text[4] = "Vielleicht ist das Schwert noch auf";
	text[5] = "andere Art und Weise nützlich.";
};

instance Lichtbringer(C_Item)
{
	name = "Lichtbringer";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 900;
	damageTotal = 90;
	damagetype = DAM_EDGE;
	range = 140;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMi_SleeperKey_01.3DS";
	description = name;
	text[0] = "Dies war das Schwert des untoten";
	text[1] = "Ork-Priesters Varrag-Kasorg.";
	text[2] = "Die Waffe ist im Laufe der Jahre";
	text[3] = "unbrauchbar geworden!";
	text[4] = "Vielleicht ist das Schwert noch auf";
	text[5] = "andere Art und Weise nützlich.";
};

instance Zeitenklinge(C_Item)
{
	name = "Zeitenklinge";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 900;
	damageTotal = 90;
	damagetype = DAM_EDGE;
	range = 140;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMi_SleeperKey_01.3DS";
	description = name;
	text[0] = "Dies war das Schwert des untoten";
	text[1] = "Ork-Priesters Varrag-Unhilqt.";
	text[2] = "Die Waffe ist im Laufe der Jahre";
	text[3] = "unbrauchbar geworden!";
	text[4] = "Vielleicht ist das Schwert noch auf";
	text[5] = "andere Art und Weise nützlich.";
};

instance Daemonenstreich(C_Item)
{
	name = "Dämonenstreich";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 900;
	damageTotal = 90;
	damagetype = DAM_EDGE;
	range = 140;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMi_SleeperKey_01.3DS";
	description = name;
	text[0] = "Dies war das Schwert des untoten";
	text[1] = "Ork-Priesters Varrag-Ruuushk.";
	text[2] = "Die Waffe ist im Laufe der Jahre";
	text[3] = "unbrauchbar geworden!";
	text[4] = "Vielleicht ist das Schwert noch auf";
	text[5] = "andere Art und Weise nützlich.";
};

instance Bannklinge(C_Item)
{
	name = "Bannklinge";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 900;
	damageTotal = 90;
	damagetype = DAM_EDGE;
	range = 140;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMi_SleeperKey_01.3DS";
	description = name;
	text[0] = "Dies war das Schwert des untoten";
	text[1] = "Ork-Hohepriesters Grash-Varrag-Arushat.";
	text[2] = "Die Waffe ist im Laufe der Jahre";
	text[3] = "unbrauchbar geworden!";
	text[4] = "Vielleicht ist das Schwert noch auf";
	text[5] = "andere Art und Weise nützlich.";
};

instance Mythrilklinge(C_Item)
{
	name = "Sonderbares Schwert";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 900;
	damageTotal = 10;
	damagetype = DAM_EDGE;
	range = 160;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMw_2H_Sword_Sleeper_01.3DS";
	description = name;
	text[0] = "Ein wundervoll gefertigtes Schwert.";
	text[1] = "Uralte Runen wurden in die Klinge eingraviert.";
	text[2] = "Vielleicht kann Xardas diese Runen entziffern!";
	text[3] = "Bevor er das Schwert nicht identifiziert hat,";
	text[4] = "lege ich es besser nicht an.";
};

instance Mythrilklinge01(C_Item)
{
	name = "URIZIEL";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 900;
	damageTotal = 90;
	damagetype = DAM_EDGE;
	range = 180;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMw_2H_Sword_Sleeper_01.3DS";
	description = name;
	text[0] = "Xardas sagt das Schwert heißt URIZIEL und soll";
	text[1] = "uralt sein. Vor langem hat es große Kräfte";
	text[2] = "besessen, doch es hat seine Magie verloren.";
	text[3] = NAME_Damage;
	count[3] = damageTotal;
	text[4] = NAME_Str_needed;
	count[4] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance Mythrilklinge02(C_Item)
{
	name = "URIZIEL";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 10000;
	damagetype = DAM_FIRE | DAM_MAGIC;
	damage[DAM_INDEX_FIRE] = 30;
	damage[DAM_INDEX_MAGIC] = 120;
	range = 180;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMw_2H_Sword_Sleeper_02.3DS";
	description = name;
	text[0] = "Dies ist das Schwert Uriziel.";
	text[1] = "Uriziel ist magisch geladen";
	text[2] = NAME_Dam_Magic;
	count[2] = damage[DAM_INDEX_MAGIC];
	text[3] = NAME_Dam_Fire;
	count[3] = damage[DAM_INDEX_FIRE];
	text[4] = NAME_Str_needed;
	count[4] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance Mythrilklinge03(C_Item)
{
	name = "URIZIEL";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 900;
	damageTotal = 90;
	damagetype = DAM_EDGE;
	range = 180;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMw_2H_Sword_Sleeper_01.3DS";
	description = name;
	text[0] = "Der magische Edelstein  wurde aus der Klinge";
	text[1] = "entfernt. Es ist immer noch eine exzellente";
	text[2] = "Waffe, aber hat seine Kräfte eingebüßt.";
	text[3] = NAME_Damage;
	count[3] = damageTotal;
	text[4] = NAME_Str_needed;
	count[4] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance Scroll4Milten(C_Item)
{
	name = "Machttausch";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 15;
	visual = "ItWrScroll.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "Zauber um magische Kraft auf Uriziel";
	text[1] = "zu übertragen.";
	text[2] = "Kann nicht von mir benutzt werden";
};

instance ItKe_SunkenTower(C_Item)
{
	name = "Schlüssel";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 3;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "öffnet die Türen";
	text[1] = "im versunkenen Turm.";
};

instance DungeonKey(C_Item)
{
	name = "Kerkerschlüssel";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 3;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "öffnet den Kerker";
	text[0] = "des Alten Lagers.";
};

instance UrizielRune(C_Item)
{
	name = "URIZIEL's Welle des Todes";
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10000;
	visual = "ItAr_Rune_14.3ds";
	material = MAT_STONE;
	spell = SPL_MASSDEATH;
	mag_circle = 6;
	description = name;
	text[0] = "Diese mächtige Zauberrune enthält";
	text[1] = "die uralten Kräfte des Schwertes URIZIEL.";
	text[2] = NAME_Mag_Circle;
	count[2] = mag_circle;
	text[3] = NAME_Manakosten;
	count[3] = SPL_SENDCAST_MASSDEATH;
	text[4] = NAME_Dam_Magic;
	count[4] = SPL_DAMAGE_MASSDEATH;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITKE_DEMONS(C_Item)
{
	name = "Rostiger Schlüssel";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 3;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = "Rostiger Schlüssel";
	text[1] = "Von Rost zerfressener Schlüssel";
	text[5] = NAME_Value;
	count[5] = value;
};

