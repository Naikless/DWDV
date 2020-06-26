
instance KDF_401_Damarok_WELCOME(C_Info)
{
	npc = KDF_401_Damarok;
	condition = KDF_401_Damarok_WELCOME_Condition;
	information = KDF_401_Damarok_WELCOME_Info;
	important = 1;
	permanent = 0;
};


func int KDF_401_Damarok_WELCOME_Condition()
{
	if(Npc_KnowsInfo(hero,KDF_402_Corristo_ROBE) && Npc_KnowsInfo(hero,KDF_403_Drago_RUNE) && Npc_KnowsInfo(hero,KDF_405_Torrez_BOOK) && (Npc_GetDistToNpc(hero,self) < 1000))
	{
		return TRUE;
	};
};

func void KDF_401_Damarok_WELCOME_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"KDF_401_Damarok_WELCOME_Info_14_01");	//Möge das Feuer dich allzeit beschützen!
	Corristo_KDFAufnahme = 6;
	B_Story_Feueraufnahme();
	AI_StopProcessInfos(self);
};


instance KDF_401_Damarok_Exit(C_Info)
{
	npc = KDF_401_Damarok;
	nr = 999;
	condition = KDF_401_Damarok_Exit_Condition;
	information = KDF_401_Damarok_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int KDF_401_Damarok_Exit_Condition()
{
	return TRUE;
};

func void KDF_401_Damarok_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance KDF_401_Damarok_HEAL(C_Info)
{
	npc = KDF_401_Damarok;
	condition = KDF_401_Damarok_HEAL_Condition;
	information = KDF_401_Damarok_HEAL_Info;
	important = 1;
	permanent = 0;
};


func int KDF_401_Damarok_HEAL_Condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_KDF) && Npc_IsInRoutine(self,Rtn_start_401))
	{
		return TRUE;
	};
};

func void KDF_401_Damarok_HEAL_Info()
{
	AI_Output(self,other,"KDF_401_Damarok_HEAL_Info_14_01");	//Wenn du Schaden nehmen solltest, werde ich dich heilen.
	AI_StopProcessInfos(self);
};


instance KDF_401_Damarok_HEALINFO(C_Info)
{
	npc = KDF_401_Damarok;
	nr = 100;
	condition = KDF_401_Damarok_HEALINFO_Condition;
	information = KDF_401_Damarok_HEALINFO_Info;
	important = 0;
	permanent = 1;
	description = "Ich bin verletzt. Kannst du mich heilen?";
};


func int KDF_401_Damarok_HEALINFO_Condition()
{
	if((hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX]) && (Npc_GetTrueGuild(hero) == GIL_KDF))
	{
		return TRUE;
	};
};

func void KDF_401_Damarok_HEALINFO_Info()
{
	AI_Output(other,self,"KDF_401_Damarok_HEALINFO_Info_15_01");	//Ich bin verletzt. Kannst du mich heilen?
	AI_Output(self,other,"KDF_401_Damarok_HEALINFO_Info_14_02");	//Der Körper gesundet, der Geist wird klar.
	Snd_Play("MFX_Heal_Cast");
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
};


var int lernen_darf;

instance KDF_401_DAMAROK_LERNEN(C_Info)
{
	npc = KDF_401_Damarok;
	condition = kdf_401_damarok_lernen_condition;
	information = kdf_401_damarok_lernen_info;
	important = 0;
	permanent = 1;
	description = "Kannst du mir was beibringen?";
};


func int kdf_401_damarok_lernen_condition()
{
	if(LERNEN_DARF == FALSE)
	{
		return TRUE;
	};
};

