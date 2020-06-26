
instance MordragsRing(C_Item)
{
	name = "Mordrags Ring";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = 250;
	visual = "ItMi_Ring_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_MordragsRing;
	on_unequip = UnEquip_MordragsRing;
	description = "Mordrags Ring";
	text[2] = NAME_Bonus_Dex;
	count[2] = 5;
	text[5] = NAME_Value;
	count[5] = value;
};


func void Equip_MordragsRing()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,5);
};

func void UnEquip_MordragsRing()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,-5);
};


instance SpecialJoint(C_Item)
{
	name = "Präparierter Traumruf";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Joint3 * 10;
	visual = "ItMi_Joint_01.3ds";
	material = MAT_WOOD;
	scemeName = "JOINT";
	on_state[0] = UseSpecialJoint;
	text[0] = "Dieses Sumpfkraut hat eine weitaus";
	text[1] = "stärkere Wirkung als normal.";
	text[3] = "Es ist für den Guru Baal-Tyon bestimmt!";
	text[5] = NAME_Value;
	count[4] = Value_Joint3 * 10;
};


func void UseSpecialJoint()
{
	AI_StartState(self,ZS_MagicSleep,1,"");
};


instance ItAt_DamLurker_01(C_Item)
{
	name = "Klaue des Dammlurker";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = Value_Lurkerklaue;
	visual = "ItAt_Lurker_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = NAME_Value;
	count[4] = Value_Lurkerklaue * 2;
};

