
instance ItWr_Book_Circle_01(C_Item)
{
	name = "Der erste Kreis";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 50;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Der erste Kreis der Magie";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseItWr_Book_Circle_01;
};


func void UseItWr_Book_Circle_01()
{
	var int nDocID;
	var string text;
	var string Text_1;
	var string Text_2;
	text = ConcatStrings(NAME_Manakosten,IntToString(SPL_SENDCAST_LIGHT));
	Text_1 = ConcatStrings(NAME_Manakosten,IntToString(SPL_SENDCAST_THUNDERBOLT));
	Text_2 = ConcatStrings(NAME_Manakosten,IntToString(SPL_SENDCAST_FIREBOLT));
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"Erster Kreis");
	Doc_PrintLine(nDocID,0,"---------------");
	Doc_SetFont(nDocID,-1,"font_10_book.TGA");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Als die Götter den Menschen die Fähigkeit zur Magie schenkten, schenkten sie ihnen auch das Wissen magische Runen herzustellen. Die Diener der Götter haben die ehrenvolle Aufgabe übernommen, diese Artefakte göttlicher Macht zu erschaffen und zu benutzen, wobei der Kreis des Magiers bestimmt, welche Zauber er in der Lage ist zu verstehen und anzuwenden. ");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Licht");
	Doc_PrintLine(nDocID,1,"---------------");
	Doc_PrintLines(nDocID,1,"Das erste Geschenk Innos an die Menschen.Eine hell strahlende Kugel wird über dem Magier erzeugt.");
	Doc_PrintLine(nDocID,1,text);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Eispfeil");
	Doc_PrintLine(nDocID,1,"---------------");
	Doc_PrintLines(nDocID,1,"Ein Geschoss aus magischer Energie.");
	Doc_PrintLine(nDocID,1,Text_1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Feuerpfeil");
	Doc_PrintLine(nDocID,1,"---------------");
	Doc_PrintLines(nDocID,1,"Ein Geschoss aus magischem Feuer.");
	Doc_PrintLine(nDocID,1,Text_2);
	Doc_Show(nDocID);
	if((BOOK_CIRCLE_01 == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(50);
		BOOK_CIRCLE_01 = TRUE;
	};
};


instance ItWr_Book_Circle_02(C_Item)
{
	name = "Der zweite Kreis";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Der zweiter Kreis der Magie";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseItWr_Book_Circle_02;
};


func void UseItWr_Book_Circle_02()
{
	var int nDocID;
	var string Text_1;
	Text_1 = ConcatStrings(NAME_Manakosten,IntToString(SPL_HEALING_HP_PER_MP));
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"Zweiter Kreis");
	Doc_PrintLine(nDocID,0,"---------------");
	Doc_SetFont(nDocID,-1,"font_10_book.TGA");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Alle Zauber werden durch die magische Energie des Anwenders ausgelöst.Der Anwender wird als Magier bezeichnet.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Jede Aktivierung eines Zaubers kostet den Magier einen Teil seiner Kraft. diese Kraft wird als Mana bezeichnet.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Heilung");
	Doc_PrintLine(nDocID,1,"---------------");
	Doc_PrintLines(nDocID,1,"Adanos sah, das die Menschen starben und das es der Wille Beliars war.Und er sprach:Stelle ich mich auch nicht gegen den Willen Beliars,gebe ich den Menschen jedoch die Macht der Heilung.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Dieser Zauber birgt die Macht, den Magier zu heilen.");
	Doc_PrintLine(nDocID,1,"Investierungszauber");
	Doc_PrintLine(nDocID,1,Text_1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_Show(nDocID);
	if((BOOK_CIRCLE_02 == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(50);
		BOOK_CIRCLE_02 = TRUE;
	};
};


instance ItWr_Book_Circle_03(C_Item)
{
	name = "Der dritte Kreis";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 150;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Der dritte Kreis der Magie";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseItWr_Book_Circle_03;
};


func void UseItWr_Book_Circle_03()
{
	var int nDocID;
	var string text;
	var string Text_1;
	var string Text_2;
	text = ConcatStrings(NAME_Manakosten,IntToString(SPL_SENDCAST_FIREBALL));
	Text_1 = ConcatStrings(NAME_Manakosten,IntToString(SPL_SENDCAST_ICECUBE));
	Text_2 = ConcatStrings(NAME_Manakosten,IntToString(SPL_SENDCAST_THUNDERBALL));
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"Dritter Kreis");
	Doc_PrintLine(nDocID,0,"---------------");
	Doc_SetFont(nDocID,-1,"font_10_book.TGA");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Manche Zauber können mit einer bestimmten größeren Anzahl von magischer Energie gespeist werden, diese werden auch Aufladungszauber genannt.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Andere Zauber werden aufrechterhalten, solange der Magier sein Mana in dieses Spruch einfliessen lässt. Solche Zauber heissen Investierungszauber.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Feuerball");
	Doc_PrintLine(nDocID,1,"---------------");
	Doc_PrintLines(nDocID,1,"Das zweite Geschenk Innos an die Kinder des Feuers. Ein Ball aus Feuer, der sein Opfer verbrennt");
	Doc_PrintLine(nDocID,1,"Auladbarer Zauber");
	Doc_PrintLine(nDocID,1,text);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Eisblock");
	Doc_PrintLine(nDocID,1,"---------------");
	Doc_PrintLines(nDocID,1,"Das Opfer wird in einen Eisblock eingefroren. Ein Zauber aus dem Tempel der Wassermagier");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,Text_1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Kugelblitz");
	Doc_PrintLine(nDocID,1,"---------------");
	Doc_PrintLines(nDocID,1,"Eine Kugel, geschaffen aus magischer Energie.");
	Doc_PrintLine(nDocID,1,Text_2);
	Doc_Show(nDocID);
	if((BOOK_CIRCLE_03 == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(50);
		BOOK_CIRCLE_03 = TRUE;
	};
};


instance ItWr_Book_Circle_04(C_Item)
{
	name = "Der vierte Kreis";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 200;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Der vierte Kreis der Magie";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseItWr_Book_Circle_04;
};


func void UseItWr_Book_Circle_04()
{
	var int nDocID;
	var string text;
	var string Text_1;
	var string Text_2;
	text = ConcatStrings(NAME_Manakosten,IntToString(SPL_SENDCAST_FIRESTORM));
	Text_1 = ConcatStrings(NAME_Manakosten,IntToString(SPL_ZAPPED_DAMAGE_PER_SEC));
	Text_2 = ConcatStrings(NAME_Manakosten,IntToString(SPL_SENDCAST_DESTROYUNDEAD));
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"Vierter Kreis");
	Doc_PrintLine(nDocID,0,"---------------");
	Doc_SetFont(nDocID,-1,"font_10_book.TGA");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Die Magie ");
	Doc_PrintLine(nDocID,0,"der Teleportation");
	Doc_PrintLine(nDocID,0,"---------------");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Das besondere an diesen magischen Formeln ist, das sie, obwohl als Runen geschaffen,von jedem der magische Energie in sich trägt gesprochen werden können.Die Magie die diese Formeln umgibt, kann sofort aktiviert werden. Es gibt keine Einschränkungen für Teleportationszauber.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"Feuersturm	");
	Doc_PrintLine(nDocID,1,"---------------");
	Doc_PrintLines(nDocID,1,"Ähnlich dem Feuerball wirkt dieser Zauber auf einen Gegner, springt von dort aus jedoch auf weitere Gegner über.");
	Doc_PrintLine(nDocID,1,"Aufladbarer Zauber");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,text);
	Doc_PrintLine(nDocID,1,"Blitz");
	Doc_PrintLine(nDocID,1,"---------------");
	Doc_PrintLines(nDocID,1,"Der Zauber springt auf mehrere Opfer über. Die Kraft des Blitzes ist schwer zu kontrollieren, so das der Magier selbst Opfer werden kann");
	Doc_PrintLine(nDocID,1,Text_1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Untote vernichten");
	Doc_PrintLine(nDocID,1,"---------------");
	Doc_PrintLines(nDocID,1,"Die Geschöpfe der Finsternis werden mit diesem Zauber verbannt.");
	Doc_PrintLine(nDocID,1,Text_2);
	Doc_Show(nDocID);
	if((BOOK_CIRCLE_04 == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(50);
		BOOK_CIRCLE_04 = TRUE;
	};
};


instance ItWr_Book_Circle_05(C_Item)
{
	name = "Der fünfte Kreis";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 250;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Der fünfte Kreis der Magie";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseItWr_Book_Circle_05;
};


func void UseItWr_Book_Circle_05()
{
	var int nDocID;
	var string Text_1;
	var string Text_2;
	Text_1 = ConcatStrings(NAME_Manakosten,IntToString(SPL_SENDCAST_FIRERAIN));
	Text_2 = ConcatStrings(NAME_Manakosten,IntToString(SPL_SENDCAST_ICEWAVE));
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"Fünfter Kreis");
	Doc_PrintLine(nDocID,0,"---------------");
	Doc_SetFont(nDocID,-1,"font_10_book.TGA");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Feuerregen");
	Doc_PrintLine(nDocID,0,"---------------");
	Doc_PrintLines(nDocID,0,"Die Macht des göttlichen Feuers trifft jedes Lebewesen im Wirkungsbreich des Magiers.");
	Doc_PrintLine(nDocID,0,Text_1);
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Eiswelle	");
	Doc_PrintLine(nDocID,1,"---------------");
	Doc_PrintLines(nDocID,1,"Ein Feld aus magischem Eis erstreckt sich über alle Gegner und friert diese für einen kurzen Zeitraum ein. Während dieser Zeit sind die Opfer bewegungsunfähig und erleiden Schaden. ");
	Doc_PrintLines(nDocID,1,"Ein Zauber aus dem Tempel der Wassermagier.");
	Doc_PrintLine(nDocID,1,Text_2);
	Doc_Show(nDocID);
	if((BOOK_CIRCLE_05 == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(50);
		BOOK_CIRCLE_05 = TRUE;
	};
};


instance ItWr_Book_Circle_06(C_Item)
{
	name = "Der sechste Kreis";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 300;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Sechster Kreis der Magie";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseItWr_Book_Circle_06;
};


func void UseItWr_Book_Circle_06()
{
	var int nDocID;
	var string text;
	text = ConcatStrings(NAME_Manakosten,IntToString(SPL_SENDCAST_BREATHOFDEATH));
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"Sechster Kreis");
	Doc_SetFont(nDocID,-1,"font_10_book.TGA");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Todeshauch");
	Doc_PrintLine(nDocID,0,"---------------");
	Doc_PrintLines(nDocID,0,"Der Atem Beliars. Eine Wolke aus Lebenverschlingendem Nichts, die jedes Wesen augenblicklich töten kann.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,text);
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Todesring");
	Doc_PrintLine(nDocID,1,"---------------");
	Doc_PrintLines(nDocID,1,"Nicht viel ist überliefert über die Rune mit der Macht von URIZIEL ");
	Doc_PrintLines(nDocID,1,"Es ist nur soviel bekannt, als das sie Beliars Mächte in sich birgt.");
	Doc_PrintLine(nDocID,1,"");
	Doc_Show(nDocID);
	if((BOOK_CIRCLE_06 == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(50);
		BOOK_CIRCLE_06 = TRUE;
	};
};


instance Goettergabe(C_Item)
{
	name = "Göttergabe";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Die Gabe der Götter";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseGoettergabe;
};


func void UseGoettergabe()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_PrintLine(nDocID,0,"Magie");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0," ");
	Doc_SetFont(nDocID,-1,"font_10_book.TGA");
	Doc_PrintLine(nDocID,0,"Die Gabe der Götter");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Seit Jahrhunderten versucht man das Wesen und den Ursprung der Magie zu ergründen. Doch wo soll man suchen? Wie kann man sie beschreiben? Sie ist die widersprüchlichste Kraft, die wir kennen. Sie kann töten und gleichzeitig heilen, Sie kann formen und zerstören.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Wie sieht eine solche Kraft aus ? Wo kann man diese unsichtbare und doch so mächtige Kraft finden? Die Magie ist das, was sie ist. Das herrlichste und zugleich mächtigste Geschenk der Götter. Dem Nutzer und Wirker dieser Kraft ist damit auch ein göttliches Geschenk gegeben. Eine heilige Kraft, die nur wenige Auserwählte in der Lage sind zu kontrollieren.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Barthos von Laran");
	Doc_Show(nDocID);
	if((BOOK_GOETTERGABE == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(50);
		BOOK_GOETTERGABE = TRUE;
	};
};


instance Geheimnisse_der_Zauberei(C_Item)
{
	name = "Geheimnisse der Zauberei";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Geheimnisse der Zauberei";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseGeheimnisse_der_Zauberei;
};


func void UseGeheimnisse_der_Zauberei()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Geheimnisse der Zauberei");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Dem Magus selbst wohnt wohl keine Magie inne, er ist vielmehr in der Lage sich ihrer zu bedienen. Er selbst hat ausschließlich die Fähigkeit die Magie zu beeinflussen und zu lenken. Der in der Hohen Kunst der Magie eingeweihte Adept muss in der Lage sein, seinen Geist als Werkzeug zu benutzen");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Sein Geist ist es, der die allumgebene Arkane Kraft sammelt, sie formt, bündelt und letztendlich in die uns zugängliche Welt entlässt. Während dieser Zeit höchster Konzentration gelingt es dem Magus mit seinem Geist unsere Sphäre zu durchdringen und auf die Andere Seite zu blicken, von dort kommt die Kraft, der Magus selbst ist nur Leiter und Former dieser Kraft.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Barthos von Laran");
	Doc_Show(nDocID);
	if((BOOK_GEHEIMNISSE_DER_ZAUBEREI == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(50);
		BOOK_GEHEIMNISSE_DER_ZAUBEREI = TRUE;
	};
};


