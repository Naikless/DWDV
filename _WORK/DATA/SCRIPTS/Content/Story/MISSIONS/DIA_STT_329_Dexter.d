
instance DIA_Dexter_Exit(C_Info)
{
	npc = STT_329_Dexter;
	nr = 999;
	condition = DIA_Dexter_Exit_Condition;
	information = DIA_Dexter_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Dexter_Exit_Condition()
{
	return 1;
};

func void DIA_Dexter_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Dexter_First(C_Info)
{
	npc = STT_329_Dexter;
	nr = 1;
	condition = DIA_Dexter_First_Condition;
	information = DIA_Dexter_First_Info;
	permanent = 0;
	important = 1;
};


func int DIA_Dexter_First_Condition()
{
	if(Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist)
	{
		return 1;
	};
};

func void DIA_Dexter_First_Info()
{
	AI_Output(self,other,"DIA_Dexter_IAmNew_10_00");	//Hey, du! Ich handele mit Sumpfkraut und Tr�nken aus dem Sektenlager. Willst du was?
};


instance DIA_Dexter_Kraut(C_Info)
{
	npc = STT_329_Dexter;
	nr = 1;
	condition = DIA_Dexter_Kraut_Condition;
	information = DIA_Dexter_Kraut_Info;
	permanent = 0;
	description = "Was ist Sumpfkraut?";
};


func int DIA_Dexter_Kraut_Condition()
{
	return 1;
};

func void DIA_Dexter_Kraut_Info()
{
	AI_Output(other,self,"DIA_Dexter_Kraut_15_00");	//Was ist Sumpfkraut?
	AI_Output(self,other,"DIA_Dexter_Kraut_10_01");	//Neu hier, was? Man kann es rauchen. Wirkt auf die meisten sehr entspannend.
};


instance DIA_Dexter_Trade(C_Info)
{
	npc = STT_329_Dexter;
	nr = 800;
	condition = DIA_Dexter_Trade_Condition;
	information = DIA_Dexter_Trade_Info;
	permanent = 1;
	description = "Zeig mir deine Ware.";
	trade = 1;
};


func int DIA_Dexter_Trade_Condition()
{
	return 1;
};

func void DIA_Dexter_Trade_Info()
{
	AI_Output(other,self,"DIA_Dexter_Trade_15_00");	//Zeig mir deine Ware.
	AI_Output(self,other,"DIA_Dexter_Trade_10_01");	//Ich habe hier nur den besten Stoff ...
	if(Dexter_Traded == FALSE)
	{
		Log_CreateTopic(GE_TraderOC,LOG_NOTE);
		B_LogEntry(GE_TraderOC,"Der Schatten Dexter am Marktplatz handelt mit Sumpfkraut und TR�NKEN aus dem Sektenlager.");
		Dexter_Traded = TRUE;
	};
};


var int Dexter_GetKalomsRecipe;

instance DIA_Dexter_JoinOC(C_Info)
{
	npc = STT_329_Dexter;
	nr = 1;
	condition = DIA_Dexter_JoinOC_Condition;
	information = DIA_Dexter_JoinOC_Info;
	permanent = 0;
	description = "Ich will mich dem Lager anschlie�en - ich will Schatten werden.";
};


func int DIA_Dexter_JoinOC_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_None)
	{
		return 1;
	};
};

