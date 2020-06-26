
instance DIA_Jeremiah_EXIT(C_Info)
{
	npc = BAU_912_Jeremiah;
	nr = 999;
	condition = DIA_Jeremiah_EXIT_Condition;
	information = DIA_Jeremiah_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Jeremiah_EXIT_Condition()
{
	return 1;
};

func void DIA_Jeremiah_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Jeremiah_Hallo(C_Info)
{
	npc = BAU_912_Jeremiah;
	nr = 1;
	condition = DIA_Jeremiah_Hallo_Condition;
	information = DIA_Jeremiah_Hallo_Info;
	permanent = 0;
	description = "Was machst du hier?";
};


func int DIA_Jeremiah_Hallo_Condition()
{
	return 1;
};

func void DIA_Jeremiah_Hallo_Info()
{
	AI_Output(other,self,"DIA_Jeremiah_Hallo_15_00");	//Was machst du hier?
	AI_Output(self,other,"DIA_Jeremiah_Hallo_04_01");	//Ich brenne den Reisschnaps, Junge.
	AI_Output(self,other,"DIA_Jeremiah_Hallo_04_02");	//Hier - nimm ne Flasche. Aber sag nichts Silas.
	CreateInvItems(self,ItFoBooze,1);
	B_GiveInvItems(self,other,ItFoBooze,1);
};


var int Jeremiah_Bauer;

instance DIA_Jeremiah_PERM(C_Info)
{
	npc = BAU_912_Jeremiah;
	nr = 1;
	condition = DIA_Jeremiah_PERM_Condition;
	information = DIA_Jeremiah_PERM_Info;
	permanent = 1;
	description = "Wie l‰uft das Schnapsbrennergesch‰ft?";
};


func int DIA_Jeremiah_PERM_Condition()
{
	return 1;
};

func void DIA_Jeremiah_PERM_Info()
{
	AI_Output(other,self,"DIA_Jeremiah_PERM_15_00");	//Wie l‰uft das Schnapsbrennergesch‰ft?
	AI_Output(self,other,"DIA_Jeremiah_PERM_04_01");	//Ich kann kaum soviel nachlegen, wie die Kerle wegsaufen.
	AI_Output(self,other,"DIA_Jeremiah_PERM_04_02");	//Ist auch ganz gut so - solange ich hier genug zu tun habe, lassen mich die Jungs vom Reislord in Ruhe.
	Jeremiah_Bauer = TRUE;
};


instance DIA_Jeremiah_Horatio(C_Info)
{
	npc = BAU_912_Jeremiah;
	nr = 2;
	condition = DIA_Jeremiah_Horatio_Condition;
	information = DIA_Jeremiah_Horatio_Info;
	permanent = 0;
	description = "Was kannst du mir ¸ber den Reislord sagen?";
};


func int DIA_Jeremiah_Horatio_Condition()
{
	if(Jeremiah_Bauer == TRUE)
	{
		return 1;
	};
};

func void DIA_Jeremiah_Horatio_Info()
{
	AI_Output(other,self,"DIA_Jeremiah_Horatio_15_00");	//Was kannst du mir ¸ber den Reislord sagen?
	AI_Output(self,other,"DIA_Jeremiah_Horatio_04_01");	//Er ist ein verdammtes Schwein! Seine Schl‰ger suchen sich die Schwachen aus, um sie zur Arbeit auf den Feldern zu zwingen.
	AI_Output(self,other,"DIA_Jeremiah_Horatio_04_02");	//Der einzige, der sich wehren kˆnnte ist Horatio. Aber der hat mit Gewalt nichts am Hut.
	AI_Output(self,other,"DIA_Jeremiah_Horatio_04_03");	//Ich hab' mal gehˆrt, wie er gesagt hat, er w¸rde dem Reislord gerne den Sch‰del einschlagen, aber das w¸rde er nie tun.
	AI_Output(self,other,"DIA_Jeremiah_Horatio_04_04");	//Seine ‹berzeugung h‰lt ihn davon ab.
};


instance DIA_JEREMIAH_LEARN(C_Info)
{
	npc = BAU_912_Jeremiah;
	nr = 1;
	condition = dia_jeremiah_learn_condition;
	information = dia_jeremiah_learn_info;
	permanent = 0;
	description = "Kannst du mir beibringen Reisschnaps zu brennen?";
};


func int dia_jeremiah_learn_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Jeremiah_Hallo))
	{
		return 1;
	};
};

func void dia_jeremiah_learn_info()
{
	AI_Output(other,self,"DIA_Jeremiah_Learn_15_00");	//Kannst du mir beibringen Reisschnaps zu brennen?
	AI_Output(self,other,"DIA_Jeremiah_Learn_04_01");	//Sicher kann ich dir was beibringen. Du musst nur die nˆtige Erfahrung daf¸r mitbringen, Junge.
	Log_CreateTopic(GE_TeacherNC,LOG_NOTE);
	B_LogEntry(GE_TeacherNC,"Jeremiah kann mir beibringen wie ich Reisschnaps brenne.");
};


instance DIA_JEREMIAH_BOOZE(C_Info)
{
	npc = BAU_912_Jeremiah;
	nr = 1;
	condition = dia_jeremiah_booze_condition;
	information = dia_jeremiah_booze_info;
	permanent = 1;
	description = "Ich will lernen Reisschnaps zu brennen. (1 LP)";
};


func int dia_jeremiah_booze_condition()
{
	if(Npc_KnowsInfo(hero,dia_jeremiah_learn) && (KNOWS_BOOZE == FALSE))
	{
		return 1;
	};
};

func void dia_jeremiah_booze_info()
{
	AI_Output(other,self,"DIA_Jeremiah_Booze_15_00");	//Ich will lernen Reisschnaps zu brennen.
	if(hero.lp >= 1)
	{
		hero.lp = hero.lp - 1;
		AI_Output(self,other,"DIA_Jeremiah_Booze_15_01");	//Gut. Du beginnst, indem du das Wasser mit dem Alkohol mischt.
		AI_Output(self,other,"DIA_Jeremiah_Booze_15_02");	//Danach gibst du die Reispflanzen zu deiner Mixtur hinzu.
		AI_Output(self,other,"DIA_Jeremiah_Booze_15_03");	//Pass aber auf, dass du den Schnaps nicht zu heiﬂ brennst. Das verdirbt den gesamten Geschmack des Reisschnaps.
		Log_CreateTopic(GE_ALCHEMIE,LOG_NOTE);
		B_LogEntry(GE_ALCHEMIE,"Reisschnaps - 1 Wasser, 1 Alkohol, 1 Reispflanze");
		KNOWS_BOOZE = TRUE;
		B_GiveSkill(other,NPC_TALENT_REGENERATE,1,0);
	}
	else
	{
		PrintScreen("Zu wenig Lernpunkte!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