instance ItWrOMMap(C_Item)
{
	name = "Karte";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 30;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = UseOMmap;
	description = "Karte zur Alten Mine";
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseOMmap()
{
	var int nDocID;
	nDocID = Doc_CreateMap();
	Doc_SetLevel(nDocID,"WORLD.ZEN");
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Map_OldMine.tga",1);
	Doc_Show(nDocID);
};


instance AltesSchwertVM(C_Item)
{
	name = "Altes Schwert";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 10;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 10;
	damageTotal = 10;
	damagetype = DAM_EDGE;
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

instance AltesSchwert(C_Item)
{
	name = "Altes Schwert";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 10;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 10;
	damageTotal = 10;
	damagetype = DAM_EDGE;
	visual = "ItMw_1H_Sword_Old_01.3DS";
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_OneHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance JackalsSword(C_Item)
{
	name = "Jackals Schwert";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	owner = Grd_201_Jackal;
	value = 27;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 20;
	damageTotal = 3;
	damagetype = DAM_EDGE;
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

instance KdW_Amulett(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = 100;
	visual = "ItMi_Amulet_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	description = "Botenamulett der Wassermagier";
	text[5] = NAME_Value;
	count[5] = value;
};

instance Cronos_Brief(C_Item)
{
	name = "Brief";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseCronosBrief;
	scemeName = "MAP";
	description = "Cronos Brief an die Feuermagier";
};


func void UseCronosBrief()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0," ");
	Doc_PrintLine(nDocID,0,"Hochgeschätzter Meister Corristo,");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,-1,"font_10_book.TGA");
	Doc_PrintLines(nDocID,0,"Saturas, ehrwürdiger Meister der Magier vom Keis des Wassers, möchte Euch ersuchen, gemeinsam mit uns dafür Sorge zu tragen, daß die Spannungen zwischen dem alten und dem neuen Lager in einem Rahmen gehalten werden, der für beide Seiten zuträglich ist. Da Ihr dafür Sorge tragt, daß der König seine monatliche Erzlieferung erhält, ist es in Eurem Interesse, daß die Aktivitäten der Banditen aus dem Neuen Lager eingeschränkt werden. Desweiteren ist es in unserem Interesse, daß seitens des Alten Lagers keine Schritte unternommen werden, die unser Vorhaben, die magische Barriere wieder zu öffnen in Gefahr bringen könnten.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"In Erwartung Eurer baldigen Antwort");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"            Cronos, Hüter des Erzes");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance Neks_Amulett(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = 50;
	visual = "ItMi_Amulet_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_Schutzamulett_Nek;
	on_unequip = UnEquip_Schutzamulett_Nek;
	description = "Amulett des toten Gardisten";
	text[1] = "der Name NEK ist auf der Rückseite eingraviert";
	text[2] = NAME_Prot_Edge;
	count[2] = 5;
	text[5] = NAME_Value;
	count[5] = value;
};


func void Equip_Schutzamulett_Nek()
{
	self.protection[PROT_EDGE] += 5;
	self.protection[PROT_BLUNT] += 5;
};

func void UnEquip_Schutzamulett_Nek()
{
	self.protection[PROT_EDGE] -= 5;
	self.protection[PROT_BLUNT] -= 5;
};


instance DEXTERJOINT(C_Item)
{
	name = "Erleuchteter Geist";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	hp = 10;
	hp_max = 10;
	weight = 1;
	value = 1;
	visual = "ItMi_Joint_01.3ds";
	material = MAT_WOOD;
	scemeName = "JOINT";
	on_state[0] = usedexterjoint;
	description = name;
	text[0] = "Dieses Sumpfkraut";
	text[1] = "hat eine besondere Auswirkung";
	text[2] = "auf das Bewusstsein seines Opfers.";
	text[5] = NAME_Value;
	count[5] = value;
};


func void usedexterjoint()
{
	Mdl_ApplyOverlayMdsTimed(self,"HUMANS_DRUNKEN.MDS",Time_Haste3);
};


instance HealthWater(C_Item)
{
	name = "Heiltrank für Y'Berion";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItFo_Potion_Health_03.3ds";
	material = MAT_GLAS;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance TheList(C_Item)
{
	name = "Bedarfsliste";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	hp = 5;
	hp_max = 5;
	weight = 1;
	visual = "ItWr_Scroll_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = UseTheList;
	description = name;
	text[0] = "Ian, der Boss der Alten Mine hat auf dieser";
	text[1] = "Liste seinen Bedarf an Vorräten aufgeführt.";
};


func void UseTheList()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"Bedarfsliste");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"20 Laib  Brot - diesmal  aber nicht  das Verschimmelte!");
	Doc_PrintLine(nDocID,0,"25-30  Äpfel");
	Doc_PrintLine(nDocID,0,"10  Käse");
	Doc_PrintLine(nDocID,0,"1 Suppenkelle");
	Doc_PrintLine(nDocID,0,"1 Bürste");
	Doc_PrintLine(nDocID,0,"5   Spitzhacken   + 3  Hämmer");
	Doc_PrintLines(nDocID,0,"Und  reichlich  Sumpfkraut - weißt  ja erste  Lieferung im   Monat! ");
	Doc_PrintLine(nDocID,0,"Die Lieferung   sollte  übermorgen da sein.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"IAN");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance TheListNC(C_Item)
{
	name = "Bedarfsliste (erweitert)";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	hp = 5;
	hp_max = 5;
	weight = 1;
	visual = "ItWr_Scroll_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = UseTheListNC;
	description = name;
	text[0] = "Ian, der Boss der Alten Mine hat auf dieser";
	text[1] = "Liste seinen Bedarf an Vorräten aufgeführt.";
	text[2] = "(Lares hat einige Punkte hinzugefügt. Eine";
	text[3] = "wirklich meisterhafte Fälschung!)";
};


func void UseTheListNC()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"Bedarfsliste");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"20 Laib  Brot - diesmal  aber nicht  das Verschimmelte!");
	Doc_PrintLine(nDocID,0,"25-30  Äpfel");
	Doc_PrintLine(nDocID,0,"10  Käse");
	Doc_PrintLine(nDocID,0,"1 Suppenkelle");
	Doc_PrintLine(nDocID,0,"1 Bürste");
	Doc_PrintLine(nDocID,0,"5   Spitzhacken   + 3  Hämmer");
	Doc_PrintLines(nDocID,0,"Und  reichlich  Sumpfkraut - weißt  ja erste  Lieferung im   Monat! ");
	Doc_PrintLine(nDocID,0,"Die Lieferung   sollte  übermorgen da sein.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"IAN");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Was mir gerade noch einfällt:");
	Doc_PrintLine(nDocID,0,"30 Flaschen Bier");
	Doc_PrintLine(nDocID,0,"5 Flaschen Wein");
	Doc_PrintLine(nDocID,0,"25 gebratene Scavangerkeulen");
	Doc_PrintLine(nDocID,0,"ein halbes Duzend Ersatzwaffen");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance Lares_Ring(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING || ITEM_MISSION;
	value = 50;
	visual = "ItMi_Ring_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_Lares_Ring;
	on_unequip = UnEquip_Lares_Ring;
	description = "Ring von Lares";
	text[2] = NAME_Bonus_Str;
	count[2] = 3;
	text[5] = NAME_Value;
	count[5] = value;
};


