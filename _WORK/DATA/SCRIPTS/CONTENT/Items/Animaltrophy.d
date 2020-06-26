
const int Value_Zähne = 10;
const int Value_Krallen = 15;
const int Value_Wolfsfell = 10;
const int Value_Orkhundfell = 15;
const int Value_Panzerplatte = 50;
const int Value_Crawlerzangen = 10;
const int Value_Shadowbeastfell = 100;
const int Value_Lurkerklaue = 15;
const int Value_Lurkerhaut = 25;
const int Value_Sumpfhaihaut = 100;
const int Value_Trollfell = 200;
const int Value_Flügel = 15;
const int Value_Stachel = 25;
const int Value_Feuerzunge = 500;
const int Value_Sumpfhaizähne = 500;
const int Value_Shadowbeasthorn = 500;
const int Value_Trollhauer = 500;
const int Value_Steinherz = 1000;
const int Value_Feuerherz = 1000;
const int Value_Eisherz = 1000;
const int Value_Eistueck = 100;

instance ItAt_Teeth_01(C_Item)
{
	name = "Zähne";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Zähne;
	visual = "ItAt_Teeth_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = NAME_Value;
	count[4] = Value_Zähne;
};

instance ItAt_Wolf_01(C_Item)
{
	name = "Wolfsfell";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Wolfsfell;
	visual = "ItAt_Wolf_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = NAME_Value;
	count[4] = Value_Wolfsfell;
};

instance ITAT_BLACKWOLF_01(C_Item)
{
	name = "Fell des schwarzen Wolfes";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Wolfsfell;
	visual = "ItAt_Shadowbeast_01.3DS";
	material = MAT_LEATHER;
	description = "Sehr seltenes schwarzes Wolfsfell.";
	text[4] = NAME_Value;
	count[4] = Value_Shadowbeastfell;
};

instance ItAt_Wolf_02(C_Item)
{
	name = "Orkhundfell";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Orkhundfell;
	visual = "ItAt_Wolf_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = NAME_Value;
	count[4] = Value_Orkhundfell;
};

instance ItAt_Waran_01(C_Item)
{
	name = "Flammenzunge";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Feuerzunge;
	visual = "ItAt_Waran_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = NAME_Value;
	count[4] = Value_Feuerzunge;
};

instance ItAt_Claws_01(C_Item)
{
	name = "Krallen";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Krallen;
	visual = "ItAt_Claws_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = NAME_Value;
	count[4] = Value_Krallen;
};

instance ItAt_Crawler_02(C_Item)
{
	name = "Panzerplatte";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Panzerplatte;
	visual = "ItAt_Crawler_02.3DS";
	material = MAT_WOOD;
	description = "Die Panzerplatte eines Minecrawler Kriegers";
	text[4] = NAME_Value;
	count[4] = Value_Panzerplatte;
};

instance ItAt_Crawler_01(C_Item)
{
	name = "Crawlerzangen";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Crawlerzangen;
	visual = "ItAt_Crawler_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = NAME_Value;
	count[4] = Value_Crawlerzangen;
};

instance ItAt_Shadow_01(C_Item)
{
	name = "Schattenläuferfell";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Shadowbeastfell;
	visual = "ItAt_Shadowbeast_01.3DS";
	material = MAT_LEATHER;
	description = "Fell eines Schattenläufers";
	text[4] = NAME_Value;
	count[4] = Value_Shadowbeastfell;
};

instance ItAt_Shadow_02(C_Item)
{
	name = "Horn";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Shadowbeasthorn;
	visual = "ItAt_Shadowbeast_02.3DS";
	material = MAT_LEATHER;
	description = "Horn eines Schattenläufers";
	text[4] = NAME_Value;
	count[4] = Value_Shadowbeasthorn;
};

instance ItAt_Lurker_01(C_Item)
{
	name = "Lurkerklaue";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Lurkerklaue;
	visual = "ItAt_Lurker_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = NAME_Value;
	count[4] = Value_Lurkerklaue;
};

