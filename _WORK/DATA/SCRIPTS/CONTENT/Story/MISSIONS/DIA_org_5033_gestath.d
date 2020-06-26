
instance DIA_GESTATH_EXIT(C_Info)
{
	npc = org_5033_gestath;
	nr = 999;
	condition = dia_gestath_exit_condition;
	information = dia_gestath_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_gestath_exit_condition()
{
	return 1;
};

func void dia_gestath_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GESTATH_HELLO(C_Info)
{
	npc = org_5033_gestath;
	nr = 1;
	condition = dia_gestath_hello_condition;
	information = dia_gestath_hello_info;
	permanent = 0;
	description = "Was machst du hier?";
};


func int dia_gestath_hello_condition()
{
	return 1;
};

func void dia_gestath_hello_info()
{
	AI_Output(other,self,"DIA_Org_5033_Gestath_Hello_15_00");	//Was machst du hier?
	AI_Output(self,other,"DIA_Org_5033_Gestath_Hello_13_01");	//Ich bin Jäger. Ich ziehe in der Kolonie umher und jage.
	AI_Output(other,self,"DIA_Org_5033_Gestath_Hello_13_02");	//Kannst du mir was beibringen?
	AI_Output(self,other,"DIA_Org_5033_Gestath_Hello_13_03");	//Schon, aber das wird dich ein bisschen was kosten.
	Log_CreateTopic(GE_TeacherOW,LOG_NOTE);
	B_LogEntry(GE_TeacherOW,"Gestath, ein Jäger der zwischen der freien Mine und dem Neuen Lager lebt, kann mir beibringen Tiere auszuschlachten.");
};


instance DIA_GESTATH_ARMOR(C_Info)
{
	npc = org_5033_gestath;
	nr = 1;
	condition = dia_gestath_armor_condition;
	information = dia_gestath_armor_info;
	permanent = 0;
	description = "Interessante Rüstung die du da trägst.";
};


func int dia_gestath_armor_condition()
{
	if(Npc_KnowsInfo(hero,dia_gestath_hello))
	{
		return 1;
	};
};

func void dia_gestath_armor_info()
{
	AI_Output(other,self,"DIA_Org_5033_Gestath_Armor_15_00");	//Interessante Rüstung die du da trägst.
	AI_Output(self,other,"DIA_Org_5033_Gestath_Armor_13_01");	//Ja, nicht? Hat mir ein Typ namens Wolf gemacht.
	AI_Output(self,other,"DIA_Org_5033_Gestath_Armor_13_02");	//Hab' ihm die entsprechenden Materialien gebracht und am nächsten Tag war das Ding fertig.
};


instance ORG_859_GESTATH_CREATURES(C_Info)
{
	npc = org_5033_gestath;
	nr = 1;
	condition = org_859_gestath_creatures_condition;
	information = org_859_gestath_creatures_info;
	permanent = 1;
	description = "Ich will lernen, Tiere auszuschlachten.";
};


func int org_859_gestath_creatures_condition()
{
	if(Npc_KnowsInfo(hero,dia_gestath_hello) && ((Knows_GetTeeth == FALSE) || (Knows_GetFur == FALSE) || (Knows_GetClaws == FALSE) || (Knows_GetHide == FALSE)))
	{
		return 1;
	};
};

func void org_859_gestath_creatures_info()
{
	AI_Output(other,self,"Org_859_Gestath_Creatures_15_00");	//Ich will lernen, Tiere auszuschlachten.
	if((Knows_GetTeeth == FALSE) || (Knows_GetFur == FALSE) || (Knows_GetClaws == FALSE) || (Knows_GetHide == FALSE))
	{
		AI_Output(self,other,"Org_859_Gestath_Creatures_13_01");	//Was willst du wissen?
		Info_ClearChoices(org_859_gestath_creatures);
		Info_AddChoice(org_859_gestath_creatures,DIALOG_BACK,org_859_gestath_creatures_back);
		if(Knows_GetTeeth == FALSE)
		{
			Info_AddChoice(org_859_gestath_creatures,"Zähne entfernen (Kosten: 1 LP, 50 Erz)",org_859_gestath_creatures_zahn);
		};
		if(Knows_GetFur == FALSE)
		{
			Info_AddChoice(org_859_gestath_creatures,"Fell abziehen (Kosten: 1 LP, 100 Erz)",org_859_gestath_creatures_fell);
		};
		if(Knows_GetClaws == FALSE)
		{
			Info_AddChoice(org_859_gestath_creatures,"Krallen abzuziehen (Kosten: 1 LP, 50 Erz)",org_859_gestath_creatures_kralle);
		};
		if(Knows_GetHide == FALSE)
		{
			Info_AddChoice(org_859_gestath_creatures,"Häuten von Reptilien (Kosten: 1 LP, 100 Erz)",org_859_gestath_creatures_haut);
		};
	}
	else
	{
		AI_Output(self,other,"Org_859_Gestath_Creatures_TaughtAll_13_00");	//Ich habe dir alles beigebracht, was ich weiß.
	};
};

func void org_859_gestath_creatures_back()
{
	Info_ClearChoices(org_859_gestath_creatures);
};

func void org_859_gestath_creatures_zahn()
{
	AI_Output(other,self,"Org_859_Gestath_Creatures_Zahn_15_00");	//Wie komme ich an die Zähne?
	if(Npc_HasItems(other,ItMiNugget) >= 50)
	{
		if(other.lp >= 1)
		{
			other.lp = other.lp - 1;
			B_GiveInvItems(other,self,ItMiNugget,50);
			PrintScreen("Lerne: Zähne nehmen",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
			AI_Output(self,other,"Org_859_Gestath_Creatures_Zahn_13_01");	//Du musst vor allem darauf achten, dass die Zähne nicht splittern. Um das zu verhindern, musst du dein Messer in der Mitte des Zahns ansetzen und vorsichtig hebeln.
			AI_Output(self,other,"Org_859_Gestath_Creatures_Zahn_13_02");	//Zähne kannst du von Wölfen, Schattenläufern oder Snappern nehmen.
			Knows_GetTeeth = TRUE;
			Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry(GE_AnimalTrophies,"Wissen über Zähne entfernen - Wolf, Orkhund, Snapper, Beisser, Bluthund, Schattenläufer.");
		}
		else
		{
			AI_Output(self,other,"Org_859_Gestath_Creatures_KEINE_LP_13_00");	//Du mußt mehr Erfahrung sammeln, vorher wird dich mein Wissen nicht weiterbringen.
			PrintScreen("Zu wenig Lernpunkte!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output(self,other,"Org_859_Gestath_Creatures_KEIN_ERZ_13_00");	//Erst will ich mein Erz sehen - wie gesagt: Es hat alles seinen Preis!
	};
};

func void org_859_gestath_creatures_fell()
{
	AI_Output(other,self,"Org_859_Gestath_Creatures_Fell_15_00");	//Wie kann ich den Viechern das Fell abziehen?
	if(Npc_HasItems(other,ItMiNugget) >= 100)
	{
		if(other.lp >= 1)
		{
			other.lp = other.lp - 1;
			B_GiveInvItems(other,self,ItMiNugget,100);
			PrintScreen("Lerne: Fell abziehen",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
			AI_Output(self,other,"Org_859_Gestath_Creatures_Fell_13_01");	//Wichtig ist vor allem: Immer von vorne nach hinten. Wenn du den Bogen einmal raushast, ist es kein Problem. Felle sind sehr wertvoll!
			AI_Output(self,other,"Org_859_Gestath_Creatures_Fell_13_02");	//Das Fell von Wölfen oder Schattenläufern eignet sich zum Herstellen von Kleidung. Du wirst merken, ob ein erlegtes Tier ein brauchbares Fell hat, wenn du es untersuchst.
			Knows_GetFur = TRUE;
			Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry(GE_AnimalTrophies,"Wissen über Fell abziehen - Wolf, Orkhund, Schattenläufer, Troll");
		}
		else
		{
			AI_Output(self,other,"Org_859_Gestath_Creatures_KEINE_LP_13_00");	//Du mußt mehr Erfahrung sammeln, vorher wird dich mein Wissen nicht weiterbringen.
			PrintScreen("Zu wenig Lernpunkte!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output(self,other,"Org_859_Gestath_Creatures_KEIN_ERZ_13_00");	//Erst will ich mein Erz sehen - wie gesagt: Es hat alles seinen Preis!
	};
};

func void org_859_gestath_creatures_kralle()
{
	if(Npc_HasItems(other,ItMiNugget) >= 50)
	{
		if(other.lp >= 1)
		{
			other.lp = other.lp - 1;
			B_GiveInvItems(other,self,ItMiNugget,50);
			PrintScreen("Lerne: Krallen abziehen",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
			AI_Output(other,self,"Org_859_Gestath_Creatures_Kralle_15_00");	//Bring mir bei, Krallen abzuziehen!
			AI_Output(self,other,"Org_859_Gestath_Creatures_Kralle_13_01");	//Ist im Grunde ganz einfach, wenn du weißt, wie's geht. Du musst die Krallen nach vorne wegknicken, auf keinen Fall nach hinten und NICHT ziehen!
			AI_Output(self,other,"Org_859_Gestath_Creatures_Kralle_13_02");	//Krallen kannst du vor allem von Echsen nehmen. Du wirst ab jetzt erkennen, von welchem erlegten Biest du die Krallen nehmen kannst.
			Knows_GetClaws = TRUE;
			Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry(GE_AnimalTrophies,"Wissen über Krallen abziehen - Warane, Snapper, Lurker, Beisser, Razor");
		}
		else
		{
			AI_Output(self,other,"Org_859_Gestath_Creatures_KEINE_LP_13_00");	//Du mußt mehr Erfahrung sammeln, vorher wird dich mein Wissen nicht weiterbringen.
			PrintScreen("Zu wenig Lernpunkte!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output(self,other,"Org_859_Gestath_Creatures_KEIN_ERZ_13_00");	//Erst will ich mein Erz sehen - wie gesagt: Es hat alles seinen Preis!
	};
};

func void org_859_gestath_creatures_haut()
{
	if(Npc_HasItems(other,ItMiNugget) >= 100)
	{
		if(other.lp >= 1)
		{
			other.lp = other.lp - 1;
			B_GiveInvItems(other,self,ItMiNugget,100);
			PrintScreen("Lerne: Echsen häuten",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
			AI_Output(other,self,"Org_859_Gestath_Creatures_Haut_15_00");	//Worauf muss ich beim Häuten von Reptilien achten?
			AI_Output(self,other,"Org_859_Gestath_Creatures_Haut_13_01");	//Die einzigen Reptilien, die dafür geeignet sind, sind der Lurker und der Sumpfhai.
			AI_Output(self,other,"Org_859_Gestath_Creatures_Haut_13_02");	//Wenn du die Haut an den Seiten anschneidest, löst sie sich wie von selbst. Du solltest ab jetzt kein Problem mehr haben, Echsen zu häuten.
			Knows_GetHide = TRUE;
			Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry(GE_AnimalTrophies,"Wissen über Häuten - Lurker, Sumpfhai");
		}
		else
		{
			AI_Output(self,other,"Org_859_Gestath_Creatures_KEINE_LP_13_00");	//Du mußt mehr Erfahrung sammeln, vorher wird dich mein Wissen nicht weiterbringen.
			PrintScreen("Zu wenig Lernpunkte!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output(self,other,"Org_859_Gestath_Creatures_KEIN_ERZ_13_00");	//Erst will ich mein Erz sehen - wie gesagt: Es hat alles seinen Preis!
	};
};

