
instance DIA_BaalOrun_Exit(C_Info)
{
	npc = GUR_1209_BaalOrun;
	nr = 999;
	condition = DIA_BaalOrun_Exit_Condition;
	information = DIA_BaalOrun_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_BaalOrun_Exit_Condition()
{
	return 1;
};

func void DIA_BaalOrun_Exit_Info()
{
	AI_StopProcessInfos(self);
};


var int BaalOrun_Ansprechbar;
var int BaalOrun_Sakrileg;

instance DIA_BaalOrun_NoTalk(C_Info)
{
	npc = GUR_1209_BaalOrun;
	nr = 2;
	condition = DIA_BaalOrun_NoTalk_Condition;
	information = DIA_BaalOrun_NoTalk_Info;
	permanent = 1;
	important = 1;
};


func int DIA_BaalOrun_NoTalk_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (BaalOrun_Ansprechbar == FALSE) && (Npc_GetPermAttitude(self,other) != ATT_FRIENDLY))
	{
		return 1;
	};
};

func void DIA_BaalOrun_NoTalk_Info()
{
	Info_ClearChoices(DIA_BaalOrun_NoTalk);
	Info_AddChoice(DIA_BaalOrun_NoTalk,DIALOG_ENDE,DIA_BaalOrun_NoTalk_ENDE);
	Info_AddChoice(DIA_BaalOrun_NoTalk,"Alles, klar, Alter?",DIA_BaalOrun_NoTalk_Imp);
	Info_AddChoice(DIA_BaalOrun_NoTalk,"Der Schläfer sei mit dir!",DIA_BaalOrun_NoTalk_Sleeper);
	Info_AddChoice(DIA_BaalOrun_NoTalk,"Hi! Ich bin neu hier!",DIA_BaalOrun_NoTalk_Hi);
};

func void DIA_BaalOrun_NoTalk_Hi()
{
	AI_Output(other,self,"DIA_BaalOrun_NoTalk_Hi_15_00");	//Hi! Ich bin neu hier!
	AI_Output(self,other,"DIA_BaalOrun_NoTalk_Hi_12_01");	//
	BaalOrun_Sakrileg = TRUE;
};

func void DIA_BaalOrun_NoTalk_Sleeper()
{
	AI_Output(other,self,"DIA_BaalOrun_NoTalk_Sleeper_15_00");	//Der Schläfer sei mit dir!
	AI_Output(self,other,"DIA_BaalOrun_NoTalk_Sleeper_12_01");	//
	BaalOrun_Sakrileg = TRUE;
};

func void DIA_BaalOrun_NoTalk_Imp()
{
	AI_Output(other,self,"DIA_BaalOrun_NoTalk_Imp_15_00");	//Alles klar, Alter? 
	AI_Output(self,other,"DIA_BaalOrun_NoTalk_Imp_12_01");	//
	BaalOrun_Sakrileg = TRUE;
};

func void DIA_BaalOrun_NoTalk_ENDE()
{
	AI_StopProcessInfos(self);
};


instance DIA_BaalOrun_FirstTalk(C_Info)
{
	npc = GUR_1209_BaalOrun;
	nr = 1;
	condition = DIA_BaalOrun_FirstTalk_Condition;
	information = DIA_BaalOrun_FirstTalk_Info;
	permanent = 0;
	important = 1;
};


func int DIA_BaalOrun_FirstTalk_Condition()
{
	if(Ghorim_KickHarlok == LOG_SUCCESS)
	{
		BaalOrun_Ansprechbar = TRUE;
		return 1;
	};
};

