
instance Info_Riordian_EXIT(C_Info)
{
	npc = KDW_605_Riordian;
	nr = 999;
	condition = Info_Riordian_EXIT_Condition;
	information = Info_Riordian_EXIT_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_Riordian_EXIT_Condition()
{
	return TRUE;
};

func void Info_Riordian_EXIT_Info()
{
	AI_StopProcessInfos(self);
	if(!Npc_HasItems(self,ItArRuneThunderball))
	{
		CreateInvItem(self,ItArRuneThunderball);
	};
};


instance Info_Riordian_NEWS(C_Info)
{
	npc = KDW_605_Riordian;
	condition = Info_Riordian_NEWS_Condition;
	information = Info_Riordian_NEWS_Info;
	permanent = 0;
	important = 0;
	description = "Saturas schickt mich.";
};


func int Info_Riordian_NEWS_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Saturas_OFFER) && Npc_KnowsInfo(hero,KDW_605_Riordian_GREET))
	{
		return TRUE;
	};
};

func void Info_Riordian_NEWS_Info()
{
	AI_Output(other,self,"Info_Riordian_NEWS_15_01");	//Saturas schickt mich.
	AI_Output(self,other,"Info_Riordian_NEWS_14_02");	//Ahhh, komm näher. Ich bin bereits informiert.
	AI_Output(self,other,"Info_Riordian_NEWS_14_03");	//Hier nimm diese Tränke, da ist von jedem was dabei.
	AI_Output(self,other,"Info_Riordian_NEWS_14_04");	//Nun geh und bring uns die Fokussteine. Diese Artefakte sind unsere einzige Hoffnung.
	CreateInvItems(self,ItFo_Potion_Health_01,20);
	B_GiveInvItems(self,hero,ItFo_Potion_Health_01,20);
	Npc_RemoveInvItems(hero,ItFo_Potion_Health_01,15);
	CreateInvItems(hero,ItFo_Potion_Mana_01,5);
	CreateInvItems(hero,ItFo_Potion_Health_02,2);
	CreateInvItems(hero,ItFo_Potion_Mana_02,2);
	CreateInvItems(hero,ItFo_Potion_Health_03,1);
	CreateInvItems(hero,ItFo_Potion_Mana_03,1);
	CreateInvItems(hero,ItFo_Potion_Haste_02,2);
	CreateInvItems(hero,ItFo_Potion_Strength_01,1);
	CreateInvItems(hero,ItFo_Potion_Dex_01,1);
};


instance Info_Riordian_REWARD(C_Info)
{
	npc = KDW_605_Riordian;
	condition = Info_Riordian_REWARD_Condition;
	information = Info_Riordian_REWARD_Info;
	permanent = 0;
	important = 0;
	description = "Saturas sagt, du hättest eine Belohnung für mich?";
};


func int Info_Riordian_REWARD_Condition()
{
	if(Saturas_BringFoci == 5)
	{
		return TRUE;
	};
};

func void Info_Riordian_REWARD_Info()
{
	AI_Output(other,self,"Info_Riordian_REWARD_15_01");	//Saturas sagt, du hättest eine Belohnung für mich?
	AI_Output(self,other,"Info_Riordian_REWARD_14_02");	//Ahhhh, komm näher, komm näher.
	AI_Output(self,other,"Info_Riordian_REWARD_14_03");	//Unser spiritueller Führer hat mir von deinen Heldentaten berichtet.
	AI_Output(self,other,"Info_Riordian_REWARD_14_04");	//Wir alle hier im Lager, ja in der ganzen Kolonie sind dir zu großem Dank verpflichtet.
	AI_Output(self,other,"Info_Riordian_REWARD_14_05");	//Nimm dies als einen bescheidenen Ausgleich für all deine Mühen.
	CreateInvItems(self,ItFo_Potion_Health_02,20);
	B_GiveInvItems(self,hero,ItFo_Potion_Health_02,20);
	Npc_RemoveInvItems(hero,ItFo_Potion_Health_02,15);
	CreateInvItems(hero,ItFo_Potion_Mana_02,5);
	CreateInvItems(hero,ItFo_Potion_Health_03,2);
	CreateInvItems(hero,ItFo_Potion_Mana_03,2);
	CreateInvItems(hero,ItFo_Potion_Haste_02,3);
	CreateInvItems(hero,ItFo_Potion_Master_01,1);
	CreateInvItems(hero,ItFo_Potion_Health_Perma_02,1);
	CreateInvItems(hero,ItFo_Potion_Mana_Perma_02,1);
	B_LogEntry(CH3_BringFoci,"Riordian war aufgeschlossen wie immer. Er übergab mir einen ganzen Haufen Tränke, die ich bestimmt noch sehr gut gebrauchen kann.");
	if(Npc_KnowsInfo(hero,Info_Cronos_REWARD))
	{
		Log_SetTopicStatus(CH3_BringFoci,LOG_SUCCESS);
	};
};


instance Info_Riordian_MESSAGE(C_Info)
{
	npc = KDW_605_Riordian;
	condition = Info_Riordian_MESSAGE_Condition;
	information = Info_Riordian_MESSAGE_Info;
	permanent = 0;
	important = 1;
};


func int Info_Riordian_MESSAGE_Condition()
{
	if(UrShak_SpokeOfUluMulu && !EnteredFreeMine)
	{
		return TRUE;
	};
};

