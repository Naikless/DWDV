
instance DIA_Gilbert_EXIT(C_Info)
{
	npc = Non_1500_Gilbert;
	nr = 999;
	condition = DIA_Gilbert_EXIT_Condition;
	information = DIA_Gilbert_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Gilbert_EXIT_Condition()
{
	return 1;
};

func void DIA_Gilbert_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Gilbert_First(C_Info)
{
	npc = Non_1500_Gilbert;
	nr = 1;
	condition = DIA_Gilbert_First_Condition;
	information = DIA_Gilbert_First_Info;
	permanent = 0;
	important = 1;
};


func int DIA_Gilbert_First_Condition()
{
	if(Npc_GetDistToNpc(self,other) <= ZivilAnquatschDist)
	{
		return 1;
	};
};

func void DIA_Gilbert_First_Info()
{
	AI_Output(self,other,"DIA_Gilbert_First_04_00");	//Was machst du denn hier? Hab nicht oft Besuch hier oben, hehe!
	AI_Output(self,other,"DIA_Gilbert_First_04_01");	//War ne gute Leistung von dir, mein Versteck zu finden.
	B_GiveXP(XP_GilbertFound);
};


instance DIA_Gilbert_Hallo(C_Info)
{
	npc = Non_1500_Gilbert;
	nr = 1;
	condition = DIA_Gilbert_Hallo_Condition;
	information = DIA_Gilbert_Hallo_Info;
	permanent = 0;
	description = "Was machst du hier?";
};


func int DIA_Gilbert_Hallo_Condition()
{
	return 1;
};

func void DIA_Gilbert_Hallo_Info()
{
	AI_Output(other,self,"DIA_Gilbert_Hallo_15_00");	//Was machst du hier?
	AI_Output(self,other,"DIA_Gilbert_Hallo_04_01");	//Ich hatte die Schnauze voll vom alten Lager. Hatte Ärger mit Gomez Leuten. Ist aber schon ne Weile her.
};


instance DIA_GILBERT_HELP(C_Info)
{
	npc = Non_1500_Gilbert;
	nr = 2;
	condition = dia_gilbert_help_condition;
	information = dia_gilbert_help_info;
	permanent = 0;
	important = 0;
	description = "Kann ich dir wobei helfen?";
};


func int dia_gilbert_help_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Gilbert_Hallo))
	{
		return 1;
	};
};

func void dia_gilbert_help_info()
{
	AI_Output(other,self,"DIA_Gilbert_Help_04_00");	//Kann ich dir wobei helfen?
	AI_Output(self,other,"DIA_Gilbert_Help_04_01");	//Wenn du mich schon so fragst, ja kannst du.
	AI_Output(self,other,"DIA_Gilbert_Help_04_02");	//Du könntest für mich ins Alte Lager gehen, dich mal bei Gomez Leute umhören ob sich noch jemand an mich erinnert.
	AI_Output(other,self,"DIA_Gilbert_Help_04_03");	//Und was wenn das jemand tut?
	AI_Output(self,other,"DIA_Gilbert_Help_04_04");	//Ich will wissen, ob ich mich wieder ins Alte Lager wagen kann, ohne das ich von Gomez' Leuten aufs Maul bekomme.
	AI_Output(self,other,"DIA_Gilbert_Help_04_05");	//Wenn du was weißt, dann komm' zu mir zurück und erzähl mir alles.
	Info_ClearChoices(dia_gilbert_help);
	Info_AddChoice(dia_gilbert_help,"Ich kümmere mich darum.",dia_gilbert_help_back);
	Info_AddChoice(dia_gilbert_help,"Was hast du eigentlich verbrochen?",dia_gilbert_help_done);
	Info_AddChoice(dia_gilbert_help,"Wo soll ich anfangen?",dia_gilbert_help_where);
	OC_BACK = LOG_RUNNING;
	Log_CreateTopic(CH1_GILBERT,LOG_MISSION);
	B_LogEntry(CH1_GILBERT,"Gilbert, ein Einsiedler der vom Leben im Alten Lager genug hatte, hat mich beauftragt, dass ich mich ihm Alten Lager umhöre, ob sich noch jemand an ihn erinnert.");
	Log_SetTopicStatus(CH1_GILBERT,LOG_RUNNING);
};

func void dia_gilbert_help_back()
{
	AI_Output(other,self,"DIA_Gilbert_Help_BACK_15_00");	//Ich kümmere mich darum.
	Info_ClearChoices(dia_gilbert_help);
};