instance Machtvolle_Kunst(C_Item)
{
	name = "Machtvolle Kunst";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Machtvolle Kunst";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseMachtvolle_Kunst;
};


func void UseMachtvolle_Kunst()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Machtvolle Kunst");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Ein Werk für den Eingweihten der Arkanen Kunst");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Die Fähigkeiten die göttliche Macht zu kanalisieren wächst in dem Magier. Anfangs keimt sie nur wie ein kleiner Schössling auf dem Feld und man muss ihn pflegen, damit er nicht verkümmert. Doch wenn dieser Schössling erst einmal herangewachsen ist, entfaltet er seine volle Pracht");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Er wächst und wächst und wird stärker mit jedem Tag. So ergeht es auch dem gelehrigen Magus. Seine anfänglich sehr geringen Kräfte wachsen und gedeihen und entfalten mit der Zeit eine Macht, die in ihrer Vollendung nicht absehbar ist. Diese Macht zu ihrer höchsten Vollendung zu führen ist die heilige Pflicht eines jeden Magus, denn dieser Schößling gesät von den Göttern selbst ist das größte Geschenk, welches ein Sterblicher empfangen kann.");
	Doc_Show(nDocID);
	if((BOOK_MACHTVOLLE_KUNST == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(50);
		BOOK_MACHTVOLLE_KUNST = TRUE;
	};
};


