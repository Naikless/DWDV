
instance DIA_Darrion_Exit(C_Info)
{
	npc = NOV_1312_Darrion;
	nr = 999;
	condition = DIA_Darrion_Exit_Condition;
	information = DIA_Darrion_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Darrion_Exit_Condition()
{
	return 1;
};

func void DIA_Darrion_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Darrion_Hello(C_Info)
{
	npc = NOV_1312_Darrion;
	nr = 1;
	condition = DIA_Darrion_Hello_Condition;
	information = DIA_Darrion_Hello_Info;
	permanent = 0;
	description = "Hi - ich bin neu hier und will das Lager kennenlernen.";
};


func int DIA_Darrion_Hello_Condition()
{
	return 1;
};

func void DIA_Darrion_Hello_Info()
{
	AI_Output(other,self,"DIA_Darrion_Hello_15_00");	//Hi - ich bin neu hier und will das Lager kennen lernen.
	AI_Output(self,other,"DIA_Darrion_Hello_11_01");	//Da bist du zum falschen Ort gekommen. Seit sich die Templer zum Kampf rüsten, sind wir Tag und Nacht beschäftigt.
	AI_Output(self,other,"DIA_Darrion_Hello_11_02");	//Ich hab' nicht viel Zeit für neugierige Fragen. Also stör mich nicht - es sei denn, du willst was kaufen.
	Log_CreateTopic(GE_TraderPSI,LOG_NOTE);
	B_LogEntry(GE_TraderPSI,"Der Novize Darrion handelt mit WAFFEN. Er hält sich die meiste Zeit in der Schmiede auf.");
};


instance DIA_Darrion_Trade(C_Info)
{
	npc = NOV_1312_Darrion;
	nr = 800;
	condition = DIA_Darrion_Trade_Condition;
	information = DIA_Darrion_Trade_Info;
	permanent = 1;
	description = "Ich will mit dir handeln!";
	trade = 1;
};


func int DIA_Darrion_Trade_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Darrion_Hello))
	{
		return TRUE;
	};
};

func void DIA_Darrion_Trade_Info()
{
	AI_Output(other,self,"DIA_Darrion_Trade_15_00");	//Ich will mit dir handeln!
	AI_Output(self,other,"DIA_Darrion_Trade_11_01");	//Gut! Hier - das sind die Waffen, die ich zurzeit da habe.
};


instance DIA_DARRION_LEARNNOT(C_Info)
{
	npc = NOV_1312_Darrion;
	nr = 1;
	condition = dia_darrion_learnnot_condition;
	information = dia_darrion_learnnot_info;
	permanent = 0;
	description = "Kannst du mir was beibringen?";
};


func int dia_darrion_learnnot_condition()
{
	if((Npc_KnowsInfo(hero,DIA_Darrion_Hello) && (Npc_GetTrueGuild(hero) != GIL_NOV)) || (Npc_GetTrueGuild(hero) != GIL_TPL) || (Npc_GetTrueGuild(hero) != GIL_GUR))
	{
		return TRUE;
	};
};

func void dia_darrion_learnnot_info()
{
	AI_Output(other,self,"DIA_Darrion_LearnNOT_15_00");	//Kannst du mir was beibringen?
	AI_Output(self,other,"DIA_Darrion_LearnNOT_11_01");	//Ich unterrichte nur Leute, die zu uns gehören.
	AI_Output(self,other,"DIA_Darrion_LearnNOT_11_02");	//Wenn du was lernen willst, wirst du dich uns erst anschliessen müssen.
};


var int darrion_smithasking;

instance DIA_DARRION_LEARNYES(C_Info)
{
	npc = NOV_1312_Darrion;
	nr = 1;
	condition = dia_darrion_learnyes_condition;
	information = dia_darrion_learnyes_info;
	permanent = 1;
	description = "Kannst du mir das Schmiedehandwerk beibringen?";
};


func int dia_darrion_learnyes_condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_NOV) || (Npc_GetTrueGuild(hero) == GIL_TPL) || (Npc_GetTrueGuild(hero) == GIL_GUR))
	{
		return TRUE;
	};
};

