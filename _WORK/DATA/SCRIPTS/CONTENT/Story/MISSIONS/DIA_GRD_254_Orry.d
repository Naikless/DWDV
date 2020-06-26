
instance DIA_Orry_PreExit(C_Info)
{
	npc = GRD_254_Orry;
	nr = 999;
	condition = DIA_Orry_PreExit_Condition;
	information = DIA_Orry_PreExit_Info;
	permanent = 0;
	description = DIALOG_ENDE;
};


func int DIA_Orry_PreExit_Condition()
{
	return 1;
};

func void DIA_Orry_PreExit_Info()
{
	AI_Output(self,other,"DIA_Orry_PreExit_06_00");	//Sieh zu, das du heil zum Alten Lager kommst!
	AI_StopProcessInfos(self);
};


instance DIA_Orry_Exit(C_Info)
{
	npc = GRD_254_Orry;
	nr = 999;
	condition = DIA_Orry_Exit_Condition;
	information = DIA_Orry_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Orry_Exit_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Orry_PreExit))
	{
		return 1;
	};
};

func void DIA_Orry_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Orry_GuardGate(C_Info)
{
	npc = GRD_254_Orry;
	nr = 2;
	condition = DIA_Orry_GuardGate_Condition;
	information = DIA_Orry_GuardGate_Info;
	permanent = 0;
	description = "Was machst du hier?";
};


func int DIA_Orry_GuardGate_Condition()
{
	if(Kapitel <= 1)
	{
		return 1;
	};
};

func void DIA_Orry_GuardGate_Info()
{
	AI_Output(other,self,"DIA_Orry_GuardGate_15_00");	//Was machst du hier?
	AI_Output(self,other,"DIA_Orry_GuardGate_06_01");	//Dafür sorgen, dass keiner an die Austauschstelle rankommt. Vor allem nicht die Halsabschneider aus dem Neuen Lager.
	AI_Output(self,other,"DIA_Orry_GuardGate_06_02");	//Du bist der Neue, den sie heute reingeworfen haben, nicht?
	AI_Output(other,self,"DIA_Orry_GuardGate_15_03");	//Sieht so aus.
	AI_Output(self,other,"DIA_Orry_GuardGate_06_04");	//Dann solltest du wissen, dass du dich vor den Typen aus dem Neuen Lager in Acht nehmen musst!
	AI_Output(self,other,"DIA_Orry_GuardGate_06_05");	//Ich arbeite fürs alte Lager. Genau wie alle anderen, die du an der Austauschstelle gesehen hast.
	AI_Output(self,other,"DIA_Orry_GuardGate_06_06");	//Du hast schon mit Diego geredet, nehme ich an?
	Info_ClearChoices(DIA_Orry_GuardGate);
	Info_AddChoice(DIA_Orry_GuardGate,"Nein.",DIA_Orry_GuardGate_No);
	Info_AddChoice(DIA_Orry_GuardGate,"Ja.",DIA_Orry_GuardGate_Yes);
};

func void DIA_Orry_GuardGate_No()
{
	AI_Output(other,self,"DIA_Orry_GuardGate_No_15_00");	//Nein.
	AI_Output(self,other,"DIA_Orry_GuardGate_No_06_01");	//Dann solltest du das tun! Er kümmert sich um die Neuen.
	AI_Output(self,other,"DIA_Orry_GuardGate_No_06_02");	//Er weiß viele Dinge über die Kolonie, die für einen Neuen sehr wichtig sein können.
	Info_ClearChoices(DIA_Orry_GuardGate);
};

func void DIA_Orry_GuardGate_Yes()
{
	AI_Output(other,self,"DIA_Orry_GuardGate_Yes_15_00");	//Ja, hab' ich.
	AI_Output(self,other,"DIA_Orry_GuardGate_Yes_06_01");	//Gut! Dann weißt du ja schon Bescheid.
	Info_ClearChoices(DIA_Orry_GuardGate);
};


instance DIA_Orry_NewCamp(C_Info)
{
	npc = GRD_254_Orry;
	nr = 1;
	condition = DIA_Orry_NewCamp_Condition;
	information = DIA_Orry_NewCamp_Info;
	permanent = 0;
	description = "Warum sollte ich mich vor dem Neuen Lager in Acht nehmen?";
};