instance Elementare_Arcanei(C_Item)
{
	name = "Elementare Arcanei";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Elementare Arcanei";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseElementare_Arcanei;
};


func void UseElementare_Arcanei()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Elementare Arcanei");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Einordung der Magie in das Gefüge des Irdischen");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Viel wurde geforscht über die Magie und ihrer Stellung zu den Elementen. Man kann mit Fug und Recht behaupten, dass die Magie als das absolute Element angesehen werden kann. Sie hat die Macht alle Elmente zu verändern und zu formen und ist ihnen somit augenscheinlich übergestellt.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Eine Verbindung von Element und Magie bringt jedes Element in seiner reinsten Form zutage, so gibt es an wenigen Stellen natürliche Vorkommen solcher Verbindungen und sie sind gar sehr begehrt. Auch die Fähigkeiten eines Magus Elemente scheinbar aus dem Nichts zu erschaffen sind Beweis, dass die magische Kraft das reinste und höchste Gut darstellt, das existiert.");
	Doc_Show(nDocID);
	if((BOOK_ELEMENTARE_ARCANEI == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(50);
		BOOK_ELEMENTARE_ARCANEI = TRUE;
	};
};


instance Wahre_Macht(C_Item)
{
	name = "Wahre Macht";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Wahre Macht";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseWahre_Macht;
};


func void UseWahre_Macht()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Wahre Macht");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Die heilige Pflicht des Kundigen");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Es ist seine Macht, die den Magus von den normalen Menschen unterscheidet. Er, ausgestattet mit der Fähigkeit göttliche Kraft zu beeinflussen, ist ein Wesen, für welches die normalen Grenzen des Sterblichen nicht gelten müssen. ");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Hat der Magus erst einmal einen Grad erreicht, der es ihm ermöglicht die Grenzen seines Daseins zu sprengen, so kann er sich selbst auf eine Stufe über der des normalen Sterblichen stellen. Er kann Grenzen von Raum und Zeit durchdringen, selbst das Ende allen Seins, der Tod, ist kein Hindernis auf seinem Weg.");
	Doc_Show(nDocID);
	if((BOOK_WAHRE_MACHT == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(50);
		BOOK_WAHRE_MACHT = TRUE;
	};
};


instance Das_magische_Erz(C_Item)
{
	name = "Das magische Erz";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Das magische Erz";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseDas_magische_Erz;
};


func void UseDas_magische_Erz()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"Vom Erz");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Das beste Erz zum Schmieden einer Waffe findet man zweifelsohne in den Erzminen bei Khorinis. Es ist von elementarer Reinheit und durchtränkt von Magie. Es ist von unvergleichlicher Härte und doch so weich, dass es nicht bricht. Eine Waffe geschmiedet aus jenem Stahl, der unter unsagbar hohen Aufwand aus den tiefen Minen gewonnen wird, ist mit keiner Klinge und sei sie aus dem noch so besten Stahl gefertigt, zu vergleichen");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,". Kein Schild, den sie nicht brechen kann, kein Panzer, den sie nicht durchbohrt. Könige und Helden aus längst vergangen Tagen trugen Waffen aus bestem Khorinisstahl und in ganz Myrtana werden auch heute für solche Waffen die besten Preise erzielt. Doch wird für dieses Erz auch ein hoher Preis verlangt. Um es der Erde abzutrotzen muß großer Aufwand getrieben werden, denn es ist so, als wolle das Erz nicht aus dem Schoße der Erde entfliehen.");
	Doc_Show(nDocID);
	if((BOOK_DAS_MAGISCHE_ERZ == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(50);
		BOOK_DAS_MAGISCHE_ERZ = TRUE;
	};
};


instance Schlacht_um_Varant1(C_Item)
{
	name = "Schlacht um Varant";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Schlacht um Varant";
	text[0] = "Band 1";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseSchlacht_um_Varant1;
};


