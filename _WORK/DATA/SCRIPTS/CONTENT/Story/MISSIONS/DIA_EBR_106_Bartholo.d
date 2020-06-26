
instance DIA_Bartholo_Exit(C_Info)
{
	npc = EBR_106_Bartholo;
	nr = 999;
	condition = DIA_Bartholo_Exit_Condition;
	information = DIA_Bartholo_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Bartholo_Exit_Condition()
{
	return 1;
};

func void DIA_Bartholo_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Bartholo_HAllo(C_Info)
{
	npc = EBR_106_Bartholo;
	nr = 4;
	condition = Info_Bartholo_HAllo_Condition;
	information = Info_Bartholo_HAllo_Info;
	permanent = 0;
	description = "Wer bist du?";
};


func int Info_Bartholo_HAllo_Condition()
{
	return 1;
};

func void Info_Bartholo_HAllo_Info()
{
	AI_Output(other,self,"Info_Bartholo_HAllo_15_00");	//Wer bist du?
	AI_Output(self,other,"Info_Bartholo_HAllo_12_01");	//Ich bin Bartholo. Ich k�mmere mich um die Versorgung der Erzbarone.
	AI_Output(self,other,"Info_Bartholo_HAllo_12_02");	//Ich regele alles - von Krautlieferungen, �ber Essen bis hin zur Versorgung der Frauen.
	AI_Output(self,other,"Info_Bartholo_HAllo_12_03");	//Au�erdem sorge ich daf�r, dass die beiden idiotischen K�che ihre Arbeit gut machen.
	AI_Output(self,other,"Info_Bartholo_HAllo_12_04");	//Sie sollten mir daf�r dankbar sein. Gomez l�sst sich nicht jeden Fra� gefallen. Die letzten beiden hat er an die Snapper im Fluss verf�ttert.
};


var int bartholo_trade;

instance Info_Bartholo_PERM(C_Info)
{
	npc = EBR_106_Bartholo;
	nr = 4;
	condition = Info_Bartholo_PERM_Condition;
	information = Info_Bartholo_PERM_Info;
	permanent = 1;
	description = "Ich will mit dir handeln.";
	trade = 1;
};


func int Info_Bartholo_PERM_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Bartholo_HAllo))
	{
		return 1;
	};
};

func void Info_Bartholo_PERM_Info()
{
	AI_Output(other,self,"Info_Bartholo_PERM_15_00");	//Ich will mit dir handeln.
	AI_Output(self,other,"Info_Bartholo_PERM_12_01");	//Ich habe einiges da - wenn du genug Erz hast.
	if(BARTHOLO_TRADE == FALSE)
	{
		Log_CreateTopic(GE_TraderOC,LOG_NOTE);
		B_LogEntry(GE_TraderOC,"Bartholo, einer der Erzbarone des Alten Lagers handelt mit verschiedenen Waren des Alten Lagers.");
		BARTHOLO_TRADE = TRUE;
	};
};


instance Info_Bartholo_Krautbote(C_Info)
{
	npc = EBR_106_Bartholo;
	nr = 4;
	condition = Info_Bartholo_Krautbote_Condition;
	information = Info_Bartholo_Krautbote_Info;
	permanent = 1;
	description = "Ich habe ne Ladung Kraut von Cor Kalom f�r Gomez.";
};


func int Info_Bartholo_Krautbote_Condition()
{
	if(Kalom_Krautbote == LOG_RUNNING)
	{
		return 1;
	};
};

func void Info_Bartholo_Krautbote_Info()
{
	AI_Output(other,self,"Info_Bartholo_Krautbote_15_00");	//Ich habe 'ne Ladung Kraut von Cor Kalom f�r Gomez.
	AI_Output(self,other,"Info_Bartholo_Krautbote_12_01");	//Zeig her!
	if(Npc_HasItems(other,ItMiJoint_3) >= 30)
	{
		AI_Output(self,other,"Info_Bartholo_Krautbote_12_02");	//Hmmmmmmm ...
		AI_Output(self,other,"Info_Bartholo_Krautbote_12_03");	//Gut! Gomez ist beinahe ungeduldig geworden. Sei froh, dass du es heute noch abgeliefert hast!
		AI_Output(other,self,"Info_Bartholo_Krautbote_15_04");	//Was ist mit der Bezahlung?
		AI_Output(self,other,"Info_Bartholo_Krautbote_12_05");	//Nicht so eilig ... Hier, nimm. 500 Erz waren abgemacht.
		B_GiveInvItems(other,self,ItMiJoint_3,30);
		CreateInvItems(self,ItMiNugget,500);
		B_GiveInvItems(self,other,ItMiNugget,500);
		Kalom_DeliveredWeed = TRUE;
		B_LogEntry(CH1_KrautBote,"Bartholo hat mir 500 Erz f�r die Krautlieferung gegeben.");
		B_GiveXP(XP_WeedShipmentDelivered);
		Info_Bartholo_Krautbote.permanent = 0;
	}
	else
	{
		AI_Output(self,other,"Info_Bartholo_Krautbote_NoKraut_12_00");	//Du hast zu wenig Kraut f�r einen Boten! Ich will f�r dich nicht hoffen, dass du das Zeug verscherbelt hast! Komm wieder, wenn du die richtige Menge dabei hast!
	};
};


instance DIA_EBR_106_Bartholo_Wait4SC(C_Info)
{
	npc = EBR_106_Bartholo;
	condition = DIA_EBR_106_Bartholo_Wait4SC_Condition;
	information = DIA_EBR_106_Bartholo_Wait4SC_Info;
	important = 1;
	permanent = 0;
};


func int DIA_EBR_106_Bartholo_Wait4SC_Condition()
{
	if(ExploreSunkenTower == TRUE)
	{
		return TRUE;
	};
};

func void DIA_EBR_106_Bartholo_Wait4SC_Info()
{
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoNpc(self,other);
	AI_Output(self,other,"Info_Bartholo_12_01");	//Ich hatte mir fast gedacht, dass es jemand durch das Pentagramm versuchen w�rde!
	AI_Output(self,other,"Info_Bartholo_12_02");	//Aber im Gegensatz zu diesem verr�terischen Schmied Stone brauchen wir dich nicht mehr!
	AI_Output(other,self,"Info_Bartholo_15_03");	//Wo ist Stone?
	AI_Output(self,other,"Info_Bartholo_12_04");	//Hinter Gittern! Aber daf�r wirst du gleich unter der Erde liegen!
	AI_Output(self,other,"Info_Bartholo_12_05");	//Schnappt ihn euch, Jungs, und macht ihn kalt!
	CreateInvItem(self,ItKe_Storage_01);
	AI_StopProcessInfos(self);
	self.guild = GIL_EBR;
	Npc_SetTrueGuild(self,GIL_EBR);
};


instance DIA_BARTHOLO_SCBARON(C_Info)
{
	npc = EBR_106_Bartholo;
	nr = 3;
	condition = dia_bartholo_scbaron_condition;
	information = dia_bartholo_scbaron_info;
	permanent = 0;
	important = 1;
};


func int dia_bartholo_scbaron_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_EBR)
	{
		return 1;
	};
};

func void dia_bartholo_scbaron_info()
{
	AI_Output(self,other,"DIA_Bartholo_SCBARON_15_00");	//Du bist der Neue bei Gomez' Leibgarde?
	AI_Output(self,other,"DIA_Bartholo_SCBARON_15_01");	//Du wirst deine Entscheidung nicht bereuen.
	AI_StopProcessInfos(self);
};

