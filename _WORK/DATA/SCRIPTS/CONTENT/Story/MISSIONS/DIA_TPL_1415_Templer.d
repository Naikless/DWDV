
instance DIA_Tpl_1415_Torwache_Exit(C_Info)
{
	npc = TPL_1415_Templer;
	nr = 999;
	condition = DIA_Tpl_1415_Torwache_Exit_Condition;
	information = DIA_Tpl_1415_Torwache_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Tpl_1415_Torwache_Exit_Condition()
{
	return 1;
};

func void DIA_Tpl_1415_Torwache_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Tpl_1415_Torwache_First(C_Info)
{
	npc = TPL_1415_Templer;
	nr = 2;
	condition = DIA_Tpl_1415_Torwache_First_Condition;
	information = DIA_Tpl_1415_Torwache_First_Info;
	permanent = 0;
	important = 1;
};


func int DIA_Tpl_1415_Torwache_First_Condition()
{
	if(Kapitel >= 2)
	{
		return FALSE;
	};
	if(Npc_GetDistToWP(other,"PSI_START") > 800)
	{
		Npc_SetRefuseTalk(self,30);
	};
	if(Npc_RefuseTalk(self) == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Tpl_1415_Torwache_First_Info()
{
	AI_Output(self,other,"DIA_Tpl_1415_Torwache_First_13_00");	//Sei gegrüßt, Fremder!
	AI_Output(self,other,"DIA_Tpl_1415_Torwache_First_13_01");	//Du bist dabei, heiligen Boden zu betreten. Dies ist die Bruderschaft des Schläfers.
	AI_Output(self,other,"DIA_Tpl_1415_Torwache_First_13_02");	//Was führt dich her?
	Info_ClearChoices(DIA_Tpl_1415_Torwache_First);
	Info_AddChoice(DIA_Tpl_1415_Torwache_First,"Ich bin neu hier. Ich wollte mir euer Lager ansehen.",DIA_Tpl_1415_Torwache_First_JustLooking);
	if(Npc_GetTrueGuild(hero) == GIL_None)
	{
		Info_AddChoice(DIA_Tpl_1415_Torwache_First,"Ich will mich euch anschliessen.",DIA_Tpl_1415_Torwache_First_Join);
	};
};

func void DIA_Tpl_1415_Torwache_First_Join()
{
	AI_Output(other,self,"DIA_Tpl_1415_Torwache_First_Join_15_00");	//Ich habe gehört, ihr seid auf der Suche nach neuen Leuten. Ich will mich euch anschließen.
	AI_Output(self,other,"DIA_Tpl_1415_Torwache_First_Join_13_01");	//Dann sei willkommen. Die Bruderschaft des Schläfers hat einen Platz für jeden, der sich vom Geist des Schläfers führen lassen will.
	AI_Output(self,other,"DIA_Tpl_1415_Torwache_First_Join_13_02");	//Wenn es dir wirklich ernst ist, solltest du versuchen, die Aufmerksamkeit von Baal Namib zu erregen. Er steht direkt auf dem Platz hinter dem Tor.
	AI_Output(self,other,"DIA_Tpl_1415_Torwache_First_Join_13_04");	//Aber du darfst ihn nicht direkt ansprechen. Warte, bis er dich anspricht.
	Info_ClearChoices(DIA_Tpl_1415_Torwache_First);
};

func void DIA_Tpl_1415_Torwache_First_JustLooking()
{
	AI_Output(other,self,"DIA_Tpl_1415_Torwache_First_JustLooking_15_00");	//Ich bin neu hier. Ich wollte mir euer Lager ansehen.
	AI_Output(self,other,"DIA_Tpl_1415_Torwache_First_JustLooking_13_01");	//Fremde sind uns willkommen.
	AI_Output(self,other,"DIA_Tpl_1415_Torwache_First_JustLooking_13_02");	//Aber es ist wichtig, das du unsere Regeln achtest. Es gibt bestimmte Bereiche, in denen Fremde sich nicht aufhalten dürfen.
	Info_ClearChoices(DIA_Tpl_1415_Torwache_First);
};


instance DIA_Tpl_1415_Torwache_Sit(C_Info)
{
	npc = TPL_1415_Templer;
	nr = 2;
	condition = DIA_Tpl_1415_Torwache_Sit_Condition;
	information = DIA_Tpl_1415_Torwache_Sit_Info;
	permanent = 1;
	description = "Wie sieht's im Lager aus?";
};


func int DIA_Tpl_1415_Torwache_Sit_Condition()
{
	return 1;
};

func void DIA_Tpl_1415_Torwache_Sit_Info()
{
	AI_Output(other,self,"DIA_Tpl_1415_Torwache_Sit_15_00");	//Wie sieht's im Lager aus?
	AI_Output(self,other,"DIA_Tpl_1415_Torwache_Sit_13_01");	//Alles ruhig. Geh nur rein.
};


instance Tpl_1415_Torwache_TEMPLERAUFNAHME(C_Info)
{
	npc = TPL_1415_Templer;
	condition = Tpl_1415_Torwache_TEMPLERAUFNAHME_Condition;
	information = Tpl_1415_Torwache_TEMPLERAUFNAHME_Info;
	important = 1;
	permanent = 0;
};


func int Tpl_1415_Torwache_TEMPLERAUFNAHME_Condition()
{
	if(((Npc_HasItems(hero,ItAt_Crawlerqueen) >= 1) || (CorKalom_BringMCQBalls == LOG_SUCCESS)) && (Npc_GetTrueGuild(hero) == GIL_NOV) && (Npc_GetDistToNpc(hero,self) < 1000))
	{
		return TRUE;
	};
};

func void Tpl_1415_Torwache_TEMPLERAUFNAHME_Info()
{
	AI_GotoNpc(hero,self);
	AI_Output(self,other,"Tpl_1415_Torwache_IMPORTANT_Info_13_01");	//Hey, ich habe schon gehört, was in der Mine geschehen ist. Gute Arbeit. Damit hast du dir deine Aufnahme zu den Templern verdient!
	AI_Output(self,other,"Tpl_1415_Torwache_IMPORTANT_Info_13_02");	//Sprich doch mal mit Cor Angar!
	Log_CreateTopic(GE_BecomeTemplar,LOG_NOTE);
	B_LogEntry(GE_BecomeTemplar,"Ich sollte mal mit Cor Angar reden. Vielleicht nimmt er mich in die Reihen der Templer auf.");
};


instance Tpl_1415_Templer_ROCK(C_Info)
{
	npc = TPL_1415_Templer;
	condition = Tpl_1415_Templer_ROCK_Condition;
	information = Tpl_1415_Templer_ROCK_Info;
	important = 0;
	permanent = 1;
	description = "Ich brauche eine Rüstung.";
};


func int Tpl_1415_Templer_ROCK_Condition()
{
	if(Kapitel < 2)
	{
		return TRUE;
	};
};

func void Tpl_1415_Templer_ROCK_Info()
{
	AI_Output(other,self,"Tpl_1415_Templer_ROCK_Info_10_01");	//Ich brauche eine Rüstung.
	AI_Output(self,other,"Tpl_1415_Templer_ROCK_Info_10_02");	//Dann wirst du dich uns anschliessen müssen. Wir können unsere Rüstungen nicht an Lagerfremde verkaufen.
	AI_Output(self,other,"Tpl_1415_Templer_ROCK_Info_10_03");	//Jeder neue Novize bekommt für den Anfang einen Novizenrock. Es ist nicht viel, aber er kann dir das Leben retten.
};