func void DIA_Dexter_JoinOC_Info()
{
	AI_Output(other,self,"DIA_Dexter_JoinOC_15_00");	//Ich will mich dem Lager anschlie�en - ich will Schatten werden.
	AI_Output(self,other,"DIA_Dexter_JoinOC_10_01");	//So? Du suchst eine M�glichkeit, dich zu bew�hren?
	AI_Output(self,other,"DIA_Dexter_JoinOC_10_02");	//Gut - du kannst etwas f�r mich erledigen. Wenn du die Sache gut machst, leg' ich ein gutes Wort bei Diego f�r dich ein.
	AI_Output(other,self,"DIA_Dexter_JoinOC_15_03");	//Um was geht es?
	AI_Output(self,other,"DIA_Dexter_JoinOC_10_04");	//Im Sektenlager gibt es einen Mann, der Kalom hei�t. Ist ein ziemlich hohes Tier - einer der Gurus der Sekte.
	AI_Output(self,other,"DIA_Dexter_JoinOC_10_05");	//Kalom ist Alchimist. Er hat das Rezept f�r einen ziemlich wirkungsvollen Heiltrank.
	AI_Output(self,other,"DIA_Dexter_JoinOC_10_06");	//Ich will ihm das Rezept abkaufen, dann kann ich die Dinger selber herstellen.
	AI_Output(self,other,"DIA_Dexter_JoinOC_10_07");	//Aber an Kalom kommt niemand ran.
	AI_Output(other,self,"DIA_Dexter_JoinOC_15_08");	//Und was soll ich da machen?
	AI_Output(self,other,"DIA_Dexter_JoinOC_10_09");	//Die Sektenspinner sind dauernd auf der Suche nach neuen Leuten. Du bist neu hier. Tu einfach so, als wenn du dich anwerben lassen willst.
	AI_Output(self,other,"DIA_Dexter_JoinOC_10_10");	//Kalom ist einer der Gurus, das hei�t, er pr�ft die neuen Anw�rter. Wenn du mit ihm in Kontakt kommst. versuch, an das Rezept zu kommen.
	AI_Output(self,other,"DIA_Dexter_JoinOC_10_11");	//Ob du daf�r bezahlst oder nicht, ist mir egal.
	Info_ClearChoices(DIA_Dexter_JoinOC);
	Info_AddChoice(DIA_Dexter_JoinOC,"Okay - ich werd sehen, ob ich das Ding kriege.",DIA_Dexter_JoinOC_Ok);
	Info_AddChoice(DIA_Dexter_JoinOC,"H�rt sich nach ner schwierigen Sache an - wieviel ist f�r mich drin?",DIA_Dexter_JoinOC_HowMuch);
};

func void DIA_Dexter_JoinOC_Ok()
{
	AI_Output(other,self,"DIA_Dexter_JoinOC_Ok_15_00");	//Okay - ich werd sehen, ob ich das Ding kriege.
	Dexter_GetKalomsRecipe = LOG_RUNNING;
	Log_CreateTopic(CH1_KalomsRecipe,LOG_MISSION);
	Log_SetTopicStatus(CH1_KalomsRecipe,LOG_RUNNING);
	B_LogEntry(CH1_KalomsRecipe,"Der Schatten Dexter am Marktplatz hat mir aufgetragen, f�r ihn ein Rezept vom Guru Kalom im Sektenlager zu besorgen.");
	B_LogEntry(CH1_KalomsRecipe,"Dexter meinte, ich solle mich als Bewerber ins Sektenlager einschleichen.");
	Info_ClearChoices(DIA_Dexter_JoinOC);
};

func void DIA_Dexter_JoinOC_HowMuch()
{
	AI_Output(other,self,"DIA_Dexter_JoinOC_HowMuch_15_00");	//H�rt sich nach 'ner schwierigen Sache an - wie viel ist f�r mich drin?
	AI_Output(self,other,"DIA_Dexter_JoinOC_HowMuch_10_01");	//Irgendwann wird Diego mich fragen, ob du f�r uns geeignet bist. Rate mal, wovon meine Antwort abh�ngen wird.
	Info_AddChoice(DIA_Dexter_JoinOC,"Es kann sein, dass ich das Rezept bezahlen muss - gib mir 50 Erz Vorschu�.",DIA_Dexter_JoinOC_Advance);
};

func void DIA_Dexter_JoinOC_Advance()
{
	AI_Output(other,self,"DIA_Dexter_JoinOC_Advance_15_00");	//Es kann sein, dass ich f�r das Rezept bezahlen muss - gib mir 50 Erz als Vorschuss.
	AI_Output(self,other,"DIA_Dexter_JoinOC_Advance_10_01");	//Vergiss es.
	Info_AddChoice(DIA_Dexter_JoinOC,"Kein Erz - kein Rezept!",DIA_Dexter_JoinOC_Threat);
};

func void DIA_Dexter_JoinOC_Threat()
{
	AI_Output(other,self,"DIA_Dexter_JoinOC_Threat_15_00");	//Kein Erz - kein Rezept!
	AI_Output(self,other,"DIA_Dexter_JoinOC_Threat_10_01");	//Na sch�n! �ber das Erz k�nnen wir reden, wenn du das Rezept hast.
	Info_AddChoice(DIA_Dexter_JoinOC,"Ich will jetzt Erz sehen, oder du kannst dein Rezept selber abholen.",DIA_Dexter_JoinOC_OreNowOrElse);
};