func int DIA_Orry_NewCamp_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Orry_GuardGate))
	{
		return 1;
	};
};

func void DIA_Orry_NewCamp_Info()
{
	AI_Output(other,self,"DIA_Orry_NewCamp_15_00");	//Warum sollte ich mich vor dem Neuen Lager in Acht nehmen?
	AI_Output(self,other,"DIA_Orry_NewCamp_06_01");	//Verglichen mit dem Neuen Lager ist das Alte Lager ein ruhiger und friedlicher Ort.
	AI_Output(self,other,"DIA_Orry_NewCamp_06_02");	//Das Neue Lager bekommt keine Waren aus der Außenwelt. Die meisten Banditen klauen sich zusammen, was sie zum Leben brauchen.
};


instance DIA_Orry_OldCamp(C_Info)
{
	npc = GRD_254_Orry;
	nr = 2;
	condition = DIA_Orry_OldCamp_Condition;
	information = DIA_Orry_OldCamp_Info;
	permanent = 0;
	description = "Und das Alte Lager?";
};


func int DIA_Orry_OldCamp_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Orry_GuardGate))
	{
		return 1;
	};
};

func void DIA_Orry_OldCamp_Info()
{
	AI_Output(other,self,"DIA_Orry_OldCamp_15_00");	//Und das Alte Lager?
	AI_Output(self,other,"DIA_Orry_OldCamp_06_01");	//Die Erzbarone haben alles unter Kontrolle. Unter ihnen stehen die Gardisten. Unter denen wiederum stehen die Schatten. Ganz am Ende kommen die Buddler.
	AI_Output(self,other,"DIA_Orry_OldCamp_06_02");	//Buddler ist jeder, der hier ankommt. Wenn du was Besseres werden willst, musst du als erstes bei den Schatten aufgenommen werden.
	if(Npc_GetTrueGuild(hero) == GIL_None)
	{
		hero.guild = GIL_VLK;
		Mdl_ApplyOverlayMds(hero,"Humans_Tired.mds");
		Log_CreateTopic(CH1_JoinOC,LOG_MISSION);
		Log_SetTopicStatus(CH1_JoinOC,LOG_RUNNING);
		B_LogEntry(CH1_JoinOC," Der Gardist Orry erklärte mir, dass jeder der in der Kolonie ankommt, Buddler ist. Wenn ich also was besseres werden möchte, sollte ich versuchen bei den Schatten aufgenommen zu werden.");
	};
};


instance DIA_Orry_Shore(C_Info)
{
	npc = GRD_254_Orry;
	nr = 3;
	condition = DIA_Orry_Shore_Condition;
	information = DIA_Orry_Shore_Info;
	permanent = 0;
	description = "Als ich ans Ufer gespült wurde. hat mich einer von den Typen geschlagen.";
};


func int DIA_Orry_Shore_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Orry_GuardGate))
	{
		return 1;
	};
};

func void DIA_Orry_Shore_Info()
{
	AI_Output(other,self,"DIA_Orry_Shore_15_00");	//Als ich ans Ufer gespült wurde, hat mich einer von den Typen mit einem Schlag ins Gesicht begrüßt.
	AI_Output(self,other,"DIA_Orry_Shore_06_01");	//Das machen sie mit jedem Neuen. Sie nennen es 'Die Taufe'.
	AI_Output(other,self,"DIA_Orry_Shore_15_02");	//Habt ihr im Alten Lager noch mehr so nette Leute?
	AI_Output(self,other,"DIA_Orry_Shore_06_03");	//Es gibt schon einige Schweine. Aber solange du dein Schutzgeld zahlst, kann dir nichts passieren.
};


instance DIA_Orry_Woman(C_Info)
{
	npc = GRD_254_Orry;
	nr = 3;
	condition = DIA_Orry_Woman_Condition;
	information = DIA_Orry_Woman_Info;
	permanent = 0;
	description = "Sie haben eine Frau zusammen mit den Waren reingeschickt.";
};


func int DIA_Orry_Woman_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Orry_GuardGate))
	{
		return 1;
	};
};