func void kdf_401_damarok_lernen_info()
{
	AI_Output(other,self,"KDF_401_Damarok_LERNEN_Info_14_01");	//Kannst du mir was beibringen?
	if(Npc_GetTrueGuild(hero) == GIL_KDF)
	{
		Log_CreateTopic(GE_TeacherOC,LOG_NOTE);
		B_LogEntry(GE_TeacherOC,"Damarok, der Alchemist der Feuermagier kann mich in der Lehre der Alchemie unterrichten.");
		AI_Output(self,other,"KDF_401_Damarok_LERNEN_Info_14_02");	//Ich kann dich die Kunst der Alchemie lehren.
		AI_Output(self,other,"KDF_401_Damarok_LERNEN_Info_14_03");	//Es gibt eine Vielzahl von alchemischen Substanzen, die alle eine verschiedene Wirkung auf Körper und Geist haben.
		AI_Output(self,other,"KDF_401_Damarok_LERNEN_Info_14_04");	//Wenn es dein Wunsch ist, werde ich dich unterweisen.
		LERNEN_DARF = TRUE;
	}
	else
	{
		AI_Output(self,other,"KDF_401_Damarok_LERNEN_Info_14_05");	//Ich unterrichte nur Magier vom Kreis des Feuers.
		AI_Output(self,other,"KDF_401_Damarok_LERNEN_Info_14_06");	//Solange du dich nicht in den Dienst Innos gestellt hast, werde ich dir nichts beibringen.
	};
};


instance KDF_401_DAMAROK_TRAENKE(C_Info)
{
	npc = KDF_401_Damarok;
	condition = kdf_401_damarok_traenke_condition;
	information = kdf_401_damarok_traenke_info;
	important = 0;
	permanent = 1;
	description = "Welche Tränke kannst du mir beibringen?";
};


func int kdf_401_damarok_traenke_condition()
{
	if((LERNEN_DARF == TRUE) && (Npc_GetTrueGuild(hero) == GIL_KDF))
	{
		return TRUE;
	};
};

func void kdf_401_damarok_traenke_info()
{
	AI_Output(other,self,"KDF_401_Damarok_Traenke_Info_14_01");	//Welche Tränke kannst du mir beibringen?
	AI_Output(self,other,"KDF_401_Damarok_Traenke_Info_14_02");	//Ich kenne die Rezepturen von Heil- und Manatraenken.
	Info_ClearChoices(kdf_401_damarok_traenke);
	Info_AddChoice(kdf_401_damarok_traenke,DIALOG_BACK,kdf_401_damarok_traenke_back);
	if(KNOWS_HEILESSENZ == FALSE)
	{
		Info_AddChoice(kdf_401_damarok_traenke,"Essenz heilender Kraft (Kosten: 1 Lernpunkt)",kdf_401_damarok_traenke_health1);
	};
	if((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == FALSE))
	{
		Info_AddChoice(kdf_401_damarok_traenke,"Extrakt heilender Kraft (Kosten: 2 Lernpunkte)",kdf_401_damarok_traenke_health2);
	};
	if((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == FALSE))
	{
		Info_AddChoice(kdf_401_damarok_traenke,"Elixier heilender Kraft (Kosten: 3 Lernpunkte)",kdf_401_damarok_traenke_health3);
	};
	if(KNOWS_MANAESSENZ == FALSE)
	{
		Info_AddChoice(kdf_401_damarok_traenke,"Essenz magischer Energie (Kosten: 1 Lernpunkt)",kdf_401_damarok_traenke_mana1);
	};
	if((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == FALSE))
	{
		Info_AddChoice(kdf_401_damarok_traenke,"Extrakt magischer Energie (Kosten: 2 Lernpunkte)",kdf_401_damarok_traenke_mana2);
	};
	if((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == FALSE))
	{
		Info_AddChoice(kdf_401_damarok_traenke,"Elixier magischer Energie (Kosten: 3 Lernpunkte)",kdf_401_damarok_traenke_mana3);
	};
	if((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == TRUE) && (KNOWS_HEILPERMAESSENZ == FALSE))
	{
		Info_AddChoice(kdf_401_damarok_traenke,"Essenz des Lebens (Kosten: 5 Lernpunkte)",kdf_401_damarok_traenke_healthperma1);
	};
	if((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == TRUE) && (KNOWS_HEILPERMAESSENZ == TRUE) && (KNOWS_HEILPERMAEXTRAKT == FALSE))
	{
		Info_AddChoice(kdf_401_damarok_traenke,"Extrakt des Lebens (Kosten: 8 Lernpunkte)",kdf_401_damarok_traenke_healthperma2);
	};
	if((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == TRUE) && (KNOWS_HEILPERMAESSENZ == TRUE) && (KNOWS_HEILPERMAEXTRAKT == TRUE) && (KNOWS_HEILPERMAELIXIER == FALSE))
	{
		Info_AddChoice(kdf_401_damarok_traenke,"Elixier des Lebens (Kosten: 10 Lernpunkte)",kdf_401_damarok_traenke_healthperma3);
	};
	if((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_MANAPERMAESSENZ == FALSE))
	{
		Info_AddChoice(kdf_401_damarok_traenke,"Essenz des Geistes (Kosten: 5 Lernpunkte)",kdf_401_damarok_traenke_manaperma1);
	};
	if((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_MANAPERMAESSENZ == TRUE) && (KNOWS_MANAPERMAEXTRAKT == FALSE))
	{
		Info_AddChoice(kdf_401_damarok_traenke,"Extrakt des Geistes (Kosten: 8 Lernpunkte)",kdf_401_damarok_traenke_manaperma2);
	};
	if((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_MANAPERMAESSENZ == TRUE) && (KNOWS_MANAPERMAEXTRAKT == TRUE) && (KNOWS_MANAPERMAELIXIER == FALSE))
	{
		Info_AddChoice(kdf_401_damarok_traenke,"Elixier des Geistes (Kosten: 10 Lernpunkte)",kdf_401_damarok_traenke_manaperma3);
	};
};

