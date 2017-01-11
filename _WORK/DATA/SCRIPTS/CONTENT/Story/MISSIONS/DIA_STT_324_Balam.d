
instance STT_324_BALAM_EXIT(C_Info)
{
	npc = STT_324_Balam;
	condition = stt_324_balam_exit_condition;
	information = stt_324_balam_exit_info;
	important = 0;
	permanent = 1;
	nr = 999;
	description = DIALOG_ENDE;
};


func int stt_324_balam_exit_condition()
{
	return 1;
};

func void stt_324_balam_exit_info()
{
	AI_StopProcessInfos(self);
};


instance STT_324_BALAM_DOING(C_Info)
{
	npc = STT_324_Balam;
	condition = stt_324_balam_doing_condition;
	information = stt_324_balam_doing_info;
	important = 0;
	permanent = 0;
	description = "Was machst du hier?";
};


func int stt_324_balam_doing_condition()
{
	return 1;
};

func void stt_324_balam_doing_info()
{
	AI_Output(other,self,"DIA_Orry_GuardGate_15_00");	//Was machst du hier?
	AI_Output(self,other,"Stt_324_Balam_DOING_02_73");	//Ich bereite zusammen mit Omid das Essen für Gomez zu. Das ist eine verdammt gefährliche Aufgabe.
	AI_Output(other,self,"Stt_324_Balam_DOING_03_72");	//Warum?
	AI_Output(self,other,"Stt_324_Balam_DOING_04_71");	//Ich sag's mal so, wenn Gomez das Essen nicht schmeckt, wird das mit Sicherheit die letzte Mahlzeit gewesen sein, die wir gekocht haben.
	AI_Output(other,self,"Stt_324_Balam_DOING_05_70");	//Verstehe.
};


instance DIA_BALAM_CAN(C_Info)
{
	npc = STT_324_Balam;
	nr = 3;
	condition = dia_balam_can_condition;
	information = dia_balam_can_info;
	permanent = 0;
	description = "Kannst du mir was beibringen?";
};


func int dia_balam_can_condition()
{
	if(Npc_KnowsInfo(hero,stt_324_balam_doing))
	{
		return 1;
	};
};

func void dia_balam_can_info()
{
	AI_Output(other,self,"DIA_Balam_Can_12_01");	//Kannst du mir was beibringen?
	AI_Output(self,other,"DIA_Balam_Can_12_02");	//Ich kann dir das Rezept für eine Suppe beibringen, die mit Wurzeln zubereitet wird.
	AI_Output(self,other,"DIA_Balam_Can_12_03");	//Vor meiner Zeit in der Kolonie, war ich öfter in der Wildnis unterwegs, hab Kräuter gesammelt und für neue Rezepte verwendet.
	AI_Output(self,other,"DIA_Balam_Can_12_04");	//Wenn du willst, werde ich dir das Rezept beibringen.
	Log_CreateTopic(GE_TeacherOC,LOG_NOTE);
	B_LogEntry(GE_TeacherOC,"Balam, der Koch des alten Lagers kann mir zeigen wie ich Wurzelsuppe kochen kann.");
};


instance DIA_BALAM_LEARN(C_Info)
{
	npc = STT_324_Balam;
	nr = 4;
	condition = dia_balam_learn_condition;
	information = dia_balam_learn_info;
	permanent = 1;
	description = "Wurzelsuppe (Kosten: 1 Lernpunkt)";
};


func int dia_balam_learn_condition()
{
	if(Npc_KnowsInfo(hero,dia_balam_can) && (KNOWS_SOUP == FALSE))
	{
		return 1;
	};
};

func void dia_balam_learn_info()
{
	AI_Output(other,self,"DIA_Balam_Learn_15_00");	//Bring mir bei wie ich Wurzelsuppe koche.
	if(hero.lp >= 1)
	{
		hero.lp = hero.lp - 1;
		AI_Output(self,other,"DIA_Balam_Learn_12_01");	//Also als erstes, wirst du erstmal das Wasser zum kochen bringen müssen.
		AI_Output(self,other,"DIA_Balam_Learn_12_02");	//Sobald es soweit ist, wirst du dir Wurzeln in den Topf geben.
		AI_Output(self,other,"DIA_Balam_Learn_12_03");	//Nicht vergessen die Suppe immer schön umzurühren.
		AI_Output(self,other,"DIA_Balam_Learn_12_04");	//Als letztes kommt das Orkblatt in den Topf.
		AI_Output(self,other,"DIA_Balam_Learn_12_05");	//Ist ein Geheimtipp von mir, dass wird der Suppe noch ein besonderes Aroma geben.
		Log_CreateTopic(GE_COOK,LOG_NOTE);
		B_LogEntry(GE_COOK,"Ab jetzt kann ich Wurzelsuppe kochen.");
		B_LogEntry(GE_COOK,"Die Zutaten sind: 2 Steinwurzeln und 1 Orkblatt. ");
		KNOWS_SOUP = TRUE;
		PrintScreen("Lerne: Wurzelsuppe",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Zu wenig Lernpunkte!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

