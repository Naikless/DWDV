
instance DIA_PAUL_EXIT(C_Info)
{
	npc = non_5054_paul;
	nr = 999;
	condition = dia_paul_exit_condition;
	information = dia_paul_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_paul_exit_condition()
{
	return 1;
};

func void dia_paul_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAUL_WHO(C_Info)
{
	npc = non_5054_paul;
	nr = 1;
	condition = dia_paul_who_condition;
	information = dia_paul_who_info;
	permanent = 0;
	important = 0;
	description = "Wie sieht's aus?";
};


func int dia_paul_who_condition()
{
	if(PAUL_OC == LOG_RUNNING)
	{
		return 1;
	};
};

func void dia_paul_who_info()
{
	AI_Output(other,self,"DIA_PAUL_WHO_15_00");	//Wie sieht's aus?
	AI_Output(self,other,"DIA_PAUL_WHO_02_01");	//Was willst du von mir? Willst du mir auch eine auf's Maul hauen?
};


instance DIA_PAUL_OC(C_Info)
{
	npc = non_5054_paul;
	nr = 1;
	condition = dia_paul_oc_condition;
	information = dia_paul_oc_info;
	permanent = 0;
	important = 0;
	description = "Ich bin hier um dir einen Vorschlag zu machen.";
};


func int dia_paul_oc_condition()
{
	if((PAUL_OC == LOG_RUNNING) && Npc_KnowsInfo(hero,dia_paul_who))
	{
		return 1;
	};
};

func void dia_paul_oc_info()
{
	AI_Output(other,self,"DIA_PAUL_OC_15_00");	//Ich bin hier um dir einen Vorschlag zu machen.
	AI_Output(self,other,"DIA_PAUL_OC_02_01");	//Was für einen Vorschlag?
	AI_Output(other,self,"DIA_PAUL_OC_02_02");	//Eine Chance dich dem alten Lager anzuschliessen.
	AI_Output(self,other,"DIA_PAUL_OC_02_03");	//Ach du gehörst auch dazu? Der letzte von euch hat mir ganz schön auf's Maul gehauen.
	AI_Output(self,other,"DIA_PAUL_OC_02_04");	//Warum sollte ich mich da euch anschliessen?
	Info_ClearChoices(dia_paul_oc);
	Info_AddChoice(dia_paul_oc,"Weil du im alten Lager viele Chancen haben wirst.",dia_paul_oc_chances);
	Info_AddChoice(dia_paul_oc,"Ein Leben im alten Lager ist ein freies Leben.",dia_paul_oc_free);
	Info_AddChoice(dia_paul_oc,"Wenn nicht bekommst du aufs Maul, Paul.",dia_paul_oc_maul);
};

func void dia_paul_oc_chances()
{
	AI_Output(other,self,"DIA_PAUL_OC_CHANCES_Info_15_01");	//Weil du im alten Lager viele Chancen haben wirst.
	AI_Output(self,other,"DIA_PAUL_OC_CHANCES_Info_14_02");	//So? Was für Chancen werde ich denn haben können?
	Info_ClearChoices(dia_paul_oc);
	Info_AddChoice(dia_paul_oc,"Du kannst dich bis nach ganz oben hocharbeiten.",dia_paul_oc_workhard);
	Info_AddChoice(dia_paul_oc,"Du kannst in den Minen eine Menge Erz verdienen.",dia_paul_oc_earnore);
};

func void dia_paul_oc_free()
{
	AI_Output(other,self,"DIA_PAUL_OC_FREE_Info_15_01");	//Ein Leben im alten Lager ist ein freies Leben.
	AI_Output(self,other,"DIA_PAUL_OC_FREE_Info_14_02");	//Das glaube ich nicht. In einem Lager in dem ich zur Begrüßung die Fresse poliert bekomme kann kein freies Leben bieten.
	AI_Output(self,other,"DIA_PAUL_OC_FREE_Info_14_03");	//Versuch' jemand anderen zu verarschen. Ich werde mich nie dem alten Lager anschliessen.
	PAUL_OC = LOG_FAILED;
	Log_SetTopicStatus(CH1_PAULOC,LOG_FAILED);
	B_LogEntry(CH1_PAULOC,"Ich konnte Paul nicht davon überzeugen, dass es das beste ist ich dem alten Lager anzuschliessen. Das wird Cutter nicht gefallen.");
	Info_ClearChoices(dia_paul_oc);
	AI_StopProcessInfos(self);
};

func void dia_paul_oc_maul()
{
	AI_Output(other,self,"DIA_PAUL_OC_MAUL_Info_15_01");	//Wenn nicht bekommst du aufs Maul, Paul.
	AI_Output(self,other,"DIA_PAUL_OC_MAUL_Info_14_02");	//Ich wusste doch, dass du genau so ein Penner wie der letzte Kerl bist.
	AI_Output(self,other,"DIA_PAUL_OC_MAUL_Info_14_03");	//Ich hau' ab!
	PAUL_OC = LOG_FAILED;
	Log_SetTopicStatus(CH1_PAULOC,LOG_FAILED);
	B_LogEntry(CH1_PAULOC,"Ich konnte Paul nicht davon überzeugen, dass es das beste ist ich dem alten Lager anzuschliessen. Das wird Cutter nicht gefallen.");
	Info_ClearChoices(dia_paul_oc);
	AI_StopProcessInfos(self);
};

func void dia_paul_oc_workhard()
{
	AI_Output(other,self,"DIA_PAUL_OC_WORKHARD_Info_15_01");	//Du kannst dich bis nach ganz oben hocharbeiten.
	AI_Output(self,other,"DIA_PAUL_OC_WORKHARD_Info_14_02");	//Hast du das auch gemacht?
	AI_Output(other,self,"DIA_PAUL_OC_WORKHARD_Info_14_03");	//Ganz genau.
	AI_Output(self,other,"DIA_PAUL_OC_WORKHARD_Info_14_04");	//Scheint dir ja nicht gerade schlecht zu gehen.
	AI_Output(self,other,"DIA_PAUL_OC_WORKHARD_Info_14_05");	//Ich glaube ich werde mich mal auf den Weg machen und mir das Lager ansehen.
	AI_Output(self,other,"DIA_PAUL_OC_WORKHARD_Info_14_06");	//Danke für die Hilfe!
	PAUL_OC = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_PAULOC,LOG_SUCCESS);
	B_LogEntry(CH1_PAULOC,"Ich konnte Paul davon überzeugen, dass es am besten ist sich dem alten Lager anzuschliessen. Damit habe ich meine Aufgabe erfüllt und Cutter wird zufrieden sein.");
	B_GiveXP(XP_PAUL);
	Info_ClearChoices(dia_paul_oc);
	Npc_ExchangeRoutine(self,"OLDCAMP");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"OLDCAMP");
};