func void kdf_401_damarok_traenke_back()
{
	Info_ClearChoices(kdf_401_damarok_traenke);
};

func void kdf_401_damarok_traenke_health1()
{
	AI_Output(other,self,"KDF_401_Damarok_Traenke_Health1_15_00");	//Was muss ich tun?
	if(other.lp >= 1)
	{
		other.lp = other.lp - 1;
		B_GiveSkill(other,NPC_TALENT_REGENERATE,1,0);
		AI_Output(self,other,"KDF_401_Damarok_Traenke_Health1_06_01");	//Als erstes musst du die Zutaten in die Laborwasserflasche geben. Erst danach kommt das Wasser.
		AI_Output(self,other,"KDF_401_Damarok_Traenke_Health1_06_02");	//Achte einfach nur darauf, dass du diese Reihenfolge einhälst und die Alchemie wird ab sofort dein Verbündeter sein.
		KNOWS_HEILESSENZ = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Essenz heilender Kraft - 1 Wasser, 1 leichtes Heilkraut");
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Zu wenig Lernpunkte!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void kdf_401_damarok_traenke_health2()
{
	AI_Output(other,self,"KDF_401_Damarok_Traenke_Health2_15_00");	//Was muss ich tun?
	if(other.lp >= 2)
	{
		other.lp = other.lp - 2;
		PrintScreen("Lerne: Extrakt heilender Kraft",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDF_401_Damarok_Traenke_Health2_06_01");	//Als erstes musst du die Zutaten in die Laborwasserflasche geben. Erst danach kommt das Wasser.
		AI_Output(self,other,"KDF_401_Damarok_Traenke_Health2_06_02");	//Achte einfach nur darauf, dass du diese Reihenfolge einhälst und die Alchemie wird ab sofort dein Verbündeter sein.
		KNOWS_HEILEXTRAKT = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Extrakt heilender Kraft - 1 Wasser, 2 leichte Heilkräuter, 1 mittleres Heilkraut");
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Zu wenig Lernpunkte!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void kdf_401_damarok_traenke_health3()
{
	AI_Output(other,self,"KDF_401_Damarok_Traenke_Health3_15_00");	//Was muss ich tun?
	if(other.lp >= 3)
	{
		other.lp = other.lp - 3;
		PrintScreen("Lerne: Elixier heilender Kraft",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDF_401_Damarok_Traenke_Health3_06_01");	//Als erstes musst du die Zutaten in die Laborwasserflasche geben. Erst danach kommt das Wasser.
		AI_Output(self,other,"KDF_401_Damarok_Traenke_Health3_06_02");	//Achte einfach nur darauf, dass du diese Reihenfolge einhälst und die Alchemie wird ab sofort dein Verbündeter sein.
		KNOWS_HEILELIXIER = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Elixier heilender Kraft - 1 Wasser, 2 mittlere Heilkräuter, 1 starkes Heilkraut");
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Zu wenig Lernpunkte!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void kdf_401_damarok_traenke_mana1()
{
	AI_Output(other,self,"KDF_401_Damarok_Traenke_Mana1_15_00");	//Was muss ich tun?
	if(other.lp >= 1)
	{
		other.lp = other.lp - 1;
		B_GiveSkill(other,NPC_TALENT_REGENERATE,1,0);
		AI_Output(self,other,"KDF_401_Damarok_Traenke_Mana1_06_01");	//Als erstes musst du die Zutaten in die Laborwasserflasche geben. Erst danach kommt das Wasser.
		AI_Output(self,other,"KDF_401_Damarok_Traenke_Mana1_06_02");	//Achte einfach nur darauf, dass du diese Reihenfolge einhälst und die Alchemie wird ab sofort dein Verbündeter sein.
		KNOWS_MANAESSENZ = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Essenz magischer Energie - 1 Alkohol, 1 Rabenkraut");
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Zu wenig Lernpunkte!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void kdf_401_damarok_traenke_mana2()
{
	AI_Output(other,self,"KDF_401_Damarok_Traenke_Mana2_15_00");	//Was muss ich tun?
	if(other.lp >= 2)
	{
		other.lp = other.lp - 2;
		PrintScreen("Lerne: Extrakt magischer Energie",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDF_401_Damarok_Traenke_Mana2_06_01");	//Als erstes musst du die Zutaten in die Laborwasserflasche geben. Erst danach kommt das Wasser.
		AI_Output(self,other,"KDF_401_Damarok_Traenke_Mana2_06_02");	//Achte einfach nur darauf, dass du diese Reihenfolge einhälst und die Alchemie wird ab sofort dein Verbündeter sein.
		KNOWS_MANAEXTRAKT = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Extrakt magischer Energie - 1 Alkohol, 2 Rabenkraut, 1 Dunkelkraut");
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Zu wenig Lernpunkte!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void kdf_401_damarok_traenke_mana3()
{
	AI_Output(other,self,"KDF_401_Damarok_Traenke_Mana3_15_00");	//Was muss ich tun?
	if(other.lp >= 3)
	{
		other.lp = other.lp - 3;
		PrintScreen("Lerne: Elixier magischer Energie",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDF_401_Damarok_Traenke_Mana3_06_01");	//Als erstes musst du die Zutaten in die Laborwasserflasche geben. Erst danach kommt das Wasser.
		AI_Output(self,other,"KDF_401_Damarok_Traenke_Mana3_06_02");	//Achte einfach nur darauf, dass du diese Reihenfolge einhälst und die Alchemie wird ab sofort dein Verbündeter sein.
		KNOWS_MANAELIXIER = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Elixier magischer Energie - 1 Alkohol, 2 Dunkelkraut");
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Zu wenig Lernpunkte!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void kdf_401_damarok_traenke_manaperma1()
{
	AI_Output(other,self,"KDF_401_Damarok_Traenke_ManaPerma1_15_00");	//Was muss ich tun?
	if(other.lp >= 5)
	{
		other.lp = other.lp - 5;
		PrintScreen("Lerne: Essenz des Geistes",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDF_401_Damarok_Traenke_ManaPerma1_06_01");	//Als erstes musst du die Zutaten in die Laborwasserflasche geben. Erst danach kommt das Wasser.
		AI_Output(self,other,"KDF_401_Damarok_Traenke_ManaPerma1_06_02");	//Achte einfach nur darauf, dass du diese Reihenfolge einhälst und die Alchemie wird ab sofort dein Verbündeter sein.
		KNOWS_MANAPERMAESSENZ = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Essenz des Geistes - 1 Alkohol, 2 Dunkelkraut, 1 Nachtschatten");
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Zu wenig Lernpunkte!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void kdf_401_damarok_traenke_manaperma2()
{
	AI_Output(other,self,"KDF_401_Damarok_Traenke_ManaPerma2_15_00");	//Was muss ich tun?
	if(other.lp >= 8)
	{
		other.lp = other.lp - 8;
		PrintScreen("Lerne: Extrakt des Geistes",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDF_401_Damarok_Traenke_ManaPerma2_06_01");	//Als erstes musst du die Zutaten in die Laborwasserflasche geben. Erst danach kommt das Wasser.
		AI_Output(self,other,"KDF_401_Damarok_Traenke_ManaPerma2_06_02");	//Achte einfach nur darauf, dass du diese Reihenfolge einhälst und die Alchemie wird ab sofort dein Verbündeter sein.
		KNOWS_MANAPERMAEXTRAKT = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Extrakt des Geistes - 1 Alkohol, 2 Dunkelkraut, 2 Nachtschatten");
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Zu wenig Lernpunkte!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void kdf_401_damarok_traenke_manaperma3()
{
	AI_Output(other,self,"KDF_401_Damarok_Traenke_ManaPerma3_15_00");	//Was muss ich tun?
	if(other.lp >= 10)
	{
		other.lp = other.lp - 10;
		PrintScreen("Lerne: Elixier des Geistes",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDF_401_Damarok_Traenke_ManaPerma3_06_01");	//Als erstes musst du die Zutaten in die Laborwasserflasche geben. Erst danach kommt das Wasser.
		AI_Output(self,other,"KDF_401_Damarok_Traenke_ManaPerma3_06_02");	//Achte einfach nur darauf, dass du diese Reihenfolge einhälst und die Alchemie wird ab sofort dein Verbündeter sein.
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

func void kdf_401_damarok_traenke_healthperma1()
{
	AI_Output(other,self,"KDF_401_Damarok_Traenke_HealthPerma1_15_00");	//Was muss ich tun?
	if(other.lp >= 5)
	{
		other.lp = other.lp - 5;
		PrintScreen("Lerne: Essenz des Lebens",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDF_401_Damarok_Traenke_HealthPerma1_06_01");	//Als erstes musst du die Zutaten in die Laborwasserflasche geben. Erst danach kommt das Wasser.
		AI_Output(self,other,"KDF_401_Damarok_Traenke_HealthPerma1_06_02");	//Achte einfach nur darauf, dass du diese Reihenfolge einhälst und die Alchemie wird ab sofort dein Verbündeter sein.
		KNOWS_HEILPERMAESSENZ = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Essenz des Lebens - 1 Wasser, 2 starke Heilkräuter");
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Zu wenig Lernpunkte!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void kdf_401_damarok_traenke_healthperma2()
{
	AI_Output(other,self,"KDF_401_Damarok_Traenke_HealthPerma2_15_00");	//Was muss ich tun?
	if(other.lp >= 8)
	{
		other.lp = other.lp - 8;
		PrintScreen("Lerne: Extrakt des Lebens",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDF_401_Damarok_Traenke_HealthPerma2_06_01");	//Als erstes musst du die Zutaten in die Laborwasserflasche geben. Erst danach kommt das Wasser.
		AI_Output(self,other,"KDF_401_Damarok_Traenke_HealthPerma2_06_02");	//Achte einfach nur darauf, dass du diese Reihenfolge einhälst und die Alchemie wird ab sofort dein Verbündeter sein.
		KNOWS_HEILPERMAEXTRAKT = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Extrakt des Lebens - 1 Wasser, 2 starke Heilkräuter, 1 Orkblatt");
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Zu wenig Lernpunkte!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void kdf_401_damarok_traenke_healthperma3()
{
	AI_Output(other,self,"KDF_401_Damarok_Traenke_Health3_15_00");	//Was muss ich tun?
	if(other.lp >= 10)
	{
		other.lp = other.lp - 10;
		PrintScreen("Lerne: Elixier des Lebens",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDF_401_Damarok_Traenke_HealthPerma3_06_01");	//Als erstes musst du die Zutaten in die Laborwasserflasche geben. Erst danach kommt das Wasser.
		AI_Output(self,other,"KDF_401_Damarok_Traenke_HealthPerma3_06_02");	//Achte einfach nur darauf, dass du diese Reihenfolge einhälst und die Alchemie wird ab sofort dein Verbündeter sein.
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

