
instance DIA_Caine_Exit(C_Info)
{
	npc = NOV_1301_Caine;
	nr = 999;
	condition = DIA_Caine_Exit_Condition;
	information = DIA_Caine_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Caine_Exit_Condition()
{
	return 1;
};

func void DIA_Caine_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Caine_Hallo(C_Info)
{
	npc = NOV_1301_Caine;
	nr = 1;
	condition = DIA_Caine_Hallo_Condition;
	information = DIA_Caine_Hallo_Info;
	permanent = 0;
	description = "Hi! Ich bin neu hier!";
};


func int DIA_Caine_Hallo_Condition()
{
	return 1;
};

func void DIA_Caine_Hallo_Info()
{
	AI_Output(other,self,"DIA_Caine_Hallo_15_00");	//Hi! Ich bin neu hier!
	AI_Output(self,other,"DIA_Caine_Hallo_13_01");	//Ich bin Caine. Schüler von Cor Kalom. Du hast sicher schon von ihm gehört, richtig?
	Info_ClearChoices(DIA_Caine_Hallo);
	Info_AddChoice(DIA_Caine_Hallo,"Nein.",DIA_Caine_Hallo_Nein);
	Info_AddChoice(DIA_Caine_Hallo,"Ja.",DIA_Caine_Hallo_Ja);
};

func void DIA_Caine_Hallo_Ja()
{
	AI_Output(other,self,"DIA_Caine_Hallo_Ja_15_00");	//Ja.
	AI_Output(self,other,"DIA_Caine_Hallo_Ja_13_01");	//Dann weißt du ja, dass er hier der zweitwichtigste Mann nach Y'Berion ist.
	Info_ClearChoices(DIA_Caine_Hallo);
};

func void DIA_Caine_Hallo_Nein()
{
	AI_Output(other,self,"DIA_Caine_Hallo_Nein_15_00");	//Nein.
	AI_Output(self,other,"DIA_Caine_Hallo_Nein_13_01");	//Nicht?! Du bist wohl wirklich noch nicht lange hier, was?
	AI_Output(self,other,"DIA_Caine_Hallo_Nein_13_02");	//Cor Kalom ist der zweitwichtigste Mann nach Y'Berion. Er entscheidet, wer als Novize bei uns aufgenommen wird.
	Info_ClearChoices(DIA_Caine_Hallo);
};


instance DIA_CAINE_WAYSTOKALOM(C_Info)
{
	npc = NOV_1301_Caine;
	nr = 2;
	condition = dia_caine_waystokalom_condition;
	information = dia_caine_waystokalom_info;
	permanent = 0;
	description = "Ich würde gerne mit Cor Kalom reden - kannst du mir dabei helfen?";
};


func int dia_caine_waystokalom_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Caine_Hallo) && (TPL_1406_Templer.aivar[AIV_PASSGATE] == FALSE) && (KALOMS_GUARD == LOG_RUNNING))
	{
		return 1;
	};
};

func void dia_caine_waystokalom_info()
{
	AI_Output(other,self,"DIA_Caine_WaysToKalom_15_00");	//Ich würde gerne mit Cor Kalom reden - kannst du mir dabei helfen?
	AI_Output(self,other,"DIA_Caine_WaysToKalom_13_01");	//Wenn du zu Cor Kalom willst, mußt du einen guten Grund haben.
	AI_Output(self,other,"DIA_Caine_WaysToKalom_13_02");	//Die Wache hat Anweisung, nur die vorzulassen, die Alchimistische Substanzen bringen oder von einen der Gurus geschickt wurden.
	if(KALOMS_GUARD == LOG_RUNNING)
	{
		B_LogEntry(CH1_KALOMSGUARD,"Wenn ich mit Cor Kalom reden möchte, brauche ich entweder Alchimistische Substanzen oder die Erlaubnis eines Gurus.");
	};
};


instance DIA_CAINE_ALCHEMIES(C_Info)
{
	npc = NOV_1301_Caine;
	nr = 2;
	condition = dia_caine_alchemies_condition;
	information = dia_caine_alchemies_info;
	permanent = 0;
	description = "Was für alchimistische Substanzen kann ich Kalom bringen?";
};


func int dia_caine_alchemies_condition()
{
	if(Npc_KnowsInfo(hero,dia_caine_waystokalom) && (TPL_1406_Templer.aivar[AIV_PASSGATE] == FALSE) && (KALOMS_GUARD == LOG_RUNNING))
	{
		return 1;
	};
};

func void dia_caine_alchemies_info()
{
	AI_Output(other,self,"DIA_Caine_Alchemies_15_00");	//Was für alchimistische Substanzen kann ich Kalom bringen?
	AI_Output(self,other,"DIA_Caine_Alchemies_13_01");	//Kalom benötigt vor allem das Sekret der Minecrawler. Wenn du ihm genug davon beschaffst, wird dich die Wache sicher vorlassen.
	AI_Output(self,other,"DIA_Caine_Alchemies_13_02");	//Er braucht zwar auch Pflanzen und Beeren, die man zwischen den Lagern findet, aber die nimmt Fortuno unten an.
	if(KALOMS_GUARD == LOG_RUNNING)
	{
		B_LogEntry(CH1_KALOMSGUARD,"Sobald ich Cor Kalom das Sekret der Minecrawler bringe, wird mich die Wache vorbeilassen.");
	};
};


instance DIA_Caine_Job(C_Info)
{
	npc = NOV_1301_Caine;
	nr = 1;
	condition = DIA_Caine_Job_Condition;
	information = DIA_Caine_Job_Info;
	permanent = 0;
	description = "Und was tust du?";
};


func int DIA_Caine_Job_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Caine_Hallo))
	{
		return 1;
	};
};

func void DIA_Caine_Job_Info()
{
	AI_Output(other,self,"DIA_Caine_Job_15_00");	//Und was tust du?
	AI_Output(self,other,"DIA_Caine_Job_13_01");	//Ich helfe meinem Meister bei der Aufbereitung der alchimistischen Substanzen.
	AI_Output(self,other,"DIA_Caine_Job_13_02");	//Im wesentlichen Sumpfkraut und Minecrawlersekret. Vor allem das Sekret braucht er dringend.
};


instance DIA_Caine_WoSekret(C_Info)
{
	npc = NOV_1301_Caine;
	nr = 2;
	condition = DIA_Caine_WoSekret_Condition;
	information = DIA_Caine_WoSekret_Info;
	permanent = 0;
	description = "Wo bekomme ich das Sekret der Minecrawler?";
};