func void Equip_Lares_Ring()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,3);
};

func void UnEquip_Lares_Ring()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,-3);
};


instance Heiltrank(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI || ITEM_MISSION;
	value = 100;
	visual = "ItFo_Potion_Health_01.3ds";
	material = MAT_GLAS;
	on_state[0] = UseHeiltrank;
	scemeName = "POTION";
	description = "Trank der schnellen Heilung";
	text[2] = NAME_Bonus_HP;
	count[2] = 30;
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseHeiltrank()
{
	PrintDebugNpc(PD_ITEM_MOBSI,"UseHealthPotion");
	Npc_ChangeAttribute(self,ATR_HITPOINTS,30);
	PrintDebugNpc(PD_ITEM_MOBSI,"Ich trinke meinen Heiltrank");
};


instance SpecialWater(C_Item)
{
	name = "Zauberwasser";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItFoFlaskHealth.3ds";
	material = MAT_GLAS;
	scemeName = "POTION";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance KalomsRecipe(C_Item)
{
	name = "Kalom's Rezeptbuch";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[0] = "Enthält das Rezept für einen Heiltrank.";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_KalomsRecipe;
};


func void Use_KalomsRecipe()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Lifrun ak Gharak");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Gharak Or Nach bin thu. Lifrun mar Orag chtah. Shrunk esp Horinth.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Wenn man es rückwärts liest, scheint es einen Sinn zu geben");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"          - Kalom");
	Doc_Show(nDocID);
};