func void UseSchlacht_um_Varant1()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Red_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Red_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"... doch Feldherr Rhobar wählte den Angriff. Er versammelte sein Heer und stieß mit geballter Kraft gegen die schlechtgedeckte rechte Flanke des Feindes vor. Er hielt sich nicht lang mit den Geplänkeln auf, sondern stieß wie ein Schwert in die Seite des feindlichen Heeres und zerschnitt sie wie Papier. Immer weiter trieb er seine Mannen voran, immer weiter Richtung der Grenze von Varant. Er wusste, wenn er diese Schlacht gewinnen wollte, musste es ihm gelingen das feindliche Herr zu teilen und verhindern, dass sich Gellon und Lukkor ");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"  vereinen und ihm den vernichtenden Schlag versetzen. Es musste ihm gelingen ihren Nachschub zu stören, dann war ihm der Sieg nicht mehr zu nehmen ...");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"...Gellon war tot, seine Armee geschlagen, seine nun führerlosen Mannen auf der Flucht. Doch Rhobar war gewillt dem Feind keine Chance zu geben sich zu sammeln und befahl sofort den Aufbruch, um den Feind zu vernichten. Lukkor indes beschließt die Gunst der Stunde zu nutzen und König Rhobars erschöpften Truppen den Todesstoß zu versetzen...");
	Doc_Show(nDocID);
	if((BOOK_SCHLACHT_UM_VARANT1 == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(50);
		BOOK_SCHLACHT_UM_VARANT1 = TRUE;
	};
};


instance Schlacht_um_Varant2(C_Item)
{
	name = "Schlacht um Varant";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Schlacht um Varant";
	text[0] = "Band 2";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseSchlacht_um_Varant2;
};


func void UseSchlacht_um_Varant2()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Red_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Red_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Der Krieg war entschieden. Varant seiner, für die Verorgung der Truppen so wichtigen,  Seehäfen beraubt. König Rhobar weilte schon lange nicht mehr auf den Schlachtfeldern von Varant, sondern überließ es seinen Generälen die letzten feindliche Truppen aufzureiben. Varant besaß nur noch ein größeres Heer, geführt von Lukkor, dem fähigsten Kriegsherrn des Varantener Heeres, mehr als einmal hatte er eine drohende Niederlage in einen Sieg verwandeln können");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,". Doch nun saß sein Heer in der Falle. Dem Heer des Feindes zwar zahlenmäßig überlegen doch in aussichtloser Position. Lee, der Kriegsheld von Myrtana hatte ihn in eine Falle gelockt. Seine schwere Reiterei konnte auf dem tiefen, sumpfigen Boden des engen Tals nicht kämpfen und die Hügelketten um ihn herum waren von Lee's Soldaten besetzt, die immer wieder zustießen und so sein Herr Mann um Mann dezimierten. Die verzweifelten Ausfälle seiner Mannen waren blutig zurückgeschlagen worden. Er war besiegt.");
	Doc_Show(nDocID);
	if((BOOK_SCHLACHT_UM_VARANT2 == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(50);
		BOOK_SCHLACHT_UM_VARANT2 = TRUE;
	};
};


instance Myrtanas_Lyrik(C_Item)
{
	name = "Myrtanas Lyrik";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Myrtanas Lyrik";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseMyrtanas_Lyrik;
};


func void UseMyrtanas_Lyrik()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Red_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Red_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"    Das Lied der");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"		  Reue");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Am Anfang war die Macht, rein und pur,");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"heute bleibt nur noch das Echo vom alten Schwur.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Die Zeiten der Einheit schon lang dahin,");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"nach Hab und Gut steht uns nun der Sinn.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Geteilt ist nun, was einst zusammen.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Verflucht der Geist der uns genommen.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Voll Sehnsucht sind der unsren Lieder.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Die Einigkeit kommt niemals wieder.");
	Doc_PrintLines(nDocID,1,"");
	Doc_Show(nDocID);
	if((BOOK_MYRTANAS_LYRIK == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(50);
		BOOK_MYRTANAS_LYRIK = TRUE;
	};
};


instance Lehren_der_Goetter1(C_Item)
{
	name = "Lehren der Götter Band1";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Lehren der Götter";
	text[0] = "Band 1";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseLehren_der_Goetter1;
};


func void UseLehren_der_Goetter1()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Red_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Red_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Höre die Worte der Götter, denn es ist ihr Wille, dass sie gehört werden. Befolge die Lehren der Götter, denn es ist ihr Wille, dass sie befolgt werden. Achte die Priester der Götter, denn sie sind erwählt.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Die Worte Innos : Und möget ihr nicht verstehen, so zweifelt nicht an den Worten der Priester, ihr Tun ist gerecht und weise. Denn ich bin die aufgehende Sonne, das Licht und das Leben. Und alles was da wider der Sonne, ist wider mir und soll verbannt sein auf immer und ewig in die Schatten.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Die Worte Adanos: Arbeite und lebe, denn der Tag ist gemacht dafür, dass der Mensch arbeite. Suche das Lernen und Wissen, auf dass Du es weitergeben kannst, denn so bist Du geschaffen worden. Wer aber müßig und faul, der soll verbannt werden auf immer und ewig in die Schatten.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Die Worte Beliar: Wer aber handelt unrecht und gegen den Willen der Götter, den will ich strafen, den Körper mit Schmerz , Leid und Tod, den Geist werde ich aber zu mir nehmen auf immer und ewig in die Schatten. ");
	Doc_Show(nDocID);
	if((BOOK_LEHREN_DER_GOETTER1 == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(50);
		BOOK_LEHREN_DER_GOETTER1 = TRUE;
	};
};


instance Lehren_der_Goetter2(C_Item)
{
	name = "Lehren der Götter Band2";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Lehren der Götter";
	text[0] = "Band 2";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseLehren_der_Goetter2;
};


func void UseLehren_der_Goetter2()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Red_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Red_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Vom Anbeginn der Zeit: Es ward noch kein Tag oder Nacht und kein Wesen zog über die Welt. Da erschien der Welt Innos und sein Licht erhellte alles. Und Innos schenkte der Welt das Leben. Da aber kein Wesen im Licht des Innos leben kann, schuf er die Sonne. Das Licht war aber noch zu stark. Da teilte sich Innos und schuf Beliar. Beliar brachte die Nacht. Nun konnten die Menschen sein. Da teilte sich Innos erneut und schuf Adanos. Adanos gab den Menschen die Vielseitigkeit, Wissen, Neugier und Mut. Innos war sehr zufrieden mit sich und seinem Werk.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Und er beschloss die Menschen Adanos ganz zu überlassen, um zu ruhen. Beliar aber wurde von Neid zerfressen, denn die Menschen beteten nicht zu ihm und ruhten des Nachts. Da wurde er zornig und er formte sich einen Menschen. Einen Menschen, der nur ihn anbeten sollte. Der Mensch aber ward genau so wie alle anderen Menschen. Beliar wurde so stark von Zorn erfüllt, dass er den Menschen tötete und sprach: Wenn sie mich nicht anbeten, dann sollen sie mich fürchten. Und er schuf den Tod und nahm den Menschen das Leben.");
	Doc_Show(nDocID);
	if((BOOK_LEHREN_DER_GOETTER2 == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(50);
		BOOK_LEHREN_DER_GOETTER2 = TRUE;
	};
};


