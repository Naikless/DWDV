
instance OrkParchmentOne(C_Item)
{
	name = "Pergamenthäfte";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	hp = 5;
	hp_max = 5;
	weight = 1;
	value = 3;
	visual = "ItWr_Scroll_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[0] = "ein Teil eines uralten Pergaments";
	text[1] = "das untere Ende scheint abgerissen";
	text[2] = "worden zu sein. Diese Schrift ähnelt";
	text[3] = "den Runen an den Wänden dieser Höhlen sehr";
};

instance OrkParchmentTwo(C_Item)
{
	name = "Pergamenthäfte";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	hp = 5;
	hp_max = 5;
	weight = 1;
	value = 3;
	visual = "ItWr_Scroll_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[0] = "ein Teil eines uralten Pergaments";
	text[1] = "das obere Ende scheint abgerissen";
	text[2] = "worden zu sein. Diese Schrift ähnelt";
	text[3] = "den Runen an den Wänden dieser Höhlen sehr";
};

instance ITKE_PSI_KALOM_01(C_Item)
{
	name = "Schlüssel";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_04.3ds";
	material = MAT_METAL;
	description = "Laborschlüssel";
	text[0] = "öffnet die Truhe im Alchemielabor";
	text[1] = "des Sumpflagers";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItWrFocimap(C_Item)
{
	name = "Fokuskarte von Saturas";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 15;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = UseFocimap;
	description = name;
	text[0] = "Die Spitzen des Pentagramms markieren die ";
	text[1] = "Orte aller fünf Fokussteine, die damals bei";
	text[2] = "der Erschaffung der magischen Barriere";
	text[3] = "verwendet wurden. Die Karte ist alt und die";
	text[4] = "Steine könnten mittlerweile";
	text[5] = "an anderen Orten liegen";
};


func void UseFocimap()
{
	var int nDocID;
	nDocID = Doc_CreateMap();
	Doc_SetLevel(nDocID,"WORLD.ZEN");
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Map_World_Foki.tga",1);
	Doc_Show(nDocID);
};


instance ItWr_Troll_01(C_Item)
{
	name = "Tagebuch-Seite";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = UseTroll;
	description = name;
	text[1] = "Eine stark verwitterte Seite, deren Schrift man";
	text[2] = "kaum noch entziffern kann.";
	text[3] = "Der ehemalige Besitzer scheint ein Trolljäger";
	text[4] = "gewesen zu sein.";
};


func void UseTroll()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_PrintLine(nDocID,0,"169. Tag");
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Heute werde ich es schaffen. Ich weiß es. Die Götter stehen mir bei. Ich habe alles versucht einen Troll zu töten. Härtester Stahl zeigte keine Wirkung und Pfeile prallten von ihm ab als wäre seine Haut aus Stein.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Nun werde ich mich dieser magischen Spruchrolle bedienen, die mir der Händler in Khorinis verkauft hat. Sie hat mich 50 Goldstücke gekostet, aber der Gewinn, den ich durch die Trophäen bekomme, wird mich reich machen.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Heute werde ich einen Troll töten.");
	Doc_Show(nDocID);
};


instance Focus_2(C_Item)
{
	name = "Fokus aus der Trollschlucht";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	hp = 1;
	hp_max = 1;
	weight = 1;
	value = 1;
	visual = "ItMi_Focus_01.3ds";
	material = MAT_STONE;
	description = name;
	text[1] = "Einer der fünf Foki, die zur Erschaffung";
	text[2] = "der magischen Barriere benutzt wurden.";
};

instance ItKe_BERG_01(C_Item)
{
	name = "Truhenschlüssel";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "Alte Bergfestung";
	text[1] = "Ein rostiger alter Schlüssel";
	text[2] = "der zu einer Truhe gehört";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItWr_Urkunde_01(C_Item)
{
	name = "Urkunde";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 15;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = UseUrkunde;
	description = "Besitzurkunde";
	text[0] = "Berechtigt den Besitzer dazu den";
	text[1] = "Gebietsanspruch der Bergfestung";
	text[2] = "geltend zu machen.";
	text[5] = "Wert:                                 400 Pfund Gold";
};


func void UseUrkunde()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_PrintLine(nDocID,0,"Urkunde");
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Ich, Bergmar Burggraf zu Westfeld und meines Herren zu Tymoris Landrichter über das Gut in dem Gebiet um Khorinis gelegen, ... tue kund, ... das ich ... dem Besitzer dieser Urkunde ... und dem Innoshaus daselbst das Lehen auf der Bergfeste (mitsamt weiteren Zehenten und allen dort befindlichen Minen) aufgegeben und verkauft habe um 400 Pfund Gold.");
	Doc_Show(nDocID);
};