instance ItWrWorldmap(C_Item)
{
	name = "Karte der Kolonie";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = UseWorldmap;
	description = name;
	text[0] = "Leider fehlt darauf ein großes Gebiet";
	text[1] = "im Südwesten.";
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseWorldmap()
{
	var int nDocID;
	nDocID = Doc_CreateMap();
	Doc_SetLevel(nDocID,"WORLD.ZEN");
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Map_World.tga",1);
	Doc_Show(nDocID);
};


instance ItWrOCmap(C_Item)
{
	name = "Karte";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 40;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = UseOCmap;
	description = "Übersicht Altes Lager";
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseOCmap()
{
	var int nDocID;
	nDocID = Doc_CreateMap();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Map_OldCamp.tga",1);
	Doc_Show(nDocID);
};


instance ItWrNCmap(C_Item)
{
	name = "Karte";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 40;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = UseNCmap;
	description = "Übersicht Neues Lager";
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseNCmap()
{
	var int nDocID;
	nDocID = Doc_CreateMap();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Map_NewCamp.tga",1);
	Doc_Show(nDocID);
};


instance ItWrPSImap(C_Item)
{
	name = "Karte";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 40;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = UsePSImap;
	description = "Übersicht Sumpflager";
	text[5] = NAME_Value;
	count[5] = value;
};


func void UsePSImap()
{
	var int nDocID;
	nDocID = Doc_CreateMap();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Map_PSICamp.tga",1);
	Doc_Show(nDocID);
};


instance ItWrPinup(C_Item)
{
	name = "Skizze";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 60;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = UsePinUp;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};


func void UsePinUp()
{
	var int nDocID;
	nDocID = Doc_CreateMap();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Map_PinUp.tga",1);
	Doc_Show(nDocID);
};


instance ItWrDieVerurteilten(C_Item)
{
	name = "Die Verurteilten";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWrBook.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItWr_Fire_Letter_01(C_Item)
{
	name = "Versiegelter Brief";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseFireletter;
	scemeName = "MAPSEALED";
	description = "Brief an Feuermagier";
	text[1] = "Das Siegel darf nicht geöffnet werden!";
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseFireletter()
{
	var int nDocID;
	CreateInvItem(hero,ItWr_Fire_Letter_02);
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0," ");
	Doc_PrintLine(nDocID,0,"Hochgeschätzter Meister");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,-1,"font_10_book.TGA");
	Doc_PrintLines(nDocID,0,"eure letzte Nachricht erhielten wir mit großer Sorge.Wir haben uns beraten und lassen Euch durch diesen Brief unsere Entscheidung wissen.Die  Bruderschaft bedeutet eine Gefahr. Eine Gefahr für die weiteren Abläufe unseres Handelsabkommen und damit für den König, das gesamte Königreich und auch für Euer Leben. Deshalb solltet Ihr zunächst Kundschafter aussenden und herausfinden, auf welchen Göttern und auf welchem Wissen ihre magische Macht beruht. Wenn Ihr das herausgefunden habt, werden wir die Priester mit Euren Erkenntnissen vertraut machen, auf das wir gemeinsam diesem Spuk ein Ende bereiten werden. Schon in diesem Augenblick studieren die Gelehrten die alten Bücher. Über alle neuen Erkenntnisse berichten wir Euch umgehend auf gewohntem Weg.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Möge Innos uns schützen");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ItWr_Fire_Letter_02(C_Item)
{
	name = "Geöffneter Brief";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseFireletter2;
	scemeName = "MAP";
	description = "Brief an Feuermagier";
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseFireletter2()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0," ");
	Doc_PrintLine(nDocID,0,"Hochgeschätzter Meister Xardas,");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,-1,"font_10_book.TGA");
	Doc_PrintLines(nDocID,0,"Eure letzte Nachricht erhielten wir mit großer Sorge. Wir haben uns beraten und lassen Euch durch diesen Brief unsere Entscheidung wissen. Die Bruderschaft bedeutet eine Gefahr. Eine Gefahr für die weiteren Abläufe unseres Handelsabkommen und damit für den König, das gesamte Königreich und auch für Euer Leben. Deshalb solltet Ihr zunächst Kundschafter aussenden und herausfinden, auf welchen Göttern und auf welchem Wissen ihre magische Macht beruht. Es ist unsere Pflicht, diese Sekte zu zerschlagen und ihr Wissen an uns zu bringen, auf das niemand damit Unheil zu stiften vermag. Sobald uns Eure Antwirt erreicht, werden wir Innos Priester mit Euren Erkenntnissen vertraut machen. Schon in diesem Augenblick studieren die Gelehrten die alten Bücher. Über alle neuen Erkenntnisse berichten wir Euch umgehend auf gewohntem Weg.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Möge Innos uns schützen");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ItKe_Gomez_01(C_Item)
{
	name = "Gomez' Schlüssel";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_04.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Öffnet Gomez Truhen";
	text[1] = "Öffnet Lagerraumtüren im Keller der Erzbarone";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItKey_RB_01(C_Item)
{
	name = "Reislord's Schlüssel";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Öffnet Reislord's Truhe";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITKEY_OB_SMITH_01(C_Item)
{
	name = "Eisenschlüssel";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Öffnet die Tür des Schmiedelagers";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItKe_Storage_01(C_Item)
{
	name = "Lagerschlüssel";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Öffnet Haupttür der Lagerräume ";
	text[1] = "im Keller der Erzbarone";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItKe_OM_01(C_Item)
{
	name = "Truhenschlüssel";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Santinos Lager ";
	text[1] = "Oberer Warentauschplatz";
	text[2] = "Alte Mine";
};

instance ItKe_OM_02(C_Item)
{
	name = "Truhenschlüssel";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "öffnet Aarons Truhe";
	text[1] = "in der Alten Mine.";
};

instance ItKe_OM_03(C_Item)
{
	name = "Truhenschlüssel";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "öffnet die Truhen";
	text[1] = "im Lagerschuppen der Alten Mine.";
};

instance ItKe_OM_04(C_Item)
{
	name = "Truhenschlüssel";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_04.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Albertos Lager";
	text[1] = "Unterer Warentauschplatz";
};

instance ITKE_OMCAMP_01(C_Item)
{
	name = "Truhenschlüssel";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "öffnet Garaz Truhe";
	text[1] = "vor der Alten Mine.";
};

instance ItFo_OM_Beer_01(C_Item)
{
	name = "Starkbier";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = 30;
	visual = "ItFo_Beer_01.3ds";
	material = MAT_GLAS;
	on_state[0] = UseStarkBeer;
	scemeName = "POTION";
	description = name;
	text[0] = NAME_Bonus_HP;
	count[0] = 6;
	text[3] = "";
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseStarkBeer()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,6);
	if(Npc_IsPlayer(self))
	{
		GET_DRUNK = GET_DRUNK + 1;
		self.voicePitch = 0;
		if(GET_DRUNK == 4)
		{
			Mdl_ApplyOverlayMdsTimed(self,"HUMANS_DRUNKEN.MDS",Time_Haste1);
			GET_DRUNK = 0;
		};
	};
};


var int riddle1;
var int riddle2;
var int riddle3;
var int riddle4;
var int riddle5;
var int riddle6;

instance theriddle1(C_Item)
{
	name = "Altes Buch";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Chromanin";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Usetheriddle1;
};


func void Usetheriddle1()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Chromanin");
	Doc_PrintLine(nDocID,0,"-----------");
	Doc_SetFont(nDocID,-1,"font_10_book.TGA");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Der, der gewillt ist allen irdischen Lastern zu entsagen und auf den Pfaden der Rechtschaffenen wandelt, soll wissen wo der Quell meiner Macht verborgen liegt. Auf daß er es nutzen möge die Ketten dieser Welt zu sprengen und sich als würdig zu erweisen, Chromanin zu empfangen.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Der Weise verschafft sich großen Überblick, bevor er sich der nächsten Aufgabe widmet.");
	Doc_Show(nDocID);
	if(riddle1 == FALSE)
	{
		Log_CreateTopic(theriddle_log,LOG_MISSION);
		Log_SetTopicStatus(theriddle_log,LOG_RUNNING);
		B_LogEntry(theriddle_log,"Ich habe dem Skelett Magier im Nebelturm ein sehr seltsames Buch abgenommen. Chromanin! Es scheint sich um ein Rätsel zu handeln, das ein geheimnisvoller Fremder dieser Welt gestellt hat: ...Der Weise verschafft sich großen Überblick, bevor er sich der nächsten Aufgabe widmet... Mmmh! Ich verstehe es noch nicht ganz. aber vielleicht komme ich ja noch dahinter.");
		Wld_InsertItem(theriddle2,"CASTLE_TOWER_TOP");
		riddle1 = TRUE;
	};
};


instance theriddle2(C_Item)
{
	name = "Altes Buch";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Chromanin 2";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Usetheriddle2;
};


func void Usetheriddle2()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Chromanin");
	Doc_PrintLine(nDocID,0,"-----------");
	Doc_SetFont(nDocID,-1,"font_10_book.TGA");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Getragen von den Gezeiten, haben Chromanins Visionen der Zukunft mir die Augen geöffnet. Kein Preis ist hoch genug, den Glauben daran wieder aufzugeben. Viel zu stark hat es mich bewegt.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Was geteilt, wird wieder vereint, wenn auch nur kurz massiv voneinander getrennt.");
	Doc_Show(nDocID);
	if(riddle2 == FALSE)
	{
		B_GiveXP(300);
		B_LogEntry(theriddle_log,"Ich habe ein zweites Buch gefunden, das den Namen Chromanin trägt. Und wieder gibt es mir ein Rätsel auf...Was geteilt, wird wieder vereint, wenn auch nur kurz massiv voneinander getrennt....");
		Snd_Play("FoundRiddlersBook");
		Wld_InsertItem(theriddle3,"FP_SLEEP_OW_BLOODFLY_01_02");
		riddle2 = TRUE;
	};
};


instance theriddle3(C_Item)
{
	name = "Altes Buch";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Chromanin 3";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Usetheriddle3;
};


func void Usetheriddle3()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Chromanin");
	Doc_PrintLine(nDocID,0,"-----------");
	Doc_SetFont(nDocID,-1,"font_10_book.TGA");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Oh, ihr Götter der alten Zeiten. Kann es sein, das ein Mensch, wie ich, der nur einfach gestrickt und unwürdig, solch´ großes Vermächtnis erlangen darf. Die Angst ist groß, alles zu verlieren durch ein kleines Wort des Schwankens.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Der kluge Fischer, versucht sein Glück auch mal auf der anderen Seite des Sees.");
	Doc_Show(nDocID);
	if(riddle3 == FALSE)
	{
		B_GiveXP(500);
		B_LogEntry(theriddle_log,"Ich habe das dritte Buch gefunden. Ich glaube so langsam verstehe ich, wie das abläuft....Der kluge Fischer, versucht sein Glück auch mal auf der anderen Seite des Sees...");
		Snd_Play("FoundRiddlersBook");
		Wld_InsertItem(theriddle4,"FP_SLEEP_OW_LURKER_NC_LAKE_02");
		riddle3 = TRUE;
	};
};


instance theriddle4(C_Item)
{
	name = "Altes Buch";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Chromanin 4";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Usetheriddle4;
};


func void Usetheriddle4()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Chromanin");
	Doc_PrintLine(nDocID,0,"-----------");
	Doc_SetFont(nDocID,-1,"font_10_book.TGA");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Ich wage nicht zu hoffen eines Tages Chromanin selbst zu erleben. Vorbei sind die Tage der Verschwendung und des Klangens. So leicht wird es sein, die völlige Vollendung zu erreichen. Ich bin nicht mehr weit davon entfernt.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Vergessen sind die Taten jener, die sich einst an Bord befanden.");
	Doc_Show(nDocID);
	if(riddle4 == FALSE)
	{
		B_GiveXP(700);
		B_LogEntry(theriddle_log,"Nummer vier. Ich frag mich langsam, warum ich mich von diesem Typ an der Nase herumführen lasse....Vergessen sind die Taten jener, die sich einst an Bord befanden...");
		Snd_Play("FoundRiddlersBook");
		Wld_InsertItem(theriddle5,"LOCATION_25_01");
		riddle4 = TRUE;
	};
};


instance theriddle5(C_Item)
{
	name = "Altes Buch";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Chromanin 5";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Usetheriddle5;
};


func void Usetheriddle5()
{
	var int nDocID;
	var C_Npc riddler;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Chromanin");
	Doc_PrintLine(nDocID,0,"-----------");
	Doc_SetFont(nDocID,-1,"font_10_book.TGA");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Doch soll ich nicht alleine diesen Weg beschreiten. Diese Ehre sei mir vergönnt. Ich muß mich fügen und die Kraft, die in mir wohnt, muß ich teilen mit den Würdigen, die da kommen werden, mich zu finden. Hoffentlich kommen sie bald...");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Dort, wo alles begann, sollst du mich finden.");
	Doc_Show(nDocID);
	if(riddle5 == FALSE)
	{
		B_GiveXP(850);
		B_LogEntry(theriddle_log,"Dies scheint das letzte zu sein. Bin gespannt zu erfahren, wem ich gegenüber stehen werde ...Dort, wo alles begann, sollst du mich finden...");
		Snd_Play("FoundRiddlersBook");
		Wld_InsertNpc(Bau_940_Riddler,"");
		riddler = Hlp_GetNpc(Bau_940_Riddler);
		Npc_ChangeAttribute(riddler,ATR_HITPOINTS,-riddler.attribute[ATR_HITPOINTS_MAX]);
		riddle5 = TRUE;
	};
};


instance theriddle6(C_Item)
{
	name = "Altes Buch";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Chromanin 6";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Usetheriddle6;
};


func void Usetheriddle6()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Chromanin");
	Doc_PrintLine(nDocID,0,"-----------");
	Doc_SetFont(nDocID,-1,"font_10_book.TGA");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_Show(nDocID);
	if(riddle6 == FALSE)
	{
		B_GiveXP(1000);
		B_LogEntry(theriddle_log,"Der geheimnisvolle Fremde ist tot. Diese Dämonen haben ihn getötet. Irgendetwas scheint ihn mit diesen Geschöpfen der Hölle verbunden zu haben. Sonst wäre er sicher nicht an diesen gottverlassenen Ort zurückgekehrt. Das Geheimnis, das er mit mir teilen wollte, hat er mit ins Grab genommen.");
		Log_SetTopicStatus(theriddle_log,LOG_SUCCESS);
		Snd_Play("FoundRiddler");
		Wld_InsertNpc(SkeletonMage,"OW_FOGDUNGEON_36_MOVEMENT");
		Wld_InsertNpc(Skeleton,"OW_FOGDUNGEON_36_MOVEMENT");
		Wld_InsertNpc(SkeletonWarrior,"OW_FOGDUNGEON_36_MOVEMENT");
		Wld_InsertNpc(Skeleton,"OW_FOGDUNGEON_36_MOVEMENT2");
		Wld_InsertNpc(SkeletonScout,"OW_FOGDUNGEON_36_MOVEMENT2");
		Wld_InsertNpc(SkeletonWarrior,"OW_FOGDUNGEON_37");
		Wld_InsertNpc(SkeletonMage,"OW_FOGDUNGEON_37");
		riddle6 = TRUE;
	};
};


