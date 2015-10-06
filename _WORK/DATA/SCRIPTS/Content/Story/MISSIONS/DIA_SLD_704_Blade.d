
instance SLD_704_BLADE_EXIT(C_Info)
{
	npc = SLD_704_Blade;
	nr = 999;
	condition = sld_704_blade_exit_condition;
	information = sld_704_blade_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int sld_704_blade_exit_condition()
{
	return 1;
};

func void sld_704_blade_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BLADE_HELLO(C_Info)
{
	npc = SLD_704_Blade;
	nr = 1;
	condition = dia_blade_hello_condition;
	information = dia_blade_hello_info;
	permanent = 0;
	description = "Hi! Wer bist du?";
};


func int dia_blade_hello_condition()
{
	return 1;
};

func void dia_blade_hello_info()
{
	AI_Output(other,self,"DIA_Blade_Hello_13_00");	//Hi! Wer bist du?
	AI_Output(self,other,"DIA_Blade_Hello_15_01");	//Mich nennen hier alle Blade. Ich bin derjenige, der sich darum kümmert das die Waffen von unseren Jungs scharf bleiben.
	AI_Output(self,other,"DIA_Blade_Hello_11_01");	//Vor meiner Zeit in der Kolonie, war ich Waffenschmied bei der Armee. Deswegen bin ich der richtige für den Job.
	Log_CreateTopic(GE_TraderNC,LOG_NOTE);
	B_LogEntry(GE_TraderNC,"Blade kann mir Schmiedezubehör verkaufen.");
};


instance DIA_BLADE_TRADE(C_Info)
{
	npc = SLD_704_Blade;
	nr = 800;
	condition = dia_blade_trade_condition;
	information = dia_blade_trade_info;
	permanent = 1;
	description = "Hast du was zu verkaufen?";
	trade = 1;
};


func int dia_blade_trade_condition()
{
	if(Npc_KnowsInfo(hero,dia_blade_hello))
	{
		return TRUE;
	};
};

func void dia_blade_trade_info()
{
	AI_Output(other,self,"DIA_Blade_Trade_15_00");	//Hast du was zu verkaufen?
	AI_Output(self,other,"DIA_Blade_Trade_11_01");	//Ich kann dir Dinge verkaufen, die du zum schmieden brauchen wirst.
};


instance DIA_BLADE_LEARNNOT(C_Info)
{
	npc = SLD_704_Blade;
	nr = 1;
	condition = dia_blade_learnnot_condition;
	information = dia_blade_learnnot_info;
	permanent = 0;
	description = "Kann ich was von dir lernen?";
};


func int dia_blade_learnnot_condition()
{
	if(Npc_KnowsInfo(hero,dia_blade_hello))
	{
		return TRUE;
	};
};

func void dia_blade_learnnot_info()
{
	AI_Output(other,self,"DIA_Blade_LearnNOT_15_00");	//Kann ich was von dir lernen?
	AI_Output(self,other,"DIA_Blade_LearnNOT_11_01");	//Wenn du dich unserem Lager angeschlossen hast schon.
	AI_Output(self,other,"DIA_Blade_LearnNOT_11_02");	//Als Bandit kann ich dir die Grundlagen beibringen. Wenn du einer von uns wärst, würde ich dir mehr zeigen.
	Log_CreateTopic(GE_TeacherNC,LOG_NOTE);
	B_LogEntry(GE_TeacherNC,"Der Söldner Blade kann mir das Schmieden beibringen.");
};


instance DIA_BLADE_LEARNYES(C_Info)
{
	npc = SLD_704_Blade;
	nr = 1;
	condition = dia_blade_learnyes_condition;
	information = dia_blade_learnyes_info;
	permanent = 1;
	description = "Was kannst du mir beibringen?";
};


func int dia_blade_learnyes_condition()
{
	if(((Npc_GetTrueGuild(hero) == GIL_ORG) && Npc_KnowsInfo(hero,dia_blade_learnnot)) || ((Npc_GetTrueGuild(hero) == GIL_SLD) && Npc_KnowsInfo(hero,dia_blade_learnnot)))
	{
		return TRUE;
	};
};

func void dia_blade_learnyes_info()
{
	AI_Output(other,self,"DIA_Blade_LearnYES_15_00");	//Was kannst du mir beibringen?
	AI_Output(self,other,"DIA_Blade_LearnYES_11_01");	//Ich kann dir einige Sachen über's schmieden beibringen.
	AI_Output(self,other,"DIA_Blade_LearnYES_11_02");	//Du musst mir nur sagen was du wissen willst.
	Info_ClearChoices(dia_blade_learnyes);
	Info_AddChoice(dia_blade_learnyes,DIALOG_BACK,dia_blade_learnyes_back);
	if(((KNOWS_AXT == FALSE) && (Kapitel > 1) && (Npc_GetTrueGuild(hero) == GIL_ORG)) || ((Npc_GetTrueGuild(hero) == GIL_SLD) && (Kapitel > 1) && (KNOWS_AXT == FALSE)))
	{
		Info_AddChoice(dia_blade_learnyes,"Morgenstern (Kosten: 1 Lernpunkt)",dia_blade_learnyes_axt);
	};
	if(((KNOWS_AXT == TRUE) && (KNOWS_STAHLGEFLECHT == FALSE) && (Kapitel > 1) && (Npc_GetTrueGuild(hero) == GIL_ORG)) || ((Npc_GetTrueGuild(hero) == GIL_SLD) && (Kapitel > 1) && (KNOWS_STAHLGEFLECHT == FALSE) && (KNOWS_AXT == TRUE)))
	{
		Info_AddChoice(dia_blade_learnyes,"Stahlgeflecht (Kosten: 2 Lernpunkte)",dia_blade_learnyes_stahlgeflecht);
	};
	if(((KNOWS_AXT == TRUE) && (KNOWS_STAHLGEFLECHT == TRUE) && (KNOWS_STEINBRECHER == FALSE) && (Kapitel > 1) && (Npc_GetTrueGuild(hero) == GIL_ORG)) || ((Npc_GetTrueGuild(hero) == GIL_SLD) && (Kapitel > 1) && (KNOWS_STEINBRECHER == FALSE) && (KNOWS_STAHLGEFLECHT == TRUE) && (KNOWS_AXT == TRUE)))
	{
		Info_AddChoice(dia_blade_learnyes,"Steinbrecher (Kosten: 3 Lernpunkte)",dia_blade_learnyes_steinbrecher);
	};
	if((KNOWS_SöLDNERKLINGE == FALSE) && (KNOWS_AXT == TRUE) && (KNOWS_STEINBRECHER == TRUE) && (KNOWS_STAHLGEFLECHT == TRUE) && (Kapitel > 2) && (Npc_GetTrueGuild(hero) == GIL_SLD))
	{
		Info_AddChoice(dia_blade_learnyes,"Leichte Streitaxt (Kosten: 4 Lernpunkte)",dia_blade_learnyes_söldnerklinge);
	};
	if((KNOWS_ZWEIHåNDER == FALSE) && (KNOWS_SöLDNERKLINGE == TRUE) && (KNOWS_AXT == TRUE) && (KNOWS_STEINBRECHER == TRUE) && (KNOWS_STAHLGEFLECHT == TRUE) && (Kapitel > 3) && (Npc_GetTrueGuild(hero) == GIL_SLD))
	{
		Info_AddChoice(dia_blade_learnyes,"Streitaxt (Kosten: 5 Lernpunkte)",dia_blade_learnyes_zweihånder);
	};
	if((KNOWS_ZORNSTAHL == FALSE) && (KNOWS_ZWEIHåNDER == TRUE) && (KNOWS_SöLDNERKLINGE == TRUE) && (KNOWS_AXT == TRUE) && (KNOWS_STEINBRECHER == TRUE) && (KNOWS_STAHLGEFLECHT == TRUE) && (Kapitel > 4) && (Npc_GetTrueGuild(hero) == GIL_SLD))
	{
		Info_AddChoice(dia_blade_learnyes,"Kriegerstimme (Kosten: 6 Lernpunkte)",dia_blade_learnyes_zornstahl);
	};
};

func void dia_blade_learnyes_back()
{
	Info_ClearChoices(dia_blade_learnyes);
};

func void dia_blade_learnyes_axt()
{
	AI_Output(other,self,"DIA_Blade_LearnYES_15_02");	//Was muss ich tun?
	if(hero.lp >= 1)
	{
		hero.lp = hero.lp - 1;
		AI_Output(self,other,"DIA_Blade_LearnYES_09_03");	//Du nimmst den Rohstahl und hälst ihn ins Feuer.
		AI_Output(self,other,"DIA_Blade_LearnYES_09_04");	//Dann benutzt du den Schmiedehammer und bearbeitest den Stahl am Amboss.
		AI_Output(self,other,"DIA_Blade_LearnYES_09_05");	//Den Wassereimer, benutzt du um die Klinge zu härten.
		AI_Output(self,other,"DIA_Blade_LearnYES_09_06");	//Als letztes muss die Klinge am Schleifstein geschärft werden.
		Log_CreateTopic(GE_SMITH,LOG_NOTE);
		B_LogEntry(GE_SMITH,"Jetzt kann ich einen Morgenstern schmieden.");
		KNOWS_AXT = TRUE;
		B_GiveSkill(other,NPC_TALENT_FIREMASTER,1,0);
	}
	else
	{
		PrintScreen("Zu wenig Lernpunkte!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

func void dia_blade_learnyes_stahlgeflecht()
{
	AI_Output(other,self,"DIA_Blade_LearnYES_15_02");	//Was muss ich tun?
	if(hero.lp >= 2)
	{
		hero.lp = hero.lp - 2;
		AI_Output(self,other,"DIA_Blade_LearnYES_09_03");	//Du nimmst den Rohstahl und hälst ihn ins Feuer.
		AI_Output(self,other,"DIA_Blade_LearnYES_09_04");	//Dann benutzt du den Schmiedehammer und bearbeitest den Stahl am Amboss.
		AI_Output(self,other,"DIA_Blade_LearnYES_09_05");	//Den Wassereimer, benutzt du um die Klinge zu härten.
		AI_Output(self,other,"DIA_Blade_LearnYES_09_06");	//Als letztes muss die Klinge am Schleifstein geschärft werden.
		Log_CreateTopic(GE_SMITH,LOG_NOTE);
		B_LogEntry(GE_SMITH,"Jetzt kann ich ein Stahlgeflecht schmieden.");
		KNOWS_STAHLGEFLECHT = TRUE;
		PrintScreen("Lerne: Stahlgeflecht schmieden",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Zu wenig Lernpunkte!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

func void dia_blade_learnyes_steinbrecher()
{
	AI_Output(other,self,"DIA_Blade_LearnYES_15_02");	//Was muss ich tun?
	if(hero.lp >= 3)
	{
		hero.lp = hero.lp - 3;
		AI_Output(self,other,"DIA_Blade_LearnYES_09_03");	//Du nimmst den Rohstahl und hälst ihn ins Feuer.
		AI_Output(self,other,"DIA_Blade_LearnYES_09_04");	//Dann benutzt du den Schmiedehammer und bearbeitest den Stahl am Amboss.
		AI_Output(self,other,"DIA_Blade_LearnYES_09_05");	//Den Wassereimer, benutzt du um die Klinge zu härten.
		AI_Output(self,other,"DIA_Blade_LearnYES_09_06");	//Als letztes muss die Klinge am Schleifstein geschärft werden.
		Log_CreateTopic(GE_SMITH,LOG_NOTE);
		B_LogEntry(GE_SMITH,"Jetzt kann ich einen Steinbrecher schmieden.");
		KNOWS_STEINBRECHER = TRUE;
		PrintScreen("Lerne: Steinbrecher schmieden",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Zu wenig Lernpunkte!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

func void dia_blade_learnyes_söldnerklinge()
{
	AI_Output(other,self,"DIA_Blade_LearnYES_15_02");	//Was muss ich tun?
	if(hero.lp >= 4)
	{
		hero.lp = hero.lp - 4;
		AI_Output(self,other,"DIA_Blade_LearnYES_09_03");	//Du nimmst den Rohstahl und hälst ihn ins Feuer.
		AI_Output(self,other,"DIA_Blade_LearnYES_09_04");	//Dann benutzt du den Schmiedehammer und bearbeitest den Stahl am Amboss.
		AI_Output(self,other,"DIA_Blade_LearnYES_09_05");	//Den Wassereimer, benutzt du um die Klinge zu härten.
		AI_Output(self,other,"DIA_Blade_LearnYES_09_06");	//Als letztes muss die Klinge am Schleifstein geschärft werden.
		Log_CreateTopic(GE_SMITH,LOG_NOTE);
		B_LogEntry(GE_SMITH,"Ab jetzt werde ich die leichte Streitaxt schmieden können.");
		KNOWS_SöLDNERKLINGE = TRUE;
		PrintScreen("Lerne: Leichte Streitaxt schmieden",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Zu wenig Lernpunkte!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

func void dia_blade_learnyes_zweihånder()
{
	AI_Output(other,self,"DIA_Blade_LearnYES_15_02");	//Was muss ich tun?
	if(hero.lp >= 5)
	{
		hero.lp = hero.lp - 5;
		AI_Output(self,other,"DIA_Blade_LearnYES_09_03");	//Du nimmst den Rohstahl und hälst ihn ins Feuer.
		AI_Output(self,other,"DIA_Blade_LearnYES_09_04");	//Dann benutzt du den Schmiedehammer und bearbeitest den Stahl am Amboss.
		AI_Output(self,other,"DIA_Blade_LearnYES_09_05");	//Den Wassereimer, benutzt du um die Klinge zu härten.
		AI_Output(self,other,"DIA_Blade_LearnYES_09_06");	//Als letztes muss die Klinge am Schleifstein geschärft werden.
		Log_CreateTopic(GE_SMITH,LOG_NOTE);
		B_LogEntry(GE_SMITH,"Eine Streitaxt zu schmieden ist ab jetzt kein Problem mehr.");
		KNOWS_ZWEIHåNDER = TRUE;
		PrintScreen("Lerne: Streitaxt schmieden",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Zu wenig Lernpunkte!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

func void dia_blade_learnyes_zornstahl()
{
	AI_Output(other,self,"DIA_Blade_LearnYES_15_02");	//Was muss ich tun?
	if(hero.lp >= 6)
	{
		hero.lp = hero.lp - 6;
		AI_Output(self,other,"DIA_Blade_LearnYES_09_03");	//Du nimmst den Rohstahl und hälst ihn ins Feuer.
		AI_Output(self,other,"DIA_Blade_LearnYES_09_04");	//Dann benutzt du den Schmiedehammer und bearbeitest den Stahl am Amboss.
		AI_Output(self,other,"DIA_Blade_LearnYES_09_05");	//Den Wassereimer, benutzt du um die Klinge zu härten.
		AI_Output(self,other,"DIA_Blade_LearnYES_09_06");	//Als letztes muss die Klinge am Schleifstein geschärft werden.
		Log_CreateTopic(GE_SMITH,LOG_NOTE);
		B_LogEntry(GE_SMITH,"Die Kriegerstimme ist ab jetzt kein Geheimnis mehr.");
		KNOWS_ZORNSTAHL = TRUE;
		PrintScreen("Lerne: Kriegerstimme schmieden",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Zu wenig Lernpunkte!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};


instance DIA_BLADE_SMITH(C_Info)
{
	npc = SLD_704_Blade;
	nr = 1;
	condition = dia_blade_smith_condition;
	information = dia_blade_smith_info;
	permanent = 0;
	description = "Ich hätte eine neue Aufgabe für dich.";
};


func int dia_blade_smith_condition()
{
	if(FMC_SMITH == LOG_RUNNING)
	{
		return 1;
	};
};

func void dia_blade_smith_info()
{
	AI_Output(other,self,"DIA_Blade_SMITH_13_00");	//Ich hätte eine neue Aufgabe für dich.
	AI_Output(self,other,"DIA_Blade_SMITH_15_01");	//Ach? Und die wäre?
	AI_Output(other,self,"DIA_Blade_SMITH_11_02");	//Die Söldner bei der freien Mine bräuchten einen neuen Schmied in ihrem Lager.
	AI_Output(other,self,"DIA_Blade_SMITH_11_03");	//Die Schmiede im Kessel steht jetzt schon seit einiger Zeit still.
	AI_Output(self,other,"DIA_Blade_SMITH_11_04");	//Und warum sollte ich da anfangen zu arbeiten?
	AI_Output(other,self,"DIA_Blade_SMITH_11_05");	//Nun, dass ist doch besser als den ganzen Tag hier rumzustehen und nichts zu tun zu haben.
	AI_Output(self,other,"DIA_Blade_SMITH_11_06");	//Hmm, okay hast ja recht. Ich werd' meinen Arsch dann mal dahin bewegen.
	AI_Output(self,other,"DIA_Blade_SMITH_11_07");	//Wir sehn' uns später.
	Npc_ExchangeRoutine(self,"FREEMINECAMP");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FREEMINECAMP");
	B_LogEntry(CH1_FMCSMITH,"Blade hat eingewilligt in der freien Mine zu arbeiten. Er begab sich sofort zu seinem neuen Arbeitsplatz.");
};


instance DIA_BLADE_WHY(C_Info)
{
	npc = SLD_704_Blade;
	nr = 1;
	condition = dia_blade_why_condition;
	information = dia_blade_why_info;
	permanent = 0;
	description = "Warum bist du hier und nicht mehr im Kessel?";
};


func int dia_blade_why_condition()
{
	if((FMTaken == TRUE) && (FMC_SMITH == LOG_SUCCESS))
	{
		return 1;
	};
};

func void dia_blade_why_info()
{
	AI_Output(other,self,"DIA_Blade_WHY_13_00");	//Warum bist du hier und nicht mehr im Kessel?
	AI_Output(self,other,"DIA_Blade_WHY_15_01");	//Noch nicht gehört? Gomez' Leute haben die freie Mine angegriffen.
	AI_Output(self,other,"DIA_Blade_WHY_11_02");	//Okyl und seine Leute sind alle tot.
	AI_Output(self,other,"DIA_Blade_WHY_11_03");	//Ich hatte das Glück, dass ich zu der Zeit im Lager war um mir Vorräte zu holen.
	AI_Output(self,other,"DIA_Blade_WHY_11_04");	//Ich leb' wahrscheinlich nur deswegen noch.
};

