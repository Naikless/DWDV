
instance DIA_Aidan_Exit(C_Info)
{
	npc = ORG_859_Aidan;
	nr = 999;
	condition = DIA_Aidan_Exit_Condition;
	information = DIA_Aidan_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Aidan_Exit_Condition()
{
	return 1;
};

func void DIA_Aidan_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Aidan_Hello(C_Info)
{
	npc = ORG_859_Aidan;
	nr = 1;
	condition = DIA_Aidan_Hello_Condition;
	information = DIA_Aidan_Hello_Info;
	permanent = 0;
	description = "Was machst du hier?";
};


func int DIA_Aidan_Hello_Condition()
{
	return 1;
};

func void DIA_Aidan_Hello_Info()
{
	AI_Output(other,self,"DIA_Aidan_Hello_15_00");	//Was machst du hier?
	AI_Output(self,other,"DIA_Aidan_Hello_13_01");	//Ich bin J�ger. Ich lebe vom Verkauf von Fellen und Z�hnen.
	AI_Output(other,self,"DIA_Aidan_Hello_15_02");	//Bringt das viel ein?
	AI_Output(self,other,"DIA_Aidan_Hello_13_03");	//Wenn man wei�, wie man die Viecher richtig ausschlachtet, schon.
	Log_CreateTopic(GE_TeacherOW,LOG_NOTE);
	B_LogEntry(GE_TeacherOW,"Aidan, ein J�ger der auf dem Weg zwischen Altem und Neuen Lager lebt, kann mir beibringen, wie man Tiere richtig ausschlachtet.");
};


instance Org_859_Aidan_Creatures(C_Info)
{
	npc = ORG_859_Aidan;
	nr = 1;
	condition = Org_859_Aidan_Creatures_Condition;
	information = Org_859_Aidan_Creatures_Info;
	permanent = 1;
	description = "Ich will lernen, Tiere auszuschlachten.";
};


func int Org_859_Aidan_Creatures_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Aidan_Hello) && ((Knows_GetTeeth == FALSE) || (Knows_GetFur == FALSE) || (Knows_GetClaws == FALSE) || (Knows_GetHide == FALSE)))
	{
		return 1;
	};
};

func void Org_859_Aidan_Creatures_Info()
{
	AI_Output(other,self,"Org_859_Aidan_Creatures_15_00");	//Ich will lernen, Tiere auszuschlachten.
	if((Knows_GetTeeth == FALSE) || (Knows_GetFur == FALSE) || (Knows_GetClaws == FALSE) || (Knows_GetHide == FALSE))
	{
		AI_Output(self,other,"Org_859_Aidan_Creatures_13_01");	//Was willst du wissen?
		Info_ClearChoices(Org_859_Aidan_Creatures);
		Info_AddChoice(Org_859_Aidan_Creatures,DIALOG_BACK,Org_859_Aidan_Creatures_BACK);
		if(Knows_GetTeeth == FALSE)
		{
			Info_AddChoice(Org_859_Aidan_Creatures,"Z�hne entfernen (Kosten: 1 LP, 50 Erz)",Org_859_Aidan_Creatures_Zahn);
		};
		if(Knows_GetFur == FALSE)
		{
			Info_AddChoice(Org_859_Aidan_Creatures,"Fell abziehen (Kosten: 1 LP, 100 Erz)",Org_859_Aidan_Creatures_Fell);
		};
		if(Knows_GetClaws == FALSE)
		{
			Info_AddChoice(Org_859_Aidan_Creatures,"Krallen abzuziehen (Kosten: 1 LP, 50 Erz)",Org_859_Aidan_Creatures_Kralle);
		};
		if(Knows_GetHide == FALSE)
		{
			Info_AddChoice(Org_859_Aidan_Creatures,"H�uten von Reptilien (Kosten: 1 LP, 100 Erz)",Org_859_Aidan_Creatures_Haut);
		};
	}
	else
	{
		AI_Output(self,other,"Org_859_Aidan_Creatures_TaughtAll_13_00");	//Ich habe dir alles beigebracht, was ich wei�.
	};
};