func void dia_gilbert_help_done()
{
	AI_Output(other,self,"DIA_Gilbert_Help_Done_15_00");	//Was hast du eigentlich verbrochen?
	AI_Output(self,other,"DIA_Gilbert_Help_Done_09_01");	//Ach, dass ist nicht so wichtig. Wichtig ist meine Rückkehr ins Alte Lager.
};

func void dia_gilbert_help_where()
{
	AI_Output(other,self,"DIA_Gilbert_Help_Where_15_00");	//Wo soll ich anfangen?
	AI_Output(self,other,"DIA_Gilbert_Help_Where_09_01");	//Ich hatte meine Hütte im Marktviertel des Außenringes. Da hatte ich auch den Ärger. Dort solltest du also anfangen.
	B_LogEntry(CH1_GILBERT,"Ich soll meine Befragung im Marktviertel, des Außenringes im Alten Lager beginnen.");
};


instance DIA_GILBERT_UND(C_Info)
{
	npc = Non_1500_Gilbert;
	nr = 1;
	condition = dia_gilbert_und_condition;
	information = dia_gilbert_und_info;
	permanent = 0;
	description = "Ich hab' mal mit ein paar Leuten geredet.";
};


func int dia_gilbert_und_condition()
{
	if(Npc_KnowsInfo(hero,info_jackal_gilbert) && Npc_KnowsInfo(hero,info_fisk_gilbert) && Npc_KnowsInfo(hero,info_dexter_gilbert))
	{
		return 1;
	};
};

func void dia_gilbert_und_info()
{
	AI_Output(other,self,"DIA_Gilbert_Und_15_00");	//Ich hab' mal mit ein paar Leuten geredet.
	AI_Output(self,other,"DIA_Gilbert_Und_04_01");	//Und?
	AI_Output(other,self,"DIA_Gilbert_Und_04_02");	//Jackal kann sich noch gut an dich und die Sache erinnern.
	AI_Output(other,self,"DIA_Gilbert_Und_04_03");	//Fisk kennt dich noch, weiß aber nichts mehr von irgendwelchem Ärger.
	AI_Output(other,self,"DIA_Gilbert_Und_04_04");	//Dexter kennt dich nicht.
	AI_Output(self,other,"DIA_Gilbert_Und_04_05");	//Das ist ja schonmal was. Aber ich muss sicher sein können, dass die Sache geklärt ist.
	AI_Output(self,other,"DIA_Gilbert_Und_04_06");	//Geh' zu Gravo. Er ist zwar nur ein Buddler, aber er hat Einfluss bis zu den Erzbaronen.
	AI_Output(self,other,"DIA_Gilbert_Und_04_07");	//Wenn einer was klären kann, dann er.
	AI_Output(self,other,"DIA_Gilbert_Und_04_08");	//Du findest ihn am Wasserloch, neben dem Burgtor.
	B_LogEntry(CH1_GILBERT,"Gilbert bat mich darum, dass ich mit Gravo rede. Wenn jemand Gilbert helfen kann, dann er. Ich finde Gravo am Wasserloch neben dem Burgtor.");
};


instance DIA_GILBERT_ORE(C_Info)
{
	npc = Non_1500_Gilbert;
	nr = 1;
	condition = dia_gilbert_ore_condition;
	information = dia_gilbert_ore_info;
	permanent = 0;
	description = "Ich hab' mit Gravo gesprochen.";
};


func int dia_gilbert_ore_condition()
{
	if(Npc_KnowsInfo(hero,dia_gravo_helpgilbert))
	{
		return 1;
	};
};

func void dia_gilbert_ore_info()
{
	AI_Output(other,self,"DIA_Gilbert_Ore_15_00");	//Ich hab' mit Gravo gesprochen.
	AI_Output(self,other,"DIA_Gilbert_Ore_04_01");	//Und?
	AI_Output(other,self,"DIA_Gilbert_Ore_04_02");	//Er verlangt 500 Erz für seine Hilfe.
	AI_Output(self,other,"DIA_Gilbert_Ore_04_03");	//500 Erz? War ja zu erwarten, dass das teuer wird.
	AI_Output(other,self,"DIA_Gilbert_Ore_04_04");	//Jetzt sag' mir nicht du hast das Erz nicht.
	AI_Output(self,other,"DIA_Gilbert_Ore_04_05");	//Doch, aber nicht hier.
	AI_Output(self,other,"DIA_Gilbert_Ore_04_06");	//Es befindet sich in meiner alten Hütte im Marktviertel.
	AI_Output(self,other,"DIA_Gilbert_Ore_04_07");	//Das Problem ist nur, dass ich meinen Schlüssel vor einiger Zeit verloren habe.
	AI_Output(self,other,"DIA_Gilbert_Ore_04_08");	//Wenn du dich mit Schlössern auskennst, kannst du das Schloss der Truhe knacken.
	AI_Output(self,other,"DIA_Gilbert_Ore_04_09");	//Mit Sicherheit hat sich aber jetzt jemand anders meine Hütte genommen.
	AI_Output(self,other,"DIA_Gilbert_Ore_04_10");	//Du solltest also schleichen können.
	AI_Output(self,other,"DIA_Gilbert_Ore_04_11");	//Meine Hütte rechts neben der von einem Buddler namens Dusty.
	B_LogEntry(CH1_GILBERT,"Gilbert nannte mir den Ort an dem er sein Erz versteckt hält. Es ist in der Truhe in einer Hütte rechts neben der von Dusty.");
};