func int DIA_Caine_WoSekret_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Caine_Job))
	{
		return 1;
	};
};

func void DIA_Caine_WoSekret_Info()
{
	AI_Output(other,self,"DIA_Caine_WoSekret_15_00");	//Wo bekomme ich das Sekret der Minecrawler?
	AI_Output(self,other,"DIA_Caine_WoSekret_13_01");	//Crawler findest du in der Alten Mine. Aber du musst wissen wie du ihnen das Sekret abzapfst.
	AI_Output(self,other,"DIA_Caine_WoSekret_13_02");	//Falls du wirklich vorhast, dich mit den Biestern anzulegen, sprich besser vorher mit einem der Templer, der Erfahrung hat. Zum Beispiel Gor Na Drak.
	AI_Output(self,other,"DIA_Caine_WoSekret_13_03");	//Er ist jeden Tag zwischen unserem Lager und der Alten Mine unterwegs. Morgens triffst du ihn unten am Labor.
};


instance DIA_Caine_AddInfoKalom(C_Info)
{
	npc = NOV_1301_Caine;
	nr = 2;
	condition = DIA_Caine_AddInfoKalom_Condition;
	information = DIA_Caine_AddInfoKalom_Info;
	permanent = 0;
	description = "Was kannst du mir noch über deinen Meister erzählen?";
};


func int DIA_Caine_AddInfoKalom_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Caine_Job))
	{
		return 1;
	};
};

func void DIA_Caine_AddInfoKalom_Info()
{
	AI_Output(other,self,"DIA_Caine_AddInfoKalom_15_00");	//Was kannst du mir noch über deinen Meister erzählen?
	AI_Output(self,other,"DIA_Caine_AddInfoKalom_13_01");	//Er ist nicht wie die anderen Gurus. Er getattet jedem, ihn anzusprechen, aber NIEMANDEM seine kostbare Zeit zu verschwenden.
};


instance DIA_CAINE_WIEGURUSEND(C_Info)
{
	npc = NOV_1301_Caine;
	nr = 2;
	condition = dia_caine_wiegurusend_condition;
	information = dia_caine_wiegurusend_info;
	permanent = 0;
	description = "Wie bringe ich einen Guru dazu, dass er mich zu Kalom schickt?";
};


func int dia_caine_wiegurusend_condition()
{
	if(Npc_KnowsInfo(hero,dia_caine_waystokalom) && (TPL_1406_Templer.aivar[AIV_PASSGATE] == FALSE) && (KALOMS_GUARD == LOG_RUNNING))
	{
		return 1;
	};
};

func void dia_caine_wiegurusend_info()
{
	AI_Output(other,self,"DIA_Caine_WieGuruSend_15_00");	//Wie bringe ich einen Guru dazu, dass er mich zu Kalom schickt?
	AI_Output(self,other,"DIA_Caine_WieGuruSend_13_01");	//Darüber kann die Lester mehr erzählen.
	AI_Output(self,other,"DIA_Caine_WieGuruSend_13_02");	//Bis vor kurzen hat er noch für Cor Kalom gearbeitet, jetzt kümmert er sich zusammen mit den Gurus um die Neuen.
	if(KALOMS_GUARD == LOG_RUNNING)
	{
		B_LogEntry(CH1_KALOMSGUARD,"Wenn ich einen Guru dazu bringen soll, dass er mich zu Cor Kalom schickt, sollte ich mich mal mit Lester unterhalten.");
	};
};


instance Nov_1301_Caine_CHEST(C_Info)
{
	npc = NOV_1301_Caine;
	nr = 3;
	condition = Nov_1301_Caine_CHEST_Condition;
	information = Nov_1301_Caine_CHEST_Info;
	important = 0;
	permanent = 0;
	description = "Wie komme ich an das Rezept von Kalom?";
};


func int Nov_1301_Caine_CHEST_Condition()
{
	if((Dexter_GetKalomsRecipe == LOG_RUNNING) && Npc_KnowsInfo(hero,DIA_Caine_Hallo))
	{
		return TRUE;
	};
};

func void Nov_1301_Caine_CHEST_Info()
{
	AI_Output(other,self,"Nov_1301_Caine_CHEST_Info_15_01");	//Wie komme ich an das Rezept von Kalom?
	AI_Output(self,other,"Nov_1301_Caine_CHEST_Info_13_02");	//Gar nicht. Er hält es in seiner Truhe verschlossen. Das rückt er niemals raus.
};


var int lernen_darf_psi;

instance NOV_1301_CAINE_LERNEN(C_Info)
{
	npc = NOV_1301_Caine;
	nr = 4;
	condition = nov_1301_caine_lernen_condition;
	information = nov_1301_caine_lernen_info;
	important = 0;
	permanent = 1;
	description = "Kannst du mir was über Alchemie beibringen?";
};


func int nov_1301_caine_lernen_condition()
{
	if((LERNEN_DARF_PSI == FALSE) && Npc_KnowsInfo(hero,DIA_Caine_Hallo))
	{
		return TRUE;
	};
};

func void nov_1301_caine_lernen_info()
{
	AI_Output(other,self,"Nov_1301_Caine_LERNEN_Info_14_01");	//Kannst du mir was über Alchemie beibringen?
	if((Npc_GetTrueGuild(hero) == GIL_NOV) || (Npc_GetTrueGuild(hero) == GIL_TPL) || (Npc_GetTrueGuild(hero) == GIL_GUR))
	{
		Log_CreateTopic(GE_TeacherPSI,LOG_NOTE);
		B_LogEntry(GE_TeacherPSI,"Caine, der Alchemist des Sumpflagers kann mich in der Lehre der Alchemie unterrichten.");
		AI_Output(self,other,"Nov_1301_Caine_LERNEN_Info_14_02");	//Cor Kalom hat mir viel beigebracht. Ich bin zwar noch nicht fertig mit meiner Ausbildung, aber ich kann dir auch etwas beibringen.
		AI_Output(self,other,"Nov_1301_Caine_LERNEN_Info_14_03");	//Ich verstehe mich sowohl auf Heiltränken, Manatränken und einigen speziellen Tränken, in dessen Geheimnisse nur die Gurus unserer Bruderschaft eingeweiht werden dürfen.
		AI_Output(self,other,"Nov_1301_Caine_LERNEN_Info_14_04");	//Die Rezepturen von Mana- und Heiltränken darf ich aber auch Novizen und Templern beibringen.
		LERNEN_DARF_PSI = TRUE;
	}
	else
	{
		AI_Output(self,other,"Nov_1301_Caine_LERNEN_Info_14_05");	//Ich kann dir nur was beibringen wenn du zu uns gehörst.
		AI_Output(self,other,"Nov_1301_Caine_LERNEN_Info_14_06");	//Cor Kalom würde mich umbringen, wenn ich die Rezepturen unserer Tränke Fremden beibringe.
	};
};


