
instance DIA_Torrez_Exit(C_Info)
{
	npc = KDF_405_Torrez;
	nr = 999;
	condition = DIA_Torrez_Exit_Condition;
	information = DIA_Torrez_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Torrez_Exit_Condition()
{
	return 1;
};

func void DIA_Torrez_Exit_Info()
{
	AI_StopProcessInfos(self);
	if(!Npc_HasItems(self,ItArRuneFirebolt))
	{
		CreateInvItem(self,ItArRuneFirebolt);
	};
};


instance DIA_Torrez_Hello(C_Info)
{
	npc = KDF_405_Torrez;
	nr = 1;
	condition = DIA_Torrez_Hello_Condition;
	information = DIA_Torrez_Hello_Info;
	permanent = 0;
	description = "Ich suche den obersten Feuermagier!";
};


func int DIA_Torrez_Hello_Condition()
{
	return 1;
};

func void DIA_Torrez_Hello_Info()
{
	AI_Output(other,self,"DIA_Torrez_Hello_15_00");	//Ich suche den obersten Feuermagier!
	AI_Output(self,other,"DIA_Torrez_Hello_04_01");	//Sprich mit Milten! Und nun geh!
	AI_StopProcessInfos(self);
};


instance DIA_Torrez_Belohnung(C_Info)
{
	npc = KDF_405_Torrez;
	nr = 5;
	condition = DIA_Torrez_Belohnung_Condition;
	information = DIA_Torrez_Belohnung_Info;
	permanent = 0;
	description = "Ich habe einen Brief übergeben und soll meine Belohnung selber wählen.";
};


func int DIA_Torrez_Belohnung_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Milten_ComesBack) && (milten_HasLetter == TRUE))
	{
		return 1;
	};
};

func void DIA_Torrez_Belohnung_Info()
{
	AI_Output(other,self,"DIA_Torrez_Belohnung_15_00");	//Corristo schickt mich. Ich habe den Brief übergeben und soll meine Belohnung selber wählen.
	AI_Output(self,other,"DIA_Torrez_Belohnung_04_01");	//Du hast uns einen großen Dienst erwiesen und sollst deine Belohnung erhalten. Wähle mit Bedacht.
	Info_ClearChoices(DIA_Torrez_Belohnung);
	Info_AddChoice(DIA_Torrez_Belohnung,"Essenz des Geistes (Maximales Mana +5)",DIA_Torrez_Belohnung_ManaMax);
	Info_AddChoice(DIA_Torrez_Belohnung,"3 Spruchrollen (Feuerball, Blitz und Verwandeln in Scavenger)",DIA_Torrez_Belohnung_Scrolls);
	Info_AddChoice(DIA_Torrez_Belohnung,"Ring des Geschicks (+5)",DIA_Torrez_Belohnung_Dex);
	Info_AddChoice(DIA_Torrez_Belohnung,"Stärkering (+5)",DIA_Torrez_Belohnung_Str);
};

func void DIA_Torrez_Belohnung_Str()
{
	AI_Output(other,self,"DIA_Torrez_Belohnung_Str_15_00");	//Ich nehme den Stärkering.
	AI_Output(self,other,"DIA_Torrez_Belohnung_Str_04_01");	//Eine solche Wahl hatte ich von dir erwartet. Hier, nimm den Ring.
	CreateInvItem(self,Staerkering);
	B_GiveInvItems(self,hero,Staerkering,1);
	Info_ClearChoices(DIA_Torrez_Belohnung);
};

func void DIA_Torrez_Belohnung_Dex()
{
	AI_Output(other,self,"DIA_Torrez_Belohnung_Dex_15_00");	//Ich nehme den Ring des Geschicks.
	AI_Output(self,other,"DIA_Torrez_Belohnung_Dex_04_01");	//Geschicklichkeit siegt über Stärke. Eine gute Entscheidung.
	CreateInvItem(self,Ring_des_Geschicks);
	B_GiveInvItems(self,hero,Ring_des_Geschicks,1);
	Info_ClearChoices(DIA_Torrez_Belohnung);
};

func void DIA_Torrez_Belohnung_Scrolls()
{
	AI_Output(other,self,"DIA_Torrez_Belohnung_Scrolls_15_00");	//Gib mir die Spruchrollen.
	AI_Output(self,other,"DIA_Torrez_Belohnung_Scrolls_04_01");	//Nutze sie mit Bedacht. Du kannst jede von ihnen nur einmal verwenden!
	CreateInvItems(self,ItArScrollFireball,3);
	B_GiveInvItems(self,hero,ItArScrollFireball,3);
	Npc_RemoveInvItems(other,ItArScrollFireball,2);
	CreateInvItem(other,ItArScrollTrfScavenger);
	CreateInvItem(other,ItArScrollChainLightning);
	Info_ClearChoices(DIA_Torrez_Belohnung);
};