instance Lehren_der_Goetter3(C_Item)
{
	name = "Lehren der Götter Band3";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Lehren der Götter";
	text[0] = "Band 3";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseLehren_der_Goetter3;
};


func void UseLehren_der_Goetter3()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Red_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Red_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Innos gab den Menschen die Macht ihn zu hören und zu ihm zu sprechen. Er gab ihnen die Macht große Wunder zu vollbringen. Und er nannte sie Magie. Mit dieser Macht konnten die Menschen die Welt frei nach ihrem Willen gestalten. Es gab keine Grenzen, die Innos ihnen aufzeigte. Und so hatten die Menschen Teil an der göttlichen Schöpferkraft. Aber die Menschen waren sich alle gleich und das gefiel ihnen nicht. Also nahm er denen die unzufrieden waren, die Kraft. Die wenigen, die sich dankbar zeigten, stellte Innos über alle anderen");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Diese Menschen wurden alsbald verehrt und gefürchtet und wurden Priester genannt. Doch auch unter ihnen gab es viele, die bald unzufrieden waren. Und so kam es, dass sie zu Adanos beteten und ihren Ursprung vergassen. Die Riege der Priester war gespalten. Kriege wurden entfesselt und auch der Glaube an die göttliche Allmacht war bald schon nur noch Mythos. So teilten sich die Priester. Die dem Adanos folgten nannte man nun Magier des Wassers, die Geweihten des Innos hießen aber die Magier des Feuers.");
	Doc_Show(nDocID);
	if((BOOK_LEHREN_DER_GOETTER3 == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(50);
		BOOK_LEHREN_DER_GOETTER3 = TRUE;
	};
};


instance Jagd_und_Beute(C_Item)
{
	name = "Jagd und Beute";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Jagd und Beute";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseJagd_und_Beute;
};


func void UseJagd_und_Beute()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Sein Schriftzeugnis hat die Zeiten überdauert und seine Ratschläge gelten als Lehrbuch der Jagdkunst. Nach den großen Schlachten im Norden ist es heute jedem Landsmann geläufig, wie man mit dem Bogen umzugehen hat. Jedoch gibt es bei der Jagd einige Regeln zu befolgen, die über den einfachen Umgang mit der Waffe hinaus gehen! Das Wild ist scheu und unberechenbar.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Die Kunst der Jagd mit dem Bogen verfügt nicht nur über die älteste Tradition, sondern ist auch die geläufigste aller denkbaren Jagdarten. Die Technik dieser Art der traditionellen Jagd hat sich im Lauf der Jahrtausende kaum verändert und wird sich wohl auch in Zukunft nicht ändern. Welche Umstände bestimmen wirklich den Ablauf der Jagd mit dem Bogen? Diese Gesetzmäßigkeiten erkannt zu haben, ist die eigentliche hohe Kunst der Bogenjagd.");
	Doc_Show(nDocID);
	if((BOOK_JAGD_UND_BEUTE == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(50);
		BOOK_JAGD_UND_BEUTE = TRUE;
	};
};


instance Kampfkunst(C_Item)
{
	name = "Kampfkunst";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Kampfkunst";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseKampfkunst;
};


func void UseKampfkunst()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"2000 Jahre lang bildeten diese Lehren des Meisters die Pfeiler bei der Entwicklung der Kampfkunst.  ");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Geschult werden dabei die Beweglichkeit des Körpers, Ruhe und Schnelligkeit, Beobachtung und Reaktion. Die Bewegungen müssen gut koordiniert und die Körperhaltung korrekt sein, um die beste Entfaltung deiner Kraft zu erreichen.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Der Kern der geistigen und körperlichen Lehren des Meisters hat viele Jahre überlebt.  ");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Sein einzigartiger Erfolg hat Generationen beeinflußt. Jahrtausende, in denen zwar die Welt ihr Äußeres schon oft verändert hat, in der aber eines für immer Bestand haben wird: Die Harmonie der inneren Kräfte mit der gezielten äußeren Bewegung des Körpers.");
	Doc_Show(nDocID);
	if((BOOK_KAMPFKUNST == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(50);
		BOOK_KAMPFKUNST = TRUE;
	};
};


instance Die_Gruft(C_Item)
{
	name = "Die Gruft";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Die Gruft";
	text[5] = NAME_Value;
	count[5] = value;
};

instance Astronomie(C_Item)
{
	name = "Astronomie";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Astronomie";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseAstronomie;
};


func void UseAstronomie()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Im Zentrum befindet sich der Morgrad mit seinen vier Elementen Erde, Wasser, Feuer und Luft, der Raum des Vergänglichen, in seinem Inneren die unaussprechliche Dunkelheit des Beliar. Über allem befindet sich die Sphäre des Himmels.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"In der Hierarchie des Kosmos nimmt der Mensch die Stellung des Empfängers ein. Durch seine Seele hat er Teil am höchsten Sein, dem göttlichen Geist, sein vergänglicher Körper hingegen besteht aus Stoffen des Morgrad. Als kleines Abbild der ganzen Welt.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Die synodische Umlaufszeit der Planeten, dh. die Zeitdauer zwischen zwei gleichartigen Stellungen in Bezug zum Morgrad unserer Welt, weicht jedes Jahrhundert um einige Grade ab, so dass wir davon ausgehen können, uns in einer ständigen Bewegung mit dem restlichen Kosmos zu befinden.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Bei der Aufstellung eines Kalenders bezogen wir uns Anfangs auf den Mondlauf, um den Anschluß an die tatsächliche Länge des Sonnenjahres zu erhalten.");
	Doc_Show(nDocID);
	if((BOOK_ASTRONOMIE == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(50);
		BOOK_ASTRONOMIE = TRUE;
	};
};


instance Rezepturen(C_Item)
{
	name = "Rezepturen";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Rezepturen";
	text[0] = "Band 1";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseRezepturen;
};