instance NOV_1301_CAINE_TRAENKE(C_Info)
{
	npc = NOV_1301_Caine;
	condition = nov_1301_caine_traenke_condition;
	information = nov_1301_caine_traenke_info;
	important = 0;
	permanent = 1;
	description = "Welche Rezepturen kennst du?";
};


func int nov_1301_caine_traenke_condition()
{
	if(((LERNEN_DARF_PSI == TRUE) && (Npc_GetTrueGuild(hero) == GIL_NOV)) || (Npc_GetTrueGuild(hero) == GIL_TPL) || (Npc_GetTrueGuild(hero) == GIL_GUR))
	{
		return TRUE;
	};
};

func void nov_1301_caine_traenke_info()
{
	AI_Output(other,self,"Nov_1301_Caine_Traenke_Info_14_01");	//Welche Rezepturen kennst du?
	AI_Output(self,other,"Nov_1301_Caine_Traenke_Info_14_02");	//Ich kenne die Rezepturen von Heil- und Manatränken.
	Info_ClearChoices(nov_1301_caine_traenke);
	Info_AddChoice(nov_1301_caine_traenke,DIALOG_BACK,nov_1301_caine_traenke_back);
	if(KNOWS_HEILESSENZ == FALSE)
	{
		Info_AddChoice(nov_1301_caine_traenke,"Essenz heilender Kraft (Kosten: 1 Lernpunkt)",nov_1301_caine_traenke_health1);
	};
	if((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == FALSE))
	{
		Info_AddChoice(nov_1301_caine_traenke,"Extrakt heilender Kraft (Kosten: 2 Lernpunkte)",nov_1301_caine_traenke_health2);
	};
	if((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == FALSE))
	{
		Info_AddChoice(nov_1301_caine_traenke,"Elixier heilender Kraft (Kosten: 3 Lernpunkte)",nov_1301_caine_traenke_health3);
	};
	if(KNOWS_MANAESSENZ == FALSE)
	{
		Info_AddChoice(nov_1301_caine_traenke,"Essenz magischer Energie (Kosten: 1 Lernpunkt)",nov_1301_caine_traenke_mana1);
	};
	if((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == FALSE))
	{
		Info_AddChoice(nov_1301_caine_traenke,"Extrakt magischer Energie (Kosten: 2 Lernpunkte)",nov_1301_caine_traenke_mana2);
	};
	if((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == FALSE))
	{
		Info_AddChoice(nov_1301_caine_traenke,"Elixier magischer Energie (Kosten: 3 Lernpunkte)",nov_1301_caine_traenke_mana3);
	};
	if((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == TRUE) && (KNOWS_HEILPERMAESSENZ == FALSE))
	{
		Info_AddChoice(nov_1301_caine_traenke,"Essenz des Lebens (Kosten: 5 Lernpunkte)",nov_1301_caine_traenke_healthperma1);
	};
	if((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == TRUE) && (KNOWS_HEILPERMAESSENZ == TRUE) && (KNOWS_HEILPERMAEXTRAKT == FALSE))
	{
		Info_AddChoice(nov_1301_caine_traenke,"Extrakt des Lebens (Kosten: 8 Lernpunkte)",nov_1301_caine_traenke_healthperma2);
	};
	if((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == TRUE) && (KNOWS_HEILPERMAESSENZ == TRUE) && (KNOWS_HEILPERMAEXTRAKT == TRUE) && (KNOWS_HEILPERMAELIXIER == FALSE))
	{
		Info_AddChoice(nov_1301_caine_traenke,"Elixier des Lebens (Kosten: 10 Lernpunkte)",nov_1301_caine_traenke_healthperma3);
	};
	if((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_MANAPERMAESSENZ == FALSE))
	{
		Info_AddChoice(nov_1301_caine_traenke,"Essenz des Geistes (Kosten: 5 Lernpunkte)",nov_1301_caine_traenke_manaperma1);
	};
	if((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_MANAPERMAESSENZ == TRUE) && (KNOWS_MANAPERMAEXTRAKT == FALSE))
	{
		Info_AddChoice(nov_1301_caine_traenke,"Extrakt des Geistes (Kosten: 8 Lernpunkte)",nov_1301_caine_traenke_manaperma2);
	};
	if((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_MANAPERMAESSENZ == TRUE) && (KNOWS_MANAPERMAEXTRAKT == TRUE) && (KNOWS_MANAPERMAELIXIER == FALSE))
	{
		Info_AddChoice(nov_1301_caine_traenke,"Elixier des Geistes (Kosten: 10 Lernpunkte)",nov_1301_caine_traenke_manaperma3);
	};
	if(((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_STRENGTHESSENZ == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_GUR)) || ((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == TRUE) && (KNOWS_STRENGTHESSENZ == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_GUR)))
	{
		Info_AddChoice(nov_1301_caine_traenke,"Essenz der Stärke (Kosten: 5 Lernpunkte)",nov_1301_caine_traenke_strengthperma1);
	};
	if(((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_STRENGTHESSENZ == TRUE) && (KNOWS_STRENGTHEXTRAKT == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_GUR)) || ((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == TRUE) && (KNOWS_STRENGTHESSENZ == TRUE) && (KNOWS_STRENGTHEXTRAKT == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_GUR)))
	{
		Info_AddChoice(nov_1301_caine_traenke,"Extrakt der Stärke (Kosten: 8 Lernpunkte)",nov_1301_caine_traenke_strengthperma2);
	};
	if(((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_STRENGTHESSENZ == TRUE) && (KNOWS_STRENGTHEXTRAKT == TRUE) && (KNOWS_STRENGTHELIXIER == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_GUR)) || ((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == TRUE) && (KNOWS_STRENGTHESSENZ == TRUE) && (KNOWS_STRENGTHEXTRAKT == TRUE) && (KNOWS_STRENGTHELIXIER == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_GUR)))
	{
		Info_AddChoice(nov_1301_caine_traenke,"Elixier der Stärke (Kosten: 10 Lernpunkte)",nov_1301_caine_traenke_strengthperma3);
	};
	if(((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_STRENGTHESSENZ == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_GUR)) || ((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == TRUE) && (KNOWS_DEXESSENZ == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_GUR)))
	{
		Info_AddChoice(nov_1301_caine_traenke,"Essenz der Geschicklichkeit (Kosten: 5 Lernpunkte)",nov_1301_caine_traenke_dexperma1);
	};
	if(((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_STRENGTHESSENZ == TRUE) && (KNOWS_STRENGTHEXTRAKT == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_GUR)) || ((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == TRUE) && (KNOWS_STRENGTHESSENZ == TRUE) && (KNOWS_STRENGTHEXTRAKT == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_GUR)))
	{
		Info_AddChoice(nov_1301_caine_traenke,"Extrakt der Geschicklichkeit (Kosten: 8 Lernpunkte)",nov_1301_caine_traenke_dexperma2);
	};
	if(((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_DEXESSENZ == TRUE) && (KNOWS_DEXEXTRAKT == TRUE) && (KNOWS_DEXELIXIER == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_GUR)) || ((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == TRUE) && (KNOWS_DEXESSENZ == TRUE) && (KNOWS_DEXEXTRAKT == TRUE) && (KNOWS_DEXELIXIER == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_GUR)))
	{
		Info_AddChoice(nov_1301_caine_traenke,"Elixier der Geschicklichkeit (Kosten: 10 Lernpunkte)",nov_1301_caine_traenke_dexperma3);
	};
	if(((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_DEXESSENZ == TRUE) && (KNOWS_DEXEXTRAKT == TRUE) && (KNOWS_DEXELIXIER == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_GUR)) || ((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == TRUE) && (KNOWS_DEXESSENZ == TRUE) && (KNOWS_DEXEXTRAKT == TRUE) && (KNOWS_DEXELIXIER == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_GUR)))
	{
		Info_AddChoice(nov_1301_caine_traenke,"Elixier der Geschicklichkeit (Kosten: 10 Lernpunkte)",nov_1301_caine_traenke_dexperma3);
	};
	if((Npc_GetTrueGuild(hero) == GIL_GUR) && (KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_PSIELIXIER == FALSE))
	{
		Info_AddChoice(nov_1301_caine_traenke,"Elixier (Kosten: 10 Lernpunkte)",nov_1301_caine_traenke_elixier);
	};
	if((Npc_GetTrueGuild(hero) == GIL_GUR) && (KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_PSICRAWLER == FALSE))
	{
		Info_AddChoice(nov_1301_caine_traenke,"Crawler-Elixier (Kosten: 10 Lernpunkte)",nov_1301_caine_traenke_crawlerelixier);
	};
};