func void DIA_Torrez_Belohnung_ManaMax()
{
	AI_Output(other,self,"DIA_Torrez_Belohnung_ManaMax_15_00");	//Ich will den Trank!
	AI_Output(self,other,"DIA_Torrez_Belohnung_ManaMax_04_01");	//Deine Wahl war weise! Du hast das kostbarste Geschenk von allen gewählt. Trinke den Trank und deine Macht wird wachsen!
	CreateInvItem(self,ItFo_Potion_Mana_Perma_01);
	B_GiveInvItems(self,hero,ItFo_Potion_Mana_Perma_01,1);
	Info_ClearChoices(DIA_Torrez_Belohnung);
};


instance DIA_Torrez_BriefTausch(C_Info)
{
	npc = KDF_405_Torrez;
	nr = 5;
	condition = DIA_Torrez_BriefTausch_Condition;
	information = DIA_Torrez_BriefTausch_Info;
	permanent = 0;
	description = "Ich habe einen Brief für euch! Aber ich will erst meine Belohnung sehen!";
};


func int DIA_Torrez_BriefTausch_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Milten_ComesBack) && (milten_HasLetter == FALSE))
	{
		return 1;
	};
};

func void DIA_Torrez_BriefTausch_Info()
{
	var C_Npc Corristo;
	AI_Output(other,self,"DIA_Torrez_BriefTausch_15_00");	//Ich habe einen Brief für euch! Aber ich will erst meine Belohnung sehen!
	AI_Output(self,other,"DIA_Torrez_BriefTausch_04_01");	//Warum sprichst du nicht mit Milten?
	AI_Output(other,self,"DIA_Torrez_BriefTausch_15_02");	//Hab ich bereits.
	AI_Output(self,other,"DIA_Torrez_BriefTausch_04_03");	//Verstehe. Ich habe deine Belohnung bei mir - zeig mir den Brief. Jetzt!
	AI_Output(other,self,"DIA_Torrez_BriefTausch_15_04");	//Hier ist er.
	if(Npc_HasItems(other,ItWr_Fire_Letter_01) >= 1)
	{
		AI_Output(self,other,"DIA_Torrez_BriefTausch_04_05");	//Deine Belohnung ist ein Ring der Stärke. Es ist ein seltenes Artefakt und wird dir sicherlich sehr nützlich sein.
		AI_Output(self,other,"DIA_Torrez_BriefTausch_04_06");	//Und nun geh!
		B_GiveInvItems(other,self,ItWr_Fire_Letter_01,1);
		Npc_RemoveInvItems(self,ItWr_Fire_Letter_01,1);
		CreateInvItems(self,Staerkering,1);
		B_GiveInvItems(self,other,Staerkering,1);
		B_GiveXP(XP_XardasLetter);
	}
	else if(Npc_HasItems(other,ItWr_Fire_Letter_02) >= 1)
	{
		AI_Output(self,other,"DIA_Torrez_BriefTausch_04_07");	//Das Siegel ist gebrochen.
		AI_Output(other,self,"DIA_Torrez_BriefTausch_15_08");	//Unfälle passieren eben.
		AI_Output(self,other,"DIA_Torrez_BriefTausch_04_09");	//Deine Belohnung ist ein Trank der Heilung. Sei zufrieden damit. Einem Boten, der einen Brief ohne Siegel übergibt, steht normalerweise gar nichts zu!
		B_GiveInvItems(other,self,ItWr_Fire_Letter_02,1);
		Npc_RemoveInvItems(self,ItWr_Fire_Letter_02,1);
		CreateInvItems(self,ItFo_Potion_Health_03,1);
		B_GiveInvItems(self,other,ItFo_Potion_Health_03,1);
		B_GiveXP(XP_XardasLetterOPEN);
	};
	Corristo = Hlp_GetNpc(Kdf_402_Corristo);
	CreateInvItems(Corristo,ItWr_Fire_Letter_02,1);
	AI_StopProcessInfos(self);
};


instance DIA_Torrez_PERM(C_Info)
{
	npc = KDF_405_Torrez;
	nr = 1;
	condition = DIA_Torrez_PERM_Condition;
	information = DIA_Torrez_PERM_Info;
	permanent = 1;
	description = "Was machen die magischen Künste?";
};


func int DIA_Torrez_PERM_Condition()
{
	return 1;
};