func void Info_Riordian_MESSAGE_Info()
{
	AI_Output(self,hero,"Info_Riordian_MESSAGE_14_01");	//Gut, dass du kommst! Ich habe schon auf dich gewartet!
};


instance Info_Riordian_MESSAGEWHY(C_Info)
{
	npc = KDW_605_Riordian;
	condition = Info_Riordian_MESSAGEWHY_Condition;
	information = Info_Riordian_MESSAGEWHY_Info;
	permanent = 0;
	important = 0;
	description = "Du hast auf mich gewartet? Warum?";
};


func int Info_Riordian_MESSAGEWHY_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Riordian_MESSAGE))
	{
		return TRUE;
	};
};

func void Info_Riordian_MESSAGEWHY_Info()
{
	AI_Output(hero,self,"Info_Riordian_MESSAGEWHY_15_01");	//Du hast auf mich gewartet? Warum?
	AI_Output(self,hero,"Info_Riordian_MESSAGEWHY_14_02");	//Gorn bat mich, dich bei deinem Auftauchen hier sofort zu ihm zu schicken!
	AI_Output(hero,self,"Info_Riordian_MESSAGEWHY_15_03");	//Was ist los?
	AI_Output(self,hero,"Info_Riordian_MESSAGEWHY_14_04");	//Er hat einen Plan zur Befreiung der besetzten Mine.
	AI_Output(hero,self,"Info_Riordian_MESSAGEWHY_15_05");	//Bewacht er noch den Zugang zur Mine?
	AI_Output(self,hero,"Info_Riordian_MESSAGEWHY_14_06");	//Ja! Bitte suche ihn so schnell wie möglich auf!
};


instance KDW_605_Riordian_WELCOME(C_Info)
{
	npc = KDW_605_Riordian;
	condition = KDW_605_Riordian_WELCOME_Condition;
	information = KDW_605_Riordian_WELCOME_Info;
	important = 1;
	permanent = 0;
};


func int KDW_605_Riordian_WELCOME_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_KDW)
	{
		return TRUE;
	};
};

func void KDW_605_Riordian_WELCOME_Info()
{
	AI_Output(self,other,"KDW_605_Riordian_WELCOME_Info_14_01");	//Gut, dass du uns beigetreten bist.
};


instance KDW_605_Riordian_HEAL(C_Info)
{
	npc = KDW_605_Riordian;
	condition = KDW_605_Riordian_HEAL_Condition;
	information = KDW_605_Riordian_HEAL_Info;
	important = 1;
	permanent = 0;
};


func int KDW_605_Riordian_HEAL_Condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_KDW) && Npc_KnowsInfo(hero,KDW_605_Riordian_WELCOME))
	{
		return TRUE;
	};
};

func void KDW_605_Riordian_HEAL_Info()
{
	AI_Output(self,other,"KDW_605_Riordian_HEAL_Info_14_01");	//Wenn du verletzt bist, werde ich dich heilen.
};


instance KDW_605_Riordian_HEALINFO(C_Info)
{
	npc = KDW_605_Riordian;
	nr = 100;
	condition = KDW_605_Riordian_HEALINFO_Condition;
	information = KDW_605_Riordian_HEALINFO_Info;
	important = 0;
	permanent = 1;
	description = "Ich bin verletzt. Kannst du mich heilen?";
};


func int KDW_605_Riordian_HEALINFO_Condition()
{
	if((hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX]) && (Npc_GetTrueGuild(hero) == GIL_KDW))
	{
		return TRUE;
	};
};

func void KDW_605_Riordian_HEALINFO_Info()
{
	AI_Output(other,self,"KDW_605_Riordian_HEALINFO_Info_15_01");	//Ich bin verletzt. Kannst du mich heilen?
	AI_Output(self,other,"KDW_605_Riordian_HEALINFO_Info_14_02");	//Durch mein Wort rufe ich die Kraft der Heilung und lasse diesen Körper und den Geist gesunden!
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	Snd_Play("MFX_Heal_Cast");
};


instance KDW_605_Riordian_GREET(C_Info)
{
	npc = KDW_605_Riordian;
	condition = KDW_605_Riordian_GREET_Condition;
	information = KDW_605_Riordian_GREET_Info;
	important = 0;
	permanent = 0;
	description = "Ich grüße dich Magier.";
};


func int KDW_605_Riordian_GREET_Condition()
{
	return TRUE;
};

func void KDW_605_Riordian_GREET_Info()
{
	AI_Output(other,self,"KDW_605_Riordian_GREET_Info_15_01");	//Ich grüße dich Magier!
	AI_Output(self,other,"KDW_605_Riordian_GREET_Info_14_02");	//Ich bin Riordian, der Alchemist. Du willst bestimmt einen Trank?
	Log_CreateTopic(GE_TraderNC,LOG_NOTE);
	B_LogEntry(GE_TraderNC,"Riordian der Wassermagier handelt mit TRÄNKEN. Er ist im Alchemielabor auf der obersten Ebene zu finden.");
};


instance KDW_605_Riordian_TRADE(C_Info)
{
	npc = KDW_605_Riordian;
	condition = KDW_605_Riordian_TRADE_Condition;
	information = KDW_605_Riordian_TRADE_Info;
	important = 0;
	permanent = 1;
	description = "Zeig mir deine Ware.";
	trade = 1;
};