func void UseRezepturen()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Das Balsam des Sehens:");
	Doc_PrintLine(nDocID,0,"----------------");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Dazu wird ihm Galle auf die Augen gestrichen. Galle ist bitter im Geschmack. Wird dieses Bittere auf das Auge genommen, dh: schauen wir das Bittere an, so erwächst daraus Weisheit. Wir werden sehend! Bitterkeit und Weisheit schliessen einander aus. Sie sind Gegenpole!");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Tränen, Leid und Enttäuschung sind bitter, die Weisheit aber ist die Trösterin in jedem seelischen Schmerz. Bitterkeit und Weisheit bilden eine Alternative. Wo Bitterkeit, da fehlt die Weisheit, und wo Weisheit, da gibt es keine Bitterkeit.");
	Doc_Show(nDocID);
	if((BOOK_REZEPTUREN == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(50);
		BOOK_REZEPTUREN = TRUE;
	};
};


instance Rezepturen2(C_Item)
{
	name = "Rezepturen";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Rezepturen";
	text[0] = "Band 2";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseRezepturen2;
};


func void UseRezepturen2()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Der Wein des Vergessens");
	Doc_PrintLine(nDocID,0,"--------------------");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Hoch oben an den Hängen des Archolos, gibt es die besten Trauben, die man für diesen Wein finden kann. Die Kunst diesen Wein zu seiner Vollendung reifen zu lassen, besteht darin, ihn unter keinen Umständen jeglicher Bewegung auszusetzen. Die Trauben werden vor der Kellerei mit dem gemeinen Syos-kraut versetzt. ");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Sehet und staunet, wenn der Magister klarstes Brunnenwasser zu vortrefflichen Wein verwandelt. Alle ihm huldigen und sich an seiner Gabe laben. Der Magister seine faulen Lehrlinge zur Strafe in Flaschen sperrt, Feuer sich auf wundersame Weise entzündet und schwarze Schlangen emporwachsen.");
	Doc_Show(nDocID);
	if((BOOK_REZEPTUREN2 == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(50);
		BOOK_REZEPTUREN2 = TRUE;
	};
};


instance TagebuchOT(C_Item)
{
	name = "Tagebuch";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Tagebuch";
	text[0] = "Ein altes zerschlissenes Buch.";
	text[1] = "Es fehlen Seiten.";
	on_state[0] = UseTagebuchOT;
};


func void UseTagebuchOT()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"23. Tag");
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLines(nDocID,0,"Ich habe das Zeitgefühl verloren.");
	Doc_PrintLines(nDocID,0,"Ich schätze es ist 23 Tage her, seit uns die Orks gefangen genommen und zur Arbeit gezwungen haben.");
	Doc_PrintLines(nDocID,0,"Die Arbeit ist hart und die Bastarde haben keine Gnade, wer schwach ist, ist tot!");
	Doc_PrintLines(nDocID,0,"Ich will hier abhauen, egal wie!!!");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"28. Tag");
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLines(nDocID,0,"Wir mussten die Stollen noch weiter in den Berg hinein treibe.");
	Doc_PrintLines(nDocID,0,"Der vordere Bereich ist schon gigantisch, wenn ich nur wüßte für was wir das tun müssen.");
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"67. Tag");
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLines(nDocID,1,"Ich habe erzählt bekommen, dass diese Priester der Orks keine Herzen mehr hätten, aber wie können sie leben?");
	Doc_PrintLines(nDocID,1,"Außerdem habe ich das Schwert gesehen, vor dem sich die Priester so fürchten, hätte ich es nur, ich würde es ihnen in ihren Körper jagen.");
	Doc_PrintLine(nDocID,1,"");
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"78. Tag");
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLines(nDocID,1,"Das Schwert liegt in einem Raum im vorderen Bereich des Tempels, wird aber von einem Priester bewacht.");
	Doc_PrintLines(nDocID,1,"Ich werde flüchten. Mein Tagebuch lasse ich hier liegen, vielleicht hilft es irgendjemanden mal.");
	Doc_Show(nDocID);
};


instance ItWr_Bloodfly_01(C_Item)
{
	name = "Die Blutfliegen";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 150;
	visual = "ItWr_Book_02_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Die Blutfliegen";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseItWr_Bloodfly_01;
};


func void UseItWr_Bloodfly_01()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"Blutfliegen");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0," ");
	Doc_SetFont(nDocID,-1,"font_10_book.TGA");
	Doc_PrintLine(nDocID,0,"Über die Fliegen");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Dort aber , wo das Erdreich feucht und die Luft schwül ist, werden die Fliegen angelockt vom rinnenden Schweiß aller Kreaturen.Mit ihrem Stachel töten sie ihre Opfer und laben sich an ihrem Blut. ");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Den Stachel zu entnehmen ist eine Kunst die von vielen Sumpfjägern beherrscht wird.Schneide tief in den Unterleib, um den Stachel herum mit gezackten Schnitten und entferne vorsichtig den Stachel mitsamt dem umgebenen Gewebe.Lasse ihn ausbluten und streife das ungeniessbare Fleisch ab.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_Show(nDocID);
	if((Knows_GetBFSting == FALSE) && (KNOWS_GETBFFLY == FALSE))
	{
		Knows_GetBFSting = TRUE;
		KNOWS_GETBFFLY = TRUE;
		Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
		B_LogEntry(GE_AnimalTrophies,"Wissen über Stachel entfernen - Blutfliegen");
		PrintScreen("Lerne: Stachel entfernen",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		B_LogEntry(GE_AnimalTrophies,"Wissen über Flügel entfernen - Blutfliegen");
		PrintScreen("Lerne: Flügel entfernen",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};


var int salmsnotiz;
var int dobraksnotiz;
var int pelensnotiz;
var int mascosnotiz;
var int janosnotiz;
var int allenotizen;

instance ITWR_SALMSNOTIZ(C_Item)
{
	name = "Nachricht von Salm";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	hp = 5;
	hp_max = 5;
	weight = 1;
	visual = "ItWr_Scroll_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = usesalmsnotiz;
	description = name;
	text[0] = "";
	text[1] = "";
};


func void usesalmsnotiz()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Es war Dumm von mir anzunehmen das es sich bei der Sache um eine einfache Aufgabe handelt. Aber die Belohnung war wirklich verlockend. Trotzdem sitze ich jetzt hier in der Falle unter dem Plateu, umzingelt von einer Horde Razors. Die Nacht bricht langsam herein. Wenn ich Glück habe, kann ich mich an den Viechern vorbeischleichen wenn sie schlafen. Ich sollte aber vorsichtig sein.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Salm");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Was brauche ich für meine Abreise?");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Mein Teil des Ganzen:");
	Doc_PrintLine(nDocID,0,"R");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
	if(SALMSNOTIZ == FALSE)
	{
		Log_CreateTopic(MYSTERIOUSNOTICES,LOG_MISSION);
		Log_SetTopicStatus(MYSTERIOUSNOTICES,LOG_RUNNING);
		B_LogEntry(MYSTERIOUSNOTICES,"In der Nähe des versunkenen Turmes fand ich eine Notiz von einem Salm. Er schrieb das er eine Aufgabe erfüllen müsse und ihn eine Belohnung erwartet. Unter dem Brief wurde groß der Buchstabe R hinterlassen.");
		SALMSNOTIZ = TRUE;
	};
};


