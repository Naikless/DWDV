
instance ItWr_GolemBook1(C_Item)
{
	name = "Arkanum Golum - Band I";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = UseGolemBook1;
};


func void UseGolemBook1()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"ARKANUM GOLUM - Band I");
	Doc_PrintLine(nDocID,0,"=====================");
	Doc_PrintLines(nDocID,0,"(Magie der Golems)");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Nur wer schon einmal einem dieser aus den Elementen erschaffenen Kreaturen begegnet ist, wird wirklich verstehen, welchen Respekt diese magieschen Wesen einem abenteuerlustigen Wanderer einflößen können.");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"Steingolem");
	Doc_PrintLine(nDocID,1,"------------");
	Doc_PrintLines(nDocID,1,"Diese steinernen Kolosse sind im Kampf fast unverwundbar. Schwerter, Äxte und Bögen scheinen diesen Monstren nichts anhaben zu können.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Der einzige glaubhafte Bericht von der Bezwingung eines solchen Leviathans stammt von einem Söldner. Er schrieb davon, wie der stumpfe Aufprall seines Kriegshammers Risse in den Golem trieb, bis dieser schlußendlich zerbarst.");
	Doc_Show(nDocID);
};


instance ItWr_GolemBook2(C_Item)
{
	name = "Arkanum Golum - Band II";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = UseGolemBook2;
};


func void UseGolemBook2()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"ARKANUM GOLUM - Band II");
	Doc_PrintLine(nDocID,0,"======================");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Eisgolem");
	Doc_PrintLine(nDocID,0,"---------");
	Doc_PrintLines(nDocID,0,"Den Steingolems verwandt sind die Eisgolems, deren physische Substanz jedoch völlig aus gefrorenem Wasser zu bestehen scheint. Jede uns bekannte Waffe scheint an der glatten Oberfläche dieser eisigen Wesen abzugleiten.");
	Doc_PrintLines(nDocID,0,"Auch sei der abenteuerlustige Wanderer gewarnt vor dem Eisatem dieser Kreatur, schließt sie doch jeden Ahnungslosen im Nu in einer Säule aus Eis ein.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLines(nDocID,1,"Einst berichtete ein Feuermagier von der Begegnung mit einem solchen Geschöpf, doch schien er keine ernste Bedrohung darin erkannt zu haben.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Feuergolem");
	Doc_PrintLine(nDocID,1,"------------");
	Doc_PrintLines(nDocID,1,"Berichten zufolge können diese feurigen Geschöpfe ihre Opfer mit nur einer Berührung in ein Flammenmeer verwandeln.");
	Doc_PrintLines(nDocID,1,"Erst im letzten Jahr stieß eine Jagdgruppe im Hochland auf solch einen wandelnden Gluthaufen. Der Ausgang ist unklar, doch sollen Blitze und Eis die Höllenkreatur gestoppt haben.");
	Doc_Show(nDocID);
};


instance ItWrWorldmap_Orc(C_Item)
{
	name = "Karte";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = UseWorldmap_Orc;
	description = "Karte der Kolonie (ergänzt)";
	text[0] = "Ur-Shak der Ork-Schamane hat das";
	text[1] = "Orkgebiet eingezeichnet!";
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseWorldmap_Orc()
{
	var int nDocID;
	nDocID = Doc_CreateMap();
	Doc_SetLevel(nDocID,"WORLD.ZEN");
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Map_World_Orc.tga",1);
	Doc_Show(nDocID);
};


instance ItKe_Freemine(C_Item)
{
	name = "Schlüssel zur freien Mine";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 3;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = "Schlüssel zur freien Mine";
	text[5] = NAME_Value;
	count[5] = value;
};

instance OrcMedicine(C_Item)
{
	name = "Ork-Medizin";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ITFO_POTION_STRENGTH_01.3DS";
	material = MAT_GLAS;
	on_state[0] = UseOrcMedicine;
	scemeName = "POTION";
	description = name;
	text[0] = "Wirkung: unbekannt";
};


func void UseOrcMedicine()
{
	if(C_NpcIsOrc(self))
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	}
	else
	{
		Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
	};
};


instance UluMulu(C_Item)
{
	name = "Ulu-Mulu";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE | ITEM_MISSION;
	value = 1000;
	damageTotal = 35;
	damagetype = DAM_EDGE;
	range = 140;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMi_Amulet_Ulumulu_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	text[0] = "Das Ulu-Mulu ist ein Zeichen großer Stärke und";
	text[1] = "Würde. Der Träger dieser Standarte hat vor";
	text[2] = "Orks nichts zu befürchten!";
	text[3] = NAME_Damage;
	count[3] = damageTotal;
	text[4] = NAME_Str_needed;
	count[4] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITKE_CORRISTO(C_Item)
{
	name = "Schlüssel von Corristo";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 3;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = "Schlüssel von Corristo";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITWR_CORRISTO_01(C_Item)
{
	name = "Notiz";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 15;
	visual = "ItAr_Scroll_16.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = usecorristo_01;
	description = "Notiz";
	text[0] = "";
	text[1] = "Eine Notiz";
	text[2] = "die sich in einer Truhe";
	text[3] = "der Feuermagier befand";
};


func void usecorristo_01()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Nachdem Xardas unseren Orden verlassen hat und sich seinen dunklen Studien gewidmet hat, werde ich seine Sachen in dieser Truhe verstauen. Zu mächtig ist die Zauberrune, als das ich sie hier irgendwo liegenlassen könnte. Den Schlüssel werde ich immer bei mir halten, damit niemand auf die Idee kommt die Truhe ohne mein Wissen zu öffnen.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Corristo");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ITKEY_KALOM_GUR_01(C_Item)
{
	name = "Kalom's Truhenschlüssel";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Von Cor Kaloms persönlicher Truhe.";
};

instance ITKEY_RAVEN_EBR_01(C_Item)
{
	name = "Raven's Truhenschlüssel";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Gehört zur persönlichen Truhe";
	text[1] = "von Raven.";
};