func int KDW_605_Riordian_TRADE_Condition()
{
	if(Npc_KnowsInfo(hero,KDW_605_Riordian_GREET))
	{
		return TRUE;
	};
};

func void KDW_605_Riordian_TRADE_Info()
{
	AI_Output(other,self,"KDW_605_Riordian_TRADE_Info_15_01");	//Zeig mir deine Ware.
};


var int lernen_darf_kdw;

instance KDW_605_RIORDIAN_LERNEN(C_Info)
{
	npc = KDW_605_Riordian;
	condition = kdw_605_riordian_lernen_condition;
	information = kdw_605_riordian_lernen_info;
	important = 0;
	permanent = 1;
	description = "Kannst du mir was beibringen?";
};


func int kdw_605_riordian_lernen_condition()
{
	if(LERNEN_DARF_KDW == FALSE)
	{
		return TRUE;
	};
};

func void kdw_605_riordian_lernen_info()
{
	AI_Output(hero,self,"Info_Diego_Teach_15_00");	//Kannst du mir was beibringen?
	if((Npc_GetTrueGuild(hero) == GIL_KDW) || (Npc_GetTrueGuild(hero) == GIL_SLD))
	{
		Log_CreateTopic(GE_TeacherNC,LOG_NOTE);
		B_LogEntry(GE_TeacherNC,"Riordian, der Alchemist der Wassermagier kann mich in der Lehre der Alchemie unterrichten.");
		AI_Output(self,other,"KDW_605_Riordian_LERNEN_Info_14_02");	//Ich kann dich die Kunst der Alchemie lehren.
		AI_Output(self,other,"KDW_605_Riordian_LERNEN_Info_14_03");	//Es gibt eine Vielzahl von alchemischen Substanzen, die alle eine verschiedene Wirkung auf Körper und Geist haben.
		AI_Output(self,other,"KDW_605_Riordian_LERNEN_Info_14_04");	//Wenn es dein Wunsch ist, werde ich dich unterweisen.
		LERNEN_DARF_KDW = TRUE;
	}
	else
	{
		AI_Output(self,other,"KDW_605_Riordian_LERNEN_Info_14_05");	//Ich unterrichte nur Magier vom Kreis des Wassers.
		AI_Output(self,other,"KDW_605_Riordian_LERNEN_Info_14_06");	//Solange du dich nicht in den Dienst Adanos gestellt hast, werde ich dir nichts beibringen.
	};
};


instance KDW_605_RIORDIAN_TRAENKE(C_Info)
{
	npc = KDW_605_Riordian;
	condition = kdw_605_riordian_traenke_condition;
	information = kdw_605_riordian_traenke_info;
	important = 0;
	permanent = 1;
	description = "Welche Tränke kannst du mir beibringen?";
};


func int kdw_605_riordian_traenke_condition()
{
	if(((LERNEN_DARF_KDW == TRUE) && (Npc_GetTrueGuild(hero) == GIL_KDW)) || ((LERNEN_DARF_KDW == TRUE) && (Npc_GetTrueGuild(hero) == GIL_SLD)))
	{
		return TRUE;
	};
};