func void DIA_Orry_Woman_Info()
{
	AI_Output(other,self,"DIA_Orry_Woman_15_00");	//Ich habe gesehen, wie sie eine Frau zusammen mit den Waren reingeschickt haben.
	AI_Output(self,other,"DIA_Orry_Woman_06_01");	//Ja, die Erzbarone bekommen alles, was sie wollen.
	AI_Output(other,self,"DIA_Orry_Woman_15_02");	//Du meinst, der König tauscht Erz gegen Frauen?
	AI_Output(self,other,"DIA_Orry_Woman_06_03");	//Sie sind natürlich auch verurteilte Gefangene. Aber wenn Gomez sie nicht angefordert hätte, säßen sie in irgendwelchen Kerkern.
	AI_Output(self,other,"DIA_Orry_Woman_06_04");	//Bin mir nicht sicher, was schlimmer ist ...
};


instance DIA_Orry_Waffe(C_Info)
{
	npc = GRD_254_Orry;
	nr = 3;
	condition = DIA_Orry_Waffe_Condition;
	information = DIA_Orry_Waffe_Info;
	permanent = 0;
	description = "Ich suche eine Waffe...";
};


func int DIA_Orry_Waffe_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Orry_GuardGate))
	{
		return 1;
	};
};

func void DIA_Orry_Waffe_Info()
{
	AI_Output(other,self,"DIA_Orry_Waffe_15_00");	//Ich suche eine Waffe ...
	AI_Output(self,other,"DIA_Orry_Waffe_06_01");	//Bei der verlassenen Mine weiter hinten im Canyon müsstest du alte Waffen finden.
	AI_Output(self,other,"DIA_Orry_Waffe_06_02");	//Aber mach bloß nicht den Fehler und zieh mit 'ner rostigen Spitzhacke in den Krieg - die Dinger sind schwer und langsam.
	AI_Output(self,other,"DIA_Orry_Waffe_06_03");	//Ein ungeübter Kämpfer sollte sie nur im Notfall benutzen.
	AI_Output(self,other,"DIA_Orry_Waffe_06_04");	//Noch was...
	AI_Output(self,other,"DIA_Orry_Waffe_06_05");	//Es ist gut möglich das du auch einigen anderen Kram finden wirst, wie alte Münzen.
	AI_Output(self,other,"DIA_Orry_Waffe_06_06");	//Soweit ich weiß, sammelt Diego die Dinger.
	AI_Output(self,other,"DIA_Orry_Waffe_06_07");	//Wenn du nichts damit anzufangen weißt, solltest du also Diego fragen. Da springt bestimmt was für dich bei raus.
};


instance DIA_ORRY_MESSAGE(C_Info)
{
	npc = GRD_254_Orry;
	nr = 1;
	condition = dia_orry_message_condition;
	information = dia_orry_message_info;
	important = 1;
	permanent = 0;
};


func int dia_orry_message_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Orry_GuardGate))
	{
		return 1;
	};
};

func void dia_orry_message_info()
{
	AI_Output(self,other,"DIA_Orry_Message_15_00");	//Wenn du schon ins Alte Lager gehst, kannst du mir direkt einen Gefallen tun.
	AI_Output(self,other,"DIA_Orry_Message_15_01");	//Du kannst jemandem was ausrichten.
	AI_Output(self,other,"DIA_Orry_Message_15_02");	//Es gibt im Alten Lager einen Mann namens Pacho. Wenn du ihn siehst, richte ihm aus das die nächste Runde auf mich geht.
	AI_Output(self,other,"DIA_Orry_Message_15_03");	//Erzähl's ihm einfach, er weiß schon bescheid.
	ORRY_MESSAGE = LOG_RUNNING;
	Log_CreateTopic(CH1_MESSAGEPACHO,LOG_MISSION);
	B_LogEntry(CH1_MESSAGEPACHO,"Der Gardist Orry, gab mir den Auftrag einem Mann namens Pacho eine Nachricht zu überbringen. Falls dem Typen begegne, soll ich ihm sagen das die nächste Runde auf Orry geht. Was auch immer das heißen mag.");
	Log_SetTopicStatus(CH1_MESSAGEPACHO,LOG_RUNNING);
};

