
instance DIA_Huno_Exit(C_Info)
{
	npc = VLK_538_Huno;
	nr = 999;
	condition = DIA_Huno_Exit_Condition;
	information = DIA_Huno_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Huno_Exit_Condition()
{
	return 1;
};

func void DIA_Huno_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Huno_YouKnowYourJob(C_Info)
{
	npc = VLK_538_Huno;
	nr = 2;
	condition = DIA_Huno_YouKnowYourJob_Condition;
	information = DIA_Huno_YouKnowYourJob_Info;
	permanent = 0;
	important = 0;
	description = "Wie's aussieht, beherrschst du dein Handwerk.";
};


func int DIA_Huno_YouKnowYourJob_Condition()
{
	return TRUE;
};

func void DIA_Huno_YouKnowYourJob_Info()
{
	AI_Output(other,self,"DIA_Huno_YouKnowYourJob_15_00");	//Wie's aussieht, beherrschst du dein Handwerk.
	AI_Output(self,other,"DIA_Huno_YouKnowYourJob_09_01");	//Bisher hat sich noch niemand beschwert.
	AI_Output(self,other,"DIA_Huno_YouKnowYourJob_09_02");	//Aber das will ich auch keinem raten. Jeder Pisser hier braucht ein Schwert, und das kriegen sie von mir.
};


instance DIA_Huno_HowLong(C_Info)
{
	npc = VLK_538_Huno;
	nr = 2;
	condition = DIA_Huno_HowLong_Condition;
	information = DIA_Huno_HowLong_Info;
	permanent = 0;
	important = 0;
	description = "Wie lange brauchst du für eine Klinge?";
};


func int DIA_Huno_HowLong_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Huno_YouKnowYourJob))
	{
		return TRUE;
	};
};

func void DIA_Huno_HowLong_Info()
{
	AI_Output(other,self,"DIA_Huno_HowLong_15_00");	//Wie lange brauchst du für eine Klinge?
	AI_Output(self,other,"DIA_Huno_HowLong_09_01");	//Kommt drauf an. Ein einfaches Schwert mach' ich dir schneller, als deine müden Augen zuschauen können.
	AI_Output(self,other,"DIA_Huno_HowLong_09_02");	//Vorausgesetzt, du motivierst mich mit einer entsprechenden Bezahlung.
	AI_Output(self,other,"DIA_Huno_HowLong_09_03");	//So'n Spinner wie der Whistler muss aber meistens länger auf sein Schmuckstück warten.
	AI_Output(other,self,"DIA_Huno_HowLong_15_04");	//Wieso? Bezahlt er nicht gut?
	AI_Output(self,other,"DIA_Huno_HowLong_09_05");	//Doch, ganz im Gegenteil. Für sein letztes Schwert hat er 150 Erz locker gemacht.
	AI_Output(self,other,"DIA_Huno_HowLong_09_06");	//Irgendwie hat der Typ ein Faible für Ornamente und so 'nen Weiberkram, und das hat natürlich seinen Preis.
	AI_Output(self,other,"DIA_Huno_HowLong_09_07");	//Hey, du bist ganz schön neugierig, Freundchen.
};


instance DIA_Huno_HowsYourBusiness(C_Info)
{
	npc = VLK_538_Huno;
	nr = 2;
	condition = DIA_Huno_HowsYourBusiness_Condition;
	information = DIA_Huno_HowsYourBusiness_Info;
	permanent = 1;
	important = 0;
	description = "Na, Schmied, wie läuft das Geschäft?";
};


func int DIA_Huno_HowsYourBusiness_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Huno_YouKnowYourJob))
	{
		return TRUE;
	};
};