func void DIA_BaalOrun_FirstTalk_Info()
{
	AI_Output(self,other,"DIA_BaalOrun_FirstTalk_12_00");	//Ich habe mit Ghorim gesprochen. Du hast dich für einen unserer Brüder eingesetzt - und deine Sache war gerecht.
	AI_Output(self,other,"DIA_BaalOrun_FirstTalk_12_01");	//Darum habe ich dich für eine besondere Aufgabe erwählt.
	AI_Output(self,other,"DIA_BaalOrun_FirstTalk_12_02");	//Cor Kalom braucht dringend neues Sumpfkraut für seine Experimente.
	AI_Output(self,other,"DIA_BaalOrun_FirstTalk_12_03");	//Unsere Sammler im Sumpf arbeiten Tag und Nacht. Gehe zu ihnen und bring ihre gesamte Ernte zu Kalom ins Alchemielabor.
	B_GiveXP(XP_BaalOrunTalks);
	B_LogEntry(CH1_GhorimsRelief,"Ghorim wurde tatsächlich von Harlok abgelöst. Es geschehen noch Zeichen und Wunder.");
	Log_SetTopicStatus(CH1_GhorimsRelief,LOG_SUCCESS);
	Log_CreateTopic(CH1_DeliverWeed,LOG_MISSION);
	Log_SetTopicStatus(CH1_DeliverWeed,LOG_RUNNING);
	B_LogEntry(CH1_DeliverWeed,"Meine Überredungskünste bei Harlok, scheinen den Guru Baal Orun beeindruckt zu haben. Ich haben nun die 'Ehre' das gesammelte Kraut der Novizen im Sumpf zu Cor Kalom zu bringen.");
	BaalOrun_FetchWeed = LOG_RUNNING;
	Info_ClearChoices(DIA_BaalOrun_FirstTalk);
	Info_AddChoice(DIA_BaalOrun_FirstTalk,"Nichts sagen",DIA_BaalOrun_FirstTalk_MuteEnde);
	Info_AddChoice(DIA_BaalOrun_FirstTalk,"Wo genau kann ich die Sammler finden?",DIA_BaalOrun_FirstTalk_Where);
};

func void DIA_BaalOrun_FirstTalk_Where()
{
	AI_Output(other,self,"DIA_BaalOrun_FirstTalk_Where_15_00");	//Wo genau kann ich die Sammler finden?
	AI_Output(self,other,"DIA_BaalOrun_FirstTalk_Where_12_01");	//Ich habe dir noch nicht gestattet, mich anzusprechen!
	AI_Output(self,other,"DIA_BaalOrun_FirstTalk_Where_12_02");	//Bete zum Schläfer um Vergebung für dieses Sakrileg! Und nun geh. Deine Mission ist von äußerster Dringlichkeit.
	Info_ClearChoices(DIA_BaalOrun_FirstTalk);
	AI_StopProcessInfos(self);
	BaalOrun_Ansprechbar = FALSE;
};

func void DIA_BaalOrun_FirstTalk_MuteEnde()
{
	Info_ClearChoices(DIA_BaalOrun_FirstTalk);
	AI_StopProcessInfos(self);
	BaalOrun_Ansprechbar = FALSE;
};


instance DIA_BaalOrun_GotWeed(C_Info)
{
	npc = GUR_1209_BaalOrun;
	nr = 1;
	condition = DIA_BaalOrun_GotWeed_Condition;
	information = DIA_BaalOrun_GotWeed_Info;
	permanent = 0;
	important = 1;
};


func int DIA_BaalOrun_GotWeed_Condition()
{
	if(Viran_Bloodflies == LOG_SUCCESS)
	{
		return 1;
	};
};

func void DIA_BaalOrun_GotWeed_Info()
{
	AI_Output(self,other,"DIA_BaalOrun_GotWeed_12_00");	//Du hast unsere Sammler verteidigt ...
	AI_Output(self,other,"DIA_BaalOrun_GotWeed_12_01");	//Damit hast du nicht nur bewiesen, dass du auf unserer Seite stehst - du hast dich auch als würdiger Diener des Schläfers erwiesen.
	AI_Output(self,other,"DIA_BaalOrun_GotWeed_12_02");	//Du bist meiner Meinung nach bereit, die Robe eines Novizen zu tragen.
	BaalOrun_Ansprechbar = TRUE;
	Log_CreateTopic(CH1_JoinPsi,LOG_MISSION);
	if(Npc_GetTrueGuild(hero) == GIL_None)
	{
		Log_SetTopicStatus(CH1_JoinPsi,LOG_RUNNING);
	};
	B_LogEntry(CH1_JoinPsi,"Baal Orun bezeichnete mich als würdigen Diener des Schläfers, da ich für die anderen Novizen im Sumpf gegen die Blutfliegen gekämpft habe.");
	B_GiveXP(XP_ImpressedBaalOrun);
};