func void Org_859_Aidan_Creatures_BACK()
{
	Info_ClearChoices(Org_859_Aidan_Creatures);
};

func void Org_859_Aidan_Creatures_Zahn()
{
	AI_Output(other,self,"Org_859_Aidan_Creatures_Zahn_15_00");	//Wie komme ich an die Z�hne?
	if(Npc_HasItems(other,ItMiNugget) >= 50)
	{
		if(other.lp >= 1)
		{
			other.lp = other.lp - 1;
			B_GiveInvItems(other,self,ItMiNugget,50);
			PrintScreen("Lerne: Z�hne nehmen",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
			AI_Output(self,other,"Org_859_Aidan_Creatures_Zahn_13_01");	//Du musst vor allem darauf achten, dass die Z�hne nicht splittern. Um das zu verhindern, musst du dein Messer in der Mitte des Zahns ansetzen und vorsichtig hebeln.
			AI_Output(self,other,"Org_859_Aidan_Creatures_Zahn_13_02");	//Z�hne kannst du von W�lfen, Schattenl�ufern oder Snappern nehmen.
			Knows_GetTeeth = TRUE;
			Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry(GE_AnimalTrophies,"Wissen �ber Z�hne entfernen - Wolf, Orkhund, Snapper, Beisser, Bluthund, Schattenl�ufer.");
		}
		else
		{
			AI_Output(self,other,"Org_859_Aidan_Creatures_KEINE_LP_13_00");	//Du mu�t mehr Erfahrung sammeln, vorher wird dich mein Wissen nicht weiterbringen.
			PrintScreen("Zu wenig Lernpunkte!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output(self,other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00");	//Erst will ich mein Erz sehen - wie gesagt: Es hat alles seinen Preis!
	};
};

func void Org_859_Aidan_Creatures_Fell()
{
	AI_Output(other,self,"Org_859_Aidan_Creatures_Fell_15_00");	//Wie kann ich den Viechern das Fell abziehen?
	if(Npc_HasItems(other,ItMiNugget) >= 100)
	{
		if(other.lp >= 1)
		{
			other.lp = other.lp - 1;
			B_GiveInvItems(other,self,ItMiNugget,100);
			PrintScreen("Lerne: Fell abziehen",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
			AI_Output(self,other,"Org_859_Aidan_Creatures_Fell_13_01");	//Wichtig ist vor allem: Immer von vorne nach hinten. Wenn du den Bogen einmal raushast, ist es kein Problem. Felle sind sehr wertvoll!
			AI_Output(self,other,"Org_859_Aidan_Creatures_Fell_13_02");	//Das Fell von W�lfen oder Schattenl�ufern eignet sich zum Herstellen von Kleidung. Du wirst merken, ob ein erlegtes Tier ein brauchbares Fell hat, wenn du es untersuchst.
			Knows_GetFur = TRUE;
			Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry(GE_AnimalTrophies,"Wissen �ber Fell abziehen - Wolf, Orkhund, Schattenl�ufer, Troll");
		}
		else
		{
			AI_Output(self,other,"Org_859_Aidan_Creatures_KEINE_LP_13_00");	//Du mu�t mehr Erfahrung sammeln, vorher wird dich mein Wissen nicht weiterbringen.
			PrintScreen("Zu wenig Lernpunkte!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output(self,other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00");	//Erst will ich mein Erz sehen - wie gesagt: Es hat alles seinen Preis!
	};
};

func void Org_859_Aidan_Creatures_Kralle()
{
	if(Npc_HasItems(other,ItMiNugget) >= 50)
	{
		if(other.lp >= 1)
		{
			other.lp = other.lp - 1;
			B_GiveInvItems(other,self,ItMiNugget,50);
			PrintScreen("Lerne: Krallen abziehen",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
			AI_Output(other,self,"Org_859_Aidan_Creatures_Kralle_15_00");	//Bring mir bei, Krallen abzuziehen!
			AI_Output(self,other,"Org_859_Aidan_Creatures_Kralle_13_01");	//Ist im Grunde ganz einfach, wenn du wei�t, wie's geht. Du musst die Krallen nach vorne wegknicken, auf keinen Fall nach hinten und NICHT ziehen!
			AI_Output(self,other,"Org_859_Aidan_Creatures_Kralle_13_02");	//Krallen kannst du vor allem von Echsen nehmen. Du wirst ab jetzt erkennen, von welchem erlegten Biest du die Krallen nehmen kannst.
			Knows_GetClaws = TRUE;
			Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry(GE_AnimalTrophies,"Wissen �ber Krallen abziehen - Warane, Snapper, Lurker, Beisser, Razor");
		}
		else
		{
			AI_Output(self,other,"Org_859_Aidan_Creatures_KEINE_LP_13_00");	//Du mu�t mehr Erfahrung sammeln, vorher wird dich mein Wissen nicht weiterbringen.
			PrintScreen("Zu wenig Lernpunkte!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output(self,other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00");	//Erst will ich mein Erz sehen - wie gesagt: Es hat alles seinen Preis!
	};
};

func void Org_859_Aidan_Creatures_Haut()
{
	if(Npc_HasItems(other,ItMiNugget) >= 100)
	{
		if(other.lp >= 1)
		{
			other.lp = other.lp - 1;
			B_GiveInvItems(other,self,ItMiNugget,100);
			PrintScreen("Lerne: Echsen h�uten",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
			AI_Output(other,self,"Org_859_Aidan_Creatures_Haut_15_00");	//Worauf muss ich beim H�uten von Reptilien achten?
			AI_Output(self,other,"Org_859_Aidan_Creatures_Haut_13_01");	//Die einzigen Reptilien, die daf�r geeignet sind, sind der Lurker und der Sumpfhai.
			AI_Output(self,other,"Org_859_Aidan_Creatures_Haut_13_02");	//Wenn du die Haut an den Seiten anschneidest, l�st sie sich wie von selbst. Du solltest ab jetzt kein Problem mehr haben, Echsen zu h�uten.
			Knows_GetHide = TRUE;
			Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry(GE_AnimalTrophies,"Wissen �ber H�uten - Lurker, Sumpfhai");
		}
		else
		{
			AI_Output(self,other,"Org_859_Aidan_Creatures_KEINE_LP_13_00");	//Du mu�t mehr Erfahrung sammeln, vorher wird dich mein Wissen nicht weiterbringen.
			PrintScreen("Zu wenig Lernpunkte!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output(self,other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00");	//Erst will ich mein Erz sehen - wie gesagt: Es hat alles seinen Preis!
	};
};


instance DIA_AIDAN_BLACKWOLF(C_Info)
{
	npc = ORG_859_Aidan;
	nr = 1;
	condition = dia_aidan_blackwolf_condition;
	information = dia_aidan_blackwolf_info;
	permanent = 0;
	description = "Schau mal was ich hier habe.";
};


func int dia_aidan_blackwolf_condition()
{
	if((HUNT_WOLF == LOG_RUNNING) && Npc_HasItems(hero,itat_blackwolf_01))
	{
		return TRUE;
	};
};

func void dia_aidan_blackwolf_info()
{
	AI_Output(other,self,"DIA_Aidan_BlackWolf_15_00");	//Schau mal was ich hier habe.
	AI_Output(self,other,"DIA_Aidan_BlackWolf_13_01");	//Was... was ist das f�r ein Fell?
	AI_Output(other,self,"DIA_Aidan_BlackWolf_13_02");	//Das habe ich dem schwarzen Wolf abgezogen.
	AI_Output(self,other,"DIA_Aidan_BlackWolf_13_03");	//Von DEM schwarzen Wolf? Man, ich bin wirklich beeindruckt.
	AI_Output(self,other,"DIA_Aidan_BlackWolf_13_04");	//Es ist ewig her, seitdem ich das Mistvieh das letzte mal gesehen habe.
	AI_Output(self,other,"DIA_Aidan_BlackWolf_13_05");	//Vor einigen Jahren, als das Neue Lager gerade fertig geworden war, gab es eine Gruppe J�ger.
	AI_Output(self,other,"DIA_Aidan_BlackWolf_13_06");	//Gute Leute. Sehr erfahren mit dem Leben in der Wildnis.
	AI_Output(self,other,"DIA_Aidan_BlackWolf_13_07");	//Naja, es gab eine ganze Zeit lang Ger�chte �ber einen schwarzen Wolf, der im Wald im Osten der Kolonie umherzog.
	AI_Output(self,other,"DIA_Aidan_BlackWolf_13_08");	//Als die Gruppe das h�rte, zogen sie los um den Wolf zu jagen. Ich war damals schon J�ger, aber nicht erfahren genug um mit ihnen zu gehen.
	AI_Output(self,other,"DIA_Aidan_BlackWolf_13_09");	//Was im Nachhinein nichts schlechtes war...
	AI_Output(self,other,"DIA_Aidan_BlackWolf_13_10");	//Wochen vergingen. Die J�ger kehrten ab und an ins Lager zur�ck um Vorr�te zu sammeln. Irgendwann... kehrten sie nicht mehr zur�ck.
	AI_Output(self,other,"DIA_Aidan_BlackWolf_13_11");	//Sie haben den Wolf wohl gefunden. Erledigen konnten sie ihn aber nicht.
	AI_Output(self,other,"DIA_Aidan_BlackWolf_13_12");	//Ich habe ihn damals eine Belohnung versprochen. Eine Menge Erz...
	AI_Output(self,other,"DIA_Aidan_BlackWolf_13_13");	//Ich kann dir allerdings kein Erz geben, ich habe selbst kaum noch welches.
	AI_Output(self,other,"DIA_Aidan_BlackWolf_13_14");	//Aber, ich kann dir eine andere Belohnung bieten.
	AI_Output(self,other,"DIA_Aidan_BlackWolf_13_15");	//Dieser Bogen hier, er geh�rte dem Anf�hrer der Jagdgruppe. Vor langer Zeit fand ich ihn im Osten der Kolonie, an der Steilk�ste.
	AI_Output(self,other,"DIA_Aidan_BlackWolf_13_16");	//Ich bin mir sicher, du wirst ihn gut gebrauchen k�nnen. Marus h�tte bestimmt nichts dagegen, wenn ich einem erfahrenen J�ger seinen Bogen gebe.
	AI_Output(self,other,"DIA_Aidan_BlackWolf_13_17");	//Danke nochmal f�r deine Arbeit.
	AI_Output(self,other,"DIA_Aidan_BlackWolf_13_18");	//Wir sehen uns auf der Jagd!
	HUNT_WOLF = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_BLACKWOLF,LOG_SUCCESS);
	B_LogEntry(CH1_BLACKWOLF,"Aidan war sehr beeindruckt, dass ich den schwarzen Wolf erledigt hatte, den er schon so lange gejagt hatte. Er erz�hlte mir davon, wie vor mir eine Gruppe J�ger in die Kolonie zog um den Wolf zu jagen. Aber sie kehrten nie wieder zur�ck. Dabei d�rfte es sich wohl um das verlassene J�gerlager im Osten der Kolonie handeln. Als Belohnung bekam ich einen besonderen Bogen mit ein paar Pfeilen.");
	B_GiveXP(XP_BLACKWOLF);
	CreateInvItem(self,loner_bogen);
	B_GiveInvItems(self,hero,loner_bogen,1);
	CreateInvItems(self,ItAmArrow,30);
	B_GiveInvItems(self,hero,ItAmArrow,30);
	B_GiveInvItems(hero,self,itat_blackwolf_01,1);
	Npc_RemoveInvItem(self,itat_blackwolf_01);
};

