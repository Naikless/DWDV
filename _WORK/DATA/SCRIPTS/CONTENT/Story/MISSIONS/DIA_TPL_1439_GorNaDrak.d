
instance DIA_GorNaDrak_EXIT(C_Info)
{
	npc = TPL_1439_GorNaDrak;
	nr = 999;
	condition = DIA_GorNaDrak_EXIT_Condition;
	information = DIA_GorNaDrak_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_GorNaDrak_EXIT_Condition()
{
	return 1;
};

func void DIA_GorNaDrak_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GorNaDrak_Greet(C_Info)
{
	npc = TPL_1439_GorNaDrak;
	nr = 1;
	condition = DIA_GorNaDrak_Greet_Condition;
	information = DIA_GorNaDrak_Greet_Info;
	permanent = 0;
	description = "Hi! Wohin soll's denn gehen?";
};


func int DIA_GorNaDrak_Greet_Condition()
{
	return 1;
};

func void DIA_GorNaDrak_Greet_Info()
{
	AI_Output(other,self,"DIA_GorNaDrak_Greet_15_00");	//Hi! Wohin soll's denn gehen?
	AI_Output(self,other,"DIA_GorNaDrak_Greet_09_01");	//Wir bringen das Sekret der Minecrawler, das unsere Brüder in der Alten Mine gewinnen, zu Cor Kalom.
	AI_Output(self,other,"DIA_GorNaDrak_Greet_09_02");	//Einmal täglich gehen wir zur Alten Mine, um es abzuholen.
};


instance DIA_GorNaDrak_WasSekret(C_Info)
{
	npc = TPL_1439_GorNaDrak;
	nr = 1;
	condition = DIA_GorNaDrak_WasSekret_Condition;
	information = DIA_GorNaDrak_WasSekret_Info;
	permanent = 0;
	description = "Was ist das für ein Sekret?";
};


func int DIA_GorNaDrak_WasSekret_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_GorNaDrak_Greet))
	{
		return 1;
	};
};

func void DIA_GorNaDrak_WasSekret_Info()
{
	AI_Output(other,self,"DIA_GorNaDrak_WasSekret_15_00");	//Was ist das für ein Sekret?
	AI_Output(self,other,"DIA_GorNaDrak_WasSekret_09_01");	//Wir gewinnen es aus den Zangen der Minecrawler. Wenn man weiß wie, kann man sie herausnehmen, ohne dass das Sekret verloren geht.
	Log_CreateTopic(GE_TeacherOW,LOG_NOTE);
	B_LogEntry(GE_TeacherOW,"Gor Na drak, ein Templer der sich immer zwischen dem Sumpflager und der Alten Mine aufhält, kann mir beibringen wie ich Minecrawlern die Zangen herausschneide.");
};


instance DIA_GorNaDrak_TeachMandibles(C_Info)
{
	npc = TPL_1439_GorNaDrak;
	nr = 1;
	condition = DIA_GorNaDrak_TeachMandibles_Condition;
	information = DIA_GorNaDrak_TeachMandibles_Info;
	permanent = 1;
	description = "Kannst du mir das Zangen rausschneiden beibringen? (1 LP)";
};


func int DIA_GorNaDrak_TeachMandibles_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_GorNaDrak_WasSekret) && (Knows_GetMCMandibles == FALSE))
	{
		return 1;
	};
};

func void DIA_GorNaDrak_TeachMandibles_Info()
{
	AI_Output(other,self,"Tpl_1438_Templer_TEACHZANGEN_Info_15_01");	//Kannst du mir das Zangen rausschneiden beibringen?
	if(hero.lp >= 1)
	{
		hero.lp = hero.lp - 1;
		AI_Output(self,other,"DIA_GorNaDrak_TeachMandibles_09_01");	//Klar, nachdem du das Vieh getötet hast, packst du es an den Beißzangen und reißt sie gerade heraus. Dann kommt die Sekretdrüse mit raus, ohne zu zerreißen.  
		Knows_GetMCMandibles = TRUE;
		Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
		B_LogEntry(GE_AnimalTrophies,"Wissen über Zangen rausschneiden - Minecrawler");
		DIA_GorNaDrak_TeachMandibles.permanent = 0;
		PrintScreen("Lerne: Minecrawlerzangen rausschneiden",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else
	{
		PrintScreen("Zu wenig Lernpunkte!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};


instance DIA_GorNaDrak_WhatFor(C_Info)
{
	npc = TPL_1439_GorNaDrak;
	nr = 1;
	condition = DIA_GorNaDrak_WhatFor_Condition;
	information = DIA_GorNaDrak_WhatFor_Info;
	permanent = 0;
	description = "Wofür braucht Cor Kalom das Sekret?";
};


func int DIA_GorNaDrak_WhatFor_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_GorNaDrak_WasSekret))
	{
		return 1;
	};
};

func void DIA_GorNaDrak_WhatFor_Info()
{
	AI_Output(other,self,"DIA_GorNaDrak_WhatFor_15_00");	//Wofür braucht Cor Kalom das Sekret?
	AI_Output(self,other,"DIA_GorNaDrak_WhatFor_09_01");	//Soweit ich weiß, gewinnt er daraus ein Elixier, das die magische Kraft eines Novizen steigert.
	AI_Output(self,other,"DIA_GorNaDrak_WhatFor_09_02");	//Seit wir uns auf die große Anrufung vorbereiten, kann er gar nicht genug von dem Zeug bekommen.
	AI_Output(self,other,"DIA_GorNaDrak_WhatFor_09_03");	//Mit Hilfe des Elixiers will er die Novizen auf den großen Tag vorbereiten.
};


instance DIA_GorNaDrak_Permanent(C_Info)
{
	npc = TPL_1439_GorNaDrak;
	nr = 1;
	condition = DIA_GorNaDrak_Permanent_Condition;
	information = DIA_GorNaDrak_Permanent_Info;
	permanent = 1;
	description = "Habt ihr schon genug Elixier für die große Anrufung des Schläfers?";
};


func int DIA_GorNaDrak_Permanent_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_GorNaDrak_WhatFor) && (Kapitel < 3))
	{
		return 1;
	};
};

func void DIA_GorNaDrak_Permanent_Info()
{
	AI_Output(other,self,"DIA_GorNaDrak_Permanent_15_00");	//Habt ihr schon genug Elixier für die große Anrufung des Schläfers?
	AI_Output(self,other,"DIA_GorNaDrak_Permanent_09_01");	//Nein - Wir müssen noch 'ne Menge sammeln - in der Alten Mine sind unsere Minecrawler-Jagdtrupps Tag und Nacht im Einsatz.
};


instance TPL_1439_GORNADRAK_WELCOME(C_Info)
{
	npc = TPL_1439_GorNaDrak;
	condition = tpl_1439_gornadrak_welcome_condition;
	information = tpl_1439_gornadrak_welcome_info;
	important = 1;
	permanent = 0;
};


func int tpl_1439_gornadrak_welcome_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_TPL)
	{
		return TRUE;
	};
};

func void tpl_1439_gornadrak_welcome_info()
{
	AI_Output(self,other,"Tpl_1439_GorNaDrak_WELCOME_Info_08_01");	//Du hast es in die Ränge eines Templers geschafft? Du kannst stolz auf dich sein.
	AI_StopProcessInfos(self);
};