func void DIA_Dexter_JoinOC_OreNowOrElse()
{
	AI_Output(other,self,"DIA_Dexter_JoinOC_OreNowOrElse_15_00");	//Nein! Ich will jetzt Erz sehen, oder du kannst dir dein Rezept selber holen.
	AI_Output(self,other,"DIA_Dexter_JoinOC_OreNowOrElse_10_01");	//Es gibt noch genug andere Neue, ich denke, ich sollte den Auftrag einem von denen geben ...
	Info_AddChoice(DIA_Dexter_JoinOC,"Gut! Vergessen wir die Sache.",DIA_Dexter_JoinOC_ForgetIt);
};

func void DIA_Dexter_JoinOC_ForgetIt()
{
	AI_Output(other,self,"DIA_Dexter_JoinOC_ForgetIt_15_00");	//Gut! Vergessen wir die Sache.
	AI_Output(self,other,"DIA_Dexter_JoinOC_ForgetIt_10_01");	//Nicht so schnell! Wollte nur wissen, wie weit du gehst ... 50 Erz ist ziemlich viel f�r einen Neuen, was denkst du?
	AI_Output(other,self,"DIA_Dexter_JoinOC_ForgetIt_15_02");	//Klingt schon besser.
	AI_Output(self,other,"DIA_Dexter_JoinOC_ForgetIt_10_03");	//Gut, gut, 50 Erzbrocken kann ich gerade noch entbehren. Entt�usch mich nicht, Kleiner!
	Dexter_GetKalomsRecipe = LOG_RUNNING;
	Log_CreateTopic(CH1_KalomsRecipe,LOG_MISSION);
	Log_SetTopicStatus(CH1_KalomsRecipe,LOG_RUNNING);
	B_LogEntry(CH1_KalomsRecipe,"Der Schatten Dexter am Marktplatz hat mir aufgetragen, f�r ihn ein Rezept vom Guru Kalom im Sektenlager zu besorgen.");
	B_LogEntry(CH1_KalomsRecipe,"Dexter meinte, ich solle mich als Bewerber ins Sektenlager einschleichen.");
	CreateInvItems(self,ItMiNugget,50);
	B_GiveInvItems(self,other,ItMiNugget,50);
	Info_ClearChoices(DIA_Dexter_JoinOC);
};


var int Dexter_PsiCamp;

instance DIA_Dexter_WhereST(C_Info)
{
	npc = STT_329_Dexter;
	nr = 800;
	condition = DIA_Dexter_WhereST_Condition;
	information = DIA_Dexter_WhereST_Info;
	permanent = 1;
	description = "Wo ist das Sektenlager?";
};


func int DIA_Dexter_WhereST_Condition()
{
	if(Dexter_GetKalomsRecipe == LOG_RUNNING)
	{
		return 1;
	};
};

func void DIA_Dexter_WhereST_Info()
{
	AI_Output(other,self,"DIA_Dexter_WhereST_15_00");	//Wo ist das Sektenlager?
	AI_Output(self,other,"DIA_Dexter_WhereST_10_01");	//Durch den S�dausgang aus dem Lager raus, dann immer �stlich halten. Am besten besorgst du dir eine Karte -
	if(Npc_HasItems(self,ItWrWorldmap) > 0)
	{
		AI_Output(self,other,"DIA_Dexter_WhereST_10_02");	//Ich hab' eine da f�r 50 Erz ...
	};
	AI_Output(other,self,"DIA_Dexter_WhereST_15_02");	//Der S�dausgang ist der umgest�rzte Turm, richtig?
	AI_Output(self,other,"DIA_Dexter_WhereST_10_03");	//Stimmt genau.
	if(!Dexter_PsiCamp)
	{
		B_LogEntry(CH1_KalomsRecipe,"Das Sektenlager befindet sich �stlich vom Alten Lager");
		Dexter_PsiCamp = TRUE;
	};
};