instance ITKEY_ARENA_ORC_01(C_Item)
{
	name = "Schamanen Schlüssel";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Der Schlüssel von Kar-Nakh.";
};

instance ITFO_POTION_ELIXIER_CRAWLER(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = Value_ElixierEgg;
	visual = "ItFo_Potion_Elixier_Egg.3ds";
	material = MAT_GLAS;
	scemeName = "POTIONFAST";
	description = "Crawler Elixier";
	text[0] = "ermöglicht Kontakt zum Schläfer";
	text[5] = NAME_Value;
	count[5] = Value_ElixierEgg;
};

instance ITWRWORLDMAP_MISSION(C_Item)
{
	name = "Graham's Karte der Kolonie";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 60;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = useworldmap_mission;
	description = name;
	text[0] = "Die persönliche Karte";
	text[1] = "von Graham.";
	text[5] = NAME_Value;
	count[5] = value;
};


func void useworldmap_mission()
{
	var int nDocID;
	nDocID = Doc_CreateMap();
	Doc_SetLevel(nDocID,"WORLD.ZEN");
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Map_World.tga",1);
	Doc_SetFont(nDocID,0,"font_15_book.TGA");
	Doc_SetMargins(nDocID,0,300,160,10,10,1);
	Doc_PrintLine(nDocID,0,"Karte der");
	Doc_PrintLine(nDocID,0,"Kolonie");
	Doc_Show(nDocID);
};