func void nov_1301_caine_traenke_back()
{
	Info_ClearChoices(nov_1301_caine_traenke);
};

func void nov_1301_caine_traenke_health1()
{
	AI_Output(other,self,"Nov_1301_Caine_Traenke_Health1_15_00");	//Was muss ich tun?
	if(other.lp >= 1)
	{
		other.lp = other.lp - 1;
		B_GiveSkill(other,NPC_TALENT_REGENERATE,1,0);
		AI_Output(self,other,"Nov_1301_Caine_Traenke_Health1_06_01");	//Achte darauf, dass du die Pflanzen und Kräuter zusammen in die Laborwasserflasche gibst, bevor du die verschiedenen Flüssigkeiten einfüllst.
		AI_Output(self,other,"Nov_1301_Caine_Traenke_Health1_06_02");	//Wenn du alles richtig machst, solltest du das gewünschte Ergebnis erhalten.
		KNOWS_HEILESSENZ = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Essenz heilender Kraft - 1 Wasser, 1 leichtes Heilkraut");
		if((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == FALSE))
		{
			Info_AddChoice(nov_1301_caine_traenke,"Extrakt heilender Kraft (Kosten: 2 Lernpunkte)",nov_1301_caine_traenke_health2);
		};
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Zu wenig Lernpunkte!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void nov_1301_caine_traenke_health2()
{
	AI_Output(other,self,"Nov_1301_Caine_Traenke_Health2_15_00");	//Was muss ich tun?
	if(other.lp >= 2)
	{
		other.lp = other.lp - 2;
		PrintScreen("Lerne: Extrakt heilender Kraft",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"Nov_1301_Caine_Traenke_Health2_06_01");	//Achte darauf, dass du die Pflanzen und Kräuter zusammen in die Laborwasserflasche gibst, bevor du die verschiedenen Flüssigkeiten einfüllst.
		AI_Output(self,other,"Nov_1301_Caine_Traenke_Health2_06_02");	//Wenn du alles richtig machst, solltest du das gewünschte Ergebnis erhalten.
		KNOWS_HEILEXTRAKT = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Extrakt heilender Kraft - 1 Wasser, 2 leichte Heilkräuter, 1 mittleres Heilkraut");
		if((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == FALSE))
		{
			Info_AddChoice(nov_1301_caine_traenke,"Elixier heilender Kraft (Kosten: 3 Lernpunkte)",nov_1301_caine_traenke_health3);
		};
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Zu wenig Lernpunkte!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void nov_1301_caine_traenke_health3()
{
	AI_Output(other,self,"Nov_1301_Caine_Traenke_Health3_15_00");	//Was muss ich tun?
	if(other.lp >= 3)
	{
		other.lp = other.lp - 3;
		PrintScreen("Lerne: Elixier heilender Kraft",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"Nov_1301_Caine_Traenke_Health3_06_01");	//Achte darauf, dass du die Pflanzen und Kräuter zusammen in die Laborwasserflasche gibst, bevor du die verschiedenen Flüssigkeiten einfüllst.
		AI_Output(self,other,"Nov_1301_Caine_Traenke_Health3_06_02");	//Wenn du alles richtig machst, solltest du das gewünschte Ergebnis erhalten.
		KNOWS_HEILELIXIER = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Elixier heilender Kraft - 1 Wasser, 2 mittlere Heilkräuter, 1 starkes Heilkraut");
		if((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == TRUE) && (KNOWS_HEILPERMAESSENZ == FALSE))
		{
			Info_AddChoice(nov_1301_caine_traenke,"Essenz des Lebens (Kosten: 5 Lernpunkte)",nov_1301_caine_traenke_healthperma1);
		};
		if(((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_STRENGTHESSENZ == FALSE) && (Kapitel == 4)) || ((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == TRUE) && (KNOWS_STRENGTHESSENZ == FALSE) && (Kapitel == 4)))
		{
			Info_AddChoice(nov_1301_caine_traenke,"Essenz der Stärke (Kosten: 5 Lernpunkte)",nov_1301_caine_traenke_strengthperma1);
		};
		if(((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_STRENGTHESSENZ == FALSE) && (Kapitel == 4)) || ((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == TRUE) && (KNOWS_DEXESSENZ == FALSE) && (Kapitel == 4)))
		{
			Info_AddChoice(nov_1301_caine_traenke,"Essenz der Geschicklichkeit (Kosten: 5 Lernpunkte)",nov_1301_caine_traenke_dexperma1);
		};
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Zu wenig Lernpunkte!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void nov_1301_caine_traenke_mana1()
{
	AI_Output(other,self,"Nov_1301_Caine_Traenke_Mana1_15_00");	//Was muss ich tun?
	if(other.lp >= 1)
	{
		other.lp = other.lp - 1;
		B_GiveSkill(other,NPC_TALENT_REGENERATE,1,0);
		AI_Output(self,other,"Nov_1301_Caine_Traenke_Mana1_06_01");	//Achte darauf, dass du die Pflanzen und Kräuter zusammen in die Laborwasserflasche gibst, bevor du die verschiedenen Flüssigkeiten einfüllst.
		AI_Output(self,other,"Nov_1301_Caine_Traenke_Mana1_06_02");	//Wenn du alles richtig machst, solltest du das gewünschte Ergebnis erhalten.
		KNOWS_MANAESSENZ = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Essenz magischer Energie - 1 Alkohol, 1 Rabenkraut");
		if((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == FALSE))
		{
			Info_AddChoice(nov_1301_caine_traenke,"Extrakt magischer Energie (Kosten: 2 Lernpunkte)",nov_1301_caine_traenke_mana2);
		};
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Zu wenig Lernpunkte!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void nov_1301_caine_traenke_mana2()
{
	AI_Output(other,self,"Nov_1301_Caine_Traenke_Mana2_15_00");	//Was muss ich tun?
	if(other.lp >= 2)
	{
		other.lp = other.lp - 2;
		PrintScreen("Lerne: Extrakt magischer Energie",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"Nov_1301_Caine_Traenke_Mana2_06_01");	//Achte darauf, dass du die Pflanzen und Kräuter zusammen in die Laborwasserflasche gibst, bevor du die verschiedenen Flüssigkeiten einfüllst.
		AI_Output(self,other,"Nov_1301_Caine_Traenke_Mana2_06_02");	//Wenn du alles richtig machst, solltest du das gewünschte Ergebnis erhalten.
		KNOWS_MANAEXTRAKT = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Extrakt magischer Energie - 1 Alkohol, 2 Rabenkraut, 1 Dunkelkraut");
		if((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == FALSE))
		{
			Info_AddChoice(nov_1301_caine_traenke,"Elixier magischer Energie (Kosten: 3 Lernpunkte)",nov_1301_caine_traenke_mana3);
		};
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Zu wenig Lernpunkte!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void nov_1301_caine_traenke_mana3()
{
	AI_Output(other,self,"Nov_1301_Caine_Traenke_Mana3_15_00");	//Was muss ich tun?
	if(other.lp >= 3)
	{
		other.lp = other.lp - 3;
		PrintScreen("Lerne: Elixier magischer Energie",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"Nov_1301_Caine_Traenke_Mana3_06_01");	//Achte darauf, dass du die Pflanzen und Kräuter zusammen in die Laborwasserflasche gibst, bevor du die verschiedenen Flüssigkeiten einfüllst.
		AI_Output(self,other,"Nov_1301_Caine_Traenke_Mana3_06_02");	//Wenn du alles richtig machst, solltest du das gewünschte Ergebnis erhalten.
		KNOWS_MANAELIXIER = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Elixier magischer Energie - 1 Alkohol, 2 Dunkelkraut");
		if((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_MANAPERMAESSENZ == FALSE))
		{
			Info_AddChoice(nov_1301_caine_traenke,"Essenz des Geistes (Kosten: 5 Lernpunkte)",nov_1301_caine_traenke_manaperma1);
		};
		if(((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_STRENGTHESSENZ == FALSE) && (Kapitel == 4)) || ((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == TRUE) && (KNOWS_STRENGTHESSENZ == FALSE) && (Kapitel == 4)))
		{
			Info_AddChoice(nov_1301_caine_traenke,"Essenz der Stärke (Kosten: 5 Lernpunkte)",nov_1301_caine_traenke_strengthperma1);
		};
		if(((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_STRENGTHESSENZ == FALSE) && (Kapitel == 4)) || ((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == TRUE) && (KNOWS_DEXESSENZ == FALSE) && (Kapitel == 4)))
		{
			Info_AddChoice(nov_1301_caine_traenke,"Essenz der Geschicklichkeit (Kosten: 5 Lernpunkte)",nov_1301_caine_traenke_dexperma1);
		};
		if((Npc_GetTrueGuild(hero) == GIL_GUR) && (KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_PSIELIXIER == FALSE))
		{
			Info_AddChoice(nov_1301_caine_traenke,"Elixier (Kosten: 10 Lernpunkte)",nov_1301_caine_traenke_elixier);
		};
		if((Npc_GetTrueGuild(hero) == GIL_GUR) && (KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_PSICRAWLER == FALSE))
		{
			Info_AddChoice(nov_1301_caine_traenke,"Crawler-Elixier (Kosten: 10 Lernpunkte)",nov_1301_caine_traenke_crawlerelixier);
		};
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Zu wenig Lernpunkte!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void nov_1301_caine_traenke_manaperma1()
{
	AI_Output(other,self,"Nov_1301_Caine_Traenke_ManaPerma1_15_00");	//Was muss ich tun?
	if(other.lp >= 5)
	{
		other.lp = other.lp - 5;
		PrintScreen("Lerne: Essenz des Geistes",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"Nov_1301_Caine_Traenke_ManaPerma1_06_01");	//Achte darauf, dass du die Pflanzen und Kräuter zusammen in die Laborwasserflasche gibst, bevor du die verschiedenen Flüssigkeiten einfüllst.
		AI_Output(self,other,"Nov_1301_Caine_Traenke_ManaPerma1_06_02");	//Wenn du alles richtig machst, solltest du das gewünschte Ergebnis erhalten.
		KNOWS_MANAPERMAESSENZ = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Essenz des Geistes - 1 Alkohol, 2 Dunkelkraut, 1 Nachtschatten");
		if((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_MANAPERMAESSENZ == TRUE) && (KNOWS_MANAPERMAEXTRAKT == FALSE))
		{
			Info_AddChoice(nov_1301_caine_traenke,"Extrakt des Geistes (Kosten: 8 Lernpunkte)",nov_1301_caine_traenke_manaperma2);
		};
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Zu wenig Lernpunkte!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void nov_1301_caine_traenke_manaperma2()
{
	AI_Output(other,self,"Nov_1301_Caine_Traenke_ManaPerma2_15_00");	//Was muss ich tun?
	if(other.lp >= 8)
	{
		other.lp = other.lp - 8;
		PrintScreen("Lerne: Extrakt des Geistes",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"Nov_1301_Caine_Traenke_ManaPerma2_06_01");	//Achte darauf, dass du die Pflanzen und Kräuter zusammen in die Laborwasserflasche gibst, bevor du die verschiedenen Flüssigkeiten einfüllst.
		AI_Output(self,other,"Nov_1301_Caine_Traenke_ManaPerma2_06_02");	//Wenn du alles richtig machst, solltest du das gewünschte Ergebnis erhalten.
		KNOWS_MANAPERMAEXTRAKT = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Extrakt des Geistes - 1 Alkohol, 2 Dunkelkraut, 2 Nachtschatten");
		if((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_MANAPERMAESSENZ == TRUE) && (KNOWS_MANAPERMAEXTRAKT == TRUE) && (KNOWS_MANAPERMAELIXIER == FALSE))
		{
			Info_AddChoice(nov_1301_caine_traenke,"Elixier des Geistes (Kosten: 10 Lernpunkte)",nov_1301_caine_traenke_manaperma3);
		};
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Zu wenig Lernpunkte!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void nov_1301_caine_traenke_manaperma3()
{
	AI_Output(other,self,"Nov_1301_Caine_Traenke_ManaPerma3_15_00");	//Was muss ich tun?
	if(other.lp >= 10)
	{
		other.lp = other.lp - 10;
		PrintScreen("Lerne: Elixier des Geistes",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"Nov_1301_Caine_Traenke_ManaPerma3_06_01");	//Achte darauf, dass du die Pflanzen und Kräuter zusammen in die Laborwasserflasche gibst, bevor du die verschiedenen Flüssigkeiten einfüllst.
		AI_Output(self,other,"Nov_1301_Caine_Traenke_ManaPerma3_06_02");	//Wenn du alles richtig machst, solltest du das gewünschte Ergebnis erhalten.
		KNOWS_MANAPERMAELIXIER = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Elixier des Geistes - 1 Alkohol, 3 Dunkelkraut, 2 Mondschatten");
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Zu wenig Lernpunkte!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void nov_1301_caine_traenke_healthperma1()
{
	AI_Output(other,self,"Nov_1301_Caine_Traenke_HealthPerma1_15_00");	//Was muss ich tun?
	if(other.lp >= 5)
	{
		other.lp = other.lp - 5;
		PrintScreen("Lerne: Essenz des Lebens",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"Nov_1301_Caine_Traenke_HealthPerma1_06_01");	//Achte darauf, dass du die Pflanzen und Kräuter zusammen in die Laborwasserflasche gibst, bevor du die verschiedenen Flüssigkeiten einfüllst.
		AI_Output(self,other,"Nov_1301_Caine_Traenke_HealthPerma1_06_02");	//Wenn du alles richtig machst, solltest du das gewünschte Ergebnis erhalten.
		KNOWS_HEILPERMAESSENZ = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Essenz des Lebens - 1 Wasser, 2 starke Heilkräuter");
		if((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == TRUE) && (KNOWS_HEILPERMAESSENZ == TRUE) && (KNOWS_HEILPERMAEXTRAKT == FALSE))
		{
			Info_AddChoice(nov_1301_caine_traenke,"Extrakt des Lebens (Kosten: 8 Lernpunkte)",nov_1301_caine_traenke_healthperma2);
		};
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Zu wenig Lernpunkte!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void nov_1301_caine_traenke_healthperma2()
{
	AI_Output(other,self,"Nov_1301_Caine_Traenke_HealthPerma2_15_00");	//Was muss ich tun?
	if(other.lp >= 8)
	{
		other.lp = other.lp - 8;
		PrintScreen("Lerne: Extrakt des Lebens",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"Nov_1301_Caine_Traenke_HealthPerma2_06_01");	//Achte darauf, dass du die Pflanzen und Kräuter zusammen in die Laborwasserflasche gibst, bevor du die verschiedenen Flüssigkeiten einfüllst.
		AI_Output(self,other,"Nov_1301_Caine_Traenke_HealthPerma2_06_02");	//Wenn du alles richtig machst, solltest du das gewünschte Ergebnis erhalten.
		KNOWS_HEILPERMAEXTRAKT = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Extrakt des Lebens - 1 Wasser, 2 starke Heilkräuter, 1 Orkblatt");
		if((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == TRUE) && (KNOWS_HEILPERMAESSENZ == TRUE) && (KNOWS_HEILPERMAEXTRAKT == TRUE) && (KNOWS_HEILPERMAELIXIER == FALSE))
		{
			Info_AddChoice(nov_1301_caine_traenke,"Elixier des Lebens (Kosten: 10 Lernpunkte)",nov_1301_caine_traenke_healthperma3);
		};
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Zu wenig Lernpunkte!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void nov_1301_caine_traenke_healthperma3()
{
	AI_Output(other,self,"Nov_1301_Caine_Traenke_Health3_15_00");	//Was muss ich tun?
	if(other.lp >= 10)
	{
		other.lp = other.lp - 10;
		PrintScreen("Lerne: Elixier des Lebens",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"Nov_1301_Caine_Traenke_HealthPerma3_06_01");	//Achte darauf, dass du die Pflanzen und Kräuter zusammen in die Laborwasserflasche gibst, bevor du die verschiedenen Flüssigkeiten einfüllst.
		AI_Output(self,other,"Nov_1301_Caine_Traenke_HealthPerma3_06_02");	//Wenn du alles richtig machst, solltest du das gewünschte Ergebnis erhalten.
		KNOWS_HEILPERMAELIXIER = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Elixier des Lebens - 1 Wasser, 3 starke Heilkräuter, 2 Eichenblatt");
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Zu wenig Lernpunkte!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void nov_1301_caine_traenke_strengthperma1()
{
	AI_Output(other,self,"Nov_1301_Caine_Traenke_StrengthPerma1_15_00");	//Was muss ich tun?
	if(other.lp >= 5)
	{
		other.lp = other.lp - 5;
		PrintScreen("Lerne: Essenz der Stärke",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"Nov_1301_Caine_Traenke_StrengthPerma1_06_01");	//Achte darauf, dass du die Pflanzen und Kräuter zusammen in die Laborwasserflasche gibst, bevor du die verschiedenen Flüssigkeiten einfüllst.
		AI_Output(self,other,"Nov_1301_Caine_Traenke_StrengthPerma1_06_02");	//Wenn du alles richtig machst, solltest du das gewünschte Ergebnis erhalten.
		KNOWS_STRENGTHESSENZ = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Essenz der Stärke - 1 Wasser, 2 Orkblatt, 1 Trollkirsche");
		if(((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_STRENGTHESSENZ == TRUE) && (KNOWS_STRENGTHEXTRAKT == FALSE) && (Kapitel == 4)) || ((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == TRUE) && (KNOWS_STRENGTHESSENZ == TRUE) && (KNOWS_STRENGTHEXTRAKT == FALSE) && (Kapitel == 4)))
		{
			Info_AddChoice(nov_1301_caine_traenke,"Extrakt der Stärke (Kosten: 8 Lernpunkte)",nov_1301_caine_traenke_strengthperma2);
		};
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Zu wenig Lernpunkte!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void nov_1301_caine_traenke_strengthperma2()
{
	AI_Output(other,self,"Nov_1301_Caine_Traenke_StrengthPerma2_15_00");	//Was muss ich tun?
	if(other.lp >= 8)
	{
		other.lp = other.lp - 8;
		PrintScreen("Lerne: Extrakt der Stärke",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"Nov_1301_Caine_Traenke_StrengthPerma2_06_01");	//Achte darauf, dass du die Pflanzen und Kräuter zusammen in die Laborwasserflasche gibst, bevor du die verschiedenen Flüssigkeiten einfüllst.
		AI_Output(self,other,"Nov_1301_Caine_Traenke_StrengthPerma2_06_02");	//Wenn du alles richtig machst, solltest du das gewünschte Ergebnis erhalten.
		KNOWS_STRENGTHEXTRAKT = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Extrakt der Stärke - 1 Wasser, 3 Orkblatt, 1 Trollkirsche");
		if(((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_STRENGTHESSENZ == TRUE) && (KNOWS_STRENGTHEXTRAKT == TRUE) && (KNOWS_STRENGTHELIXIER == FALSE) && (Kapitel == 4)) || ((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == TRUE) && (KNOWS_STRENGTHESSENZ == TRUE) && (KNOWS_STRENGTHEXTRAKT == TRUE) && (KNOWS_STRENGTHELIXIER == FALSE) && (Kapitel == 4)))
		{
			Info_AddChoice(nov_1301_caine_traenke,"Elixier der Stärke (Kosten: 10 Lernpunkte)",nov_1301_caine_traenke_strengthperma3);
		};
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Zu wenig Lernpunkte!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void nov_1301_caine_traenke_strengthperma3()
{
	AI_Output(other,self,"Nov_1301_Caine_Traenke_StrengthPerma3_15_00");	//Was muss ich tun?
	if(other.lp >= 10)
	{
		other.lp = other.lp - 10;
		PrintScreen("Lerne: Elixier der Stärke",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"Nov_1301_Caine_Traenke_StrengthPerma3_06_01");	//Achte darauf, dass du die Pflanzen und Kräuter zusammen in die Laborwasserflasche gibst, bevor du die verschiedenen Flüssigkeiten einfüllst.
		AI_Output(self,other,"Nov_1301_Caine_Traenke_StrengthPerma3_06_02");	//Wenn du alles richtig machst, solltest du das gewünschte Ergebnis erhalten.
		KNOWS_STRENGTHELIXIER = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Elixier der Stärke - 1 Wasser, 4 Orkblatt, 1 Trollkirsche, 1 Drachenwurzel");
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Zu wenig Lernpunkte!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void nov_1301_caine_traenke_dexperma1()
{
	AI_Output(other,self,"Nov_1301_Caine_Traenke_DexPerma1_15_00");	//Was muss ich tun?
	if(other.lp >= 5)
	{
		other.lp = other.lp - 5;
		PrintScreen("Lerne: Essenz der Geschicklichkeit",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"Nov_1301_Caine_Traenke_DexPerma1_06_01");	//Achte darauf, dass du die Pflanzen und Kräuter zusammen in die Laborwasserflasche gibst, bevor du die verschiedenen Flüssigkeiten einfüllst.
		AI_Output(self,other,"Nov_1301_Caine_Traenke_DexPerma1_06_02");	//Wenn du alles richtig machst, solltest du das gewünschte Ergebnis erhalten.
		KNOWS_DEXESSENZ = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Essenz der Geschicklichkeit - 1 Alkohol, 2 Seraphis, 1 Flammendorn");
		if(((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_STRENGTHESSENZ == TRUE) && (KNOWS_STRENGTHEXTRAKT == FALSE) && (Kapitel == 4)) || ((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == TRUE) && (KNOWS_STRENGTHESSENZ == TRUE) && (KNOWS_STRENGTHEXTRAKT == FALSE) && (Kapitel == 4)))
		{
			Info_AddChoice(nov_1301_caine_traenke,"Extrakt der Geschicklichkeit (Kosten: 8 Lernpunkte)",nov_1301_caine_traenke_dexperma2);
		};
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Zu wenig Lernpunkte!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void nov_1301_caine_traenke_dexperma2()
{
	AI_Output(other,self,"Nov_1301_Caine_Traenke_DexPerma2_15_00");	//Was muss ich tun?
	if(other.lp >= 8)
	{
		other.lp = other.lp - 8;
		PrintScreen("Lerne: Extrakt der Geschicklichkeit",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"Nov_1301_Caine_Traenke_DexPerma2_06_01");	//Achte darauf, dass du die Pflanzen und Kräuter zusammen in die Laborwasserflasche gibst, bevor du die verschiedenen Flüssigkeiten einfüllst.
		AI_Output(self,other,"Nov_1301_Caine_Traenke_DexPerma2_06_02");	//Wenn du alles richtig machst, solltest du das gewünschte Ergebnis erhalten.
		KNOWS_DEXEXTRAKT = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Extrakt der Geschicklichkeit - 1 Alkohol, 3 Seraphis, 1 Flammendorn");
		if(((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_DEXESSENZ == TRUE) && (KNOWS_DEXEXTRAKT == TRUE) && (KNOWS_DEXELIXIER == FALSE) && (Kapitel == 4)) || ((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == TRUE) && (KNOWS_DEXESSENZ == TRUE) && (KNOWS_DEXEXTRAKT == TRUE) && (KNOWS_DEXELIXIER == FALSE) && (Kapitel == 4)))
		{
			Info_AddChoice(nov_1301_caine_traenke,"Elixier der Geschicklichkeit (Kosten: 10 Lernpunkte)",nov_1301_caine_traenke_dexperma3);
		};
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Zu wenig Lernpunkte!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void nov_1301_caine_traenke_dexperma3()
{
	AI_Output(other,self,"Nov_1301_Caine_Traenke_DexPerma3_15_00");	//Was muss ich tun?
	if(other.lp >= 10)
	{
		other.lp = other.lp - 10;
		PrintScreen("Lerne: Elixier der Geschicklichkeit",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"Nov_1301_Caine_Traenke_DexPerma3_06_01");	//Achte darauf, dass du die Pflanzen und Kräuter zusammen in die Laborwasserflasche gibst, bevor du die verschiedenen Flüssigkeiten einfüllst.
		AI_Output(self,other,"Nov_1301_Caine_Traenke_DexPerma3_06_02");	//Wenn du alles richtig machst, solltest du das gewünschte Ergebnis erhalten.
		KNOWS_DEXELIXIER = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Elixier der Geschicklichkeit - (1 Alkohol, 4 Seraphis, 1 Flammendorn, 1 Velayis");
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Zu wenig Lernpunkte!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void nov_1301_caine_traenke_elixier()
{
	AI_Output(other,self,"Nov_1301_Caine_Traenke_Elixier_15_00");	//Was muss ich tun?
	if(other.lp >= 10)
	{
		other.lp = other.lp - 10;
		PrintScreen("Lerne: Elixier",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"Nov_1301_Caine_Traenke_Elixier_06_01");	//Achte darauf, dass du die Pflanzen und Kräuter zusammen in die Laborwasserflasche gibst, bevor du die verschiedenen Flüssigkeiten einfüllst.
		AI_Output(self,other,"Nov_1301_Caine_Traenke_Elixier_06_02");	//Wenn du alles richtig machst, solltest du das gewünschte Ergebnis erhalten.
		KNOWS_PSIELIXIER = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Elixier -  1 Wasser, 2 Sumpfkraut, 1 Blutfliegensekret	");
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Zu wenig Lernpunkte!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void nov_1301_caine_traenke_crawlerelixier()
{
	AI_Output(other,self,"Nov_1301_Caine_Traenke_CrawlerElixier_15_00");	//Was muss ich tun?
	if(other.lp >= 10)
	{
		other.lp = other.lp - 10;
		PrintScreen("Lerne: Crawler-Elixier",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"Nov_1301_Caine_Traenke_CrawlerElixier_06_01");	//Achte darauf, dass du die Pflanzen und Kräuter zusammen in die Laborwasserflasche gibst, bevor du die verschiedenen Flüssigkeiten einfüllst.
		AI_Output(self,other,"Nov_1301_Caine_Traenke_CrawlerElixier_06_02");	//Wenn du alles richtig machst, solltest du das gewünschte Ergebnis erhalten.
		KNOWS_DEXELIXIER = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Crawler-Elixier - 1 Wasser, 4 Sumpfkraut, 4 Crawlerzangen");
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Zu wenig Lernpunkte!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};


instance NOV_1301_CAINE_WELCOME(C_Info)
{
	npc = Nov_1330_BaalParvez;
	condition = nov_1301_caine_welcome_condition;
	information = nov_1301_caine_welcome_info;
	important = 1;
	permanent = 0;
};


func int nov_1301_caine_welcome_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_GUR)
	{
		return TRUE;
	};
};

func void nov_1301_caine_welcome_info()
{
	AI_Output(self,other,"Nov_1301_Caine_WELCOME_Info_08_01");	//Du hast es in kurzer Zeit sehr weit gebracht, mein Freund. Von nun an bist du einer unserer Geistigen Führer.
	AI_StopProcessInfos(self);
};


instance DIA_CAINE_POTIONHELP(C_Info)
{
	npc = NOV_1301_Caine;
	nr = 1;
	condition = dia_caine_potionhelp_condition;
	information = dia_caine_potionhelp_info;
	permanent = 0;
	description = "Ich brauche deine Hilfe.";
};


func int dia_caine_potionhelp_condition()
{
	if((CorAngar_FindHerb == LOG_RUNNING) && (Npc_HasItems(other,ItFo_Plants_Herb_03) >= 5))
	{
		return 1;
	};
};

func void dia_caine_potionhelp_info()
{
	AI_Output(other,self,"DIA_Caine_PotionHelp_15_00");	//Ich brauche deine Hilfe.
	AI_Output(self,other,"DIA_Caine_PotionHelp_13_01");	//Was ist los?
	AI_Output(other,self,"DIA_Caine_PotionHelp_13_02");	//Y'Berion liegt im sterben und benötigt einen Heiltrank damit wir ihn retten können.
	AI_Output(other,self,"DIA_Caine_PotionHelp_13_03");	//Ich habe diese Heilkräuter gesammelt, damit du ihm daraus einen Heiltrank brauen kannst.
	AI_Output(self,other,"DIA_Caine_PotionHelp_13_04");	//Gut. Warte einen Moment.
	B_GiveInvItems(other,self,ItFo_Plants_Herb_03,5);
	Npc_RemoveInvItems(self,ItFo_Plants_Herb_03,5);
	AI_Output(self,other,"DIA_Caine_PotionHelp_13_05");	//So. Hier ist der Trank. Beeil dich besser!
	CreateInvItem(self,HealthWater);
	B_GiveInvItems(self,other,HealthWater,1);
};