func void DIA_Huno_HowsYourBusiness_Info()
{
	AI_Output(other,self,"DIA_Huno_HowsYourBusiness_15_00");	//Na, Schmied, wie läuft das Geschäft?
	AI_Output(self,other,"DIA_Huno_HowsYourBusiness_09_01");	//Was geht dich das an?
	AI_Output(other,self,"DIA_Huno_HowsYourBusiness_15_02");	//Vielleicht habe ich einen Auftrag für dich.
	AI_Output(self,other,"DIA_Huno_HowsYourBusiness_09_03");	//Ach ja? Was denn?
	AI_Output(other,self,"DIA_Huno_HowsYourBusiness_15_04");	//Ich überleg's mir.
	AI_Output(self,other,"DIA_Huno_HowsYourBusiness_09_05");	//Komm wieder, wenn du was brauchst, und geh mir nicht auf die Nerven.
};


var int Huno_LearnSmith;
var int huno_smithasking;

instance DIA_Huno_LEARNSMITH(C_Info)
{
	npc = VLK_538_Huno;
	nr = 2;
	condition = DIA_Huno_LEARNSMITH_Condition;
	information = DIA_Huno_LEARNSMITH_Info;
	permanent = 1;
	important = 0;
	description = "Ich würde mich selbst gern mal an deiner Schmiede versuchen.";
};


func int DIA_Huno_LEARNSMITH_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Huno_YouKnowYourJob))
	{
		return TRUE;
	};
};

func void DIA_Huno_LEARNSMITH_Info()
{
	AI_Output(other,self,"DIA_Huno_LEARNSMITH_15_00");	//Ich würde mich selbst gern mal an deiner Schmiede versuchen.
	AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_01");	//So so, aber glaub nur nicht, dass du tolle Klingen herstellen kannst!
	if(HUNO_SMITHASKING == FALSE)
	{
		Log_CreateTopic(GE_TeacherOC,LOG_NOTE);
		B_LogEntry(GE_TeacherOC,"Huno, der Schmied aus dem Alten Lager, kann mir das Schmieden beibringen.");
		HUNO_SMITHASKING = TRUE;
	};
	Info_ClearChoices(DIA_Huno_LEARNSMITH);
	Info_AddChoice(DIA_Huno_LEARNSMITH,DIALOG_BACK,dia_huno_learnsmith_back);
	if(KNOWS_GROBESSCHWERT == FALSE)
	{
		Info_AddChoice(DIA_Huno_LEARNSMITH,"Grobes Schwert (Kosten: 1 Lernpunkt)",dia_huno_learnsmith_grobesschwert);
	};
	if(((KNOWS_LEICHTESGARDESCHWERT == FALSE) && (KNOWS_GROBESSCHWERT == TRUE) && (Kapitel > 1) && (Npc_GetTrueGuild(hero) == GIL_GRD)) || ((KNOWS_LEICHTESGARDESCHWERT == FALSE) && (KNOWS_GROBESSCHWERT == TRUE) && (Kapitel > 1) && (Npc_GetTrueGuild(hero) == GIL_EBR)))
	{
		Info_AddChoice(DIA_Huno_LEARNSMITH,"Leichtes Gardeschwert (Kosten: 2 Lernpunkte)",dia_huno_learnsmith_leichtesgardeschwert);
	};
	if(((KNOWS_GARDESCHWERT == FALSE) && (KNOWS_GROBESSCHWERT == TRUE) && (KNOWS_LEICHTESGARDESCHWERT == TRUE) && (Kapitel > 1) && (Npc_GetTrueGuild(hero) == GIL_GRD)) || ((KNOWS_GARDESCHWERT == FALSE) && (KNOWS_GROBESSCHWERT == TRUE) && (KNOWS_LEICHTESGARDESCHWERT == TRUE) && (Kapitel > 1) && (Npc_GetTrueGuild(hero) == GIL_EBR)))
	{
		Info_AddChoice(DIA_Huno_LEARNSMITH,"Gardeschwert (Kosten: 3 Lernpunkte)",dia_huno_learnsmith_gardeschwert);
	};
	if(((KNOWS_GARDISTENHAND == FALSE) && (KNOWS_GARDESCHWERT == TRUE) && (KNOWS_GROBESSCHWERT == TRUE) && (KNOWS_LEICHTESGARDESCHWERT == TRUE) && (Kapitel > 2) && (Npc_GetTrueGuild(hero) == GIL_GRD)) || ((KNOWS_GARDISTENHAND == FALSE) && (KNOWS_GARDESCHWERT == TRUE) && (KNOWS_GROBESSCHWERT == TRUE) && (KNOWS_LEICHTESGARDESCHWERT == TRUE) && (Kapitel > 2) && (Npc_GetTrueGuild(hero) == GIL_EBR)))
	{
		Info_AddChoice(DIA_Huno_LEARNSMITH,"Gardistenhand (Kosten: 4 Lernpunkte)",dia_huno_learnsmith_gardistenhand);
	};
};