instance DIA_BaalOrun_WeedAtKaloms(C_Info)
{
	npc = GUR_1209_BaalOrun;
	nr = 1;
	condition = DIA_BaalOrun_WeedAtKaloms_Condition;
	information = DIA_BaalOrun_WeedAtKaloms_Info;
	permanent = 0;
	description = "Ich habe Cor Kalom das Sumpfkraut gebracht.";
};


func int DIA_BaalOrun_WeedAtKaloms_Condition()
{
	if(BaalOrun_FetchWeed == LOG_SUCCESS)
	{
		return 1;
	};
};

func void DIA_BaalOrun_WeedAtKaloms_Info()
{
	AI_Output(other,self,"DIA_BaalOrun_WeedAtKaloms_15_00");	//Ich habe Cor Kalom das Sumpfkraut gebracht.
	AI_Output(self,other,"DIA_BaalOrun_WeedAtKaloms_12_01");	//Daran hast du gut getan. Ich habe eine kleine Belohnung für deine Mühen. Hier, nimm es.
	AI_Output(self,other,"DIA_BaalOrun_WeedAtKaloms_12_02");	//Es ist ein magischer Schlafzauber. Du kannst ihn nur einmal verwenden, aber er wird dir hoffentlich gute Dienste leisten.
	AI_Output(self,other,"DIA_BaalOrun_WeedAtKaloms_12_09");	//Sobald du dich uns anschliesst, werde ich dich darin unterweisen, wie man Sumpfkraut verarbeitet.
	BaalOrun_Ansprechbar = TRUE;
	B_GiveXP(XP_ReportToBaalOrun);
	Log_CreateTopic(GE_TeacherPSI,LOG_NOTE);
	B_LogEntry(GE_TeacherPSI,"Baal Orun kann mir beibringen wie ich Sumpfkraut verarbeiten kann. Allerdings muss ich dem Sumpflager angehören, damit er mich in die Geheimnisse der Krautproduktion einweiht.");
	CreateInvItem(self,ItArScrollSleep);
	B_GiveInvItems(self,other,ItArScrollSleep,1);
};


instance DIA_BaalOrun_Perm(C_Info)
{
	npc = GUR_1209_BaalOrun;
	nr = 2;
	condition = DIA_BaalOrun_Perm_Condition;
	information = DIA_BaalOrun_Perm_Info;
	permanent = 1;
	description = "Wie läuft die Krautproduktion?";
};


func int DIA_BaalOrun_Perm_Condition()
{
	if(BaalOrun_FetchWeed == LOG_SUCCESS)
	{
		return 1;
	};
};

func void DIA_BaalOrun_Perm_Info()
{
	AI_Output(other,self,"DIA_BaalOrun_Perm_15_00");	//Wie läuft die Krautproduktion?
	AI_Output(self,other,"DIA_BaalOrun_Perm_12_01");	//Wir belasten jeden Mann bis ans Äußerste, um genug für uns UND den Handel mit den anderen Lagern herzustellen.
	AI_Output(self,other,"DIA_BaalOrun_Perm_12_02");	//Aber es ist ein Opfer für den Schläfer, und so bringen es die Novizen gerne.
};


instance DIA_BAALORUN_LEARN(C_Info)
{
	npc = GUR_1209_BaalOrun;
	nr = 3;
	condition = dia_baalorun_learn_condition;
	information = dia_baalorun_learn_info;
	permanent = 1;
	description = "Krautverarbeitung erlernen (Kosten: 5 Lernpunkte)";
};


func int dia_baalorun_learn_condition()
{
	if((BaalOrun_FetchWeed == LOG_SUCCESS) && Npc_KnowsInfo(hero,DIA_BaalOrun_WeedAtKaloms) && (KNOWS_STOMPHERB == FALSE) && C_NpcBelongsToPsiCamp(hero))
	{
		return 1;
	};
};

