
instance DIA_Silas_EXIT(C_Info)
{
	npc = ORG_841_Silas;
	nr = 999;
	condition = DIA_Silas_EXIT_Condition;
	information = DIA_Silas_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Silas_EXIT_Condition()
{
	return 1;
};

func void DIA_Silas_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Silas_Hehler(C_Info)
{
	npc = ORG_841_Silas;
	nr = 1;
	condition = DIA_Silas_Hehler_Condition;
	information = DIA_Silas_Hehler_Info;
	permanent = 0;
	description = "Wie läuft's denn so?";
};


func int DIA_Silas_Hehler_Condition()
{
	return 1;
};

func void DIA_Silas_Hehler_Info()
{
	AI_Output(other,self,"DIA_Silas_Hehler_15_00");	//Wie läuft's denn so?
	AI_Output(self,other,"DIA_Silas_Hehler_06_01");	//Gut! Wir verkaufen hier unseren selbstgebrannten Reisschnaps für gutes Erz.
	AI_Output(self,other,"DIA_Silas_Hehler_06_02");	//Kommt ja auch genug rein. Wo sollen die Jungs ihr Erz auch sonst hinbringen?
};


instance DIA_Silas_Trade(C_Info)
{
	npc = ORG_841_Silas;
	nr = 1;
	condition = DIA_Silas_Trade_Condition;
	information = DIA_Silas_Trade_Info;
	permanent = 1;
	description = "Ich will was trinken.";
	trade = 1;
};


func int DIA_Silas_Trade_Condition()
{
	return 1;
};

func void DIA_Silas_Trade_Info()
{
	AI_Output(other,self,"DIA_Silas_Trade_15_00");	//Ich will was trinken.
	AI_Output(self,other,"DIA_Silas_Trade_06_01");	//Dann musst du zahlen.
};


instance DIA_SILAS_QUEST(C_Info)
{
	npc = ORG_841_Silas;
	nr = 1;
	condition = dia_silas_quest_condition;
	information = dia_silas_quest_info;
	permanent = 0;
	description = "Brauchst du Hilfe?";
};


func int dia_silas_quest_condition()
{
	return 1;
};

func void dia_silas_quest_info()
{
	AI_Output(other,self,"DIA_Silas_Quest_15_00");	//Brauchst du Hilfe?
	AI_Output(self,other,"DIA_Silas_Quest_06_01");	//Einige von den Jungs haben mir erzählt, dass Gomez' Schergen ein richtig gutes Bier haben.
	AI_Output(self,other,"DIA_Silas_Quest_06_02");	//Starkbier, soweit ich weiß.
	AI_Output(self,other,"DIA_Silas_Quest_06_03");	//Der Reisschnaps bringt mir zwar viel Erz ein, aber hätt' ich was von dem Starkbier, könnte ich das zum doppelten Preis verkaufen.
	AI_Output(self,other,"DIA_Silas_Quest_06_04");	//Soweit ich weiß, hast du gute Kontakte ins alte Lager, also halt die Ohren offen und sieh' zu ob du ein paar Flaschen besorgen kannst.
	AI_Output(self,other,"DIA_Silas_Quest_06_05");	//Ich werd' dich selbstverständlich bezahlen.
	SILAS_BEER = LOG_RUNNING;
	Log_CreateTopic(CH1_SILAS,LOG_MISSION);
	Log_SetTopicStatus(CH1_SILAS,LOG_RUNNING);
	B_LogEntry(CH1_SILAS,"Silas, der Wirt der Kneipe aus dem Neuen Lager, gab' mir den Auftrag eine Kiste Starkbier zu besorgen. Er sagte im Alten Lager könnte ich fündig werden.");
};


instance DIA_SILAS_BEER(C_Info)
{
	npc = ORG_841_Silas;
	nr = 1;
	condition = dia_silas_beer_condition;
	information = dia_silas_beer_info;
	permanent = 1;
	description = "Hier ist dein Starkbier.";
};


func int dia_silas_beer_condition()
{
	if(Npc_KnowsInfo(hero,dia_silas_quest) && (SILAS_BEER == LOG_RUNNING))
	{
		return 1;
	};
};

func void dia_silas_beer_info()
{
	AI_Output(other,self,"DIA_Silas_Beer_15_00");	//Hier ist dein Starkbier.
	AI_Output(self,other,"DIA_Silas_Beer_15_01");	//Da bin ich ja mal gespannt.
	if(Npc_HasItems(other,ItFo_OM_Beer_01) >= 6)
	{
		AI_Output(self,other,"DIA_Silas_Beer_15_02");	//Gute Arbeit. Jetzt können die Jungs sich mal an was ordentlichem probieren.
		B_GiveInvItems(hero,self,ItFo_OM_Beer_01,6);
		SILAS_BEER = LOG_SUCCESS;
		Log_CreateTopic(CH1_SILAS,LOG_MISSION);
		Log_SetTopicStatus(CH1_SILAS,LOG_SUCCESS);
		B_LogEntry(CH1_SILAS,"Ich hab' Silas seine Kiste Bier besorgt und er war zufrieden mit meiner Arbeit. Anschliessend bekam ich eine Belohnung in Form von Erz.");
		B_GiveXP(XP_SILAS);
	}
	else
	{
		AI_Output(self,other,"DIA_Silas_Beer_15_04");	//Ein paar mehr Flaschen sollten es schon sein.
		AI_Output(self,other,"DIA_Silas_Beer_15_05");	//Komm' wieder wenn wenigstens 6 Flaschen hast.
	};
};