func void kdw_605_riordian_traenke_info()
{
	AI_Output(other,self,"KDW_605_Riordian_Traenke_Info_14_01");	//Welche Tränke kannst du mir beibringen?
	AI_Output(self,other,"KDW_605_Riordian_Traenke_Info_14_02");	//Ich kenne die Rezepturen von Heil-, Mana- und Körperlich-verändernden Tränken.
	Info_ClearChoices(kdw_605_riordian_traenke);
	Info_AddChoice(kdw_605_riordian_traenke,DIALOG_BACK,kdw_605_riordian_traenke_back);
	if(KNOWS_HEILESSENZ == FALSE)
	{
		Info_AddChoice(kdw_605_riordian_traenke,"Essenz heilender Kraft (Kosten: 1 Lernpunkt)",kdw_605_riordian_traenke_health1);
	};
	if((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == FALSE))
	{
		Info_AddChoice(kdw_605_riordian_traenke,"Extrakt heilender Kraft (Kosten: 2 Lernpunkte)",kdw_605_riordian_traenke_health2);
	};
	if((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == FALSE))
	{
		Info_AddChoice(kdw_605_riordian_traenke,"Elixier heilender Kraft (Kosten: 3 Lernpunkte)",kdw_605_riordian_traenke_health3);
	};
	if(KNOWS_MANAESSENZ == FALSE)
	{
		Info_AddChoice(kdw_605_riordian_traenke,"Essenz magischer Energie (Kosten: 1 Lernpunkt)",kdw_605_riordian_traenke_mana1);
	};
	if((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == FALSE))
	{
		Info_AddChoice(kdw_605_riordian_traenke,"Extrakt magischer Energie (Kosten: 2 Lernpunkte)",kdw_605_riordian_traenke_mana2);
	};
	if((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == FALSE))
	{
		Info_AddChoice(kdw_605_riordian_traenke,"Elixier magischer Energie (Kosten: 3 Lernpunkte)",kdw_605_riordian_traenke_mana3);
	};
	if((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == TRUE) && (KNOWS_HEILPERMAESSENZ == FALSE))
	{
		Info_AddChoice(kdw_605_riordian_traenke,"Essenz des Lebens (Kosten: 5 Lernpunkte)",kdw_605_riordian_traenke_healthperma1);
	};
	if((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == TRUE) && (KNOWS_HEILPERMAESSENZ == TRUE) && (KNOWS_HEILPERMAEXTRAKT == FALSE))
	{
		Info_AddChoice(kdw_605_riordian_traenke,"Extrakt des Lebens (Kosten: 8 Lernpunkte)",kdw_605_riordian_traenke_healthperma2);
	};
	if((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == TRUE) && (KNOWS_HEILPERMAESSENZ == TRUE) && (KNOWS_HEILPERMAEXTRAKT == TRUE) && (KNOWS_HEILPERMAELIXIER == FALSE))
	{
		Info_AddChoice(kdw_605_riordian_traenke,"Elixier des Lebens (Kosten: 10 Lernpunkte)",kdw_605_riordian_traenke_healthperma3);
	};
	if((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_MANAPERMAESSENZ == FALSE))
	{
		Info_AddChoice(kdw_605_riordian_traenke,"Essenz des Geistes (Kosten: 5 Lernpunkte)",kdw_605_riordian_traenke_manaperma1);
	};
	if((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_MANAPERMAESSENZ == TRUE) && (KNOWS_MANAPERMAEXTRAKT == FALSE))
	{
		Info_AddChoice(kdw_605_riordian_traenke,"Extrakt des Geistes (Kosten: 8 Lernpunkte)",kdw_605_riordian_traenke_manaperma2);
	};
	if((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_MANAPERMAESSENZ == TRUE) && (KNOWS_MANAPERMAEXTRAKT == TRUE) && (KNOWS_MANAPERMAELIXIER == FALSE))
	{
		Info_AddChoice(kdw_605_riordian_traenke,"Elixier des Geistes (Kosten: 10 Lernpunkte)",kdw_605_riordian_traenke_manaperma3);
	};
	if(((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_STRENGTHESSENZ == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_KDW)) || ((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == TRUE) && (KNOWS_STRENGTHESSENZ == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_KDW)))
	{
		Info_AddChoice(kdw_605_riordian_traenke,"Essenz der Stärke (Kosten: 5 Lernpunkte)",kdw_605_riordian_traenke_strengthperma1);
	};
	if(((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_STRENGTHESSENZ == TRUE) && (KNOWS_STRENGTHEXTRAKT == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_KDW)) || ((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == TRUE) && (KNOWS_STRENGTHESSENZ == TRUE) && (KNOWS_STRENGTHEXTRAKT == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_KDW)))
	{
		Info_AddChoice(kdw_605_riordian_traenke,"Extrakt der Stärke (Kosten: 8 Lernpunkte)",kdw_605_riordian_traenke_strengthperma2);
	};
	if(((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_STRENGTHESSENZ == TRUE) && (KNOWS_STRENGTHEXTRAKT == TRUE) && (KNOWS_STRENGTHELIXIER == FALSE) && (Kapitel >= 4)) || ((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == TRUE) && (KNOWS_STRENGTHESSENZ == TRUE) && (KNOWS_STRENGTHEXTRAKT == TRUE) && (KNOWS_STRENGTHELIXIER == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_KDW)))
	{
		Info_AddChoice(kdw_605_riordian_traenke,"Elixier der Stärke (Kosten: 10 Lernpunkte)",kdw_605_riordian_traenke_strengthperma3);
	};
	if(((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_STRENGTHESSENZ == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_KDW)) || ((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == TRUE) && (KNOWS_DEXESSENZ == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_KDW)))
	{
		Info_AddChoice(kdw_605_riordian_traenke,"Essenz der Geschicklichkeit (Kosten: 5 Lernpunkte)",kdw_605_riordian_traenke_dexperma1);
	};
	if(((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_STRENGTHESSENZ == TRUE) && (KNOWS_STRENGTHEXTRAKT == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_KDW)) || ((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == TRUE) && (KNOWS_STRENGTHESSENZ == TRUE) && (KNOWS_STRENGTHEXTRAKT == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_KDW)))
	{
		Info_AddChoice(kdw_605_riordian_traenke,"Extrakt der Geschicklichkeit (Kosten: 8 Lernpunkte)",kdw_605_riordian_traenke_dexperma2);
	};
	if(((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_DEXESSENZ == TRUE) && (KNOWS_DEXEXTRAKT == TRUE) && (KNOWS_DEXELIXIER == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_KDW)) || ((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == TRUE) && (KNOWS_DEXESSENZ == TRUE) && (KNOWS_DEXEXTRAKT == TRUE) && (KNOWS_DEXELIXIER == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_KDW)))
	{
		Info_AddChoice(kdw_605_riordian_traenke,"Elixier der Geschicklichkeit (Kosten: 10 Lernpunkte)",kdw_605_riordian_traenke_dexperma3);
	};
	if(((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_DEXESSENZ == TRUE) && (KNOWS_DEXEXTRAKT == TRUE) && (KNOWS_DEXELIXIER == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_KDW)) || ((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == TRUE) && (KNOWS_DEXESSENZ == TRUE) && (KNOWS_DEXEXTRAKT == TRUE) && (KNOWS_DEXELIXIER == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_KDW)))
	{
		Info_AddChoice(kdw_605_riordian_traenke,"Elixier der Geschicklichkeit (Kosten: 10 Lernpunkte)",kdw_605_riordian_traenke_dexperma3);
	};
	if(((KNOWS_STRENGTHESSENZ == TRUE) && (KNOWS_STRENGTHEXTRAKT == TRUE) && (KNOWS_STRENGTHELIXIER == TRUE) && (KNOWS_MASTERMACHT == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_KDW)) || ((KNOWS_DEXESSENZ == TRUE) && (KNOWS_DEXEXTRAKT == TRUE) && (KNOWS_DEXELIXIER == FALSE) && (KNOWS_MASTERMACHT == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_KDW)))
	{
		Info_AddChoice(kdw_605_riordian_traenke,"Trank der Macht (Kosten: 10 Lernpunkte)",kdw_605_riordian_traenke_force1);
	};
	if(((KNOWS_STRENGTHESSENZ == TRUE) && (KNOWS_STRENGTHEXTRAKT == TRUE) && (KNOWS_STRENGTHELIXIER == TRUE) && (KNOWS_MASTERMACHT == TRUE) && (KNOWS_MASTERHERRSCHAFT == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_KDW)) || ((KNOWS_DEXESSENZ == TRUE) && (KNOWS_DEXEXTRAKT == TRUE) && (KNOWS_DEXELIXIER == TRUE) && (KNOWS_MASTERMACHT == TRUE) && (KNOWS_MASTERHERRSCHAFT == FALSE) && (Kapitel >= 4) && (Npc_GetTrueGuild(hero) == GIL_KDW)))
	{
		Info_AddChoice(kdw_605_riordian_traenke,"Trank der Herrschaft (Kosten: 10 Lernpunkte)",kdw_605_riordian_traenke_force2);
	};
};

