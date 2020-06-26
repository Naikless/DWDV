
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
	name = "Pr�parierter Traumruf";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Joint3 * 10;
	visual = "ItMi_Joint_01.3ds";
	material = MAT_WOOD;
	scemeName = "JOINT";
	on_state[0] = UseSpecialJoint;
	text[0] = "Dieses Sumpfkraut hat eine weitaus";
	text[1] = "st�rkere Wirkung als normal.";
	text[3] = "Es ist f�r den Guru Baal-Tyon bestimmt!";
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
	Doc_PrintLine(nDocID,0,"Hochgesch�tzter Meister Corristo,");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,-1,"font_10_book.TGA");
	Doc_PrintLines(nDocID,0,"Saturas, ehrw�rdiger Meister der Magier vom Keis des Wassers, m�chte Euch ersuchen, gemeinsam mit uns daf�r Sorge zu tragen, da� die Spannungen zwischen dem alten und dem neuen Lager in einem Rahmen gehalten werden, der f�r beide Seiten zutr�glich ist. Da Ihr daf�r Sorge tragt, da� der K�nig seine monatliche Erzlieferung erh�lt, ist es in Eurem Interesse, da� die Aktivit�ten der Banditen aus dem Neuen Lager eingeschr�nkt werden. Desweiteren ist es in unserem Interesse, da� seitens des Alten Lagers keine Schritte unternommen werden, die unser Vorhaben, die magische Barriere wieder zu �ffnen in Gefahr bringen k�nnten.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"In Erwartung Eurer baldigen Antwort");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"            Cronos, H�ter des Erzes");
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
	text[1] = "der Name NEK ist auf der R�ckseite eingraviert";
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
	name = "Heiltrank f�r Y'Berion";
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
	text[1] = "Liste seinen Bedarf an Vorr�ten aufgef�hrt.";
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
	Doc_PrintLine(nDocID,0,"25-30  �pfel");
	Doc_PrintLine(nDocID,0,"10  K�se");
	Doc_PrintLine(nDocID,0,"1 Suppenkelle");
	Doc_PrintLine(nDocID,0,"1 B�rste");
	Doc_PrintLine(nDocID,0,"5   Spitzhacken   + 3  H�mmer");
	Doc_PrintLines(nDocID,0,"Und  reichlich  Sumpfkraut - wei�t  ja erste  Lieferung im   Monat! ");
	Doc_PrintLine(nDocID,0,"Die Lieferung   sollte  �bermorgen da sein.");
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
	text[1] = "Liste seinen Bedarf an Vorr�ten aufgef�hrt.";
	text[2] = "(Lares hat einige Punkte hinzugef�gt. Eine";
	text[3] = "wirklich meisterhafte F�lschung!)";
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
	Doc_PrintLine(nDocID,0,"25-30  �pfel");
	Doc_PrintLine(nDocID,0,"10  K�se");
	Doc_PrintLine(nDocID,0,"1 Suppenkelle");
	Doc_PrintLine(nDocID,0,"1 B�rste");
	Doc_PrintLine(nDocID,0,"5   Spitzhacken   + 3  H�mmer");
	Doc_PrintLines(nDocID,0,"Und  reichlich  Sumpfkraut - wei�t  ja erste  Lieferung im   Monat! ");
	Doc_PrintLine(nDocID,0,"Die Lieferung   sollte  �bermorgen da sein.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"IAN");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Was mir gerade noch einf�llt:");
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
	text[0] = "Enth�lt das Rezept f�r einen Heiltrank.";
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
	Doc_PrintLines(nDocID,1,"Wenn man es r�ckw�rts liest, scheint es einen Sinn zu geben");
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
	text[0] = "Leider fehlt darauf ein gro�es Gebiet";
	text[1] = "im S�dwesten.";
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
	description = "�bersicht Altes Lager";
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
	description = "�bersicht Neues Lager";
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
	description = "�bersicht Sumpflager";
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
	text[1] = "Das Siegel darf nicht ge�ffnet werden!";
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
	Doc_PrintLine(nDocID,0,"Hochgesch�tzter Meister");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,-1,"font_10_book.TGA");
	Doc_PrintLines(nDocID,0,"eure letzte Nachricht erhielten wir mit gro�er Sorge.Wir haben uns beraten und lassen Euch durch diesen Brief unsere Entscheidung wissen.Die  Bruderschaft bedeutet eine Gefahr. Eine Gefahr f�r die weiteren Abl�ufe unseres Handelsabkommen und damit f�r den K�nig, das gesamte K�nigreich und auch f�r Euer Leben. Deshalb solltet Ihr zun�chst Kundschafter aussenden und herausfinden, auf welchen G�ttern und auf welchem Wissen ihre magische Macht beruht. Wenn Ihr das herausgefunden habt, werden wir die Priester mit Euren Erkenntnissen vertraut machen, auf das wir gemeinsam diesem Spuk ein Ende bereiten werden. Schon in diesem Augenblick studieren die Gelehrten die alten B�cher. �ber alle neuen Erkenntnisse berichten wir Euch umgehend auf gewohntem Weg.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"M�ge Innos uns sch�tzen");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ItWr_Fire_Letter_02(C_Item)
{
	name = "Ge�ffneter Brief";
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
	Doc_PrintLine(nDocID,0,"Hochgesch�tzter Meister Xardas,");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,-1,"font_10_book.TGA");
	Doc_PrintLines(nDocID,0,"Eure letzte Nachricht erhielten wir mit gro�er Sorge. Wir haben uns beraten und lassen Euch durch diesen Brief unsere Entscheidung wissen. Die Bruderschaft bedeutet eine Gefahr. Eine Gefahr f�r die weiteren Abl�ufe unseres Handelsabkommen und damit f�r den K�nig, das gesamte K�nigreich und auch f�r Euer Leben. Deshalb solltet Ihr zun�chst Kundschafter aussenden und herausfinden, auf welchen G�ttern und auf welchem Wissen ihre magische Macht beruht. Es ist unsere Pflicht, diese Sekte zu zerschlagen und ihr Wissen an uns zu bringen, auf das niemand damit Unheil zu stiften vermag. Sobald uns Eure Antwirt erreicht, werden wir Innos Priester mit Euren Erkenntnissen vertraut machen. Schon in diesem Augenblick studieren die Gelehrten die alten B�cher. �ber alle neuen Erkenntnisse berichten wir Euch umgehend auf gewohntem Weg.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"M�ge Innos uns sch�tzen");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ItKe_Gomez_01(C_Item)
{
	name = "Gomez' Schl�ssel";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_04.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "�ffnet Gomez Truhen";
	text[1] = "�ffnet Lagerraumt�ren im Keller der Erzbarone";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItKey_RB_01(C_Item)
{
	name = "Reislord's Schl�ssel";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "�ffnet Reislord's Truhe";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITKEY_OB_SMITH_01(C_Item)
{
	name = "Eisenschl�ssel";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "�ffnet die T�r des Schmiedelagers";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItKe_Storage_01(C_Item)
{
	name = "Lagerschl�ssel";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "�ffnet Hauptt�r der Lagerr�ume ";
	text[1] = "im Keller der Erzbarone";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItKe_OM_01(C_Item)
{
	name = "Truhenschl�ssel";
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
	name = "Truhenschl�ssel";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "�ffnet Aarons Truhe";
	text[1] = "in der Alten Mine.";
};

instance ItKe_OM_03(C_Item)
{
	name = "Truhenschl�ssel";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "�ffnet die Truhen";
	text[1] = "im Lagerschuppen der Alten Mine.";
};

instance ItKe_OM_04(C_Item)
{
	name = "Truhenschl�ssel";
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
	name = "Truhenschl�ssel";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "�ffnet Garaz Truhe";
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
	Doc_PrintLines(nDocID,0,"Der, der gewillt ist allen irdischen Lastern zu entsagen und auf den Pfaden der Rechtschaffenen wandelt, soll wissen wo der Quell meiner Macht verborgen liegt. Auf da� er es nutzen m�ge die Ketten dieser Welt zu sprengen und sich als w�rdig zu erweisen, Chromanin zu empfangen.");
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
	Doc_PrintLines(nDocID,1,"Der Weise verschafft sich gro�en �berblick, bevor er sich der n�chsten Aufgabe widmet.");
	Doc_Show(nDocID);
	if(riddle1 == FALSE)
	{
		Log_CreateTopic(theriddle_log,LOG_MISSION);
		Log_SetTopicStatus(theriddle_log,LOG_RUNNING);
		B_LogEntry(theriddle_log,"Ich habe dem Skelett Magier im Nebelturm ein sehr seltsames Buch abgenommen. Chromanin! Es scheint sich um ein R�tsel zu handeln, das ein geheimnisvoller Fremder dieser Welt gestellt hat: ...Der Weise verschafft sich gro�en �berblick, bevor er sich der n�chsten Aufgabe widmet... Mmmh! Ich verstehe es noch nicht ganz. aber vielleicht komme ich ja noch dahinter.");
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
	Doc_PrintLines(nDocID,0,"Getragen von den Gezeiten, haben Chromanins Visionen der Zukunft mir die Augen ge�ffnet. Kein Preis ist hoch genug, den Glauben daran wieder aufzugeben. Viel zu stark hat es mich bewegt.");
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
		B_LogEntry(theriddle_log,"Ich habe ein zweites Buch gefunden, das den Namen Chromanin tr�gt. Und wieder gibt es mir ein R�tsel auf...Was geteilt, wird wieder vereint, wenn auch nur kurz massiv voneinander getrennt....");
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
	Doc_PrintLines(nDocID,0,"Oh, ihr G�tter der alten Zeiten. Kann es sein, das ein Mensch, wie ich, der nur einfach gestrickt und unw�rdig, solch� gro�es Verm�chtnis erlangen darf. Die Angst ist gro�, alles zu verlieren durch ein kleines Wort des Schwankens.");
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
	Doc_PrintLines(nDocID,1,"Der kluge Fischer, versucht sein Gl�ck auch mal auf der anderen Seite des Sees.");
	Doc_Show(nDocID);
	if(riddle3 == FALSE)
	{
		B_GiveXP(500);
		B_LogEntry(theriddle_log,"Ich habe das dritte Buch gefunden. Ich glaube so langsam verstehe ich, wie das abl�uft....Der kluge Fischer, versucht sein Gl�ck auch mal auf der anderen Seite des Sees...");
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
	Doc_PrintLines(nDocID,0,"Ich wage nicht zu hoffen eines Tages Chromanin selbst zu erleben. Vorbei sind die Tage der Verschwendung und des Klangens. So leicht wird es sein, die v�llige Vollendung zu erreichen. Ich bin nicht mehr weit davon entfernt.");
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
		B_LogEntry(theriddle_log,"Nummer vier. Ich frag mich langsam, warum ich mich von diesem Typ an der Nase herumf�hren lasse....Vergessen sind die Taten jener, die sich einst an Bord befanden...");
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
	Doc_PrintLines(nDocID,0,"Doch soll ich nicht alleine diesen Weg beschreiten. Diese Ehre sei mir verg�nnt. Ich mu� mich f�gen und die Kraft, die in mir wohnt, mu� ich teilen mit den W�rdigen, die da kommen werden, mich zu finden. Hoffentlich kommen sie bald...");
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
		B_LogEntry(theriddle_log,"Dies scheint das letzte zu sein. Bin gespannt zu erfahren, wem ich gegen�ber stehen werde ...Dort, wo alles begann, sollst du mich finden...");
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
		B_LogEntry(theriddle_log,"Der geheimnisvolle Fremde ist tot. Diese D�monen haben ihn get�tet. Irgendetwas scheint ihn mit diesen Gesch�pfen der H�lle verbunden zu haben. Sonst w�re er sicher nicht an diesen gottverlassenen Ort zur�ckgekehrt. Das Geheimnis, das er mit mir teilen wollte, hat er mit ins Grab genommen.");
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
	name = "Schamanen Schl�ssel";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Der Schl�ssel von Kar-Nakh.";
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
	text[0] = "erm�glicht Kontakt zum Schl�fer";
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
	text[0] = "Die pers�nliche Karte";
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
	text[2] = "Ein alt aussehendes Schmuckst�ck.";
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
	text[0] = "einer Gruppe J�ger";
	text[1] = "die im Osten der Kolonie";
	text[2] = "ein bestimmtes Rudel W�lfe";
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
	Doc_PrintLines(nDocID,0,"Wir sind richtung Osten aufgebrochen. Haben Geschichten �ber ein Rudel W�lfe geh�rt, angef�hrt von einem schwarzen Wolf.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Tag 75");
	Doc_PrintLines(nDocID,0,"Haben unser Lager im Wald, in der N�he der Klippen des Meeres errichtet. Sind eine Gruppe von vier erfahrenen J�gern. Sollte also kein Problem darstellen das Rudel zu bewzingen. Ein J�ger, Aidan, wird uns f�r das Fell des schwarzen Wolfes gut bezahlen.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Tag 81");
	Doc_PrintLines(nDocID,0,"Es ist mitten in der Nacht und wir sitzen in unserem Lager fest. Ich kann nichts sehen, aber ich kann h�ren wie ein Rudel um unser Lager schleicht. Scheinbar haben sie uns eingekreist. Hoffentlich ist der schwarze Wo...");
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
		B_LogEntry(CH1_BLACKWOLF,"Im Osten der Kolonie fand ich die �berreste eines J�gerlagers. Scheinbar waren sie auf der Jagd nach einem schwarzen Wolf, der ein ganzes Rudel anf�hrt. Irgendwo im Wald muss der Wolf zu finden sein.");
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

