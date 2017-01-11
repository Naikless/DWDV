
instance DIA_BRUCE_EXIT(C_Info)
{
	npc = ORG_828_Bruce;
	nr = 999;
	condition = dia_bruce_exit_condition;
	information = dia_bruce_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_bruce_exit_condition()
{
	return 1;
};

func void dia_bruce_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BRUCE_HELLO(C_Info)
{
	npc = ORG_828_Bruce;
	nr = 1;
	condition = dia_bruce_hello_condition;
	information = dia_bruce_hello_info;
	permanent = 1;
	important = 0;
	description = "Wie sieht's aus?";
};


func int dia_bruce_hello_condition()
{
	return 1;
};

func void dia_bruce_hello_info()
{
	AI_Output(other,self,"DIA_Bruce_Hello_15_00");	//Wie sieht's aus?
	AI_Output(self,other,"DIA_Bruce_Hello_12_01");	//Wer bist du? Dich hab' ich hier noch nie gesehen.
	AI_Output(other,self,"DIA_Bruce_Hello_12_02");	//Das ist kein Wunder, ich bin neu hier.
	AI_Output(self,other,"DIA_Bruce_Hello_12_03");	//Ach so. Siehst dir das Lager an was?
	AI_Output(self,other,"DIA_Bruce_Hello_12_04");	//Wenn du Arbeit suchst, sprich' mal mit Lares. Er hat immer Arbeit für Neue wie dich.
	AI_StopProcessInfos(self);
};


instance DIA_BRUCE_AMULETT(C_Info)
{
	npc = ORG_828_Bruce;
	nr = 1;
	condition = dia_bruce_amulett_condition;
	information = dia_bruce_amulett_info;
	permanent = 0;
	important = 0;
	description = "Interessantes Amulett das du da trägst.";
};


func int dia_bruce_amulett_condition()
{
	if(FRANCO_AMULETT == LOG_RUNNING)
	{
		return 1;
	};
};

func void dia_bruce_amulett_info()
{
	AI_Output(other,self,"DIA_Bruce_Amulett_15_00");	//Interessantes Amulett das du da trägst.
	AI_Output(self,other,"DIA_Bruce_Amulett_12_01");	//Find' ich auch. Hehe.
	AI_Output(self,other,"DIA_Bruce_Amulett_12_02");	//Einer unserer ehemaligen Banditen hat mir das mal vor einiger Zeit geschenkt.
};


instance DIA_BRUCE_FRANCO(C_Info)
{
	npc = ORG_828_Bruce;
	nr = 1;
	condition = dia_bruce_franco_condition;
	information = dia_bruce_franco_info;
	permanent = 0;
	important = 0;
	description = "Das ist Franco's Amulett.";
};


func int dia_bruce_franco_condition()
{
	if((FRANCO_AMULETT == LOG_RUNNING) && Npc_KnowsInfo(hero,dia_bruce_amulett))
	{
		return 1;
	};
};

func void dia_bruce_franco_info()
{
	AI_Output(other,self,"DIA_Bruce_Franco_15_00");	//Das ist Franco's Amulett. Ich denke das du es von ihm gestohlen hast.
	AI_Output(self,other,"DIA_Bruce_Franco_12_01");	//Ach? Und wenn es so wäre?
	AI_Output(self,other,"DIA_Bruce_Franco_12_02");	//Du kannst ja versuchen es mir wieder abzunehmen, wenn du es willst.
	AI_StopProcessInfos(self);
};