instance DIA_Dexter_KalomsRecipeSuccess(C_Info)
{
	npc = STT_329_Dexter;
	nr = 800;
	condition = DIA_Dexter_KalomsRecipeSuccess_Condition;
	information = DIA_Dexter_KalomsRecipeSuccess_Info;
	permanent = 1;
	description = "Ich hab' das Rezept, das du wolltest!";
};


func int DIA_Dexter_KalomsRecipeSuccess_Condition()
{
	if((Dexter_GetKalomsRecipe == LOG_RUNNING) && (Npc_HasItems(other,KalomsRecipe) > 0))
	{
		return 1;
	};
};

func void DIA_Dexter_KalomsRecipeSuccess_Info()
{
	AI_Output(other,self,"DIA_Dexter_KalomsRecipeSuccess_15_00");	//Ich hab' das Rezept, das du wolltest!
	AI_Output(self,other,"DIA_Dexter_KalomsRecipeSuccess_10_01");	//Sehr gut! Zeig her!
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Dexter_KalomsRecipeSuccess_10_02");	//Gut! Jetzt kann ich die Tr�nke selber herstellen.
	AI_Output(self,other,"DIA_Dexter_KalomsRecipeSuccess_10_03");	//Bist ein guter Mann! Werde Diego von der Sache erz�hlen!
	AI_Output(self,other,"DIA_Dexter_KalomsRecipeSuccess_10_04");	//Hier - nimm das - f�r deine M�hen...
	CreateInvItems(other,ItMiNugget,50);
	B_GiveInvItems(other,self,KalomsRecipe,1);
	Dexter_GetKalomsRecipe = LOG_SUCCESS;
	if(Npc_GetTrueGuild(hero) == GIL_None)
	{
		Log_SetTopicStatus(CH1_KalomsRecipe,LOG_SUCCESS);
		B_LogEntry(CH1_KalomsRecipe,"Dexter war beeindruckt. Seine Stimme bei Diego ist mir sicher.");
	}
	else
	{
		Log_SetTopicStatus(CH1_KalomsRecipe,LOG_SUCCESS);
		B_LogEntry(CH1_KalomsRecipe,"Dexter war beeindruckt. Leider bringt mir das nichts mehr, denn Schatten kann ich nicht mehr werden");
	};
	B_GiveXP(XP_DexterKalom);
};


instance INFO_DEXTER_GILBERT(C_Info)
{
	npc = STT_329_Dexter;
	nr = 700;
	condition = info_dexter_gilbert_condition;
	information = info_dexter_gilbert_info;
	permanent = 0;
	description = "Kennst du einen Gilbert?";
};


func int info_dexter_gilbert_condition()
{
	if(OC_BACK == LOG_RUNNING)
	{
		return 1;
	};
};

func void info_dexter_gilbert_info()
{
	AI_Output(other,self,"Info_Dexter_Gilbert_07_01");	//Kennst du einen Gilbert?
	AI_Output(self,other,"Info_Dexter_Gilbert_07_02");	//Nein, der sagt mir nichts.
	B_LogEntry(CH1_GILBERT,"Dexter kennt Gilbert nicht.");
};


instance STT_329_DEXTER_SECT(C_Info)
{
	npc = STT_329_Dexter;
	nr = 1;
	condition = stt_329_dexter_sect_condition;
	information = stt_329_dexter_sect_info;
	permanent = 1;
	description = "Was machst du denn hier?";
};


func int stt_329_dexter_sect_condition()
{
	if(((Kapitel == 2) && (Npc_GetTrueGuild(hero) == GIL_NOV)) || ((Kapitel == 2) && (Npc_GetTrueGuild(hero) == GIL_ORG)))
	{
		return 1;
	};
};

func void stt_329_dexter_sect_info()
{
	AI_Output(other,self,"STT_329_Dexter_Sect_15_00");	//Was machst du denn hier?
	AI_Output(self,other,"STT_329_Dexter_Sect_11_01");	//Raven, einer der Erzbarone unseres Lagers gab mir den Auftrag ins Sumpflager zu reisen.
	AI_Output(self,other,"STT_329_Dexter_Sect_15_02");	//Dacht' ich mir, ich k�nnt' mich bei Raven ein bisschen beliebt machen, kann ja nicht schaden.
	AI_Output(self,other,"STT_329_Dexter_Sect_11_03");	//Wenn du willst, k�nnen wir auch handeln. Ein weiterer Grund warum ich hier bin.
};

