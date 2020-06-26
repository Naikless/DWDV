
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
	Doc_PrintLines(nDocID,0,"Als die G�tter den Menschen die F�higkeit zur Magie schenkten, schenkten sie ihnen auch das Wissen magische Runen herzustellen. Die Diener der G�tter haben die ehrenvolle Aufgabe �bernommen, diese Artefakte g�ttlicher Macht zu erschaffen und zu benutzen, wobei der Kreis des Magiers bestimmt, welche Zauber er in der Lage ist zu verstehen und anzuwenden. ");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Licht");
	Doc_PrintLine(nDocID,1,"---------------");
	Doc_PrintLines(nDocID,1,"Das erste Geschenk Innos an die Menschen.Eine hell strahlende Kugel wird �ber dem Magier erzeugt.");
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
	Doc_PrintLines(nDocID,0,"Alle Zauber werden durch die magische Energie des Anwenders ausgel�st.Der Anwender wird als Magier bezeichnet.");
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
	Doc_PrintLines(nDocID,0,"Manche Zauber k�nnen mit einer bestimmten gr��eren Anzahl von magischer Energie gespeist werden, diese werden auch Aufladungszauber genannt.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Andere Zauber werden aufrechterhalten, solange der Magier sein Mana in dieses Spruch einfliessen l�sst. Solche Zauber heissen Investierungszauber.");
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
	Doc_PrintLines(nDocID,0,"Das besondere an diesen magischen Formeln ist, das sie, obwohl als Runen geschaffen,von jedem der magische Energie in sich tr�gt gesprochen werden k�nnen.Die Magie die diese Formeln umgibt, kann sofort aktiviert werden. Es gibt keine Einschr�nkungen f�r Teleportationszauber.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"Feuersturm	");
	Doc_PrintLine(nDocID,1,"---------------");
	Doc_PrintLines(nDocID,1,"�hnlich dem Feuerball wirkt dieser Zauber auf einen Gegner, springt von dort aus jedoch auf weitere Gegner �ber.");
	Doc_PrintLine(nDocID,1,"Aufladbarer Zauber");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,text);
	Doc_PrintLine(nDocID,1,"Blitz");
	Doc_PrintLine(nDocID,1,"---------------");
	Doc_PrintLines(nDocID,1,"Der Zauber springt auf mehrere Opfer �ber. Die Kraft des Blitzes ist schwer zu kontrollieren, so das der Magier selbst Opfer werden kann");
	Doc_PrintLine(nDocID,1,Text_1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Untote vernichten");
	Doc_PrintLine(nDocID,1,"---------------");
	Doc_PrintLines(nDocID,1,"Die Gesch�pfe der Finsternis werden mit diesem Zauber verbannt.");
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
	name = "Der f�nfte Kreis";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 250;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Der f�nfte Kreis der Magie";
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
	Doc_PrintLine(nDocID,0,"F�nfter Kreis");
	Doc_PrintLine(nDocID,0,"---------------");
	Doc_SetFont(nDocID,-1,"font_10_book.TGA");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Feuerregen");
	Doc_PrintLine(nDocID,0,"---------------");
	Doc_PrintLines(nDocID,0,"Die Macht des g�ttlichen Feuers trifft jedes Lebewesen im Wirkungsbreich des Magiers.");
	Doc_PrintLine(nDocID,0,Text_1);
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Eiswelle	");
	Doc_PrintLine(nDocID,1,"---------------");
	Doc_PrintLines(nDocID,1,"Ein Feld aus magischem Eis erstreckt sich �ber alle Gegner und friert diese f�r einen kurzen Zeitraum ein. W�hrend dieser Zeit sind die Opfer bewegungsunf�hig und erleiden Schaden. ");
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
	Doc_PrintLines(nDocID,0,"Der Atem Beliars. Eine Wolke aus Lebenverschlingendem Nichts, die jedes Wesen augenblicklich t�ten kann.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,text);
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Todesring");
	Doc_PrintLine(nDocID,1,"---------------");
	Doc_PrintLines(nDocID,1,"Nicht viel ist �berliefert �ber die Rune mit der Macht von URIZIEL ");
	Doc_PrintLines(nDocID,1,"Es ist nur soviel bekannt, als das sie Beliars M�chte in sich birgt.");
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
	name = "G�ttergabe";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Die Gabe der G�tter";
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
	Doc_PrintLine(nDocID,0,"Die Gabe der G�tter");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Seit Jahrhunderten versucht man das Wesen und den Ursprung der Magie zu ergr�nden. Doch wo soll man suchen? Wie kann man sie beschreiben? Sie ist die widerspr�chlichste Kraft, die wir kennen. Sie kann t�ten und gleichzeitig heilen, Sie kann formen und zerst�ren.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Wie sieht eine solche Kraft aus ? Wo kann man diese unsichtbare und doch so m�chtige Kraft finden? Die Magie ist das, was sie ist. Das herrlichste und zugleich m�chtigste Geschenk der G�tter. Dem Nutzer und Wirker dieser Kraft ist damit auch ein g�ttliches Geschenk gegeben. Eine heilige Kraft, die nur wenige Auserw�hlte in der Lage sind zu kontrollieren.");
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
	Doc_PrintLines(nDocID,0,"Dem Magus selbst wohnt wohl keine Magie inne, er ist vielmehr in der Lage sich ihrer zu bedienen. Er selbst hat ausschlie�lich die F�higkeit die Magie zu beeinflussen und zu lenken. Der in der Hohen Kunst der Magie eingeweihte Adept muss in der Lage sein, seinen Geist als Werkzeug zu benutzen");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Sein Geist ist es, der die allumgebene Arkane Kraft sammelt, sie formt, b�ndelt und letztendlich in die uns zug�ngliche Welt entl�sst. W�hrend dieser Zeit h�chster Konzentration gelingt es dem Magus mit seinem Geist unsere Sph�re zu durchdringen und auf die Andere Seite zu blicken, von dort kommt die Kraft, der Magus selbst ist nur Leiter und Former dieser Kraft.");
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
	Doc_PrintLines(nDocID,0,"Ein Werk f�r den Eingweihten der Arkanen Kunst");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Die F�higkeiten die g�ttliche Macht zu kanalisieren w�chst in dem Magier. Anfangs keimt sie nur wie ein kleiner Sch�ssling auf dem Feld und man muss ihn pflegen, damit er nicht verk�mmert. Doch wenn dieser Sch�ssling erst einmal herangewachsen ist, entfaltet er seine volle Pracht");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Er w�chst und w�chst und wird st�rker mit jedem Tag. So ergeht es auch dem gelehrigen Magus. Seine anf�nglich sehr geringen Kr�fte wachsen und gedeihen und entfalten mit der Zeit eine Macht, die in ihrer Vollendung nicht absehbar ist. Diese Macht zu ihrer h�chsten Vollendung zu f�hren ist die heilige Pflicht eines jeden Magus, denn dieser Sch��ling ges�t von den G�ttern selbst ist das gr��te Geschenk, welches ein Sterblicher empfangen kann.");
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
	Doc_PrintLines(nDocID,0,"Einordung der Magie in das Gef�ge des Irdischen");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Viel wurde geforscht �ber die Magie und ihrer Stellung zu den Elementen. Man kann mit Fug und Recht behaupten, dass die Magie als das absolute Element angesehen werden kann. Sie hat die Macht alle Elmente zu ver�ndern und zu formen und ist ihnen somit augenscheinlich �bergestellt.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Eine Verbindung von Element und Magie bringt jedes Element in seiner reinsten Form zutage, so gibt es an wenigen Stellen nat�rliche Vorkommen solcher Verbindungen und sie sind gar sehr begehrt. Auch die F�higkeiten eines Magus Elemente scheinbar aus dem Nichts zu erschaffen sind Beweis, dass die magische Kraft das reinste und h�chste Gut darstellt, das existiert.");
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
	Doc_PrintLines(nDocID,0,"Es ist seine Macht, die den Magus von den normalen Menschen unterscheidet. Er, ausgestattet mit der F�higkeit g�ttliche Kraft zu beeinflussen, ist ein Wesen, f�r welches die normalen Grenzen des Sterblichen nicht gelten m�ssen. ");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Hat der Magus erst einmal einen Grad erreicht, der es ihm erm�glicht die Grenzen seines Daseins zu sprengen, so kann er sich selbst auf eine Stufe �ber der des normalen Sterblichen stellen. Er kann Grenzen von Raum und Zeit durchdringen, selbst das Ende allen Seins, der Tod, ist kein Hindernis auf seinem Weg.");
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
	Doc_PrintLines(nDocID,0,"Das beste Erz zum Schmieden einer Waffe findet man zweifelsohne in den Erzminen bei Khorinis. Es ist von elementarer Reinheit und durchtr�nkt von Magie. Es ist von unvergleichlicher H�rte und doch so weich, dass es nicht bricht. Eine Waffe geschmiedet aus jenem Stahl, der unter unsagbar hohen Aufwand aus den tiefen Minen gewonnen wird, ist mit keiner Klinge und sei sie aus dem noch so besten Stahl gefertigt, zu vergleichen");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,". Kein Schild, den sie nicht brechen kann, kein Panzer, den sie nicht durchbohrt. K�nige und Helden aus l�ngst vergangen Tagen trugen Waffen aus bestem Khorinisstahl und in ganz Myrtana werden auch heute f�r solche Waffen die besten Preise erzielt. Doch wird f�r dieses Erz auch ein hoher Preis verlangt. Um es der Erde abzutrotzen mu� gro�er Aufwand getrieben werden, denn es ist so, als wolle das Erz nicht aus dem Scho�e der Erde entfliehen.");
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
	Doc_PrintLines(nDocID,0,"... doch Feldherr Rhobar w�hlte den Angriff. Er versammelte sein Heer und stie� mit geballter Kraft gegen die schlechtgedeckte rechte Flanke des Feindes vor. Er hielt sich nicht lang mit den Gepl�nkeln auf, sondern stie� wie ein Schwert in die Seite des feindlichen Heeres und zerschnitt sie wie Papier. Immer weiter trieb er seine Mannen voran, immer weiter Richtung der Grenze von Varant. Er wusste, wenn er diese Schlacht gewinnen wollte, musste es ihm gelingen das feindliche Herr zu teilen und verhindern, dass sich Gellon und Lukkor ");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"  vereinen und ihm den vernichtenden Schlag versetzen. Es musste ihm gelingen ihren Nachschub zu st�ren, dann war ihm der Sieg nicht mehr zu nehmen ...");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"...Gellon war tot, seine Armee geschlagen, seine nun f�hrerlosen Mannen auf der Flucht. Doch Rhobar war gewillt dem Feind keine Chance zu geben sich zu sammeln und befahl sofort den Aufbruch, um den Feind zu vernichten. Lukkor indes beschlie�t die Gunst der Stunde zu nutzen und K�nig Rhobars ersch�pften Truppen den Todessto� zu versetzen...");
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
	Doc_PrintLines(nDocID,0,"Der Krieg war entschieden. Varant seiner, f�r die Verorgung der Truppen so wichtigen,  Seeh�fen beraubt. K�nig Rhobar weilte schon lange nicht mehr auf den Schlachtfeldern von Varant, sondern �berlie� es seinen Gener�len die letzten feindliche Truppen aufzureiben. Varant besa� nur noch ein gr��eres Heer, gef�hrt von Lukkor, dem f�higsten Kriegsherrn des Varantener Heeres, mehr als einmal hatte er eine drohende Niederlage in einen Sieg verwandeln k�nnen");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,". Doch nun sa� sein Heer in der Falle. Dem Heer des Feindes zwar zahlenm��ig �berlegen doch in aussichtloser Position. Lee, der Kriegsheld von Myrtana hatte ihn in eine Falle gelockt. Seine schwere Reiterei konnte auf dem tiefen, sumpfigen Boden des engen Tals nicht k�mpfen und die H�gelketten um ihn herum waren von Lee's Soldaten besetzt, die immer wieder zustie�en und so sein Herr Mann um Mann dezimierten. Die verzweifelten Ausf�lle seiner Mannen waren blutig zur�ckgeschlagen worden. Er war besiegt.");
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
	name = "Lehren der G�tter Band1";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Lehren der G�tter";
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
	Doc_PrintLines(nDocID,0,"H�re die Worte der G�tter, denn es ist ihr Wille, dass sie geh�rt werden. Befolge die Lehren der G�tter, denn es ist ihr Wille, dass sie befolgt werden. Achte die Priester der G�tter, denn sie sind erw�hlt.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Die Worte Innos : Und m�get ihr nicht verstehen, so zweifelt nicht an den Worten der Priester, ihr Tun ist gerecht und weise. Denn ich bin die aufgehende Sonne, das Licht und das Leben. Und alles was da wider der Sonne, ist wider mir und soll verbannt sein auf immer und ewig in die Schatten.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Die Worte Adanos: Arbeite und lebe, denn der Tag ist gemacht daf�r, dass der Mensch arbeite. Suche das Lernen und Wissen, auf dass Du es weitergeben kannst, denn so bist Du geschaffen worden. Wer aber m��ig und faul, der soll verbannt werden auf immer und ewig in die Schatten.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Die Worte Beliar: Wer aber handelt unrecht und gegen den Willen der G�tter, den will ich strafen, den K�rper mit Schmerz , Leid und Tod, den Geist werde ich aber zu mir nehmen auf immer und ewig in die Schatten. ");
	Doc_Show(nDocID);
	if((BOOK_LEHREN_DER_GOETTER1 == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(50);
		BOOK_LEHREN_DER_GOETTER1 = TRUE;
	};
};


