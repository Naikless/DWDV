
instance Info_Swiney_EXIT(C_Info)
{
	npc = SFB_1037_Swiney;
	nr = 999;
	condition = Info_Swiney_EXIT_Condition;
	information = Info_Swiney_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_Swiney_EXIT_Condition()
{
	return 1;
};

func void Info_Swiney_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Swiney_Hello(C_Info)
{
	npc = SFB_1037_Swiney;
	nr = 1;
	condition = Info_Swiney_Hello_Condition;
	information = Info_Swiney_Hello_Info;
	permanent = 0;
	description = "Wer bist du?";
};


func int Info_Swiney_Hello_Condition()
{
	return 1;
};

func void Info_Swiney_Hello_Info()
{
	AI_Output(other,self,"Info_Swiney_Hello_15_00");	//Wer bist du?
	AI_Output(self,other,"Info_Swiney_Hello_09_01");	//Ich bin der beste Bergbauer, den diese verdammte Kolonie jemals gesehen hat, mein Junge.
	AI_Output(self,other,"Info_Swiney_Hello_09_02");	//Ich passe auf, dass nicht die H�lfte unserer Jungs von Steinen erschlagen werden, weil sie zu dumm sind, an der richtigen Stelle zu sch�rfen.
};


instance Info_Swiney_Schuerfer(C_Info)
{
	npc = SFB_1037_Swiney;
	nr = 1;
	condition = Info_Swiney_Schuerfer_Condition;
	information = Info_Swiney_Schuerfer_Info;
	permanent = 0;
	description = "Ich will bei euch als Sch�rfer mitmachen!";
};


func int Info_Swiney_Schuerfer_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Swiney_Hello) && (Npc_GetTrueGuild(hero) == GIL_None))
	{
		return 1;
	};
};

func void Info_Swiney_Schuerfer_Info()
{
	AI_Output(other,self,"Info_Swiney_Schuerfer_15_00");	//Ich will bei euch als Sch�rfer mitmachen!
	AI_Output(self,other,"Info_Swiney_Schuerfer_09_01");	//So? Denk blo� nicht, du kannst hier viel erwarten. Jeden Tag gibt's 3 Portionen Reis und f�r den Rest musst du selber sorgen.
	AI_Output(self,other,"Info_Swiney_Schuerfer_09_02");	//Du wei�t, warum wir das hier machen? Wir machen die Arbeit, damit alle hier eines Tages wieder rausspazieren k�nnen.
	AI_Output(self,other,"Info_Swiney_Schuerfer_09_03");	//Das hei�t, alles Erz wird abgegeben und kommt auf den gro�en Haufen. Und einmal im Monat kriegt jeder, der hier hart gearbeitet hat, 50 Brocken Erz zum Versaufen.
	AI_Output(self,other,"Info_Swiney_Schuerfer_09_04");	//Das waren auch schon die wichtigsten Sachen, die du wissen musst.
	AI_Output(self,other,"Info_Swiney_Schuerfer_09_05");	//Kennst du dich wenigstens mit der Arbeit aus?
	Info_ClearChoices(Info_Swiney_Schuerfer);
	Info_AddChoice(Info_Swiney_Schuerfer,"Nein.",Info_Swiney_Schuerfer_Nein);
	Info_AddChoice(Info_Swiney_Schuerfer,"Ja.",Info_Swiney_Schuerfer_Ja);
};

func void Info_Swiney_Schuerfer_Ja()
{
	AI_Output(other,self,"Info_Swiney_Schuerfer_Ja_15_00");	//Ja.
	AI_Output(self,other,"Info_Swiney_Schuerfer_Ja_09_01");	//Gut! Dann wei�t du ja, worauf du zu achten hast. Hier ist Schutzkleidung. 'Ne Spitzhacke musst du dir suchen. Viel Spa�.
	AI_Output(self,other,"Info_Swiney_Schuerfer_Ja_09_02");	//Hier sind deine ersten 3 Portionen Reis. Teil sie dir gut ein!
	hero.guild = GIL_SFB;
	CreateInvItem(other,sfb_armor_l);
	AI_EquipBestArmor(hero);
	Mdl_ApplyOverlayMds(hero,"Humans_Tired.mds");
	Log_CreateTopic(GE_BECOMESCHUERFER,LOG_NOTE);
	B_LogEntry(GE_BECOMESCHUERFER,"Der Sch�rfer Swiney hat mich bei den Sch�rfern aufgenommen. Ich kann mir jetzt jeden Tag 3 Portionen Reis abholen.");
	CreateInvItem(self,ItAmArrow);
	B_GiveInvItems(self,hero,ItAmArrow,1);
	Npc_RemoveInvItem(hero,ItAmArrow);
	CreateInvItems(self,ItFoRice,3);
	B_GiveInvItems(self,other,ItFoRice,3);
	Info_ClearChoices(Info_Swiney_Schuerfer);
};