instance ITWR_DOBRAKSNOTIZ(C_Item)
{
	name = "Nachricht von Dobrak";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	hp = 5;
	hp_max = 5;
	weight = 1;
	visual = "ItWr_Scroll_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = usedobraksnotiz;
	description = name;
	text[0] = "";
	text[1] = "";
};


func void usedobraksnotiz()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Verdammt, ich stecke in diesem Verdammten Schiffsrumpf fest. Ich kann hören wie die Warane draußen umherwandern. Ich muss mir was einfallen lassen. Ich frage mich ob die Anderen fündig geworden sind. Was jetzt aber wichtiger ist, wie komme ich hier raus ohne gefressen zu werden?");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Dobrak");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Wo leben und sterben Sumpfhaie?");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Mein Teil des Ganzen:");
	Doc_PrintLine(nDocID,0,"G");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
	if(DOBRAKSNOTIZ == FALSE)
	{
		Log_CreateTopic(MYSTERIOUSNOTICES,LOG_MISSION);
		Log_SetTopicStatus(MYSTERIOUSNOTICES,LOG_RUNNING);
		B_LogEntry(MYSTERIOUSNOTICES,"In der Nähe des kaputten Schiffes fand ich eine Notiz von einem Dobrak. Seine Gruppe hat sich anscheinend getrennt, da er noch Andere in seinem Brief erwähnte. Unter dem Brief wurde groß der Buchstabe G hinterlassen.");
		DOBRAKSNOTIZ = TRUE;
	};
};


instance ITWR_PELENSNOTIZ(C_Item)
{
	name = "Nachricht von Pelen";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	hp = 5;
	hp_max = 5;
	weight = 1;
	visual = "ItWr_Scroll_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = usepelensnotiz;
	description = name;
	text[0] = "";
	text[1] = "";
};


func void usepelensnotiz()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Jetzt sitze ich hier um Sumpf und frage mich wofür? Ich habe nichts gefunden, noch nicht mal einen Hinweis. Die Sektenspinner, die hier vor einigen Wochen angefangen haben ihr Lager zu bauen brauche ich ja gar nicht erst zu fragen. Da würde wahrscheinlich nichts bei rumkommen. Die Sumpfhaie sind in den letzten Stunden gefährlich nahe gekommen. Ich glaube sie fangen an mich zu wittern. Ich sollte hier schleunigst verschwinden.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Pelen");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Wo finde ich eine geknechtete und");
	Doc_PrintLine(nDocID,0,"auf ewig verdammte Seele?");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Mein Teil des Ganzen:");
	Doc_PrintLine(nDocID,0,"O");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
	if(PELENSNOTIZ == FALSE)
	{
		Log_CreateTopic(MYSTERIOUSNOTICES,LOG_MISSION);
		Log_SetTopicStatus(MYSTERIOUSNOTICES,LOG_RUNNING);
		B_LogEntry(MYSTERIOUSNOTICES,"Im Sumpf in der nähe des Lagers der Bruderschaft fand ich eine Notiz von einem Pelen. Er war wohl auf der Suche nach Irgendetwas, ist aber nicht fündig danach geworden. Er starb vermutlich durch Sumpfhaie. Unter dem Brief wurde groß der Buchstabe O hinterlassen.");
		PELENSNOTIZ = TRUE;
	};
};


instance ITWR_MASCOSNOTIZ(C_Item)
{
	name = "Nachricht von Masco";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	hp = 5;
	hp_max = 5;
	weight = 1;
	visual = "ItWr_Scroll_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = usemascosnotiz;
	description = name;
	text[0] = "";
	text[1] = "";
};


func void usemascosnotiz()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Ich bin in die Gruft hinabgestiegen und habe versucht gegen diese Untoten Mistkerle anzukommen. Das was eine ganz schön dumme Idee. Einer hat mich ganz schön erwischt. Ich habe mich in diese Höhle zurückgezogen und werde kurz rasten und versuchen meine Wunden zu versorgen. Ich fühle mich merkwürdig. Werde versuchen etwas zu schlafen.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Masco");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Von wo aus habe ich den besten");
	Doc_PrintLine(nDocID,0," Überblick über die Kolonie?");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Mein Teil des Ganzen:");
	Doc_PrintLine(nDocID,0,"D");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
	if(MASCOSNOTIZ == FALSE)
	{
		Log_CreateTopic(MYSTERIOUSNOTICES,LOG_MISSION);
		Log_SetTopicStatus(MYSTERIOUSNOTICES,LOG_RUNNING);
		B_LogEntry(MYSTERIOUSNOTICES,"In einer Höhle, in der nähe der Gruft fand ich einen Masco. Er stieg in die Gruft hinab und wurde von einem der Untoten dort verletzt. Daraufhin verwandelte er sich wohl in einen Zombie. Unter dem Brief wurde groß der Buchstabe D hinterlassen.");
		MASCOSNOTIZ = TRUE;
	};
};


instance ITWR_JANOSNOTIZ(C_Item)
{
	name = "Nachricht von Jano";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	hp = 5;
	hp_max = 5;
	weight = 1;
	visual = "ItWr_Scroll_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = usejanosnotiz;
	description = name;
	text[0] = "";
	text[1] = "";
};