func void DIA_Torrez_PERM_Info()
{
	AI_Output(other,self,"DIA_Torrez_PERM_15_00");	//Was machen die magischen Künste?
	if(Npc_GetTrueGuild(hero) != GIL_KDF)
	{
		AI_Output(self,other,"DIA_Torrez_PERM_04_01");	//Das ist nicht dein Belang!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Torrez_PERM_04_02");	//Innos zum Gruß, Bruder.
		AI_Output(self,other,"DIA_Torrez_PERM_04_03");	//Ich befasse mich momentan mit der Magie des dritten Kreises.
		AI_Output(self,other,"DIA_Torrez_PERM_04_04");	//Außerdem untersuche ich die Wirkung einiger magischer Amulette und Ringe.
		AI_Output(self,other,"DIA_Torrez_PERM_04_05");	//Es gibt eine Vielzahl von verschiedenen Artefakten die einen auf magische Weise Stärken.
		AI_Output(self,other,"DIA_Torrez_PERM_04_06");	//Einige machen die Stärker andere Ausdauernder und wieder andere erhöhen deine magischen Kräfte.
		AI_Output(self,other,"DIA_Torrez_PERM_04_07");	//Sonst widme ich Innos meine gesamte Aufmerksamkeit, Bruder.
	};
};


instance KDF_405_Torrez_BOOK(C_Info)
{
	npc = KDF_405_Torrez;
	condition = KDF_405_Torrez_BOOK_Condition;
	information = KDF_405_Torrez_BOOK_Info;
	important = 1;
	permanent = 0;
};


func int KDF_405_Torrez_BOOK_Condition()
{
	if(Npc_KnowsInfo(hero,KDF_402_Corristo_ROBE) && Npc_KnowsInfo(hero,KDF_403_Drago_RUNE))
	{
		return TRUE;
	};
};

func void KDF_405_Torrez_BOOK_Info()
{
	AI_Output(self,other,"KDF_405_Torrez_BOOK_Info_04_01");	//Für jeden der Kreise gibt es ein Buch, in welchem die Zauber des Kreises erklärt werden. Studiere sie genau, denn Wissen bedeutet Macht.
	AI_Output(self,other,"KDF_405_Torrez_BOOK_Info_04_02");	//Nimm das Buch des ersten Kreises und lerne das Feuer zu verstehen.
	CreateInvItem(self,ItWr_Book_Circle_01);
	B_GiveInvItems(self,hero,ItWr_Book_Circle_01,1);
	AI_StopProcessInfos(self);
};


instance KDF_405_Torrez_SELLBOOKS(C_Info)
{
	npc = KDF_405_Torrez;
	condition = KDF_405_Torrez_SELLBOOKS_Condition;
	information = KDF_405_Torrez_SELLBOOKS_Info;
	important = 0;
	permanent = 1;
	description = "Ich möchte Schriften über Magie erwerben";
	trade = 1;
};


func int KDF_405_Torrez_SELLBOOKS_Condition()
{
	if((Npc_KnowsInfo(hero,KDF_405_Torrez_GREET) && (Npc_GetTrueGuild(hero) == GIL_KDF)) || (Npc_KnowsInfo(hero,KDF_405_Torrez_GREET) && (Npc_GetTrueGuild(hero) == GIL_KDW)))
	{
		return TRUE;
	};
};

func void KDF_405_Torrez_SELLBOOKS_Info()
{
	AI_Output(other,self,"KDF_405_Torrez_SELLBOOKS_Info_15_01");	//Ich möchte Schriften über Magie erwerben.
};


instance KDF_405_Torrez_GREET(C_Info)
{
	npc = KDF_405_Torrez;
	condition = KDF_405_Torrez_GREET_Condition;
	information = KDF_405_Torrez_GREET_Info;
	important = 0;
	permanent = 0;
	description = "Ich grüße dich, Magier";
};


func int KDF_405_Torrez_GREET_Condition()
{
	return TRUE;
};

func void KDF_405_Torrez_GREET_Info()
{
	AI_Output(other,self,"KDF_405_Torrez_GREET_Info_15_01");	//Ich grüße dich, Magier.
	AI_Output(self,other,"KDF_405_Torrez_GREET_Info_04_02");	//Innos wache über dich! Ich handele mit magischem Wissen und kann dir zeigen, wie du deine magische Energie steigerst!
	AI_Output(self,other,"KDF_405_Torrez_GREET_Info_04_03");	//Allerdings wirst du dich erst als ein Diener Innos erweisen, bevor ich dir unsere Runen und Schriftrollen verkaufen kann.
	Log_CreateTopic(GE_TraderOC,LOG_NOTE);
	B_LogEntry(GE_TraderOC,"Torrez verkauft SPRUCHROLLEN und RUNEN. Er hält sich tagsüber im Burghof auf. Er verkauft mir diese allerdings erst, sobald ich mich dem Kreis des Feuers angeschlossen habe.");
	Log_CreateTopic(GE_TeacherOC,LOG_NOTE);
	B_LogEntry(GE_TeacherOC,"Torrez kann mir zeigen, wie ich meine MANA steigern kann. Er hält sich tagsüber im Burghof auf.");
};