func void dia_baalorun_learn_info()
{
	AI_Output(other,self,"DIA_BaalOrun_Learn_15_00");	//Ich will lernen Sumpfkraut richtig zu verarbeiten.
	if(hero.lp >= 5)
	{
		hero.lp = hero.lp - 5;
		AI_Output(self,other,"DIA_BaalOrun_Learn_12_01");	//Also Gut. Zuerst sammelst du ein Büschel Sumpfkraut und legst es in den Topf.
		AI_Output(self,other,"DIA_BaalOrun_Learn_12_02");	//Danach fängst du mit dem stampfen an. Stampfe mit gleichmäßigen Rhytmus.
		AI_Output(self,other,"DIA_BaalOrun_Learn_12_03");	//Zuletzt nimmst du das gestampfte Kraut und fängst an den Stengel zu drehen.
		AI_Output(self,other,"DIA_BaalOrun_Learn_12_04");	//Je besser die Wirkung des Krauts werden soll, desto mehr Sumpfkrautpflanzen wirst du benötigen.
		Log_CreateTopic(GE_HERB,LOG_NOTE);
		B_LogEntry(GE_HERB,"Ich kenne jetzt die Geheimnisse der Sumpfkrautverarbeitung und bin in der Lage es zu verarbeiten.");
		B_LogEntry(GE_HERB,"Ein grüner Novize benötigt eine Sumpfkrautpflanze.");
		B_LogEntry(GE_HERB,"Ein schwarzer Weiser benötigt zwei Sumpfkrautpflanzen.");
		B_LogEntry(GE_HERB,"Ein Traumruf benötigt drei Sumpfkrautpflanze.");
		KNOWS_STOMPHERB = TRUE;
		PrintScreen("Lerne: Krautverarbeitung",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Zu wenig Lernpunkte!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};


instance DIA_BAALORUN_COOKING(C_Info)
{
	npc = GUR_1209_BaalOrun;
	nr = 4;
	condition = dia_baalorun_cooking_condition;
	information = dia_baalorun_cooking_info;
	permanent = 0;
	description = "Kannst du mir beibringen zu kochen?";
};


func int dia_baalorun_cooking_condition()
{
	if(Npc_KnowsInfo(hero,Tpl_1438_Templer_WHY) && (BaalOrun_Ansprechbar == TRUE))
	{
		return 1;
	};
};

func void dia_baalorun_cooking_info()
{
	AI_Output(other,self,"DIA_BaalOrun_Cooking_15_00");	//Ich hab' gehört du wärst derjenige, der mir hier was übers kochen beibringen könnte?
	AI_Output(self,other,"DIA_BaalOrun_Cooking_12_01");	//Ja, dass ist richtig.
	AI_Output(self,other,"DIA_BaalOrun_Cooking_12_02");	//Ich kenne mich mit der Zubereitung von Minecrawlersuppe aus. Wenn du Interesse hast, werde ich es dir beibringen.
};


instance DIA_BAALORUN_SOUP(C_Info)
{
	npc = GUR_1209_BaalOrun;
	nr = 5;
	condition = dia_baalorun_soup_condition;
	information = dia_baalorun_soup_info;
	permanent = 1;
	description = "Minecrawlersuppe (Kosten: 1 Lernpunkt)";
};


func int dia_baalorun_soup_condition()
{
	if(Npc_KnowsInfo(hero,dia_baalorun_cooking) && (KNOWS_CRAWLERSOUP == FALSE))
	{
		return 1;
	};
};

func void dia_baalorun_soup_info()
{
	AI_Output(other,self,"DIA_BaalOrun_Soup_15_00");	//Bring mir bei, wie ich Minecrawlersuppe kochen kann.
	if(hero.lp >= 1)
	{
		hero.lp = hero.lp - 1;
		AI_Output(self,other,"DIA_BaalOrun_Soup_12_01");	//Gut. Als erstes beginnst du das Wasser zu erhitzen.
		AI_Output(self,other,"DIA_BaalOrun_Soup_12_02");	//Nach einer Weile gibst du die Crawlerzangen in die Suppe.
		AI_Output(self,other,"DIA_BaalOrun_Soup_12_03");	//Diese müssen gut abgekocht werden, damit das Gift in den Zangen die Wirkung verliert.
		AI_Output(self,other,"DIA_BaalOrun_Soup_12_04");	//Anschliessend gibst du die Orkblätter hinzu und verrührst das ganze.
		Log_CreateTopic(GE_COOK,LOG_NOTE);
		B_LogEntry(GE_COOK,"Nun bin ich dank Baal Orun in der Lage eine Minecrawlersuppe zu kochen.");
		B_LogEntry(GE_COOK,"Die Zutaten sind: 2 Orkblätter und 1 Crawlerzange. ");
		KNOWS_CRAWLERSOUP = TRUE;
		PrintScreen("Lerne: Minecrawlersuppe",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Zu wenig Lernpunkte!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