func void dia_darrion_learnyes_info()
{
	AI_Output(other,self,"DIA_Darrion_LearnYES_15_00");	//Kannst du mir das Schmiedehandwerk beibringen?
	AI_Output(self,other,"DIA_Darrion_LearnYES_11_01");	//Ich kann dir beibringen, wie du ein ordentliches Schwert schmieden kannst.
	AI_Output(self,other,"DIA_Darrion_LearnYES_11_02");	//Allerdings, wirst du dafür einiges an Erfahrung mitbringen müssen.
	if(DARRION_SMITHASKING == FALSE)
	{
		Log_CreateTopic(GE_TeacherPSI,LOG_NOTE);
		B_LogEntry(GE_TeacherPSI,"Der Novize Darrion kann mir das Schmiedehandwerk beibringen. Er befindet sich tagsüber in der Schmiede.");
		DARRION_SMITHASKING = TRUE;
	};
	Info_ClearChoices(dia_darrion_learnyes);
	Info_AddChoice(dia_darrion_learnyes,DIALOG_BACK,dia_darrion_learnyes_back);
	if(((KNOWS_STREITKOLBEN == FALSE) && (Kapitel > 1) && (Npc_GetTrueGuild(hero) == GIL_NOV)) || ((Npc_GetTrueGuild(hero) == GIL_TPL) && (KNOWS_STREITKOLBEN == FALSE)) || ((Npc_GetTrueGuild(hero) == GIL_GUR) && (KNOWS_STREITKOLBEN == FALSE)))
	{
		Info_AddChoice(dia_darrion_learnyes,"Streitkolben (Kosten: 1 Lernpunkt)",dia_darrion_learnyes_streitkolben);
	};
	if(((KNOWS_STAHLZUNGE == FALSE) && (KNOWS_STREITKOLBEN == TRUE) && (Kapitel > 1) && (Npc_GetTrueGuild(hero) == GIL_NOV)) || ((Npc_GetTrueGuild(hero) == GIL_TPL) && (KNOWS_STAHLZUNGE == FALSE) && (KNOWS_STREITKOLBEN == TRUE)) || ((Npc_GetTrueGuild(hero) == GIL_GUR) && (KNOWS_STAHLZUNGE == FALSE) && (KNOWS_STREITKOLBEN == TRUE)))
	{
		Info_AddChoice(dia_darrion_learnyes,"Stahlzunge (Kosten: 2 Lernpunkte)",dia_darrion_learnyes_stahlzunge);
	};
	if(((KNOWS_KRIEGSSCHWERT == FALSE) && (KNOWS_STREITKOLBEN == TRUE) && (KNOWS_STAHLZUNGE == TRUE) && (Kapitel > 1) && (Npc_GetTrueGuild(hero) == GIL_NOV)) || ((Npc_GetTrueGuild(hero) == GIL_TPL) && (KNOWS_KRIEGSSCHWERT == FALSE) && (KNOWS_STREITKOLBEN == TRUE) && (KNOWS_STAHLZUNGE == TRUE)) || ((Npc_GetTrueGuild(hero) == GIL_GUR) && (KNOWS_KRIEGSSCHWERT == FALSE) && (KNOWS_STREITKOLBEN == TRUE) && (KNOWS_STAHLZUNGE == TRUE)))
	{
		Info_AddChoice(dia_darrion_learnyes,"Kriegsschwert (Kosten: 3 Lernpunkte)",dia_darrion_learnyes_kriegsschwert);
	};
	if(((KNOWS_LEICHTER2H == FALSE) && (KNOWS_KRIEGSSCHWERT == TRUE) && (KNOWS_STREITKOLBEN == TRUE) && (KNOWS_STAHLZUNGE == TRUE) && (Kapitel > 2) && (Npc_GetTrueGuild(hero) == GIL_TPL)) || ((Npc_GetTrueGuild(hero) == GIL_GUR) && (KNOWS_LEICHTER2H == FALSE) && (KNOWS_KRIEGSSCHWERT == TRUE) && (KNOWS_STREITKOLBEN == TRUE) && (KNOWS_STAHLZUNGE == TRUE) && (Kapitel > 2)))
	{
		Info_AddChoice(dia_darrion_learnyes,"Leichter Zweihänder (Kosten: 4 Lernpunkte)",dia_darrion_learnyes_leichter2h);
	};
	if(((KNOWS_HüTERKLINGE == FALSE) && (KNOWS_KRIEGSSCHWERT == TRUE) && (KNOWS_STREITKOLBEN == TRUE) && (KNOWS_STAHLZUNGE == TRUE) && (KNOWS_LEICHTER2H == TRUE) && (Kapitel > 2) && (Npc_GetTrueGuild(hero) == GIL_TPL)) || ((Npc_GetTrueGuild(hero) == GIL_GUR) && (KNOWS_HüTERKLINGE == FALSE) && (KNOWS_KRIEGSSCHWERT == TRUE) && (KNOWS_STREITKOLBEN == TRUE) && (KNOWS_STAHLZUNGE == TRUE) && (KNOWS_LEICHTER2H == TRUE) && (Kapitel > 2)))
	{
		Info_AddChoice(dia_darrion_learnyes,"Hüterklinge (Kosten: 5 Lernpunkte)",dia_darrion_learnyes_hüterklinge);
	};
	if((KNOWS_KöNIGSKLINGE == FALSE) && (KNOWS_KRIEGSSCHWERT == TRUE) && (KNOWS_HüTERKLINGE == TRUE) && (KNOWS_STREITKOLBEN == TRUE) && (KNOWS_STAHLZUNGE == TRUE) && (KNOWS_LEICHTER2H == TRUE) && (Kapitel > 3) && (Npc_GetTrueGuild(hero) == GIL_TPL))
	{
		Info_AddChoice(dia_darrion_learnyes,"Königsklinge (Kosten: 6 Lernpunkte)",dia_darrion_learnyes_königsklinge);
	};
	if((KNOWS_ROTER_WIND == FALSE) && (KNOWS_KRIEGSSCHWERT == TRUE) && (KNOWS_HüTERKLINGE == TRUE) && (KNOWS_KöNIGSKLINGE == TRUE) && (KNOWS_STREITKOLBEN == TRUE) && (KNOWS_STAHLZUNGE == TRUE) && (KNOWS_LEICHTER2H == TRUE) && (Kapitel > 4) && (Npc_GetTrueGuild(hero) == GIL_TPL))
	{
		Info_AddChoice(dia_darrion_learnyes,"Roter Wind (Kosten: 7 Lernpunkte)",dia_darrion_learnyes_roter_wind);
	};
};