instance KDF_405_Torrez_MANA(C_Info)
{
	npc = KDF_405_Torrez;
	condition = KDF_405_Torrez_MANA_Condition;
	information = KDF_405_Torrez_MANA_Info;
	important = 0;
	permanent = 1;
	description = "Ich benötige mehr magische Kraft";
};


func int KDF_405_Torrez_MANA_Condition()
{
	if(Npc_KnowsInfo(hero,KDF_405_Torrez_GREET))
	{
		return TRUE;
	};
};

func void KDF_405_Torrez_MANA_Info()
{
	AI_Output(other,self,"KDF_405_Torrez_MANA_Info_15_01");	//Ich benötige mehr magische Kraft.
	AI_Output(self,other,"KDF_405_Torrez_MANA_Info_04_02");	//Ich kann dir helfen, deine Kraft zu steigern. Wie du sie nutzt, liegt nur an dir.
	Info_ClearChoices(KDF_405_Torrez_MANA);
	Info_AddChoice(KDF_405_Torrez_MANA,DIALOG_BACK,KDF_405_Torrez_MANA_BACK);
	Info_AddChoice(KDF_405_Torrez_MANA,"Mana +5 (5 Lernpunkte)",KDF_405_Torrez_MANA_MAN_5);
	Info_AddChoice(KDF_405_Torrez_MANA,"Mana +1 (1 Lernpunkt)",KDF_405_Torrez_MANA_MAN_1);
};

func void KDF_405_Torrez_MANA_BACK()
{
	Info_ClearChoices(KDF_405_Torrez_MANA);
};

func void KDF_405_Torrez_MANA_MAN_1()
{
	B_BuyAttributePoints(other,ATR_MANA_MAX,1);
	Info_ClearChoices(KDF_405_Torrez_MANA);
	Info_AddChoice(KDF_405_Torrez_MANA,DIALOG_BACK,KDF_405_Torrez_MANA_BACK);
	Info_AddChoice(KDF_405_Torrez_MANA,"Mana +5 (5 Lernpunkte)",KDF_405_Torrez_MANA_MAN_5);
	Info_AddChoice(KDF_405_Torrez_MANA,"Mana +1 (1 Lernpunkt)",KDF_405_Torrez_MANA_MAN_1);
};

func void KDF_405_Torrez_MANA_MAN_5()
{
	B_BuyAttributePoints(other,ATR_MANA_MAX,5);
	Info_ClearChoices(KDF_405_Torrez_MANA);
	Info_AddChoice(KDF_405_Torrez_MANA,DIALOG_BACK,KDF_405_Torrez_MANA_BACK);
	Info_AddChoice(KDF_405_Torrez_MANA,"Mana +5 (5 Lernpunkte)",KDF_405_Torrez_MANA_MAN_5);
	Info_AddChoice(KDF_405_Torrez_MANA,"Mana +1 (1 Lernpunkt)",KDF_405_Torrez_MANA_MAN_1);
};


instance KDF_405_Torrez_WANNABEMAGE(C_Info)
{
	npc = KDF_405_Torrez;
	condition = KDF_405_Torrez_WANNABEMAGE_Condition;
	information = KDF_405_Torrez_WANNABEMAGE_Info;
	important = 0;
	permanent = 0;
	description = "Was muss ich tun, um Magier zu werden?";
};


func int KDF_405_Torrez_WANNABEMAGE_Condition()
{
	if(Npc_KnowsInfo(hero,KDF_405_Torrez_GREET) && (Npc_GetTrueGuild(hero) != GIL_KDF) && !Npc_KnowsInfo(hero,KDF_402_Corristo_WANNBEKDF))
	{
		return TRUE;
	};
};

func void KDF_405_Torrez_WANNABEMAGE_Info()
{
	AI_Output(other,self,"KDF_405_Torrez_WANNABEMAGE_Info_15_01");	//Was muss ich tun, um Magier zu werden?
	AI_Output(self,other,"KDF_405_Torrez_WANNABEMAGE_Info_04_02");	//Sprich mit Meister Corristo, wenn er Zeit für dich hat.
};