func void dia_paul_oc_earnore()
{
	AI_Output(other,self,"DIA_PAUL_OC_EARNORE_Info_15_01");	//Du kannst in den Minen eine Menge Erz verdienen.
	AI_Output(self,other,"DIA_PAUL_OC_EARNORE_Info_14_02");	//Ich soll freiwillig in den Minen schuften?
	AI_Output(self,other,"DIA_PAUL_OC_EARNORE_Info_14_03");	//Nein, ich such' mir lieber ein anderes Lager statt mich für die Erzbarone abzurackern.
	PAUL_OC = LOG_FAILED;
	Log_SetTopicStatus(CH1_PAULOC,LOG_FAILED);
	B_LogEntry(CH1_PAULOC,"Ich konnte Paul nicht davon überzeugen, dass es das beste ist ich dem alten Lager anzuschliessen. Das wird Cutter nicht gefallen.");
	Info_ClearChoices(dia_paul_oc);
	AI_StopProcessInfos(self);
};


instance DIA_PAUL_NOW(C_Info)
{
	npc = non_5054_paul;
	nr = 1;
	condition = dia_paul_now_condition;
	information = dia_paul_now_info;
	permanent = 1;
	important = 0;
	description = "Wie steht's?";
};


func int dia_paul_now_condition()
{
	if(Npc_KnowsInfo(hero,dia_cutter_success))
	{
		return 1;
	};
};

func void dia_paul_now_info()
{
	AI_Output(other,self,"DIA_PAUL_NOW_15_00");	//Wie steht's?
	AI_Output(self,other,"DIA_PAUL_NOW_02_01");	//Gut. Das Alte Lager ist kein schlechter Ort zum Leben.
	AI_Output(self,other,"DIA_PAUL_NOW_02_02");	//Zumindest besser, als wenn ich draußen durch die Wildnis ziehen würde.
	AI_Output(self,other,"DIA_PAUL_NOW_02_03");	//Ich werd' jetzt vorerst bei Huno arbeiten. Er hat mir versprochen mich als Lehrling zu nehmen und mir das Schmieden beizubringen.
};