instance Lehren_der_Goetter2(C_Item)
{
	name = "Lehren der G�tter Band2";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Lehren der G�tter";
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
	Doc_PrintLines(nDocID,0,"Vom Anbeginn der Zeit: Es ward noch kein Tag oder Nacht und kein Wesen zog �ber die Welt. Da erschien der Welt Innos und sein Licht erhellte alles. Und Innos schenkte der Welt das Leben. Da aber kein Wesen im Licht des Innos leben kann, schuf er die Sonne. Das Licht war aber noch zu stark. Da teilte sich Innos und schuf Beliar. Beliar brachte die Nacht. Nun konnten die Menschen sein. Da teilte sich Innos erneut und schuf Adanos. Adanos gab den Menschen die Vielseitigkeit, Wissen, Neugier und Mut. Innos war sehr zufrieden mit sich und seinem Werk.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Und er beschloss die Menschen Adanos ganz zu �berlassen, um zu ruhen. Beliar aber wurde von Neid zerfressen, denn die Menschen beteten nicht zu ihm und ruhten des Nachts. Da wurde er zornig und er formte sich einen Menschen. Einen Menschen, der nur ihn anbeten sollte. Der Mensch aber ward genau so wie alle anderen Menschen. Beliar wurde so stark von Zorn erf�llt, dass er den Menschen t�tete und sprach: Wenn sie mich nicht anbeten, dann sollen sie mich f�rchten. Und er schuf den Tod und nahm den Menschen das Leben.");
	Doc_Show(nDocID);
	if((BOOK_LEHREN_DER_GOETTER2 == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(50);
		BOOK_LEHREN_DER_GOETTER2 = TRUE;
	};
};


instance Lehren_der_Goetter3(C_Item)
{
	name = "Lehren der G�tter Band3";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Lehren der G�tter";
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
	Doc_PrintLines(nDocID,0,"Innos gab den Menschen die Macht ihn zu h�ren und zu ihm zu sprechen. Er gab ihnen die Macht gro�e Wunder zu vollbringen. Und er nannte sie Magie. Mit dieser Macht konnten die Menschen die Welt frei nach ihrem Willen gestalten. Es gab keine Grenzen, die Innos ihnen aufzeigte. Und so hatten die Menschen Teil an der g�ttlichen Sch�pferkraft. Aber die Menschen waren sich alle gleich und das gefiel ihnen nicht. Also nahm er denen die unzufrieden waren, die Kraft. Die wenigen, die sich dankbar zeigten, stellte Innos �ber alle anderen");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Diese Menschen wurden alsbald verehrt und gef�rchtet und wurden Priester genannt. Doch auch unter ihnen gab es viele, die bald unzufrieden waren. Und so kam es, dass sie zu Adanos beteten und ihren Ursprung vergassen. Die Riege der Priester war gespalten. Kriege wurden entfesselt und auch der Glaube an die g�ttliche Allmacht war bald schon nur noch Mythos. So teilten sich die Priester. Die dem Adanos folgten nannte man nun Magier des Wassers, die Geweihten des Innos hie�en aber die Magier des Feuers.");
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
	Doc_PrintLines(nDocID,0,"Sein Schriftzeugnis hat die Zeiten �berdauert und seine Ratschl�ge gelten als Lehrbuch der Jagdkunst. Nach den gro�en Schlachten im Norden ist es heute jedem Landsmann gel�ufig, wie man mit dem Bogen umzugehen hat. Jedoch gibt es bei der Jagd einige Regeln zu befolgen, die �ber den einfachen Umgang mit der Waffe hinaus gehen! Das Wild ist scheu und unberechenbar.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Die Kunst der Jagd mit dem Bogen verf�gt nicht nur �ber die �lteste Tradition, sondern ist auch die gel�ufigste aller denkbaren Jagdarten. Die Technik dieser Art der traditionellen Jagd hat sich im Lauf der Jahrtausende kaum ver�ndert und wird sich wohl auch in Zukunft nicht �ndern. Welche Umst�nde bestimmen wirklich den Ablauf der Jagd mit dem Bogen? Diese Gesetzm��igkeiten erkannt zu haben, ist die eigentliche hohe Kunst der Bogenjagd.");
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
	Doc_PrintLines(nDocID,0,"Geschult werden dabei die Beweglichkeit des K�rpers, Ruhe und Schnelligkeit, Beobachtung und Reaktion. Die Bewegungen m�ssen gut koordiniert und die K�rperhaltung korrekt sein, um die beste Entfaltung deiner Kraft zu erreichen.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Der Kern der geistigen und k�rperlichen Lehren des Meisters hat viele Jahre �berlebt.  ");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Sein einzigartiger Erfolg hat Generationen beeinflu�t. Jahrtausende, in denen zwar die Welt ihr �u�eres schon oft ver�ndert hat, in der aber eines f�r immer Bestand haben wird: Die Harmonie der inneren Kr�fte mit der gezielten �u�eren Bewegung des K�rpers.");
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
	Doc_PrintLines(nDocID,0,"Im Zentrum befindet sich der Morgrad mit seinen vier Elementen Erde, Wasser, Feuer und Luft, der Raum des Verg�nglichen, in seinem Inneren die unaussprechliche Dunkelheit des Beliar. �ber allem befindet sich die Sph�re des Himmels.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"In der Hierarchie des Kosmos nimmt der Mensch die Stellung des Empf�ngers ein. Durch seine Seele hat er Teil am h�chsten Sein, dem g�ttlichen Geist, sein verg�nglicher K�rper hingegen besteht aus Stoffen des Morgrad. Als kleines Abbild der ganzen Welt.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Die synodische Umlaufszeit der Planeten, dh. die Zeitdauer zwischen zwei gleichartigen Stellungen in Bezug zum Morgrad unserer Welt, weicht jedes Jahrhundert um einige Grade ab, so dass wir davon ausgehen k�nnen, uns in einer st�ndigen Bewegung mit dem restlichen Kosmos zu befinden.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Bei der Aufstellung eines Kalenders bezogen wir uns Anfangs auf den Mondlauf, um den Anschlu� an die tats�chliche L�nge des Sonnenjahres zu erhalten.");
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
	Doc_PrintLines(nDocID,0,"Dazu wird ihm Galle auf die Augen gestrichen. Galle ist bitter im Geschmack. Wird dieses Bittere auf das Auge genommen, dh: schauen wir das Bittere an, so erw�chst daraus Weisheit. Wir werden sehend! Bitterkeit und Weisheit schliessen einander aus. Sie sind Gegenpole!");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Tr�nen, Leid und Entt�uschung sind bitter, die Weisheit aber ist die Tr�sterin in jedem seelischen Schmerz. Bitterkeit und Weisheit bilden eine Alternative. Wo Bitterkeit, da fehlt die Weisheit, und wo Weisheit, da gibt es keine Bitterkeit.");
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
	Doc_PrintLines(nDocID,0,"Hoch oben an den H�ngen des Archolos, gibt es die besten Trauben, die man f�r diesen Wein finden kann. Die Kunst diesen Wein zu seiner Vollendung reifen zu lassen, besteht darin, ihn unter keinen Umst�nden jeglicher Bewegung auszusetzen. Die Trauben werden vor der Kellerei mit dem gemeinen Syos-kraut versetzt. ");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Sehet und staunet, wenn der Magister klarstes Brunnenwasser zu vortrefflichen Wein verwandelt. Alle ihm huldigen und sich an seiner Gabe laben. Der Magister seine faulen Lehrlinge zur Strafe in Flaschen sperrt, Feuer sich auf wundersame Weise entz�ndet und schwarze Schlangen emporwachsen.");
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
	Doc_PrintLines(nDocID,0,"Ich habe das Zeitgef�hl verloren.");
	Doc_PrintLines(nDocID,0,"Ich sch�tze es ist 23 Tage her, seit uns die Orks gefangen genommen und zur Arbeit gezwungen haben.");
	Doc_PrintLines(nDocID,0,"Die Arbeit ist hart und die Bastarde haben keine Gnade, wer schwach ist, ist tot!");
	Doc_PrintLines(nDocID,0,"Ich will hier abhauen, egal wie!!!");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"28. Tag");
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLines(nDocID,0,"Wir mussten die Stollen noch weiter in den Berg hinein treibe.");
	Doc_PrintLines(nDocID,0,"Der vordere Bereich ist schon gigantisch, wenn ich nur w��te f�r was wir das tun m�ssen.");
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"67. Tag");
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLines(nDocID,1,"Ich habe erz�hlt bekommen, dass diese Priester der Orks keine Herzen mehr h�tten, aber wie k�nnen sie leben?");
	Doc_PrintLines(nDocID,1,"Au�erdem habe ich das Schwert gesehen, vor dem sich die Priester so f�rchten, h�tte ich es nur, ich w�rde es ihnen in ihren K�rper jagen.");
	Doc_PrintLine(nDocID,1,"");
	Doc_SetFont(nDocID,-1,"font_15_book.tga");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"78. Tag");
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLines(nDocID,1,"Das Schwert liegt in einem Raum im vorderen Bereich des Tempels, wird aber von einem Priester bewacht.");
	Doc_PrintLines(nDocID,1,"Ich werde fl�chten. Mein Tagebuch lasse ich hier liegen, vielleicht hilft es irgendjemanden mal.");
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
	Doc_PrintLine(nDocID,0,"�ber die Fliegen");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Dort aber , wo das Erdreich feucht und die Luft schw�l ist, werden die Fliegen angelockt vom rinnenden Schwei� aller Kreaturen.Mit ihrem Stachel t�ten sie ihre Opfer und laben sich an ihrem Blut. ");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Den Stachel zu entnehmen ist eine Kunst die von vielen Sumpfj�gern beherrscht wird.Schneide tief in den Unterleib, um den Stachel herum mit gezackten Schnitten und entferne vorsichtig den Stachel mitsamt dem umgebenen Gewebe.Lasse ihn ausbluten und streife das ungeniessbare Fleisch ab.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_Show(nDocID);
	if((Knows_GetBFSting == FALSE) && (KNOWS_GETBFFLY == FALSE))
	{
		Knows_GetBFSting = TRUE;
		KNOWS_GETBFFLY = TRUE;
		Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
		B_LogEntry(GE_AnimalTrophies,"Wissen �ber Stachel entfernen - Blutfliegen");
		PrintScreen("Lerne: Stachel entfernen",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		B_LogEntry(GE_AnimalTrophies,"Wissen �ber Fl�gel entfernen - Blutfliegen");
		PrintScreen("Lerne: Fl�gel entfernen",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
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
	Doc_PrintLines(nDocID,0,"Es war Dumm von mir anzunehmen das es sich bei der Sache um eine einfache Aufgabe handelt. Aber die Belohnung war wirklich verlockend. Trotzdem sitze ich jetzt hier in der Falle unter dem Plateu, umzingelt von einer Horde Razors. Die Nacht bricht langsam herein. Wenn ich Gl�ck habe, kann ich mich an den Viechern vorbeischleichen wenn sie schlafen. Ich sollte aber vorsichtig sein.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Salm");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Was brauche ich f�r meine Abreise?");
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
		B_LogEntry(MYSTERIOUSNOTICES,"In der N�he des versunkenen Turmes fand ich eine Notiz von einem Salm. Er schrieb das er eine Aufgabe erf�llen m�sse und ihn eine Belohnung erwartet. Unter dem Brief wurde gro� der Buchstabe R hinterlassen.");
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
	Doc_PrintLines(nDocID,0,"Verdammt, ich stecke in diesem Verdammten Schiffsrumpf fest. Ich kann h�ren wie die Warane drau�en umherwandern. Ich muss mir was einfallen lassen. Ich frage mich ob die Anderen f�ndig geworden sind. Was jetzt aber wichtiger ist, wie komme ich hier raus ohne gefressen zu werden?");
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
		B_LogEntry(MYSTERIOUSNOTICES,"In der N�he des kaputten Schiffes fand ich eine Notiz von einem Dobrak. Seine Gruppe hat sich anscheinend getrennt, da er noch Andere in seinem Brief erw�hnte. Unter dem Brief wurde gro� der Buchstabe G hinterlassen.");
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
	Doc_PrintLines(nDocID,0,"Jetzt sitze ich hier um Sumpf und frage mich wof�r? Ich habe nichts gefunden, noch nicht mal einen Hinweis. Die Sektenspinner, die hier vor einigen Wochen angefangen haben ihr Lager zu bauen brauche ich ja gar nicht erst zu fragen. Da w�rde wahrscheinlich nichts bei rumkommen. Die Sumpfhaie sind in den letzten Stunden gef�hrlich nahe gekommen. Ich glaube sie fangen an mich zu wittern. Ich sollte hier schleunigst verschwinden.");
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
		B_LogEntry(MYSTERIOUSNOTICES,"Im Sumpf in der n�he des Lagers der Bruderschaft fand ich eine Notiz von einem Pelen. Er war wohl auf der Suche nach Irgendetwas, ist aber nicht f�ndig danach geworden. Er starb vermutlich durch Sumpfhaie. Unter dem Brief wurde gro� der Buchstabe O hinterlassen.");
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
	Doc_PrintLines(nDocID,0,"Ich bin in die Gruft hinabgestiegen und habe versucht gegen diese Untoten Mistkerle anzukommen. Das was eine ganz sch�n dumme Idee. Einer hat mich ganz sch�n erwischt. Ich habe mich in diese H�hle zur�ckgezogen und werde kurz rasten und versuchen meine Wunden zu versorgen. Ich f�hle mich merkw�rdig. Werde versuchen etwas zu schlafen.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Masco");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Von wo aus habe ich den besten");
	Doc_PrintLine(nDocID,0," �berblick �ber die Kolonie?");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Mein Teil des Ganzen:");
	Doc_PrintLine(nDocID,0,"D");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
	if(MASCOSNOTIZ == FALSE)
	{
		Log_CreateTopic(MYSTERIOUSNOTICES,LOG_MISSION);
		Log_SetTopicStatus(MYSTERIOUSNOTICES,LOG_RUNNING);
		B_LogEntry(MYSTERIOUSNOTICES,"In einer H�hle, in der n�he der Gruft fand ich einen Masco. Er stieg in die Gruft hinab und wurde von einem der Untoten dort verletzt. Daraufhin verwandelte er sich wohl in einen Zombie. Unter dem Brief wurde gro� der Buchstabe D hinterlassen.");
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
	Doc_PrintLines(nDocID,0,"Ich habe das alte Kastell erreicht und habe jetzt schon den Eindruck das es hier nichts zu finden gibt. Hier sieht alles so leer und verlassen aus. Es ist mir hier oben zu ruhig. Ich bin mir nicht sicher, ob es wirklich das beste war das wir f�nf uns alle aufgeteilt haben. Wir h�tten gemeinsam suchen sollen. Wo Salm, Pelen, Masco und Dobrak wohl gerade stecken?");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Jano");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Wo werde ich tauchen m�ssen um");
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
		B_LogEntry(MYSTERIOUSNOTICES,"In den Bergen oben auf dem alten Kastell fand ich die Notiz von einem Jano. Er war scheinbar mit einer Gruppe unterwegs, die sich trennte um irgendetwas zu suchen. Unter dem Brief wurde gro� der Buchstabe A hinterlassen.");
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
	Doc_PrintLines(nDocID,0,"Geschafft. Scheint so als h�tte keiner der Aufseher bemerkt das ich abgehauen bin. W�hrend die Anderen Str�flinge weiter in den Minen schuften d�rfen, bin ich ein freier Mann. Allerdings geht hier irgendwas vor sich. Vor einiger Zeit kamen ein paar Magier in die Burg. Ich glaube die planen irgendwas.");
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
	Doc_PrintLines(nDocID,0,"Das war knapp. Bin ein St�ck den Fluss entlang geschwommen, als mir ein Konvoi bestehend aus einigen Aufsehern und einer Menge Str�flingen entgegen kam. Die armen Schweine sind wohl die N�chsten die f�r den K�nig in den Minen schuften. Ich bin mir sicher, dass mich einer von denen gesehen hat. Gesagt hat er aber nichts. Unter uns Gefangenen bestand schon immer eine Art Zusammenhalt.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Schleiche seit einigen Tagen einem der Magier hinterher. Er tr�gt einen blauen Stein mit sich herum. Sieht wertvoll aus. Der Magier scheint auf dem Weg Richtung Meer zu sein.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Ich bleibe mal an der Sache dran. Irgendwas passiert hier bald, dass sp�re ich.");
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
	Doc_PrintLines(nDocID,0,"Unfassbar! Der Magier verzauberte den blauen Stein und pl�tzlich spannte sich eine riesige blaue Kuppe �ber da Tal. Sieht nicht so aus, als ob da geplant gewesen w�re. Der Magier selbst sah genauso geschockt wie ich aus.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Was soll ich denn jetzt machen? Bin mir nicht sicher, ob ich durch diese Barriere hindurch gehen kann. Scheinbar ist das gesamte Tal jetzt ein einziges Gef�ngnis.");
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
	Doc_PrintLines(nDocID,0,"Jetzt ist es passiert! Die Str�flinge haben einen Aufstand gegen die Aufseher angezettelt und innerhalb der Burg wird gek�mpft. Gut das ich mich vorher schon aus dem Staub gemacht hab. Jetzt mach ich mich auf zum pass und sehe zu das ich von hier verschwinde.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Wer diesen Brief findet und meine Leiche daneben sieht, dem sag ich zum Schluss noch eins. Versuchs erst gar nicht hier heraus zu kommen. Ich hab es versucht und du siehst ja was daraus geworden ist. Also finde dich damit ab, dass du nie wieder hier heraus kommst.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Ein freiheitssuchender Str�fling");
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
	Doc_PrintLines(nDocID,0,"Die verdammte T�r ist blockiert und wir stecken in dieser H�hle fest. Es gab Ger�chte um das Amulett, ich glaube sie sind wahr. Seitdem ich es in die Hand genommen habe, f�hle ich mich merkw�rdig. Ich hab es in der Truhe verschlossen. Trotzdem... bin ich mir sicher, dass ich letzte Nacht eine fl�sternde Stimme h�rte. Ich hoffe das ich mir das nur eingebildet habe.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Tag 154");
	Doc_PrintLines(nDocID,0,"eS sprciht jetzt 2 N�cjhte zu mir. ich erz�le schon den andren davno aber sie gluaben mir nicht. es befielht mir die anderne umzubrinegn. nein. nein. warum gluaben sie miR einfcah nicht? ihc will nur helfn aber si lassen nic ht helf ne. die stim men in mienem kopf. wanhsinn.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Tag 155");
	Doc_PrintLines(nDocID,0,"deafef. einfahc . fiefdsfk. umge br ahct. grnjvfs. la chten.. im m er. fdsfd. la ch en. fdsge. nic ht. m ehr. fdsfoema. k ei nlach en. mehr. deaf. tot. fdsggsd. tot. grgfsdfegr. ge fre fasf ssen. fdsifksd. al lein. gnsjgdf. hu ng rig. fdsgd. freun dee ss en. dase. fesd.");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