instance Fakescroll(C_Item)
{
	name = "Brief";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	hp = 5;
	hp_max = 5;
	weight = 1;
	value = 0;
	visual = "ItWr_Scroll_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance Focus_3(C_Item)
{
	name = "Fokus aus der Bergfestung";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	hp = 1;
	hp_max = 1;
	weight = 1;
	value = 1;
	visual = "ItMi_Focus_01.3ds";
	material = MAT_STONE;
	description = name;
	text[1] = "Einer der fünf Foki, die zur Erschaffung";
	text[2] = "der magischen Barriere benutzt wurden.";
};

instance ItKe_Focus4(C_Item)
{
	name = "Schlüssel";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 3;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[1] = "Dieser Schlüssel stammt aus einer";
	text[2] = "Höhle vor der Klosterruine";
};

instance Focus_4(C_Item)
{
	name = "Fokus aus der Klosterruine";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	hp = 1;
	hp_max = 1;
	weight = 1;
	value = 1;
	visual = "ItMi_Focus_01.3ds";
	material = MAT_STONE;
	description = name;
	text[1] = "Einer der fünf Foki, die zur Erschaffung";
	text[2] = "der magischen Barriere benutzt wurden.";
};

instance ItMi_OrcTalisman(C_Item)
{
	name = "Orkischer Talisman";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = 1000;
	visual = "ItMi_Amulet_UluMulu_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_OrcTalisman;
	on_unequip = UnEquip_OrcTalisman;
	description = name;
	text[2] = NAME_Prot_Fire;
	count[2] = 20;
	text[5] = NAME_Value;
	count[5] = value;
};


func void Equip_OrcTalisman()
{
	self.protection[PROT_FIRE] += 20;
};

func void UnEquip_OrcTalisman()
{
	self.protection[PROT_FIRE] -= 20;
};


instance ItKe_Focus5(C_Item)
{
	name = "Schlüssel";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 3;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[1] = "Dieser Schlüssel stammt aus der";
	text[2] = "Gruft unter dem Steinkreis";
};

instance Focus_5(C_Item)
{
	name = "Fokus unter dem Stonehenge";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	hp = 1;
	hp_max = 1;
	weight = 1;
	value = 1;
	visual = "ItMi_Focus_01.3ds";
	material = MAT_STONE;
	description = name;
	text[1] = "Einer der fünf Foki, die zur Erschaffung";
	text[2] = "der magischen Barriere benutzt wurden.";
};

instance ORE_BANDITS_MESSAGE(C_Item)
{
	name = "Nachricht";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	hp = 5;
	hp_max = 5;
	weight = 1;
	visual = "ItWr_Scroll_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = useore_bandits_message;
	description = name;
	text[0] = "Gehörte einem Wegelagerer am Fluss.";
	text[1] = "";
};


func void useore_bandits_message()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Hab die Lieferung Erz den Fluss runter in einer Höhle deponiert. Allerdings komme ich jetzt nicht mehr dran, weil sich ein Lurker dort eingenistet hat. Werde wohl warten müssen, bis der sich wieder verzogen hat. Allerdings sind diese Viecher sehr zäh und ich sollte mich vorher nach einer besseren Waffe umsehen.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"P.S.: Wer den Brief auch findet, lass die Finger von meinem Erz. Sonst finde ich dich und hole mir mein Zeug wieder!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ORE_BANDITS_MESSAGE2(C_Item)
{
	name = "Nachricht";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	hp = 5;
	hp_max = 5;
	weight = 1;
	visual = "ItWr_Scroll_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = useore_bandits_message2;
	description = name;
	text[0] = "Gehörte einem Wegelagerer in der Schlucht.";
	text[1] = "";
};


func void useore_bandits_message2()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"War doch die richtige Entscheidung aus dem Alten Lager abzuhauen. Zwei von uns sind in ein Lager im Ork-Gebiet aufgebrochen und haben das Erz mitgenommen. Werden uns bald auf den Weg machen und anschliessend das Erz aufteilen.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ORE_BANDITS_MESSAGE3(C_Item)
{
	name = "Nachricht";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	hp = 5;
	hp_max = 5;
	weight = 1;
	visual = "ItWr_Scroll_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = useore_bandits_message3;
	description = name;
	text[0] = "Gehörte einem Wegelagerer auf einer Klippe.";
	text[1] = "";
};


func void useore_bandits_message3()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Habe uns aufgeteilt. Keine Ahnung wo die anderen Jungs stecken. Wir haben oben auf der Klippe über der Höhle mit den schwarzen Goblins ein Lager errichtet. Konnte mich Nachts auf den Berg schleichen und habe das Erz in einer Höhle zwischen einer Menge Bluthunden versteckt.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ORE_BANDITS_MESSAGE4(C_Item)
{
	name = "Nachricht";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	hp = 5;
	hp_max = 5;
	weight = 1;
	visual = "ItWr_Scroll_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = useore_bandits_message4;
	description = name;
	text[0] = "Gehörte einem Wegelagerer im Ork-Gebiet.";
	text[1] = "";
};


func void useore_bandits_message4()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"War keine schlechte Idee ins Ork-Gebiet zu gehen. Hier wird uns nie einer von Gomez' Leuten finden. Mit dem Erz können wir uns sicher ein schönes Leben im Neuen Lager machen. Aber zuerst sollte ein bisschen Gras über die Sache wachsen. Gomez' Ratten lassen nämlich nicht so schnell Locker.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

