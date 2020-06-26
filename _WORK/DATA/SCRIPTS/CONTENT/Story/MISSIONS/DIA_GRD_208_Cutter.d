
instance DIA_Cutter_Exit(C_Info)
{
	npc = GRD_208_Cutter;
	nr = 999;
	condition = DIA_Cutter_Exit_Condition;
	information = DIA_Cutter_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Cutter_Exit_Condition()
{
	return 1;
};

func void DIA_Cutter_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Cutter_Hello(C_Info)
{
	npc = GRD_208_Cutter;
	nr = 1;
	condition = DIA_Cutter_Hello_Condition;
	information = DIA_Cutter_Hello_Info;
	permanent = 0;
	description = "Ihr habt ganz schön viel Platz hier in der Burg.";
};


func int DIA_Cutter_Hello_Condition()
{
	if(!C_NpcBelongsToOldCamp(other))
	{
		return 1;
	};
};

func void DIA_Cutter_Hello_Info()
{
	AI_Output(other,self,"DIA_Cutter_Hello_15_00");	//Ihr habt ganz schön viel Platz hier in der Burg.
	AI_Output(self,other,"DIA_Cutter_Hello_08_01");	//Ich habe dich hier noch nie gesehen. Wer bist du?
	AI_Output(other,self,"DIA_Cutter_Hello_15_02");	//Ich bin neu hier. Wollte mich mal ein bisschen umsehen.
};


instance DIA_Cutter_Burg(C_Info)
{
	npc = GRD_208_Cutter;
	nr = 1;
	condition = DIA_Cutter_Burg_Condition;
	information = DIA_Cutter_Burg_Info;
	permanent = 0;
	description = "Was kannst du mir über die Burg sagen?";
};


func int DIA_Cutter_Burg_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Cutter_Hello))
	{
		return 1;
	};
};

func void DIA_Cutter_Burg_Info()
{
	AI_Output(other,self,"DIA_Cutter_Burg_15_00");	//Was kannst du mir über die Burg sagen?
	AI_Output(self,other,"DIA_Cutter_Burg_08_01");	//Nach dem großen Aufstand haben sich Gomez und seine Jungs die Burg unter den Nagel gerissen.
	AI_Output(self,other,"DIA_Cutter_Burg_08_02");	//Ich hab' damals schnell gemerkt, dass es besser ist, sich ihm anzuschließen.
	AI_Output(self,other,"DIA_Cutter_Burg_08_03");	//Schon als wir damals noch alle im Kerker eingepfercht waren, und in den Minen schuften mussten hatte er unter den Gefangenen am meisten zu sagen.
	AI_Output(other,self,"DIA_Cutter_Burg_15_04");	//Es gibt Kerker unter der Burg?
	AI_Output(self,other,"DIA_Cutter_Burg_08_05");	//Ja, aber sie sind heute leer. Seit dem großen Aufstand will da niemand mehr rein.
};


instance DIA_Cutter_PERM(C_Info)
{
	npc = GRD_208_Cutter;
	nr = 1;
	condition = DIA_Cutter_PERM_Condition;
	information = DIA_Cutter_PERM_Info;
	permanent = 1;
	description = "Wie ist das Leben als Gardist?";
};


func int DIA_Cutter_PERM_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Cutter_Burg))
	{
		return 1;
	};
};

func void DIA_Cutter_PERM_Info()
{
	AI_Output(other,self,"DIA_Cutter_PERM_15_00");	//Wie ist das Leben als Gardist?
	AI_Output(self,other,"DIA_Cutter_PERM_08_01");	//Ruhig. Wir sind das größte und stärkste Lager in der Kolonie - mit uns legt sich keiner an.
	AI_Output(other,self,"DIA_Cutter_PERM_15_02");	//Verstehe.
};


instance GRD_208_Cutter_WELCOME(C_Info)
{
	npc = GRD_208_Cutter;
	condition = GRD_208_Cutter_WELCOME_Condition;
	information = GRD_208_Cutter_WELCOME_Info;
	important = 1;
	permanent = 0;
};


func int GRD_208_Cutter_WELCOME_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_GRD)
	{
		return TRUE;
	};
};

func void GRD_208_Cutter_WELCOME_Info()
{
	AI_Output(self,other,"GRD_208_Cutter_WELCOME_Info_08_01");	//Du hast die richtige Entscheidung getroffen. Das Leben als Gardist wird dir gefallen!
	AI_StopProcessInfos(self);
};


instance DIA_CUTTER_GUY(C_Info)
{
	npc = GRD_208_Cutter;
	nr = 1;
	condition = dia_cutter_guy_condition;
	information = dia_cutter_guy_info;
	permanent = 0;
	important = 1;
};