func void dia_darrion_learnyes_back()
{
	Info_ClearChoices(dia_darrion_learnyes);
};

func void dia_darrion_learnyes_streitkolben()
{
	AI_Output(other,self,"DIA_Darrion_LearnYES_15_02");	//Was muss ich tun?
	if(hero.lp >= 1)
	{
		hero.lp = hero.lp - 1;
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_03");	//Als erstes nimmst du den Rohstahl und erwärmst ihn am Feuer.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_04");	//Danach musst du den glühenden Stahl am Amboss schmieden.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_05");	//Nun steckst du die glühende Klinge in den Wassereimer, um sie zu härten.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_06");	//Anschliessend, musst du die gekühlte Klinge am Schleifstein schärfen.
		Log_CreateTopic(GE_SMITH,LOG_NOTE);
		B_LogEntry(GE_SMITH,"Ich kann nun einen Streitkolben schmieden.");
		KNOWS_STREITKOLBEN = TRUE;
		B_GiveSkill(other,NPC_TALENT_FIREMASTER,1,0);
	}
	else
	{
		PrintScreen("Zu wenig Lernpunkte!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

func void dia_darrion_learnyes_stahlzunge()
{
	AI_Output(other,self,"DIA_Darrion_LearnYES_15_02");	//Was muss ich tun?
	if(hero.lp >= 2)
	{
		hero.lp = hero.lp - 2;
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_03");	//Als erstes nimmst du den Rohstahl und erwärmst ihn am Feuer.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_04");	//Danach musst du den glühenden Stahl am Amboss schmieden.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_05");	//Nun steckst du die glühende Klinge in den Wassereimer, um sie zu härten.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_06");	//Anschliessend, musst du die gekühlte Klinge am Schleifstein schärfen.
		Log_CreateTopic(GE_SMITH,LOG_NOTE);
		B_LogEntry(GE_SMITH,"Ich kann nun eine Stahlzunge schmieden.");
		KNOWS_STAHLZUNGE = TRUE;
		PrintScreen("Lerne: Stahlzunge schmieden",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Zu wenig Lernpunkte!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

func void dia_darrion_learnyes_kriegsschwert()
{
	AI_Output(other,self,"DIA_Darrion_LearnYES_15_02");	//Was muss ich tun?
	if(hero.lp >= 3)
	{
		hero.lp = hero.lp - 3;
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_03");	//Als erstes nimmst du den Rohstahl und erwärmst ihn am Feuer.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_04");	//Danach musst du den glühenden Stahl am Amboss schmieden.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_05");	//Nun steckst du die glühende Klinge in den Wassereimer, um sie zu härten.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_06");	//Anschliessend, musst du die gekühlte Klinge am Schleifstein schärfen.
		Log_CreateTopic(GE_SMITH,LOG_NOTE);
		B_LogEntry(GE_SMITH,"Ich kann nun ein Kriegsschwert schmieden.");
		KNOWS_KRIEGSSCHWERT = TRUE;
		PrintScreen("Lerne: Kriegssschwert schmieden",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Zu wenig Lernpunkte!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

func void dia_darrion_learnyes_leichter2h()
{
	AI_Output(other,self,"DIA_Darrion_LearnYES_15_02");	//Was muss ich tun?
	if(hero.lp >= 4)
	{
		hero.lp = hero.lp - 4;
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_03");	//Als erstes nimmst du den Rohstahl und erwärmst ihn am Feuer.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_04");	//Danach musst du den glühenden Stahl am Amboss schmieden.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_05");	//Nun steckst du die glühende Klinge in den Wassereimer, um sie zu härten.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_06");	//Anschliessend, musst du die gekühlte Klinge am Schleifstein schärfen.
		Log_CreateTopic(GE_SMITH,LOG_NOTE);
		B_LogEntry(GE_SMITH,"Jetzt kann ich einen leichten Zweihänder schmieden.");
		KNOWS_LEICHTER2H = TRUE;
		PrintScreen("Lerne: Leichter Zweihänder schmieden",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Zu wenig Lernpunkte!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

func void dia_darrion_learnyes_hüterklinge()
{
	AI_Output(other,self,"DIA_Darrion_LearnYES_15_02");	//Was muss ich tun?
	if(hero.lp >= 5)
	{
		hero.lp = hero.lp - 5;
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_03");	//Als erstes nimmst du den Rohstahl und erwärmst ihn am Feuer.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_04");	//Danach musst du den glühenden Stahl am Amboss schmieden.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_05");	//Nun steckst du die glühende Klinge in den Wassereimer, um sie zu härten.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_06");	//Anschliessend, musst du die gekühlte Klinge am Schleifstein schärfen.
		Log_CreateTopic(GE_SMITH,LOG_NOTE);
		B_LogEntry(GE_SMITH,"Jetzt kann ich eine Hüterklinge schmieden.");
		KNOWS_HüTERKLINGE = TRUE;
		PrintScreen("Lerne: Hüterklinge schmieden",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Zu wenig Lernpunkte!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

func void dia_darrion_learnyes_königsklinge()
{
	AI_Output(other,self,"DIA_Darrion_LearnYES_15_02");	//Was muss ich tun?
	if(hero.lp >= 6)
	{
		hero.lp = hero.lp - 6;
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_03");	//Als erstes nimmst du den Rohstahl und erwärmst ihn am Feuer.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_04");	//Danach musst du den glühenden Stahl am Amboss schmieden.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_05");	//Nun steckst du die glühende Klinge in den Wassereimer, um sie zu härten.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_06");	//Anschliessend, musst du die gekühlte Klinge am Schleifstein schärfen.
		Log_CreateTopic(GE_SMITH,LOG_NOTE);
		B_LogEntry(GE_SMITH,"Ab jetzt werde ich die Königsklinge schmieden können.");
		KNOWS_KöNIGSKLINGE = TRUE;
		PrintScreen("Lerne: Königsklinge schmieden",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Zu wenig Lernpunkte!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

func void dia_darrion_learnyes_roter_wind()
{
	AI_Output(other,self,"DIA_Darrion_LearnYES_15_02");	//Was muss ich tun?
	if(hero.lp >= 7)
	{
		hero.lp = hero.lp - 7;
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_03");	//Als erstes nimmst du den Rohstahl und erwärmst ihn am Feuer.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_04");	//Danach musst du den glühenden Stahl am Amboss schmieden.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_05");	//Nun steckst du die glühende Klinge in den Wassereimer, um sie zu härten.
		AI_Output(self,other,"DIA_Darrion_LearnYES_09_06");	//Anschliessend, musst du die gekühlte Klinge am Schleifstein schärfen.
		Log_CreateTopic(GE_SMITH,LOG_NOTE);
		B_LogEntry(GE_SMITH,"Ich werde von nun an in der Lage sein das Schwert Roter Wind zu schmieden.");
		KNOWS_ROTER_WIND = TRUE;
		PrintScreen("Lerne: Roter Wind schmieden",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Zu wenig Lernpunkte!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};


instance INFO_DARRION_ARMORFINISHED(C_Info)
{
	npc = NOV_1312_Darrion;
	condition = info_darrion_armorfinished_condition;
	information = info_darrion_armorfinished_info;
	important = 0;
	permanent = 0;
	description = "Du wolltest mich sprechen? ";
};


func int info_darrion_armorfinished_condition()
{
	if(((FreemineOrc_LookingUlumulu == LOG_SUCCESS) && (Npc_GetTrueGuild(hero) == GIL_NOV)) || ((FreemineOrc_LookingUlumulu == LOG_SUCCESS) && (Npc_GetTrueGuild(hero) == GIL_TPL)))
	{
		return TRUE;
	};
};

func void info_darrion_armorfinished_info()
{
	if(Npc_GetTrueGuild(hero) == GIL_TPL)
	{
		AI_Output(hero,self,"Info_Darrion_DIE_06_01");	//Du wolltest mich sprechen?
		AI_Output(self,hero,"Info_Darrion_DIE_06_02");	//Da bist du ja. Ja, ich wollte dich sprechen.
		AI_Output(self,hero,"Info_Darrion_DIE_06_03");	//Ich hab' schon gehört was alles passiert ist und hab' ein Geschenk für dich.
		AI_Output(self,hero,"Info_Darrion_DIE_14_04");	//Als einen unserer besten Templer, ist es mir eine Ehre dir diese Rüstung zu verleihen.
		AI_Output(self,hero,"Info_Darrion_DIE_06_04");	//Wir fanden diese Rüstung bei der Errichtung unseres Lagers im Tempel.
		AI_Output(self,hero,"Info_Darrion_DIE_06_05");	//Wir wissen nicht woher sie stammt. Sie gehörte wahrscheinlich den früheren Bewohnern der Tempel.
		AI_Output(self,hero,"Info_Darrion_DIE_06_06");	//Ihre Kultur hat sich auf jeden Fall von der unseren sehr unterschieden.
		AI_Output(self,hero,"Info_Darrion_DIE_06_07");	//Hoffentlich leistet dir diese Rüstung gute Dienste.
		B_GiveXP(XP_GorMCPlateArmor);
		CreateInvItem(self,non_armor_h);
		B_GiveInvItems(self,hero,non_armor_h,1);
	}
	else
	{
		AI_Output(hero,self,"Info_Darrion_DIE_06_01");	//Du wolltest mich sprechen?
		AI_Output(self,hero,"Info_Darrion_DIE_06_02");	//Da bist du ja. Ja, ich wollte dich sprechen.
		AI_Output(self,hero,"Info_Darrion_DIE_06_03");	//Ich hab' schon gehört was alles passiert ist und hab' ein Geschenk für dich.
		AI_Output(self,hero,"Info_Darrion_DIE_15_04");	//Du hast es selbst als Novize sehr weit gebracht. Aus diesem Grund hast du dir sie verdient.
		AI_Output(self,hero,"Info_Darrion_DIE_06_04");	//Wir fanden diese Rüstung bei der Errichtung unseres Lagers im Tempel.
		AI_Output(self,hero,"Info_Darrion_DIE_06_05");	//Wir wissen nicht woher sie stammt. Sie gehörte wahrscheinlich den früheren Bewohnern der Tempel.
		AI_Output(self,hero,"Info_Darrion_DIE_06_06");	//Ihre Kultur hat sich auf jeden Fall von der unseren sehr unterschieden.
		AI_Output(self,hero,"Info_Darrion_DIE_06_07");	//Hoffentlich leistet dir diese Rüstung gute Dienste.
		B_GiveXP(XP_GorMCPlateArmor);
		CreateInvItem(self,non_armor_h);
		B_GiveInvItems(self,hero,non_armor_h,1);
	};
};


instance INFO_DARRION_CRAFT_WHICH(C_Info)
{
	npc = NOV_1312_Darrion;
	nr = 9;
	condition = info_darrion_craft_which_condition;
	information = info_darrion_craft_which_info;
	important = 0;
	permanent = 1;
	description = "Kannst du meine Rüstung verbessern?";
};


func int info_darrion_craft_which_condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_NOV) || (Npc_GetTrueGuild(hero) == GIL_TPL) || (Npc_GetTrueGuild(hero) == GIL_GUR))
	{
		return TRUE;
	};
};

func void info_darrion_craft_which_info()
{
	AI_Output(hero,self,"Info_Darrion_CRAFT_WHICH_15_01");	//Kannst du meine Rüstung verbessern?
	AI_Output(self,hero,"Info_Darrion_CRAFT_WHICH_09_02");	//Wenn du eine entsprechende Rüstung hast, an der sich was verbessern lässt schon.
	Info_ClearChoices(info_darrion_craft_which);
	Info_AddChoice(info_darrion_craft_which,DIALOG_BACK,info_darrion_craft_which_back);
	if(Npc_HasItems(other,nov_armor_l) >= 1)
	{
		Info_AddChoice(info_darrion_craft_which,"Verbesserter Novizenrock (375 Erz)",info_darrion_craft_which_novl);
	};
	if(Npc_HasItems(other,nov_armor_m) >= 1)
	{
		Info_AddChoice(info_darrion_craft_which,"Verbesserte leichte Novizenrüstung (525 Erz)",info_darrion_craft_which_novm);
	};
	if(Npc_HasItems(other,nov_armor_h) >= 1)
	{
		Info_AddChoice(info_darrion_craft_which,"Verbesserte Novizenrüstung (600 Erz)",info_darrion_craft_which_novh);
	};
	if(Npc_HasItems(other,tpl_armor_l) >= 1)
	{
		Info_AddChoice(info_darrion_craft_which,"Verbesserte leichte Templerrüstung (675 Erz)",info_darrion_craft_which_tpll);
	};
	if(Npc_HasItems(other,tpl_armor_m) >= 1)
	{
		Info_AddChoice(info_darrion_craft_which,"Verbesserte Templerrüstung (825 Erz)",info_darrion_craft_which_tplm);
	};
	if(Npc_HasItems(other,tpl_armor_h) >= 1)
	{
		Info_AddChoice(info_darrion_craft_which,"Verbesserte schwere Templerrüstung (1050 Erz)",info_darrion_craft_which_tplh);
	};
};

func void info_darrion_craft_which_back()
{
	Info_ClearChoices(info_darrion_craft_which);
};

func void info_darrion_craft_which_novl()
{
	AI_Output(other,self,",	Info_Darrion_CRAFT_WHICH_Darrion_13_01");	//Hier ist die Rüstung.
	if((Npc_HasItems(other,nov_armor_l) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 375))
	{
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_16_02");	//Gut, diese Rüstung kann ich etwas verbessern.
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_15_04");	//Einen Moment, dass haben wir gleich.
		AI_UnequipArmor(hero);
		B_GiveInvItems(hero,self,nov_armor_l,1);
		B_GiveInvItems(hero,self,ItMiNugget,375);
		Npc_RemoveInvItem(self,nov_armor_l);
		B_StartUseMob(self,"BSFIRE");
		AI_Wait(self,1);
		B_StopUseMob(self,"BSFIRE");
		AI_Wait(self,1);
		B_StartUseMob(self,"BSANVIL");
		AI_Wait(self,1);
		B_StopUseMob(self,"BSANVIL");
		AI_Wait(self,1);
		AI_GotoNpc(self,hero);
		CreateInvItem(self,nov_armor_l_upgrade);
		B_GiveInvItems(self,hero,nov_armor_l_upgrade,1);
		AI_EquipBestArmor(hero);
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_15_05");	//Hier ist deine Rüstung. Hoffentlich schützt sie dich besser als bisher.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_15_02");	//Du hast nicht genügend Erz. Komm' wieder wenn du mehr Erz dabei hast.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_darrion_craft_which);
	};
};

func void info_darrion_craft_which_novm()
{
	AI_Output(other,self,",	Info_Darrion_CRAFT_WHICH_Darrion_13_01");	//Hier ist die Rüstung.
	if((Npc_HasItems(other,nov_armor_m) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 525))
	{
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_16_02");	//Gut, diese Rüstung kann ich etwas verbessern.
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_15_04");	//Einen Moment, dass haben wir gleich.
		B_StartUseMob(self,"BSFIRE");
		AI_Wait(self,1);
		B_StopUseMob(self,"BSFIRE");
		AI_Wait(self,1);
		B_StartUseMob(self,"BSANVIL");
		AI_Wait(self,1);
		B_StopUseMob(self,"BSANVIL");
		AI_Wait(self,1);
		AI_GotoNpc(self,hero);
		B_GiveInvItems(hero,self,ItMiNugget,525);
		Npc_RemoveInvItem(hero,nov_armor_m);
		CreateInvItem(hero,nov_armor_m_upgrade);
		AI_EquipBestArmor(hero);
		CreateInvItem(self,ItAmArrow);
		B_GiveInvItems(self,hero,ItAmArrow,1);
		Npc_RemoveInvItem(hero,ItAmArrow);
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_15_05");	//Hier ist deine Rüstung. Hoffentlich schützt sie dich besser als bisher.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_15_02");	//Du hast nicht genügend Erz. Komm' wieder wenn du mehr Erz dabei hast.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_darrion_craft_which);
	};
};

func void info_darrion_craft_which_novh()
{
	AI_Output(other,self,",	Info_Darrion_CRAFT_WHICH_Darrion_13_01");	//Hier ist die Rüstung.
	if((Npc_HasItems(other,nov_armor_h) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 600))
	{
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_16_02");	//Gut, diese Rüstung kann ich etwas verbessern.
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_15_04");	//Einen Moment, dass haben wir gleich.
		AI_UnequipArmor(hero);
		B_GiveInvItems(hero,self,nov_armor_h,1);
		B_GiveInvItems(hero,self,ItMiNugget,600);
		Npc_RemoveInvItem(self,nov_armor_h);
		B_StartUseMob(self,"BSFIRE");
		AI_Wait(self,1);
		B_StopUseMob(self,"BSFIRE");
		AI_Wait(self,1);
		B_StartUseMob(self,"BSANVIL");
		AI_Wait(self,1);
		B_StopUseMob(self,"BSANVIL");
		AI_Wait(self,1);
		AI_GotoNpc(self,hero);
		CreateInvItem(self,nov_armor_h_upgrade);
		B_GiveInvItems(self,hero,nov_armor_h_upgrade,1);
		AI_EquipBestArmor(hero);
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_15_05");	//Hier ist deine Rüstung. Hoffentlich schützt sie dich besser als bisher.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_15_02");	//Du hast nicht genügend Erz. Komm' wieder wenn du mehr Erz dabei hast.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_darrion_craft_which);
	};
};

func void info_darrion_craft_which_tpll()
{
	AI_Output(other,self,",	Info_Darrion_CRAFT_WHICH_Darrion_13_01");	//Hier ist die Rüstung.
	if((Npc_HasItems(other,tpl_armor_l) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 675))
	{
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_16_02");	//Gut, diese Rüstung kann ich etwas verbessern.
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_15_04");	//Einen Moment, dass haben wir gleich.
		AI_UnequipArmor(hero);
		B_GiveInvItems(hero,self,tpl_armor_l,1);
		B_GiveInvItems(hero,self,ItMiNugget,675);
		Npc_RemoveInvItem(self,tpl_armor_l);
		B_StartUseMob(self,"BSFIRE");
		AI_Wait(self,1);
		B_StopUseMob(self,"BSFIRE");
		AI_Wait(self,1);
		B_StartUseMob(self,"BSANVIL");
		AI_Wait(self,1);
		B_StopUseMob(self,"BSANVIL");
		AI_Wait(self,1);
		AI_GotoNpc(self,hero);
		CreateInvItem(self,tpl_armor_l_upgrade);
		B_GiveInvItems(self,hero,tpl_armor_l_upgrade,1);
		AI_EquipBestArmor(hero);
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_15_05");	//Hier ist deine Rüstung. Hoffentlich schützt sie dich besser als bisher.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_15_02");	//Du hast nicht genügend Erz. Komm' wieder wenn du mehr Erz dabei hast.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_darrion_craft_which);
	};
};

func void info_darrion_craft_which_tplm()
{
	AI_Output(other,self,",	Info_Darrion_CRAFT_WHICH_Darrion_13_01");	//Hier ist die Rüstung.
	if((Npc_HasItems(other,tpl_armor_m) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 825))
	{
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_16_02");	//Gut, diese Rüstung kann ich etwas verbessern.
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_15_04");	//Einen Moment, dass haben wir gleich.
		AI_UnequipArmor(hero);
		B_GiveInvItems(hero,self,tpl_armor_m,1);
		B_GiveInvItems(hero,self,ItMiNugget,825);
		Npc_RemoveInvItem(self,tpl_armor_m);
		B_StartUseMob(self,"BSFIRE");
		AI_Wait(self,1);
		B_StopUseMob(self,"BSFIRE");
		AI_Wait(self,1);
		B_StartUseMob(self,"BSANVIL");
		AI_Wait(self,1);
		B_StopUseMob(self,"BSANVIL");
		AI_Wait(self,1);
		AI_GotoNpc(self,hero);
		CreateInvItem(self,tpl_armor_m_upgrade);
		B_GiveInvItems(self,hero,tpl_armor_m_upgrade,1);
		AI_EquipBestArmor(hero);
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_15_05");	//Hier ist deine Rüstung. Hoffentlich schützt sie dich besser als bisher.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_15_02");	//Du hast nicht genügend Erz. Komm' wieder wenn du mehr Erz dabei hast.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_darrion_craft_which);
	};
};

func void info_darrion_craft_which_tplh()
{
	AI_Output(other,self,",	Info_Darrion_CRAFT_WHICH_Darrion_13_01");	//Hier ist die Rüstung.
	if((Npc_HasItems(other,tpl_armor_h) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 1050))
	{
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_16_02");	//Gut, diese Rüstung kann ich etwas verbessern.
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_15_04");	//Einen Moment, dass haben wir gleich.
		AI_UnequipArmor(hero);
		B_GiveInvItems(hero,self,tpl_armor_h,1);
		B_GiveInvItems(hero,self,ItMiNugget,1050);
		Npc_RemoveInvItem(self,tpl_armor_h);
		B_StartUseMob(self,"BSFIRE");
		AI_Wait(self,1);
		B_StopUseMob(self,"BSFIRE");
		AI_Wait(self,1);
		B_StartUseMob(self,"BSANVIL");
		AI_Wait(self,1);
		B_StopUseMob(self,"BSANVIL");
		AI_Wait(self,1);
		AI_GotoNpc(self,hero);
		CreateInvItem(self,tpl_armor_h_upgrade);
		B_GiveInvItems(self,hero,tpl_armor_h_upgrade,1);
		AI_EquipBestArmor(hero);
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_15_05");	//Hier ist deine Rüstung. Hoffentlich schützt sie dich besser als bisher.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Darrion_CRAFT_WHICH_Darrion_15_02");	//Du hast nicht genügend Erz. Komm' wieder wenn du mehr Erz dabei hast.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_darrion_craft_which);
	};
};