instance RICELORDS_RING(C_Item)
{
	name = "Reislords Ring";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING || ITEM_MISSION;
	value = 50;
	visual = "ItMi_Ring_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_ricelords_ring;
	on_unequip = unequip_ricelords_ring;
	description = "Reislords Ring";
	text[2] = NAME_Bonus_Str;
	count[2] = 3;
	text[5] = NAME_Value;
	count[5] = value;
};


func void equip_ricelords_ring()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,3);
};

func void unequip_ricelords_ring()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,-3);
};


instance BLOODWYNS_SCHWERT(C_Item)
{
	name = "Bloodwyns Schwert";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MULTI;
	material = MAT_METAL;
	value = 100;
	damageTotal = 25;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 25;
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

instance BUTCHS_AMULETT(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = 100;
	visual = "ItMi_Amulet_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_schutzamulett_butch;
	on_unequip = unequip_schutzamulett_butch;
	description = "Amulett von Butch";
	text[2] = NAME_Prot_Edge;
	count[2] = 5;
	text[5] = NAME_Value;
	count[5] = value;
};


func void equip_schutzamulett_butch()
{
	self.protection[PROT_EDGE] += 5;
	self.protection[PROT_BLUNT] += 5;
};

func void unequip_schutzamulett_butch()
{
	self.protection[PROT_EDGE] -= 5;
	self.protection[PROT_BLUNT] -= 5;
};


instance ITAT_CLAWS_SNAPPER(C_Item)
{
	name = "Snapperkrallen";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Krallen;
	visual = "ItAt_Claws_01.3DS";
	material = MAT_LEATHER;
	description = "Krallen von Logan's Snapper";
	text[4] = NAME_Value;
	count[4] = Value_Krallen;
};

instance FRANCOS_AMULETT(C_Item)
{
	name = "Franco's Amulett";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = 320;
	visual = "ItMi_Amulet_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_francosamulett;
	on_unequip = unequip_francosamulett;
	description = "Amulett von Franco";
	text[2] = NAME_Bonus_Dex;
	count[2] = 10;
	text[5] = NAME_Value;
	count[5] = value;
};


func void equip_francosamulett()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,10);
};