func int dia_cutter_guy_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_STT)
	{
		return 1;
	};
};

func void dia_cutter_guy_info()
{
	AI_Output(self,other,"DIA_Cutter_GUY_15_00");	//Hey du! Komm' doch mal hier rüber.
	AI_Output(other,self,"DIA_Cutter_GUY_08_01");	//Was willst du?
	AI_Output(self,other,"DIA_Cutter_GUY_15_02");	//Gomez hat dich also aufgenommen? Gute Arbeit.
	AI_Output(self,other,"DIA_Cutter_GUY_08_02");	//Wenn du schonmal hier vorbei kommst, kann ich dich auch direkt mit Arbeit versorgen.
	AI_Output(self,other,"DIA_Cutter_GUY_08_03");	//Die Lieferung aus der Außenwelt ist vor kurzem angekommen. Darunter auch ein neues Gesicht.
	AI_Output(self,other,"DIA_Cutter_GUY_08_04");	//Keine Sorge, Bullit und seine Jungs haben ihn schon getauft. Hehe.
	AI_Output(self,other,"DIA_Cutter_GUY_08_05");	//Scheinbar findet Typ aber nicht den Weg alleine hier her. Er ist zumindest noch nicht hier aufgetaucht.
	AI_Output(self,other,"DIA_Cutter_GUY_08_06");	//Geh' zum Austauschplatz und überzeuge den Jungen das es das beste ist, wenn er sich dem Alten Lager anschliesst.
	AI_Output(self,other,"DIA_Cutter_GUY_08_07");	//Wie du das anstellst ist deine Sache, sollte aber nicht allzu schwer sein, Bullit sagt der ist noch grün hinter den Ohren.
	AI_Output(self,other,"DIA_Cutter_GUY_08_08");	//Schick ihn anschliessend zu uns ins Lager, wir können noch einen Buddler gebrauchen der in den Minen arbeitet. Hehe.
	Wld_InsertNpc(non_5054_paul,"OC_1");
	PAUL_OC = LOG_RUNNING;
	Log_CreateTopic(CH1_PAULOC,LOG_MISSION);
	Log_SetTopicStatus(CH1_PAULOC,LOG_RUNNING);
	B_LogEntry(CH1_PAULOC,"Cutter, einer von Gomez' Gardisten, gab mir den Auftrag zum Austauschplatz zu gehen. Er erzählte mir, dass eine neue Lieferung aus der Außenwelt angekommen ist und darunter ein neues Gesicht sei. Allerdings ist derjenige noch nicht im alten Lager angekommen. Ich soll nun zum Austauschplatz gehen und nachsehen was da los ist.");
};


instance DIA_CUTTER_SUCCESS(C_Info)
{
	npc = GRD_208_Cutter;
	nr = 1;
	condition = dia_cutter_success_condition;
	information = dia_cutter_success_info;
	permanent = 0;
	important = 0;
	description = "Paul ist jetzt im Lager.";
};


func int dia_cutter_success_condition()
{
	if(PAUL_OC == LOG_SUCCESS)
	{
		return 1;
	};
};

func void dia_cutter_success_info()
{
	AI_Output(other,self,"DIA_Cutter_SUCCESS_15_00");	//Paul ist jetzt im Lager.
	AI_Output(self,other,"DIA_Cutter_SUCCESS_08_01");	//Der Neue? Gute Arbeit. Gomez wird erfreut darüber sein.
	AI_Output(self,other,"DIA_Cutter_SUCCESS_15_02");	//Hier hast du dir verdient.
	CreateInvItems(self,ItMiNugget,75);
	B_GiveInvItems(self,other,ItMiNugget,75);
	AI_StopProcessInfos(self);
};


instance DIA_CUTTER_FAIL(C_Info)
{
	npc = GRD_208_Cutter;
	nr = 1;
	condition = dia_cutter_fail_condition;
	information = dia_cutter_fail_info;
	permanent = 0;
	important = 0;
	description = "Paul wird nicht mehr ins Lager kommen.";
};


func int dia_cutter_fail_condition()
{
	if(PAUL_OC == LOG_FAILED)
	{
		return 1;
	};
};

func void dia_cutter_fail_info()
{
	AI_Output(other,self,"DIA_Cutter_FAIL_15_00");	//Paul wird nicht mehr ins Lager kommen.
	AI_Output(self,other,"DIA_Cutter_FAIL_08_01");	//Du Schwachkopf hast es vermasselt? Das gibt's doch nicht.
	AI_Output(self,other,"DIA_Cutter_FAIL_15_02");	//Sieh' bloß zu das du mir aus den Augen gehst.
	AI_StopProcessInfos(self);
};

