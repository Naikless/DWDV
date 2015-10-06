
instance DIA_FRANCO_EXIT(C_Info)
{
	npc = org_866_franco;
	nr = 999;
	condition = dia_franco_exit_condition;
	information = dia_franco_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_franco_exit_condition()
{
	return 1;
};

func void dia_franco_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_FRANCO_HELLO(C_Info)
{
	npc = org_866_franco;
	nr = 1;
	condition = dia_franco_hello_condition;
	information = dia_franco_hello_info;
	permanent = 0;
	description = "Hi!";
};


func int dia_franco_hello_condition()
{
	return 1;
};

func void dia_franco_hello_info()
{
	AI_Output(other,self,"DIA_Franco_Hello_15_00");	//Hi!
	AI_Output(self,other,"DIA_Franco_Hello_15_01");	//Was willst du? Siehst du nicht das ich beschäftigt bin?
	AI_StopProcessInfos(self);
};


instance DIA_FRANCO_HOWRU(C_Info)
{
	npc = org_866_franco;
	nr = 1;
	condition = dia_franco_howru_condition;
	information = dia_franco_howru_info;
	permanent = 0;
	description = "Wie sieht's aus?";
};


func int dia_franco_howru_condition()
{
	if(Npc_KnowsInfo(hero,dia_franco_hello))
	{
		return 1;
	};
};

func void dia_franco_howru_info()
{
	AI_Output(other,self,"DIA_Franco_HowRU_15_00");	//Wie sieht's aus?
	AI_Output(self,other,"DIA_Franco_HowRU_15_01");	//Du schon wieder? Hab' ich dir nicht schonmal gesagt da du dich verpissen sollst?
	AI_StopProcessInfos(self);
};


instance DIA_FRANCO_ESTEBAN(C_Info)
{
	npc = org_866_franco;
	nr = 1;
	condition = dia_franco_esteban_condition;
	information = dia_franco_esteban_info;
	permanent = 0;
	description = "Was denkst du über Esteban?";
};


func int dia_franco_esteban_condition()
{
	if(ESTEBAN_LEADER == LOG_RUNNING)
	{
		return 1;
	};
};

func void dia_franco_esteban_info()
{
	AI_Output(other,self,"DIA_Franco_Esteban_15_00");	//Was denkst du über Esteban?
	AI_Output(self,other,"DIA_Franco_Esteban_15_01");	//Was geht dich das an?
	AI_Output(self,other,"DIA_Franco_Esteban_15_02");	//Wüsste nicht warum ich einem Außenstehenden irgendwas sagen sollte.
	AI_Output(self,other,"DIA_Franco_Esteban_15_03");	//Also verschwinde!
	AI_StopProcessInfos(self);
};


instance DIA_FRANCO_AMULETT(C_Info)
{
	npc = org_866_franco;
	nr = 1;
	condition = dia_franco_amulett_condition;
	information = dia_franco_amulett_info;
	permanent = 0;
	description = "Es ist wirklich dringend das ich was erfahre.";
};


func int dia_franco_amulett_condition()
{
	if((ESTEBAN_LEADER == LOG_RUNNING) && Npc_KnowsInfo(hero,dia_franco_esteban))
	{
		return 1;
	};
};

func void dia_franco_amulett_info()
{
	AI_Output(other,self,"DIA_Franco_Amulett_15_00");	//Es ist wirklich dringend das ich was erfahre.
	AI_Output(self,other,"DIA_Franco_Amulett_15_01");	//So, dir ist es also so wichtig?
	AI_Output(self,other,"DIA_Franco_Amulett_15_02");	//Gut, ich hab' einen Auftrag für dich.
	AI_Output(self,other,"DIA_Franco_Amulett_15_03");	//Ein Typ aus dem Neuen Lager hat etwas sehr wertvolles von mir gestohlen.
	AI_Output(self,other,"DIA_Franco_Amulett_15_04");	//Ich kann allerdings nicht mehr ins Lager, weil ich da vor einiger Zeit mal ärger hatte.
	AI_Output(self,other,"DIA_Franco_Amulett_15_05");	//Also muss da jemand rein, von dem sie nicht wissen, dass er mich kennt.
	AI_Output(self,other,"DIA_Franco_Amulett_15_06");	//Das wirst du sein.
	AI_Output(self,other,"DIA_Franco_Amulett_15_07");	//Der Typ heißt Bruce und ist einer der Banditen.
	AI_Output(self,other,"DIA_Franco_Amulett_15_08");	//Damals war der Kerl mein Jagdgefährte. Allerdings konnte er seine Finger nicht von meinen Sachen lassen uns hat mein Amulett gestohlen.
	AI_Output(self,other,"DIA_Franco_Amulett_15_09");	//Das würde ich gern' wieder haben.
	AI_Output(self,other,"DIA_Franco_Amulett_15_10");	//Ich wette der Mistkerl trägt es jetzt um den Hals und spaziert damit durch's Neue Lager.
	AI_Output(self,other,"DIA_Franco_Amulett_15_11");	//Wenn du mir mein Amulett wiederbeschaffst, reden wir weiter.
	AI_Output(self,other,"DIA_Franco_Amulett_15_12");	//Jetzt sieh' erstmal zu das du mir das Ding wiederholst.
	FRANCO_AMULETT = LOG_RUNNING;
	Log_CreateTopic(CH1_AMULETT,LOG_MISSION);
	Log_SetTopicStatus(CH1_AMULETT,LOG_RUNNING);
	B_LogEntry(CH1_AMULETT,"Wenn Franco mir helfen soll, muss ich ihm zuallerst sein Amulett zurückholen. Bruce, ein Bandit aus dem Neuen Lager soll es ihm gestohlen haben. Er war der Jagdgefährte von Franco und treibt sich immer noch irgendwo im Lager herum.");
	AI_StopProcessInfos(self);
};


var int franco_esteban;

instance DIA_FRANCO_SUCCESS(C_Info)
{
	npc = org_866_franco;
	nr = 1;
	condition = dia_franco_success_condition;
	information = dia_franco_success_info;
	permanent = 0;
	important = 0;
	description = "Hier ist dein Amulett.";
};


func int dia_franco_success_condition()
{
	if((FRANCO_AMULETT == LOG_RUNNING) && Npc_HasItems(hero,francos_amulett))
	{
		return 1;
	};
};

func void dia_franco_success_info()
{
	AI_Output(other,self,"DIA_Org_5033_Franco_SUCCESS_15_00");	//Hier ist dein Amulett.
	AI_Output(self,other,"DIA_Org_5033_Franco_SUCCESS_13_01");	//Sehr gut. Hehe.
	AI_Output(self,other,"DIA_Org_5033_Franco_SUCCESS_13_02");	//Hätt' ich dir ja gar nicht zugetraut das du das schaffst.
	AI_Output(other,self,"DIA_Org_5033_Franco_SUCCESS_13_03");	//Du wolltest mir was erzählen...
	AI_Output(self,other,"DIA_Org_5033_Franco_SUCCESS_13_04");	//Ah ja. Quentin hat nichts mehr an der Spitze dieses Lagers zu suchen. Esteban wird bald seinen Platz einnehmen.
	B_GiveInvItems(other,self,francos_amulett,1);
	FRANCO_AMULETT = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_AMULETT,LOG_SUCCESS);
	B_LogEntry(CH1_AMULETT,"Franco war unausstehlich wie immer, aber er war erfreut das er sein Amulett wieder zurückbekommen hat.");
	B_GiveXP(XP_FRANCO);
	B_LogEntry(CH1_ESTEBANQUENTIN,"Franco ist sehr unzufrieden mit der Arbeit von Quentin. Er ist einer der Männer im Lager die voll hinter Esteban stehen.");
	FRANCO_ESTEBAN = TRUE;
	AI_StopProcessInfos(self);
};