func void unequip_francosamulett()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,-10);
};


instance SCARSRING(C_Item)
{
	name = "Alter Ring";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = 250;
	visual = "ItMi_Ring_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_MordragsRing;
	on_unequip = UnEquip_MordragsRing;
	description = "Alter Ring";
	text[2] = "Ein alt aussehendes Schmuckstück.";
	text[5] = NAME_Value;
	count[5] = value;
};


func void equip_scarsring()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,5);
};

func void unequip_scarsring()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,-5);
};


instance GARRETS_PICKAXE(C_Item)
{
	name = "Garrets Spitzhacke";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MULTI | ITEM_MISSION;
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


var int huntblackwolf;

instance ITWR_HUNTER_01(C_Item)
{
	name = "Tagebuchseite";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 15;
	visual = "ItAr_Scroll_16.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = usetagebuch;
	description = "Tagebuchseite";
	text[0] = "einer Gruppe Jäger";
	text[1] = "die im Osten der Kolonie";
	text[2] = "ein bestimmtes Rudel Wölfe";
	text[3] = "jagten.";
};


func void usetagebuch()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"Tag 71");
	Doc_PrintLines(nDocID,0,"Wir sind richtung Osten aufgebrochen. Haben Geschichten über ein Rudel Wölfe gehört, angeführt von einem schwarzen Wolf.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Tag 75");
	Doc_PrintLines(nDocID,0,"Haben unser Lager im Wald, in der Nähe der Klippen des Meeres errichtet. Sind eine Gruppe von vier erfahrenen Jägern. Sollte also kein Problem darstellen das Rudel zu bewzingen. Ein Jäger, Aidan, wird uns für das Fell des schwarzen Wolfes gut bezahlen.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Tag 81");
	Doc_PrintLines(nDocID,0,"Es ist mitten in der Nacht und wir sitzen in unserem Lager fest. Ich kann nichts sehen, aber ich kann hören wie ein Rudel um unser Lager schleicht. Scheinbar haben sie uns eingekreist. Hoffentlich ist der schwarze Wo...");
	Doc_Show(nDocID);
	if((HUNTBLACKWOLF == FALSE) && Npc_IsPlayer(self))
	{
		Wld_InsertNpc(blackwolf,"SPAWN_OW_WOLF_04_PSI5");
		Wld_InsertNpc(Wolf,"SPAWN_OW_WOLF_04_PSI5");
		Wld_InsertNpc(Wolf,"SPAWN_OW_WOLF_04_PSI5");
		HUNTBLACKWOLF = TRUE;
		HUNT_WOLF = LOG_RUNNING;
		Log_CreateTopic(CH1_BLACKWOLF,LOG_MISSION);
		Log_SetTopicStatus(CH1_BLACKWOLF,LOG_RUNNING);
		B_LogEntry(CH1_BLACKWOLF,"Im Osten der Kolonie fand ich die Überreste eines Jägerlagers. Scheinbar waren sie auf der Jagd nach einem schwarzen Wolf, der ein ganzes Rudel anführt. Irgendwo im Wald muss der Wolf zu finden sein.");
	};
};


instance ITFOFLEISCHEINTOPF(C_Item)
{
	name = "Fleischeintopf";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Ragout;
	visual = "ItFo_Meatbugragout_01.3ds";
	material = MAT_LEATHER;
	scemeName = "RICE";
	on_state[0] = usefleischeintopf;
	description = name;
	text[1] = NAME_Bonus_Str;
	count[1] = 1;
	text[5] = NAME_Value;
	count[5] = Value_Ragout;
};


func void usefleischeintopf()
{
	B_RaiseAttribute(ATR_STRENGTH,1);
	Snd_Play("LevelUp");
};