func void dia_huno_learnsmith_back()
{
	Info_ClearChoices(DIA_Huno_LEARNSMITH);
};

func void dia_huno_learnsmith_grobesschwert()
{
	AI_Output(other,self,"DIA_Huno_LEARNSMITH_15_02");	//Was muss ich tun?
	if(hero.lp >= 1)
	{
		hero.lp = hero.lp - 1;
		AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_03");	//Okay, nimm den Rohstahl und halte ihn ins Schmiedefeuer.
		AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_04");	//Dann musst du den glühenden Stahl am Amboss schmieden.
		AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_05");	//Stecke dann die glühende Klinge dort drüben in den Wassereimer, um sie zu härten.
		AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_06");	//Am Ende muss die abgekühlte Klinge noch am Schleifstein geschärft werden.
		Log_CreateTopic(GE_SMITH,LOG_NOTE);
		B_LogEntry(GE_SMITH,"Ich bin jetzt in der Lage ein einfaches Schwert zu schmieden.");
		Huno_LearnSmith = TRUE;
		KNOWS_GROBESSCHWERT = TRUE;
		B_GiveSkill(other,NPC_TALENT_FIREMASTER,1,0);
	}
	else
	{
		PrintScreen("Zu wenig Lernpunkte!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

func void dia_huno_learnsmith_leichtesgardeschwert()
{
	AI_Output(other,self,"DIA_Huno_LEARNSMITH_15_02");	//Was muss ich tun?
	if(hero.lp >= 2)
	{
		hero.lp = hero.lp - 2;
		AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_03");	//Okay, nimm den Rohstahl und halte ihn ins Schmiedefeuer.
		AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_04");	//Dann musst du den glühenden Stahl am Amboss schmieden.
		AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_05");	//Stecke dann die glühende Klinge dort drüben in den Wassereimer, um sie zu härten.
		AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_06");	//Am Ende muss die abgekühlte Klinge noch am Schleifstein geschärft werden.
		Log_CreateTopic(GE_SMITH,LOG_NOTE);
		B_LogEntry(GE_SMITH,"Ich kann jetzt ein leichtes Gardeschwert schmieden.");
		KNOWS_LEICHTESGARDESCHWERT = TRUE;
		PrintScreen("Lerne: Leichtes Gardeschwert schmieden",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Zu wenig Lernpunkte!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

func void dia_huno_learnsmith_gardeschwert()
{
	AI_Output(other,self,"DIA_Huno_LEARNSMITH_15_02");	//Was muss ich tun?
	if(hero.lp >= 3)
	{
		hero.lp = hero.lp - 3;
		AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_03");	//Okay, nimm den Rohstahl und halte ihn ins Schmiedefeuer.
		AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_04");	//Dann musst du den glühenden Stahl am Amboss schmieden.
		AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_05");	//Stecke dann die glühende Klinge dort drüben in den Wassereimer, um sie zu härten.
		AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_06");	//Am Ende muss die abgekühlte Klinge noch am Schleifstein geschärft werden.
		Log_CreateTopic(GE_SMITH,LOG_NOTE);
		B_LogEntry(GE_SMITH,"Ich kann jetzt ein Gardeschwert schmieden.");
		KNOWS_GARDESCHWERT = TRUE;
		PrintScreen("Lerne: Gardeschwert schmieden",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Zu wenig Lernpunkte!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

func void dia_huno_learnsmith_gardistenhand()
{
	AI_Output(other,self,"DIA_Huno_LEARNSMITH_15_02");	//Was muss ich tun?
	if(hero.lp >= 4)
	{
		hero.lp = hero.lp - 4;
		AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_03");	//Okay, nimm den Rohstahl und halte ihn ins Schmiedefeuer.
		AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_04");	//Dann musst du den glühenden Stahl am Amboss schmieden.
		AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_05");	//Stecke dann die glühende Klinge dort drüben in den Wassereimer, um sie zu härten.
		AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_06");	//Am Ende muss die abgekühlte Klinge noch am Schleifstein geschärft werden.
		Log_CreateTopic(GE_SMITH,LOG_NOTE);
		B_LogEntry(GE_SMITH,"Ich kann jetzt die Gardistenhand schmieden.");
		KNOWS_GARDISTENHAND = TRUE;
		PrintScreen("Lerne: Gardistenhand schmieden",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Zu wenig Lernpunkte!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};


var int huno_trader;

instance DIA_Huno_BUYSMITH(C_Info)
{
	npc = VLK_538_Huno;
	nr = 2;
	condition = DIA_Huno_BUYSMITH_Condition;
	information = DIA_Huno_BUYSMITH_Info;
	permanent = 1;
	important = 0;
	description = "Ich möchte Dinge fürs Schmieden kaufen!";
	trade = 1;
};


func int DIA_Huno_BUYSMITH_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Huno_YouKnowYourJob))
	{
		return TRUE;
	};
};

func void DIA_Huno_BUYSMITH_Info()
{
	AI_Output(other,self,"DIA_Huno_BUYSMITH_15_00");	//Ich möchte Dinge fürs Schmieden kaufen!
	if(HUNO_TRADER == FALSE)
	{
		Log_CreateTopic(GE_TraderOC,LOG_NOTE);
		B_LogEntry(GE_TraderOC,"Huno der Schmied des Alten Lagers handelt mir verschiedenen Schmiederwaren.");
		HUNO_TRADER = TRUE;
	};
};


instance DIA_HUNO_WAIT(C_Info)
{
	npc = VLK_538_Huno;
	nr = 2;
	condition = dia_huno_wait_condition;
	information = dia_huno_wait_info;
	permanent = 0;
	important = 1;
};


func int dia_huno_wait_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Huno_YouKnowYourJob))
	{
		return TRUE;
	};
};

func void dia_huno_wait_info()
{
	AI_Output(self,other,"DIA_Huno_Wait_15_00");	//Hey, warte mal!
	AI_Output(other,self,"DIA_Huno_Wait_09_01");	//Was denn?
	AI_Output(self,other,"DIA_Huno_Wait_15_02");	//Du bist neu hier, ich hätt' da was zu tun für dich.
	AI_Output(other,self,"DIA_Huno_Wait_09_03");	//Und was?
	AI_Output(self,other,"DIA_Huno_Wait_15_04");	//Vor einigen Tagen hab' ich ein Schwert für Bloodwyn, einen von Gomez' Gardisten geschmiedet.
	AI_Output(self,other,"DIA_Huno_Wait_09_05");	//Ich hab' die Waffe danach solang' in meine Truhe verstaut, damit Bloodwyn sie am nächsten Tag abholen kann.
	AI_Output(self,other,"DIA_Huno_Wait_09_06");	//Am nächsten Tag war das Ding auf einmal weg. Heißt also, dass irgendjemand seine Finger an meiner Truhe hatte.
	AI_Output(self,other,"DIA_Huno_Wait_09_07");	//Hör' dich mal um. Vielleicht erfährst du ja, wer da seine Finger nicht von meinen Sachen lassen konnte.
	AI_Output(self,other,"DIA_Huno_Wait_09_08");	//An deiner Stelle würd' ich beim Marktplatz anfangen, kann gut sein das der Dreckskerl das Schwert schon einem Händler verkauft hat.
	HUNO_LOSTSWORD = LOG_RUNNING;
	Log_CreateTopic(CH1_HUNOLOSTSWORD,LOG_MISSION);
	Log_SetTopicStatus(CH1_HUNOLOSTSWORD,LOG_RUNNING);
	B_LogEntry(CH1_HUNOLOSTSWORD,"Huno, der Schmied aus dem alten Lager, gab mir den Auftrag nach einem Schwert zu suchen, dass er für Bloodwyn angefertigt hat. Es wurde ihm aus der Truhe geklaut. Mit der Suche soll ich im Marktviertel beginnen.");
};


instance DIA_HUNO_SUCCESS(C_Info)
{
	npc = VLK_538_Huno;
	nr = 2;
	condition = dia_huno_success_condition;
	information = dia_huno_success_info;
	permanent = 0;
	important = 0;
	description = "Ich hab' dein Schwert.";
};


func int dia_huno_success_condition()
{
	if(Npc_HasItems(other,bloodwyns_schwert) >= 1)
	{
		return TRUE;
	};
};

func void dia_huno_success_info()
{
	AI_Output(other,self,"DIA_Huno_Success_15_00");	//Ich hab' dein Schwert.
	AI_Output(self,other,"DIA_Huno_Success_15_01");	//Gute Arbeit. Dann kann ich Bloodwyn jetzt endlich sein Schwert geben.
	AI_Output(other,self,"DIA_Huno_Success_15_02");	//Willst du gar nicht wissen wer es gestohlen hat?
	AI_Output(self,other,"DIA_Huno_Success_15_03");	//Nein, mir ging es nur um das Schwert. Hier geht jeden Tag was weg, du könntest also das halbe Lager verantwortlich machen.
	AI_Output(self,other,"DIA_Huno_Success_15_04");	//Bevor ich's vergesse. Hier deine Belohnung.
	AI_Output(other,self,"DIA_Huno_Success_15_05");	//Danke, mach's gut!
	B_GiveInvItems(other,self,bloodwyns_schwert,1);
	Npc_RemoveInvItems(self,bloodwyns_schwert,1);
	CreateInvItems(self,ItMiNugget,50);
	B_GiveInvItems(self,other,ItMiNugget,50);
	HUNO_LOSTSWORD = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_HUNOLOSTSWORD,LOG_SUCCESS);
	B_LogEntry(CH1_HUNOLOSTSWORD,"Huno war zufrieden mit meiner Arbeit und gab mir einige Brocken Erz als Belohnung für meine Arbeit.");
	B_GiveXP(XP_HUNOLOSTSWORD);
};


instance INFO_HUNO_CRAFT_WHICH(C_Info)
{
	npc = VLK_538_Huno;
	nr = 9;
	condition = info_huno_craft_which_condition;
	information = info_huno_craft_which_info;
	important = 0;
	permanent = 1;
	description = "Verbesserst du auch Rüstungen?";
};


func int info_huno_craft_which_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Huno_YouKnowYourJob))
	{
		return TRUE;
	};
};

func void info_huno_craft_which_info()
{
	AI_Output(hero,self,"Info_Huno_CRAFT_WHICH_15_01");	//Verbesserst du auch Rüstungen?
	AI_Output(self,hero,"Info_Huno_CRAFT_WHICH_09_02");	//Klar, allerdings brauchst du die entsprechende Rüstung und das entsprechende Erz dafür.
	Info_ClearChoices(info_huno_craft_which);
	Info_AddChoice(info_huno_craft_which,DIALOG_BACK,info_huno_craft_which_back);
	if(Npc_HasItems(other,vlk_armor_l) >= 1)
	{
		Info_AddChoice(info_huno_craft_which,"Verbesserte leichte Buddlerhose (125 Erz)",info_huno_craft_which_vlk);
	};
	if(Npc_HasItems(other,sfb_armor_l) >= 1)
	{
		Info_AddChoice(info_huno_craft_which,"Verbesserte Schürferklamotten (125 Erz)",info_huno_craft_which_sfb);
	};
};

func void info_huno_craft_which_back()
{
	Info_ClearChoices(info_huno_craft_which);
};

func void info_huno_craft_which_vlk()
{
	AI_Output(other,self,",	Info_Huno_CRAFT_WHICH_Huno_13_01");	//Hier ist die Rüstung.
	if((Npc_HasItems(other,vlk_armor_l) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 125))
	{
		AI_Output(self,other,",	Info_Huno_CRAFT_WHICH_Huno_16_02");	//Sieht ganz gut aus.
		AI_Output(self,other,",	Info_Huno_CRAFT_WHICH_Huno_15_04");	//Bin sicher, dass ich damit was anstellen kann. Warte, bin gleich wieder da.
		AI_UnequipArmor(hero);
		B_GiveInvItems(hero,self,ItMiNugget,125);
		Npc_RemoveInvItem(hero,vlk_armor_l);
		B_StartUseMob(self,"BSFIRE");
		AI_Wait(self,1);
		B_StopUseMob(self,"BSFIRE");
		AI_Wait(self,1);
		B_StartUseMob(self,"BSANVIL");
		AI_Wait(self,1);
		B_StopUseMob(self,"BSANVIL");
		AI_Wait(self,1);
		AI_GotoNpc(self,hero);
		CreateInvItem(hero,vlk_armor_l_upgrade);
		CreateInvItem(self,ItAmArrow);
		B_GiveInvItems(self,hero,ItAmArrow,1);
		Npc_RemoveInvItem(hero,ItAmArrow);
		AI_EquipBestArmor(hero);
		AI_Output(self,other,",	Info_Huno_CRAFT_WHICH_Huno_15_05");	//So, hier ist das Teil. Pass gut drauf auf!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Huno_CRAFT_WHICH_Huno_15_02");	//Dir fehlt Erz, Junge. Komm' wieder wenn du ausreichend hast.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_huno_craft_which);
	};
};

func void info_huno_craft_which_sfb()
{
	AI_Output(other,self,",	Info_Huno_CRAFT_WHICH_Huno_13_01");	//Hier ist die Rüstung.
	if((Npc_HasItems(other,sfb_armor_l) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 125))
	{
		AI_Output(self,other,",	Info_Huno_CRAFT_WHICH_Huno_16_02");	//Sieht ganz gut aus.
		AI_Output(self,other,",	Info_Huno_CRAFT_WHICH_Huno_15_04");	//Bin sicher, dass ich damit was anstellen kann. Warte, bin gleich wieder da.
		AI_UnequipArmor(hero);
		B_GiveInvItems(hero,self,sfb_armor_l,1);
		B_GiveInvItems(hero,self,ItMiNugget,125);
		Npc_RemoveInvItem(self,sfb_armor_l);
		B_StartUseMob(self,"BSFIRE");
		AI_Wait(self,1);
		B_StopUseMob(self,"BSFIRE");
		AI_Wait(self,1);
		B_StartUseMob(self,"BSANVIL");
		AI_Wait(self,1);
		B_StopUseMob(self,"BSANVIL");
		AI_Wait(self,1);
		AI_GotoNpc(self,hero);
		CreateInvItem(self,sfb_armor_l_upgrade);
		B_GiveInvItems(self,hero,sfb_armor_l_upgrade,1);
		AI_EquipBestArmor(hero);
		AI_Output(self,other,",	Info_Huno_CRAFT_WHICH_Huno_15_05");	//So, hier ist das Teil. Pass gut drauf auf!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Huno_CRAFT_WHICH_Huno_15_02");	//Dir fehlt Erz, Junge. Komm' wieder wenn du ausreichend hast.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_huno_craft_which);
	};
};