func void usejanosnotiz()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Ich habe das alte Kastell erreicht und habe jetzt schon den Eindruck das es hier nichts zu finden gibt. Hier sieht alles so leer und verlassen aus. Es ist mir hier oben zu ruhig. Ich bin mir nicht sicher, ob es wirklich das beste war das wir fünf uns alle aufgeteilt haben. Wir hätten gemeinsam suchen sollen. Wo Salm, Pelen, Masco und Dobrak wohl gerade stecken?");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Jano");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Wo werde ich tauchen müssen um");
	Doc_PrintLine(nDocID,0,"zu Wissen zu gelangen?");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Mein Teil des Ganzen:");
	Doc_PrintLine(nDocID,0,"A");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
	if(JANOSNOTIZ == FALSE)
	{
		Log_CreateTopic(MYSTERIOUSNOTICES,LOG_MISSION);
		Log_SetTopicStatus(MYSTERIOUSNOTICES,LOG_RUNNING);
		B_LogEntry(MYSTERIOUSNOTICES,"In den Bergen oben auf dem alten Kastell fand ich die Notiz von einem Jano. Er war scheinbar mit einer Gruppe unterwegs, die sich trennte um irgendetwas zu suchen. Unter dem Brief wurde groß der Buchstabe A hinterlassen.");
		JANOSNOTIZ = TRUE;
	};
};


instance ITWR_DIRTYNOTIZ1(C_Item)
{
	name = "Schmutziger Zettel";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	hp = 5;
	hp_max = 5;
	weight = 1;
	visual = "ItAr_Scroll_16.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = usedirtynotiz;
	description = name;
	text[0] = "";
	text[1] = "";
};


func void usedirtynotiz()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Geschafft. Scheint so als hätte keiner der Aufseher bemerkt das ich abgehauen bin. Während die Anderen Sträflinge weiter in den Minen schuften dürfen, bin ich ein freier Mann. Allerdings geht hier irgendwas vor sich. Vor einiger Zeit kamen ein paar Magier in die Burg. Ich glaube die planen irgendwas.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Jetzt muss ich mir erstmal sehen wie ich aus");
	Doc_PrintLine(nDocID,0,"diesem gottverdammten Tal rauskomme,");
	Doc_PrintLine(nDocID,0,"sonst war alles umsonst.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ITWR_DIRTYNOTIZ2(C_Item)
{
	name = "Angerissener Zettel";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	hp = 5;
	hp_max = 5;
	weight = 1;
	visual = "ItAr_Scroll_16.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = usedirtynotiz2;
	description = name;
	text[0] = "";
	text[1] = "";
};


func void usedirtynotiz2()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Das war knapp. Bin ein Stück den Fluss entlang geschwommen, als mir ein Konvoi bestehend aus einigen Aufsehern und einer Menge Sträflingen entgegen kam. Die armen Schweine sind wohl die Nächsten die für den König in den Minen schuften. Ich bin mir sicher, dass mich einer von denen gesehen hat. Gesagt hat er aber nichts. Unter uns Gefangenen bestand schon immer eine Art Zusammenhalt.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Schleiche seit einigen Tagen einem der Magier hinterher. Er trägt einen blauen Stein mit sich herum. Sieht wertvoll aus. Der Magier scheint auf dem Weg Richtung Meer zu sein.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Ich bleibe mal an der Sache dran. Irgendwas passiert hier bald, dass spüre ich.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ITWR_DIRTYNOTIZ3(C_Item)
{
	name = "Verblichener Zettel";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	hp = 5;
	hp_max = 5;
	weight = 1;
	visual = "ItAr_Scroll_16.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = usedirtynotiz3;
	description = name;
	text[0] = "";
	text[1] = "";
};


func void usedirtynotiz3()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Unfassbar! Der Magier verzauberte den blauen Stein und plötzlich spannte sich eine riesige blaue Kuppe über da Tal. Sieht nicht so aus, als ob da geplant gewesen wäre. Der Magier selbst sah genauso geschockt wie ich aus.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Was soll ich denn jetzt machen? Bin mir nicht sicher, ob ich durch diese Barriere hindurch gehen kann. Scheinbar ist das gesamte Tal jetzt ein einziges Gefängnis.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Dann war wohl alles umsonst. Aufgeben werde ich nicht. Ich ziehe noch weiter, vielleicht finde ich ja doch einen Weg hier heraus. Ja, ganz bestimmt. Es MUSS einen Weg hier raus geben.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ITWR_DIRTYNOTIZ4(C_Item)
{
	name = "Gealteter Zettel";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	hp = 5;
	hp_max = 5;
	weight = 1;
	visual = "ItAr_Scroll_16.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = usedirtynotiz4;
	description = name;
	text[0] = "";
	text[1] = "";
};


func void usedirtynotiz4()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Jetzt ist es passiert! Die Sträflinge haben einen Aufstand gegen die Aufseher angezettelt und innerhalb der Burg wird gekämpft. Gut das ich mich vorher schon aus dem Staub gemacht hab. Jetzt mach ich mich auf zum pass und sehe zu das ich von hier verschwinde.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Wer diesen Brief findet und meine Leiche daneben sieht, dem sag ich zum Schluss noch eins. Versuchs erst gar nicht hier heraus zu kommen. Ich hab es versucht und du siehst ja was daraus geworden ist. Also finde dich damit ab, dass du nie wieder hier heraus kommst.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Ein freiheitssuchender Sträfling");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ITWR_BUDDLERNOTIZ(C_Item)
{
	name = "Gekritzelte Nachricht";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	hp = 5;
	hp_max = 5;
	weight = 1;
	visual = "ItAr_Scroll_16.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = usebuddlernotiz;
	description = name;
	text[0] = "";
	text[1] = "";
};


func void usebuddlernotiz()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"Tag 152");
	Doc_PrintLines(nDocID,0,"Die verdammte Tür ist blockiert und wir stecken in dieser Höhle fest. Es gab Gerüchte um das Amulett, ich glaube sie sind wahr. Seitdem ich es in die Hand genommen habe, fühle ich mich merkwürdig. Ich hab es in der Truhe verschlossen. Trotzdem... bin ich mir sicher, dass ich letzte Nacht eine flüsternde Stimme hörte. Ich hoffe das ich mir das nur eingebildet habe.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Tag 154");
	Doc_PrintLines(nDocID,0,"eS sprciht jetzt 2 Näcjhte zu mir. ich erzäle schon den andren davno aber sie gluaben mir nicht. es befielht mir die anderne umzubrinegn. nein. nein. warum gluaben sie miR einfcah nicht? ihc will nur helfn aber si lassen nic ht helf ne. die stim men in mienem kopf. wanhsinn.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Tag 155");
	Doc_PrintLines(nDocID,0,"deafef. einfahc . fiefdsfk. umge br ahct. grnjvfs. la chten.. im m er. fdsfd. la ch en. fdsge. nic ht. m ehr. fdsfoema. k ei nlach en. mehr. deaf. tot. fdsggsd. tot. grgfsdfegr. ge fre fasf ssen. fdsifksd. al lein. gnsjgdf. hu ng rig. fdsgd. freun dee ss en. dase. fesd.");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

