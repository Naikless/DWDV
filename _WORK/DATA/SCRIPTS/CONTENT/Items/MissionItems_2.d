
instance ItWrFocusmapPsi(C_Item)
{
	name = "Fokuskarte von Y'Berion";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 15;
	visual = "ItWr_Map_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = UseFocusmapPsi;
	description = name;
	text[1] = "Auf dieser Karte ist der Weg zum";
	text[2] = "Fokusstein eingezeichnet, den Y'Berion";
	text[3] = "f�r seine Schl�fer-Beschw�rung ben�tigt";
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
	name = "Fokus von der Meeresklippe";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	hp = 1;
	hp_max = 1;
	weight = 1;
	value = 1;
	visual = "ItMi_Focus_01.3ds";
	material = MAT_STONE;
	description = name;
	text[1] = "Einer der f�nf Foki, die zur Erschaffung";
	text[2] = "der magischen Barriere benutzt wurden.";
};

instance ItMi_Stuff_Gearwheel_01(C_Item)
{
	name = "Zahnrad";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItMi_Stuff_Gearwheel_01.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Es stammt von einem defekten Erzstampfer";
	text[1] = "der in einem verlassenen Nebenstollen";
	text[2] = "der Alten Mine steht.";
};

instance ItAt_Crawlerqueen(C_Item)
{
	name = "Minecrawler Ei";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 100;
	visual = "ItAt_Crawlerqueen.3ds";
	material = MAT_LEATHER;
	description = name;
	text[0] = "Diese Eier wurden von einer";
	text[1] = "Minecrawler-K�nigin gelegt.";
	text[2] = "Sie enthalten ein viel st�rkeres Sekret";
	text[3] = "als die Zangen der normalen Minecrawler.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItWrFokusbuch(C_Item)
{
	name = "Almanach";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = UseItWrFokusbuch;
	description = name;
	text[0] = "Dieses uralte Zauberbuch enth�lt eine Reihe";
	text[1] = "magischer Formeln, die sich alle auf die ";
	text[2] = "Verwendung sogenannter Fokus-Steine beziehen.";
};


func void UseItWrFokusbuch()
{
	var int nDocID;
	if((BOOK_ALMANACH == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(50);
		BOOK_ALMANACH = TRUE;
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"Kapitel 23");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,-1,"font_10_book.TGA");
	Doc_PrintLine(nDocID,0,"Die geb�ndelte Macht");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Die im Inneren des Steins ruhende und st�ndige wachsende Kraft wird durch die Worte des Magiers freigesetzt. Best�ndig oder auf einen Schlag, das liegt alleine im seinem Ermessen. ");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Zugleich wird der Fokus jedoch frei von der Macht, er ist nunmehr eine leere H�lle.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Die Worte der Macht, um  die in einem Fokus aufbewahrte Energie freizulassen sind vielen K�nstlern der arkanen Kraft zug�nglich. Auch einen neues Artefakt mit Energie zu f�llen ist mehr magische Gepflogenheit geworden denn ein Geheimnis der Wissenden. ");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Doch einen gebrauchten Fokusstein wieder erneut aufzuladen, verstehen nur Auserw�hlte.Diese Formel aus uralten Tagen dient als Zeichen der hohen Gabe.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"So dann Wissender �ffne deinen Geist f�r die Worte alter Macht  ");
	Doc_Show(nDocID);
};

