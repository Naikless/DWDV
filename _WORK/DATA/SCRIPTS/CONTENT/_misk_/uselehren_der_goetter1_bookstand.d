
func void uselehren_der_goetter1_bookstand()
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
};