instance ItAt_Lurker_02(C_Item)
{
	name = "Lurkerhaut";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Lurkerhaut;
	visual = "ItAt_Lurker_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = NAME_Value;
	count[4] = Value_Lurkerhaut;
};

instance ItAt_Troll_02(C_Item)
{
	name = "Trollhauer";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Trollhauer;
	visual = "ItAt_Troll_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = NAME_Value;
	count[4] = Value_Trollhauer;
};

instance ItAt_Troll_01(C_Item)
{
	name = "Trollfell";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Trollfell;
	visual = "ItAt_Troll_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = NAME_Value;
	count[4] = Value_Trollfell;
};

instance ItAt_Swampshark_01(C_Item)
{
	name = "Sumpfhaihaut";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Sumpfhaihaut;
	visual = "ItAt_Swampshark_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = NAME_Value;
	count[4] = Value_Sumpfhaihaut;
};

instance ItAt_Swampshark_02(C_Item)
{
	name = "Sumpfhaizähne";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Sumpfhaizähne;
	visual = "ItAt_Swampshark_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = NAME_Value;
	count[4] = Value_Sumpfhaizähne;
};

instance ItAt_Bloodfly_01(C_Item)
{
	name = "Flügel";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Flügel;
	visual = "ItAt_Bloodfly_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = NAME_Value;
	count[4] = Value_Flügel;
};

instance ItAt_Bloodfly_02(C_Item)
{
	name = "Blutfliegenstachel";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Stachel;
	visual = "ItAt_Bloodfly_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = NAME_Value;
	count[4] = Value_Stachel;
};

instance ItAt_StoneGolem_01(C_Item)
{
	name = "Herz eines Steingolems";
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	spell = SPL_WINDFIST;
	value = Value_Steinherz;
	visual = "ItAt_StoneGolem_01.3DS";
	material = MAT_STONE;
	description = name;
	text[0] = "Dieses Herz stammt aus den Überresten";
	text[1] = "eines besiegten Steingolems.";
	text[2] = "Es hat die Kraft, einen Gegner";
	text[3] = "durch die Luft zu schleudern.";
	text[5] = NAME_Value;
	count[5] = Value_Steinherz;
};

instance ItAt_FireGolem_01(C_Item)
{
	name = "Herz eines Feuergolems";
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	spell = SPL_FIREBALL;
	value = Value_Feuerherz;
	visual = "ItAt_FireGolem_01.3DS";
	material = MAT_STONE;
	description = name;
	text[0] = "Dieses Herz stammt aus den Überresten";
	text[1] = "eines besiegten Feuergolems.";
	text[2] = "Es hat die Kraft, einen Gegner";
	text[3] = "in Flammen aufgehen zu lassen.";
	text[5] = NAME_Value;
	count[5] = Value_Feuerherz;
};

instance ItAt_IceGolem_01(C_Item)
{
	name = "Herz eines Eisgolems";
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	spell = SPL_ICECUBE;
	value = Value_Eisherz;
	visual = "ItAt_IceGolem_01.3DS";
	material = MAT_STONE;
	description = name;
	text[0] = "Dieses Herz stammt aus den Überresten";
	text[1] = "eines besiegten Eisgolems.";
	text[2] = "Es hat die Kraft, einen Gegner";
	text[3] = "zu Eis erstarren zu lassen.";
	text[5] = NAME_Value;
	count[5] = Value_Eisherz;
};

instance ItAt_IceGolem_02(C_Item)
{
	name = "Stück eines Eisgolems";
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	spell = SPL_THUNDERBOLT;
	value = Value_Eistueck;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = 500;
	visual = "ItAt_IceGolem_01.3DS";
	material = MAT_STONE;
	description = name;
	text[0] = "Dieses Stück stammt aus den Überresten";
	text[1] = "eines besiegten Eisgolems.";
	text[4] = NAME_Value;
	count[4] = Value_Eistueck;
};

