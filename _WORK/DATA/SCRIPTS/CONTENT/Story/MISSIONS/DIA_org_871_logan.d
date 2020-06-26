
instance DIA_LOGAN_EXIT(C_Info)
{
	npc = org_871_logan;
	nr = 999;
	condition = dia_logan_exit_condition;
	information = dia_logan_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_logan_exit_condition()
{
	return 1;
};

func void dia_logan_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LOGAN_HELLO(C_Info)
{
	npc = org_871_logan;
	nr = 1;
	condition = dia_logan_hello_condition;
	information = dia_logan_hello_info;
	permanent = 0;
	description = "Was machst du hier?";
};


func int dia_logan_hello_condition()
{
	return 1;
};

func void dia_logan_hello_info()
{
	AI_Output(other,self,"DIA_Org_5033_Logan_Hello_15_00");	//Was machst du hier?
	AI_Output(self,other,"DIA_Org_5033_Logan_Hello_13_01");	//Ich bin der J�ger unseres Lagers.
	AI_Output(self,other,"DIA_Org_5033_Logan_Hello_13_02");	//Ich sorg' daf�r das hier keiner von uns Kohldampf schieben muss.
	AI_Output(self,other,"DIA_Org_5033_Logan_Hello_13_03");	//Snapperfleisch ist zwar nicht das beste, aber besser als nichts.
	Log_CreateTopic(GE_TeacherOW,LOG_NOTE);
	B_LogEntry(GE_TeacherOW,"Logan, ein J�ger der im R�uberlager in den Bergen lebt, kann mir etwas �ber die Jagd beibringen.");
};


instance ORG_859_LOGAN_CREATURES(C_Info)
{
	npc = org_871_logan;
	nr = 1;
	condition = org_859_logan_creatures_condition;
	information = org_859_logan_creatures_info;
	permanent = 1;
	description = "Ich will lernen, Tiere auszuschlachten.";
};


func int org_859_logan_creatures_condition()
{
	if(Npc_KnowsInfo(hero,dia_logan_hello) && ((Knows_GetTeeth == FALSE) || (Knows_GetFur == FALSE) || (Knows_GetClaws == FALSE) || (Knows_GetHide == FALSE)))
	{
		return 1;
	};
};

func void org_859_logan_creatures_info()
{
	AI_Output(other,self,"Org_859_Logan_Creatures_15_00");	//Ich will lernen, Tiere auszuschlachten.
	if((Knows_GetTeeth == FALSE) || (Knows_GetFur == FALSE) || (Knows_GetClaws == FALSE) || (Knows_GetHide == FALSE))
	{
		AI_Output(self,other,"Org_859_Logan_Creatures_13_01");	//Was willst du wissen?
		Info_ClearChoices(org_859_logan_creatures);
		Info_AddChoice(org_859_logan_creatures,DIALOG_BACK,org_859_logan_creatures_back);
		if(Knows_GetTeeth == FALSE)
		{
			Info_AddChoice(org_859_logan_creatures,"Z�hne entfernen (Kosten: 1 LP, 50 Erz)",org_859_logan_creatures_zahn);
		};
		if(Knows_GetFur == FALSE)
		{
			Info_AddChoice(org_859_logan_creatures,"Fell abziehen (Kosten: 1 LP, 100 Erz)",org_859_logan_creatures_fell);
		};
		if(Knows_GetClaws == FALSE)
		{
			Info_AddChoice(org_859_logan_creatures,"Krallen abzuziehen (Kosten: 1 LP, 50 Erz)",org_859_logan_creatures_kralle);
		};
		if(Knows_GetHide == FALSE)
		{
			Info_AddChoice(org_859_logan_creatures,"H�uten von Reptilien (Kosten: 1 LP, 100 Erz)",org_859_logan_creatures_haut);
		};
	}
	else
	{
		AI_Output(self,other,"Org_859_Logan_Creatures_TaughtAll_13_00");	//Ich habe dir alles beigebracht, was ich wei�.
	};
};

func void org_859_logan_creatures_back()
{
	Info_ClearChoices(org_859_logan_creatures);
};

func void org_859_logan_creatures_zahn()
{
	AI_Output(other,self,"Org_859_Logan_Creatures_Zahn_15_00");	//Wie komme ich an die Z�hne?
	if(Npc_HasItems(other,ItMiNugget) >= 50)
	{
		if(other.lp >= 1)
		{
			other.lp = other.lp - 1;
			B_GiveInvItems(other,self,ItMiNugget,50);
			PrintScreen("Lerne: Z�hne nehmen",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
			AI_Output(self,other,"Org_859_Logan_Creatures_Zahn_13_01");	//Du musst vor allem darauf achten, dass die Z�hne nicht splittern. Um das zu verhindern, musst du dein Messer in der Mitte des Zahns ansetzen und vorsichtig hebeln.
			AI_Output(self,other,"Org_859_Logan_Creatures_Zahn_13_02");	//Z�hne kannst du von W�lfen, Schattenl�ufern oder Snappern nehmen.
			Knows_GetTeeth = TRUE;
			Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry(GE_AnimalTrophies,"Wissen �ber Z�hne entfernen - Wolf, Orkhund, Snapper, Beisser, Bluthund, Schattenl�ufer.");
		}
		else
		{
			AI_Output(self,other,"Org_859_Logan_Creatures_KEINE_LP_13_00");	//Du mu�t mehr Erfahrung sammeln, vorher wird dich mein Wissen nicht weiterbringen.
			PrintScreen("Zu wenig Lernpunkte!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output(self,other,"Org_859_Logan_Creatures_KEIN_ERZ_13_00");	//Erst will ich mein Erz sehen - wie gesagt: Es hat alles seinen Preis!
	};
};

func void org_859_logan_creatures_fell()
{
	AI_Output(other,self,"Org_859_Logan_Creatures_Fell_15_00");	//Wie kann ich den Viechern das Fell abziehen?
	if(Npc_HasItems(other,ItMiNugget) >= 100)
	{
		if(other.lp >= 1)
		{
			other.lp = other.lp - 1;
			B_GiveInvItems(other,self,ItMiNugget,100);
			PrintScreen("Lerne: Fell abziehen",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
			AI_Output(self,other,"Org_859_Logan_Creatures_Fell_13_01");	//Wichtig ist vor allem: Immer von vorne nach hinten. Wenn du den Bogen einmal raushast, ist es kein Problem. Felle sind sehr wertvoll!
			AI_Output(self,other,"Org_859_Logan_Creatures_Fell_13_02");	//Das Fell von W�lfen oder Schattenl�ufern eignet sich zum Herstellen von Kleidung. Du wirst merken, ob ein erlegtes Tier ein brauchbares Fell hat, wenn du es untersuchst.
			Knows_GetFur = TRUE;
			Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry(GE_AnimalTrophies,"Wissen �ber Fell abziehen - Wolf, Orkhund, Schattenl�ufer, Troll");
		}
		else
		{
			AI_Output(self,other,"Org_859_Logan_Creatures_KEINE_LP_13_00");	//Du mu�t mehr Erfahrung sammeln, vorher wird dich mein Wissen nicht weiterbringen.
			PrintScreen("Zu wenig Lernpunkte!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output(self,other,"Org_859_Logan_Creatures_KEIN_ERZ_13_00");	//Erst will ich mein Erz sehen - wie gesagt: Es hat alles seinen Preis!
	};
};

func void org_859_logan_creatures_kralle()
{
	if(Npc_HasItems(other,ItMiNugget) >= 50)
	{
		if(other.lp >= 1)
		{
			other.lp = other.lp - 1;
			B_GiveInvItems(other,self,ItMiNugget,50);
			PrintScreen("Lerne: Krallen abziehen",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
			AI_Output(other,self,"Org_859_Logan_Creatures_Kralle_15_00");	//Bring mir bei, Krallen abzuziehen!
			AI_Output(self,other,"Org_859_Logan_Creatures_Kralle_13_01");	//Ist im Grunde ganz einfach, wenn du wei�t, wie's geht. Du musst die Krallen nach vorne wegknicken, auf keinen Fall nach hinten und NICHT ziehen!
			AI_Output(self,other,"Org_859_Logan_Creatures_Kralle_13_02");	//Krallen kannst du vor allem von Echsen nehmen. Du wirst ab jetzt erkennen, von welchem erlegten Biest du die Krallen nehmen kannst.
			Knows_GetClaws = TRUE;
			Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry(GE_AnimalTrophies,"Wissen �ber Krallen abziehen - Warane, Snapper, Lurker, Beisser, Razor");
		}
		else
		{
			AI_Output(self,other,"Org_859_Logan_Creatures_KEINE_LP_13_00");	//Du mu�t mehr Erfahrung sammeln, vorher wird dich mein Wissen nicht weiterbringen.
			PrintScreen("Zu wenig Lernpunkte!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output(self,other,"Org_859_Logan_Creatures_KEIN_ERZ_13_00");	//Erst will ich mein Erz sehen - wie gesagt: Es hat alles seinen Preis!
	};
};

func void org_859_logan_creatures_haut()
{
	if(Npc_HasItems(other,ItMiNugget) >= 100)
	{
		if(other.lp >= 1)
		{
			other.lp = other.lp - 1;
			B_GiveInvItems(other,self,ItMiNugget,100);
			PrintScreen("Lerne: Echsen h�uten",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
			AI_Output(other,self,"Org_859_Logan_Creatures_Haut_15_00");	//Worauf muss ich beim H�uten von Reptilien achten?
			AI_Output(self,other,"Org_859_Logan_Creatures_Haut_13_01");	//Die einzigen Reptilien, die daf�r geeignet sind, sind der Lurker und der Sumpfhai.
			AI_Output(self,other,"Org_859_Logan_Creatures_Haut_13_02");	//Wenn du die Haut an den Seiten anschneidest, l�st sie sich wie von selbst. Du solltest ab jetzt kein Problem mehr haben, Echsen zu h�uten.
			Knows_GetHide = TRUE;
			Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry(GE_AnimalTrophies,"Wissen �ber H�uten - Lurker, Sumpfhai");
		}
		else
		{
			AI_Output(self,other,"Org_859_Logan_Creatures_KEINE_LP_13_00");	//Du mu�t mehr Erfahrung sammeln, vorher wird dich mein Wissen nicht weiterbringen.
			PrintScreen("Zu wenig Lernpunkte!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output(self,other,"Org_859_Logan_Creatures_KEIN_ERZ_13_00");	//Erst will ich mein Erz sehen - wie gesagt: Es hat alles seinen Preis!
	};
};


var int logan_trade;

instance DIA_LOGAN_TRADE(C_Info)
{
	npc = org_871_logan;
	nr = 800;
	condition = dia_logan_trade_condition;
	information = dia_logan_trade_info;
	permanent = 1;
	description = "K�nnen wir handeln?";
	trade = 1;
};


func int dia_logan_trade_condition()
{
	if(Npc_KnowsInfo(hero,dia_logan_hello))
	{
		return 1;
	};
};

func void dia_logan_trade_info()
{
	AI_Output(other,self,"DIA_Logan_TRADE_15_00");	//K�nnen wir handeln?
	AI_Output(self,other,"DIA_Logan_TRADE_12_01");	//Kommt drauf an was du zu bieten hast.
	if(LOGAN_TRADE == FALSE)
	{
		Log_CreateTopic(GE_TraderOW,LOG_NOTE);
		B_LogEntry(GE_TraderOW,"Logan aus dem R�uberlager in den Bergen kauft Felle, Z�hne und andere Tiertroph�en.");
		LOGAN_TRADE = TRUE;
	};
};


instance DIA_LOGAN_WHAT(C_Info)
{
	npc = org_871_logan;
	nr = 1;
	condition = dia_logan_what_condition;
	information = dia_logan_what_info;
	permanent = 0;
	description = "Was h�lst du von Esteban?";
};


func int dia_logan_what_condition()
{
	if(ESTEBAN_LEADER == LOG_RUNNING)
	{
		return 1;
	};
};

func void dia_logan_what_info()
{
	AI_Output(other,self,"DIA_Org_5033_Logan_What_15_00");	//Was h�lst du von Esteban?
	AI_Output(self,other,"DIA_Org_5033_Logan_What_13_01");	//Warum sollte ich dir was �ber Esteban erz�hlen?
	AI_Output(self,other,"DIA_Org_5033_Logan_What_13_02");	//Du bist keiner von uns, also wei� ich auch nicht ob man dir trauen kann.
	AI_Output(self,other,"DIA_Org_5033_Logan_What_13_03");	//Ich mach' dir einen Vorschlag.
	AI_Output(self,other,"DIA_Org_5033_Logan_What_13_04");	//Du gehst mit mir zusammen auf die Jagd und wenn du dich als vertrauensw�rdig erweist, erz�hl ich dir was du wissen willst.
};


instance DIA_LOGAN_HUNT(C_Info)
{
	npc = org_871_logan;
	nr = 1;
	condition = dia_logan_hunt_condition;
	information = dia_logan_hunt_info;
	permanent = 0;
	description = "Lass uns jagen gehen.";
};


func int dia_logan_hunt_condition()
{
	if((ESTEBAN_LEADER == LOG_RUNNING) && Npc_KnowsInfo(hero,dia_logan_what))
	{
		return 1;
	};
};

func void dia_logan_hunt_info()
{
	AI_Output(other,self,"DIA_Org_5033_Logan_Hunt_15_00");	//Lass uns jagen gehen.
	AI_Output(self,other,"DIA_Org_5033_Logan_Hunt_13_01");	//Gut. Vorher muss ich dir noch was erz�hlen.
	AI_StandUp(self);
	AI_Output(self,other,"DIA_Org_5033_Logan_Hunt_13_02");	//Als ich das letzte mal unten war, lief mir ein Snapper �ber den Weg. Ich hab' ja schon viele von den Biestern gesehen, aber der...
	AI_Output(self,other,"DIA_Org_5033_Logan_Hunt_13_03");	//Das Vieh hatte einen eiskalten Blick. So als w�rde es keinen Moment z�gern dich in tausend Fetzen zu zerrei�en.
	AI_Output(self,other,"DIA_Org_5033_Logan_Hunt_13_04");	//Wenn du mir hilfst das Vieh zu erledigen, bin ich dir was schuldig.
	SNAPPER_HUNT = LOG_RUNNING;
	Log_CreateTopic(CH1_SNAPPER,LOG_MISSION);
	Log_SetTopicStatus(CH1_SNAPPER,LOG_RUNNING);
	B_LogEntry(CH1_SNAPPER,"Wenn Logan mir helfen soll, soll ich ihn zuerst auf der Jagd begleiten. Er erz�hlte mir, dass er vor kurzem einem fiesen Snapper begegnet ist. Wenn ich ihm helfe, den zu erledigen, wird er auch mir erz�hlen, was ich wissen m�chte.");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"FMTAKEN");
	self.senses_range = 3000;
	AI_StopProcessInfos(self);
	Wld_InsertNpc(badsnapper,"FP_ROAM_OW_SCA_01_BADITS2");
};


instance DIA_LOGAN_APPROACH_SNAPPER(C_Info)
{
	npc = org_871_logan;
	nr = 1;
	condition = dia_logan_approach_snapper_condition;
	information = dia_logan_approach_snapper_info;
	permanent = 0;
	important = 1;
};


func int dia_logan_approach_snapper_condition()
{
	if((SNAPPER_HUNT == LOG_RUNNING) && Npc_GetDistToWP(self,"SPAWN_OW_SCA_01_BADITS7") < 3000)
	{
		return 1;
	};
};

func void dia_logan_approach_snapper_info()
{
	AI_Output(self,other,"DIA_Org_5033_Logan_APPROACH_13_00");	//Da vorne ist er, ich erkenne ihn wieder!
	AI_ReadyMeleeWeapon(self);
	AI_Output(self,other,"DIA_Org_5033_Logan_APPROACH_13_01");	//Auf geht's!
	AI_StopProcessInfos(self);
};


var int logan_esteban;

instance DIA_LOGAN_SUCCESS(C_Info)
{
	npc = org_871_logan;
	nr = 1;
	condition = dia_logan_success_condition;
	information = dia_logan_success_info;
	permanent = 0;
	important = 1;
};


func int dia_logan_success_condition()
{
	if((SNAPPER_HUNT == LOG_RUNNING) && Npc_IsDead(badsnapper))
	{
		return 1;
	};
};

func void dia_logan_success_info()
{
	AI_Output(other,self,"DIA_Org_5033_Logan_SUCCESS_15_00");	//Das Vieh ist erledigt.
	AI_Output(self,other,"DIA_Org_5033_Logan_SUCCESS_13_01");	//Gute Arbeit, du bist ja doch zu was zu gebrauchen.
	AI_Output(self,other,"DIA_Org_5033_Logan_SUCCESS_13_02");	//Wie ich dir gesagt habe, helfe ich dir jetzt.
	AI_Output(self,other,"DIA_Org_5033_Logan_SUCCESS_13_03");	//Ich bin der Meinung, dass Esteban bald unser neuer Anf�hrer ist.
	AI_Output(self,other,"DIA_Org_5033_Logan_SUCCESS_13_04");	//Nicht mehr lange und er wird sich gegen Quentin auflehnen.
	AI_Output(self,other,"DIA_Org_5033_Logan_SUCCESS_13_05");	//Auch wenn Quentin immer gut f�r uns gesorgt hat, die Zeiten �ndern sich, denke ich.
	AI_Output(self,other,"DIA_Org_5033_Logan_SUCCESS_13_06");	//Mehr wolltest du nicht wissen oder? Dann seh'n wir uns im Lager.
	SNAPPER_HUNT = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_SNAPPER,LOG_SUCCESS);
	B_LogEntry(CH1_SNAPPER,"Logan ist zufrieden mit mir. Ab jetzt vertraut er mir und hilft mir, wenn was ist.");
	B_GiveXP(XP_SNAPPER);
	B_LogEntry(CH1_ESTEBANQUENTIN,"Logan ist der Meinung, dass Quentin nicht mehr lange Anf�hrer sein wird. Er kann Quentin zwar gut leiden, sagt aber, dass sich die Zeiten �ndern.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	LOGAN_ESTEBAN = TRUE;
};