instance DIA_GILBERT_FINISHED(C_Info)
{
	npc = Non_1500_Gilbert;
	nr = 1;
	condition = dia_gilbert_finished_condition;
	information = dia_gilbert_finished_info;
	permanent = 0;
	description = "Du kannst die Sache als erledigt betrachten.";
};


func int dia_gilbert_finished_condition()
{
	if(ERZ_GEGEBEN == TRUE)
	{
		return 1;
	};
};

func void dia_gilbert_finished_info()
{
	var int zufallsbelohnung;
	AI_Output(other,self,"DIA_Gilbert_Finished_15_00");	//Du kannst die Sache als erledigt betrachten.
	AI_Output(self,other,"DIA_Gilbert_Finished_04_01");	//Das heißt ich kann ab jetzt wieder zurück ins Lager?
	AI_Output(other,self,"DIA_Gilbert_Finished_04_02");	//Ganz genau.
	AI_Output(self,other,"DIA_Gilbert_Finished_04_03");	//Sehr gut. Danke Junge. Ich bin dir was schuldig.
	AI_Output(other,self,"DIA_Gilbert_Finished_04_04");	//Gibt es auch eine handfeste Belohnung?
	AI_Output(self,other,"DIA_Gilbert_Finished_04_05");	//Hier, nimm. Das hast du dir verdient.
	AI_Output(self,other,"DIA_Gilbert_Finished_04_06");	//Ich werde mich demnächst wieder ins Lager verziehen. Aber das hat noch Zeit.
	AI_Output(self,other,"DIA_Gilbert_Finished_04_07");	//Wir haben uns bestimmt nicht das letzte mal gesehen. Hehe.
	AI_StopProcessInfos(self);
	zufallsbelohnung = Hlp_Random(100);
	if(zufallsbelohnung >= 75)
	{
		CreateInvItems(self,ItAt_Wolf_01,2);
		B_GiveInvItems(self,other,ItAt_Wolf_01,2);
	}
	else if(zufallsbelohnung >= 60)
	{
		CreateInvItems(self,ItFo_Potion_Health_Perma_01,1);
		B_GiveInvItems(self,other,ItFo_Potion_Health_Perma_01,1);
	}
	else if(zufallsbelohnung >= 50)
	{
		CreateInvItems(self,ItMi_Stuff_OldCoin_01,5);
		B_GiveInvItems(self,hero,ItMi_Stuff_OldCoin_01,5);
	}
	else if(zufallsbelohnung >= 40)
	{
		CreateInvItems(self,ItFoBeer,2);
		B_GiveInvItems(self,other,ItFoBeer,2);
	}
	else if(zufallsbelohnung >= 30)
	{
		CreateInvItems(self,Schutzring_Feuer2,1);
		B_GiveInvItems(self,other,Schutzring_Feuer2,1);
	}
	else if(zufallsbelohnung >= 20)
	{
		CreateInvItems(self,ItMw_1H_Axe_Old_01,1);
		B_GiveInvItems(self,other,ItMw_1H_Axe_Old_01,1);
	}
	else if(zufallsbelohnung >= 10)
	{
		CreateInvItems(self,ItMw_1H_Sword_01,1);
		B_GiveInvItems(self,other,ItMw_1H_Sword_01,1);
	};
	OC_BACK = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_GILBERT,LOG_SUCCESS);
	B_LogEntry(CH1_GILBERT,"Gilbert war zufrieden mit meiner Arbeit und gab' mir zur Belohnung einen nützlichen Gegenstand. Er wird demnächst wieder ins Alte Lager zurückkehren.");
	B_GiveXP(XP_GILBERT);
};