func void kdw_605_riordian_traenke_back()
{
	Info_ClearChoices(kdw_605_riordian_traenke);
};

func void kdw_605_riordian_traenke_health1()
{
	AI_Output(other,self,"KDW_605_Riordian_Traenke_Health1_15_00");	//Was muss ich tun?
	if(other.lp >= 1)
	{
		other.lp = other.lp - 1;
		B_GiveSkill(other,NPC_TALENT_REGENERATE,1,0);
		AI_Output(self,other,"KDW_605_Riordian_Traenke_Health1_06_01");	//Als erstes musst du die Zutaten in die Laborwasserflasche geben. Erst danach kommt das Wasser.
		AI_Output(self,other,"KDW_605_Riordian_Traenke_Health1_06_02");	//Achte einfach nur darauf, dass du diese Reihenfolge einhälst und die Alchemie wird ab sofort dein Verbündeter sein.
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

func void kdw_605_riordian_traenke_health2()
{
	AI_Output(other,self,"KDW_605_Riordian_Traenke_Health2_15_00");	//Was muss ich tun?
	if(other.lp >= 2)
	{
		other.lp = other.lp - 2;
		PrintScreen("Lerne: Extrakt heilender Kraft",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDW_605_Riordian_Traenke_Health2_06_01");	//Als erstes musst du die Zutaten in die Laborwasserflasche geben. Erst danach kommt das Wasser.
		AI_Output(self,other,"KDW_605_Riordian_Traenke_Health2_06_02");	//Achte einfach nur darauf, dass du diese Reihenfolge einhälst und die Alchemie wird ab sofort dein Verbündeter sein.
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

func void kdw_605_riordian_traenke_health3()
{
	AI_Output(other,self,"KDW_605_Riordian_Traenke_Health3_15_00");	//Was muss ich tun?
	if(other.lp >= 3)
	{
		other.lp = other.lp - 3;
		PrintScreen("Lerne: Elixier heilender Kraft",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDW_605_Riordian_Traenke_Health3_06_01");	//Als erstes musst du die Zutaten in die Laborwasserflasche geben. Erst danach kommt das Wasser.
		AI_Output(self,other,"KDW_605_Riordian_Traenke_Health3_06_02");	//Achte einfach nur darauf, dass du diese Reihenfolge einhälst und die Alchemie wird ab sofort dein Verbündeter sein.
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

func void kdw_605_riordian_traenke_mana1()
{
	AI_Output(other,self,"KDW_605_Riordian_Traenke_Mana1_15_00");	//Was muss ich tun?
	if(other.lp >= 1)
	{
		other.lp = other.lp - 1;
		B_GiveSkill(other,NPC_TALENT_REGENERATE,1,0);
		AI_Output(self,other,"KDW_605_Riordian_Traenke_Mana1_06_01");	//Als erstes musst du die Zutaten in die Laborwasserflasche geben. Erst danach kommt das Wasser.
		AI_Output(self,other,"KDW_605_Riordian_Traenke_Mana1_06_02");	//Achte einfach nur darauf, dass du diese Reihenfolge einhälst und die Alchemie wird ab sofort dein Verbündeter sein.
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

func void kdw_605_riordian_traenke_mana2()
{
	AI_Output(other,self,"KDW_605_Riordian_Traenke_Mana2_15_00");	//Was muss ich tun?
	if(other.lp >= 2)
	{
		other.lp = other.lp - 2;
		PrintScreen("Lerne: Extrakt magischer Energie",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDW_605_Riordian_Traenke_Mana2_06_01");	//Als erstes musst du die Zutaten in die Laborwasserflasche geben. Erst danach kommt das Wasser.
		AI_Output(self,other,"KDW_605_Riordian_Traenke_Mana2_06_02");	//Achte einfach nur darauf, dass du diese Reihenfolge einhälst und die Alchemie wird ab sofort dein Verbündeter sein.
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

func void kdw_605_riordian_traenke_mana3()
{
	AI_Output(other,self,"KDW_605_Riordian_Traenke_Mana3_15_00");	//Was muss ich tun?
	if(other.lp >= 3)
	{
		other.lp = other.lp - 3;
		PrintScreen("Lerne: Elixier magischer Energie",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDW_605_Riordian_Traenke_Mana3_06_01");	//Als erstes musst du die Zutaten in die Laborwasserflasche geben. Erst danach kommt das Wasser.
		AI_Output(self,other,"KDW_605_Riordian_Traenke_Mana3_06_02");	//Achte einfach nur darauf, dass du diese Reihenfolge einhälst und die Alchemie wird ab sofort dein Verbündeter sein.
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

func void kdw_605_riordian_traenke_manaperma1()
{
	AI_Output(other,self,"KDW_605_Riordian_Traenke_ManaPerma1_15_00");	//Was muss ich tun?
	if(other.lp >= 5)
	{
		other.lp = other.lp - 5;
		PrintScreen("Lerne: Essenz des Geistes",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDW_605_Riordian_Traenke_ManaPerma1_06_01");	//Als erstes musst du die Zutaten in die Laborwasserflasche geben. Erst danach kommt das Wasser.
		AI_Output(self,other,"KDW_605_Riordian_Traenke_ManaPerma1_06_02");	//Achte einfach nur darauf, dass du diese Reihenfolge einhälst und die Alchemie wird ab sofort dein Verbündeter sein.
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

func void kdw_605_riordian_traenke_manaperma2()
{
	AI_Output(other,self,"KDW_605_Riordian_Traenke_ManaPerma2_15_00");	//Was muss ich tun?
	if(other.lp >= 8)
	{
		other.lp = other.lp - 8;
		PrintScreen("Lerne: Extrakt des Geistes",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDW_605_Riordian_Traenke_ManaPerma2_06_01");	//Als erstes musst du die Zutaten in die Laborwasserflasche geben. Erst danach kommt das Wasser.
		AI_Output(self,other,"KDW_605_Riordian_Traenke_ManaPerma2_06_02");	//Achte einfach nur darauf, dass du diese Reihenfolge einhälst und die Alchemie wird ab sofort dein Verbündeter sein.
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

func void kdw_605_riordian_traenke_manaperma3()
{
	AI_Output(other,self,"KDW_605_Riordian_Traenke_ManaPerma3_15_00");	//Was muss ich tun?
	if(other.lp >= 10)
	{
		other.lp = other.lp - 10;
		PrintScreen("Lerne: Elixier des Geistes",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDW_605_Riordian_Traenke_ManaPerma3_06_01");	//Als erstes musst du die Zutaten in die Laborwasserflasche geben. Erst danach kommt das Wasser.
		AI_Output(self,other,"KDW_605_Riordian_Traenke_ManaPerma3_06_02");	//Achte einfach nur darauf, dass du diese Reihenfolge einhälst und die Alchemie wird ab sofort dein Verbündeter sein.
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

func void kdw_605_riordian_traenke_healthperma1()
{
	AI_Output(other,self,"KDW_605_Riordian_Traenke_HealthPerma1_15_00");	//Was muss ich tun?
	if(other.lp >= 5)
	{
		other.lp = other.lp - 5;
		PrintScreen("Lerne: Essenz des Lebens",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDW_605_Riordian_Traenke_HealthPerma1_06_01");	//Als erstes musst du die Zutaten in die Laborwasserflasche geben. Erst danach kommt das Wasser.
		AI_Output(self,other,"KDW_605_Riordian_Traenke_HealthPerma1_06_02");	//Achte einfach nur darauf, dass du diese Reihenfolge einhälst und die Alchemie wird ab sofort dein Verbündeter sein.
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

func void kdw_605_riordian_traenke_healthperma2()
{
	AI_Output(other,self,"KDW_605_Riordian_Traenke_HealthPerma2_15_00");	//Was muss ich tun?
	if(other.lp >= 8)
	{
		other.lp = other.lp - 8;
		PrintScreen("Lerne: Extrakt des Lebens",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDW_605_Riordian_Traenke_HealthPerma2_06_01");	//Als erstes musst du die Zutaten in die Laborwasserflasche geben. Erst danach kommt das Wasser.
		AI_Output(self,other,"KDW_605_Riordian_Traenke_HealthPerma2_06_02");	//Achte einfach nur darauf, dass du diese Reihenfolge einhälst und die Alchemie wird ab sofort dein Verbündeter sein.
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

func void kdw_605_riordian_traenke_healthperma3()
{
	AI_Output(other,self,"KDW_605_Riordian_Traenke_Health3_15_00");	//Was muss ich tun?
	if(other.lp >= 10)
	{
		other.lp = other.lp - 10;
		PrintScreen("Lerne: Elixier des Lebens",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDW_605_Riordian_Traenke_HealthPerma3_06_01");	//Als erstes musst du die Zutaten in die Laborwasserflasche geben. Erst danach kommt das Wasser.
		AI_Output(self,other,"KDW_605_Riordian_Traenke_HealthPerma3_06_02");	//Achte einfach nur darauf, dass du diese Reihenfolge einhälst und die Alchemie wird ab sofort dein Verbündeter sein.
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

func void kdw_605_riordian_traenke_strengthperma1()
{
	AI_Output(other,self,"KDW_605_Riordian_Traenke_StrengthPerma1_15_00");	//Was muss ich tun?
	if(other.lp >= 5)
	{
		other.lp = other.lp - 5;
		PrintScreen("Lerne: Essenz der Stärke",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDW_605_Riordian_Traenke_StrengthPerma1_06_01");	//Als erstes musst du die Zutaten in die Laborwasserflasche geben. Erst danach kommt das Wasser.
		AI_Output(self,other,"KDW_605_Riordian_Traenke_StrengthPerma1_06_02");	//Achte einfach nur darauf, dass du diese Reihenfolge einhälst und die Alchemie wird ab sofort dein Verbündeter sein.
		KNOWS_STRENGTHESSENZ = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Essenz der Stärke - 1 Wasser, 2 Orkblatt, 1 Trollkirsche");
		if(((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_STRENGTHESSENZ == TRUE) && (KNOWS_STRENGTHEXTRAKT == FALSE) && (Kapitel == 4)) || ((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == TRUE) && (KNOWS_STRENGTHESSENZ == TRUE) && (KNOWS_STRENGTHEXTRAKT == FALSE) && (Kapitel == 4)))
		{
			Info_AddChoice(kdw_605_riordian_traenke,"Extrakt der Stärke (Kosten: 8 Lernpunkte)",kdw_605_riordian_traenke_strengthperma2);
		};
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Zu wenig Lernpunkte!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void kdw_605_riordian_traenke_strengthperma2()
{
	AI_Output(other,self,"KDW_605_Riordian_Traenke_StrengthPerma2_15_00");	//Was muss ich tun?
	if(other.lp >= 8)
	{
		other.lp = other.lp - 8;
		PrintScreen("Lerne: Extrakt der Stärke",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDW_605_Riordian_Traenke_StrengthPerma2_06_01");	//Als erstes musst du die Zutaten in die Laborwasserflasche geben. Erst danach kommt das Wasser.
		AI_Output(self,other,"KDW_605_Riordian_Traenke_StrengthPerma2_06_02");	//Achte einfach nur darauf, dass du diese Reihenfolge einhälst und die Alchemie wird ab sofort dein Verbündeter sein.
		KNOWS_STRENGTHEXTRAKT = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Extrakt der Stärke - 1 Wasser, 3 Orkblatt, 1 Trollkirsche");
		if(((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_STRENGTHESSENZ == TRUE) && (KNOWS_STRENGTHEXTRAKT == TRUE) && (KNOWS_STRENGTHELIXIER == FALSE) && (Kapitel == 4)) || ((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == TRUE) && (KNOWS_STRENGTHESSENZ == TRUE) && (KNOWS_STRENGTHEXTRAKT == TRUE) && (KNOWS_STRENGTHELIXIER == FALSE) && (Kapitel == 4)))
		{
			Info_AddChoice(kdw_605_riordian_traenke,"Elixier der Stärke (Kosten: 10 Lernpunkte)",kdw_605_riordian_traenke_strengthperma3);
		};
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Zu wenig Lernpunkte!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void kdw_605_riordian_traenke_strengthperma3()
{
	AI_Output(other,self,"KDW_605_Riordian_Traenke_StrengthPerma3_15_00");	//Was muss ich tun?
	if(other.lp >= 10)
	{
		other.lp = other.lp - 10;
		PrintScreen("Lerne: Elixier der Stärke",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDW_605_Riordian_Traenke_StrengthPerma3_06_01");	//Als erstes musst du die Zutaten in die Laborwasserflasche geben. Erst danach kommt das Wasser.
		AI_Output(self,other,"KDW_605_Riordian_Traenke_StrengthPerma3_06_02");	//Achte einfach nur darauf, dass du diese Reihenfolge einhälst und die Alchemie wird ab sofort dein Verbündeter sein.
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

func void kdw_605_riordian_traenke_dexperma1()
{
	AI_Output(other,self,"KDW_605_Riordian_Traenke_DexPerma1_15_00");	//Was muss ich tun?
	if(other.lp >= 5)
	{
		other.lp = other.lp - 5;
		PrintScreen("Lerne: Essenz der Geschicklichkeit",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDW_605_Riordian_Traenke_DexPerma1_06_01");	//Als erstes musst du die Zutaten in die Laborwasserflasche geben. Erst danach kommt das Wasser.
		AI_Output(self,other,"KDW_605_Riordian_Traenke_DexPerma1_06_02");	//Achte einfach nur darauf, dass du diese Reihenfolge einhälst und die Alchemie wird ab sofort dein Verbündeter sein.
		KNOWS_DEXESSENZ = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Essenz der Geschicklichkeit - 1 Alkohol, 2 Seraphis, 1 Flammendorn");
		if(((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_STRENGTHESSENZ == TRUE) && (KNOWS_STRENGTHEXTRAKT == FALSE) && (Kapitel == 4)) || ((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == TRUE) && (KNOWS_STRENGTHESSENZ == TRUE) && (KNOWS_STRENGTHEXTRAKT == FALSE) && (Kapitel == 4)))
		{
			Info_AddChoice(kdw_605_riordian_traenke,"Extrakt der Geschicklichkeit (Kosten: 8 Lernpunkte)",kdw_605_riordian_traenke_dexperma2);
		};
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Zu wenig Lernpunkte!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void kdw_605_riordian_traenke_dexperma2()
{
	AI_Output(other,self,"KDW_605_Riordian_Traenke_DexPerma2_15_00");	//Was muss ich tun?
	if(other.lp >= 8)
	{
		other.lp = other.lp - 8;
		PrintScreen("Lerne: Extrakt der Geschicklichkeit",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDW_605_Riordian_Traenke_DexPerma2_06_01");	//Als erstes musst du die Zutaten in die Laborwasserflasche geben. Erst danach kommt das Wasser.
		AI_Output(self,other,"KDW_605_Riordian_Traenke_DexPerma2_06_02");	//Achte einfach nur darauf, dass du diese Reihenfolge einhälst und die Alchemie wird ab sofort dein Verbündeter sein.
		KNOWS_DEXEXTRAKT = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Extrakt der Geschicklichkeit - 1 Alkohol, 3 Seraphis, 1 Flammendorn");
		if(((KNOWS_MANAESSENZ == TRUE) && (KNOWS_MANAEXTRAKT == TRUE) && (KNOWS_MANAELIXIER == TRUE) && (KNOWS_DEXESSENZ == TRUE) && (KNOWS_DEXEXTRAKT == TRUE) && (KNOWS_DEXELIXIER == FALSE) && (Kapitel == 4)) || ((KNOWS_HEILESSENZ == TRUE) && (KNOWS_HEILEXTRAKT == TRUE) && (KNOWS_HEILELIXIER == TRUE) && (KNOWS_DEXESSENZ == TRUE) && (KNOWS_DEXEXTRAKT == TRUE) && (KNOWS_DEXELIXIER == FALSE) && (Kapitel == 4)))
		{
			Info_AddChoice(kdw_605_riordian_traenke,"Elixier der Geschicklichkeit (Kosten: 10 Lernpunkte)",kdw_605_riordian_traenke_dexperma3);
		};
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Zu wenig Lernpunkte!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void kdw_605_riordian_traenke_dexperma3()
{
	AI_Output(other,self,"KDW_605_Riordian_Traenke_DexPerma3_15_00");	//Was muss ich tun?
	if(other.lp >= 10)
	{
		other.lp = other.lp - 10;
		PrintScreen("Lerne: Elixier der Geschicklichkeit",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDW_605_Riordian_Traenke_DexPerma3_06_01");	//Als erstes musst du die Zutaten in die Laborwasserflasche geben. Erst danach kommt das Wasser.
		AI_Output(self,other,"KDW_605_Riordian_Traenke_DexPerma3_06_02");	//Achte einfach nur darauf, dass du diese Reihenfolge einhälst und die Alchemie wird ab sofort dein Verbündeter sein.
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

func void kdw_605_riordian_traenke_force1()
{
	AI_Output(other,self,"KDW_605_Riordian_Traenke_Force1_15_00");	//Was muss ich tun?
	if(other.lp >= 10)
	{
		other.lp = other.lp - 10;
		PrintScreen("Lerne: Trank der Macht",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDW_605_Riordian_Traenke_Force1_06_01");	//Als erstes musst du die Zutaten in die Laborwasserflasche geben. Erst danach kommt das Wasser.
		AI_Output(self,other,"KDW_605_Riordian_Traenke_Force1_06_02");	//Achte einfach nur darauf, dass du diese Reihenfolge einhälst und die Alchemie wird ab sofort dein Verbündeter sein.
		KNOWS_MASTERMACHT = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Trank der Macht - (1 Syrianisches Öl, 2 Seraphis, 1 Flammendorn, 2 Orkblatt, 1 Trollkirsche");
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Zu wenig Lernpunkte!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

func void kdw_605_riordian_traenke_force2()
{
	AI_Output(other,self,"KDW_605_Riordian_Traenke_Force2_15_00");	//Was muss ich tun?
	if(other.lp >= 10)
	{
		other.lp = other.lp - 10;
		PrintScreen("Lerne: Trank der Herrschaft",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		AI_Output(self,other,"KDW_605_Riordian_Traenke_Force2_06_01");	//Als erstes musst du die Zutaten in die Laborwasserflasche geben. Erst danach kommt das Wasser.
		AI_Output(self,other,"KDW_605_Riordian_Traenke_Force2_06_02");	//Achte einfach nur darauf, dass du diese Reihenfolge einhälst und die Alchemie wird ab sofort dein Verbündeter sein.
		KNOWS_MASTERHERRSCHAFT = TRUE;
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Trank der Herrschaft - (1 Syrianisches Öl, 3 Velayis, 1 Flammendorn, 3 Eichenblatt, 1 Trollkirsche");
	}
	else
	{
		B_Say(self,other,"$NOLEARNNOPOINTS");
		PrintScreen("Zu wenig Lernpunkte!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