func void Info_Swiney_Schuerfer_Nein()
{
	AI_Output(other,self,"Info_Swiney_Schuerfer_Nein_15_00");	//Nein.
	AI_Output(self,other,"Info_Swiney_Schuerfer_Nein_09_01");	//Nat�rlich nicht! Warum immer ich? Gut. Pass auf. Du nimmst jetzt diese Klamotten und ziehst sie dir an - hier.
	AI_Output(self,other,"Info_Swiney_Schuerfer_Nein_09_02");	//Wenn dir ein Erzbrocken auf den Fu� f�llt und du keine Schutzkleidung tr�gst, bist du ein Kr�ppel und nur noch die H�lfte f�r uns wert.
	AI_Output(self,other,"Info_Swiney_Schuerfer_Nein_09_03");	//'Ne Spitzhacke liegt hier bestimmt irgendwo noch rum.
	AI_Output(self,other,"Info_Swiney_Schuerfer_Nein_09_04");	//Aber viel anfangen kannst du damit sowieso nicht - na ja - was soll's ...
	AI_Output(self,other,"Info_Swiney_Schuerfer_Nein_09_05");	//...hier sind �brigens deine ersten 3 Portionen Reis. Denk dran, du kriegst nur einmal am Tag Essen.
	hero.guild = GIL_SFB;
	CreateInvItem(other,sfb_armor_l);
	AI_EquipBestArmor(hero);
	Mdl_ApplyOverlayMds(hero,"Humans_Tired.mds");
	Log_CreateTopic(GE_BECOMESCHUERFER,LOG_NOTE);
	B_LogEntry(GE_BECOMESCHUERFER,"Der Sch�rfer Swiney hat mich bei den Sch�rfern aufgenommen. Ich kann mir jetzt jeden Tag 3 Portionen Reis abholen.");
	CreateInvItem(self,ItAmArrow);
	B_GiveInvItems(self,hero,ItAmArrow,1);
	Npc_RemoveInvItem(hero,ItAmArrow);
	CreateInvItems(self,ItFoRice,3);
	B_GiveInvItems(self,other,ItFoRice,3);
	Info_ClearChoices(Info_Swiney_Schuerfer);
};


instance Info_Swiney_PERM(C_Info)
{
	npc = SFB_1037_Swiney;
	nr = 1;
	condition = Info_Swiney_PERM_Condition;
	information = Info_Swiney_PERM_Info;
	permanent = 1;
	description = "Wieviel Erz habt ihr schon gesammelt?";
};


func int Info_Swiney_PERM_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Swiney_Schuerfer))
	{
		return 1;
	};
};

func void Info_Swiney_PERM_Info()
{
	AI_Output(other,self,"Info_Swiney_PERM_15_00");	//Wie viel Erz habt ihr schon gesammelt?
	AI_Output(self,other,"Info_Swiney_PERM_09_01");	//Die Magier sagen, viel brauchen wir nicht mehr. Geh ins Neue Lager und sieh dir den Haufen an.
	AI_StopProcessInfos(self);
};


var int swiney_riceday;

instance DIA_SWINEY_DAILYRICE(C_Info)
{
	npc = SFB_1037_Swiney;
	nr = 3;
	condition = dia_swiney_dailyrice_condition;
	information = dia_swiney_dailyrice_info;
	permanent = 1;
	description = "Ich will mir meine t�gliche Portion Reis abholen.";
};


func int dia_swiney_dailyrice_condition()
{
	if(Npc_KnowsInfo(hero,Info_Swiney_Schuerfer) && (hero.guild == GIL_SFB))
	{
		return 1;
	};
};

func void dia_swiney_dailyrice_info()
{
	AI_Output(other,self,"DIA_Swiney_DailyRice_15_00");	//Ich will mir meine t�gliche Portion Reis abholen.
	if(SWINEY_RICEDAY != Wld_GetDay())
	{
		AI_Output(self,other,"DIA_Swiney_DailyRice_05_01");	//Hier gibt's 3 Portionen f�r dich. Aber teil sie dir gut ein, das muss den ganzen Tag reichen.
		CreateInvItems(self,ItFoRice,3);
		B_GiveInvItems(self,other,ItFoRice,3);
		SWINEY_RICEDAY = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Swiney_DailyRice_05_02");	//Du hast deinen Reis heut' schon gekriegt. Komm morgen wieder oder geh' ins Lager und kauf dir was.
	};
};

