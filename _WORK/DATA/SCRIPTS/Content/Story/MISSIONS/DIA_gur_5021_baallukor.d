
instance DIA_BAALLUKOR_EXIT(C_Info)
{
	npc = gur_5021_baallukor;
	nr = 999;
	condition = dia_baallukor_exit_condition;
	information = dia_baallukor_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_baallukor_exit_condition()
{
	return 1;
};

func void dia_baallukor_exit_info()
{
	AI_StopProcessInfos(self);
};


var int baallukor_sakrileg;

instance DIA_BAALLUKOR_NOTALK(C_Info)
{
	npc = gur_5021_baallukor;
	nr = 1;
	condition = dia_baallukor_notalk_condition;
	information = dia_baallukor_notalk_info;
	permanent = 1;
	important = 1;
};


func int dia_baallukor_notalk_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (BAALLUKOR_ANSPRECHBAR == FALSE) && (Npc_GetPermAttitude(self,other) != ATT_FRIENDLY))
	{
		return 1;
	};
};

func void dia_baallukor_notalk_info()
{
	Info_ClearChoices(dia_baallukor_notalk);
	Info_AddChoice(dia_baallukor_notalk,DIALOG_ENDE,dia_baallukor_notalk_ende);
	Info_AddChoice(dia_baallukor_notalk,"Alles, klar, Alter?",dia_baallukor_notalk_imp);
	Info_AddChoice(dia_baallukor_notalk,"Der Schläfer sei mit dir!",dia_baallukor_notalk_sleeper);
	Info_AddChoice(dia_baallukor_notalk,"Hi! Ich bin neu hier!",dia_baallukor_notalk_hi);
};

func void dia_baallukor_notalk_hi()
{
	AI_Output(other,self,"DIA_BaalNamib_NoTalk_Hi_15_00");	//Hi! Ich bin neu hier!
	AI_Output(self,other,"DIA_BaalNamib_NoTalk_Hi_02_01");	//
	BAALLUKOR_SAKRILEG = TRUE;
};

func void dia_baallukor_notalk_sleeper()
{
	AI_Output(other,self,"DIA_BaalNamib_NoTalk_Sleeper_15_00");	//Der Schläfer sei mit dir!
	AI_Output(self,other,"DIA_BaalNamib_NoTalk_Sleeper_02_01");	//
	BAALLUKOR_SAKRILEG = TRUE;
};

func void dia_baallukor_notalk_imp()
{
	AI_Output(other,self,"DIA_BaalNamib_NoTalk_Imp_15_00");	//Alles, klar, Alter?
	AI_Output(self,other,"DIA_BaalNamib_NoTalk_Imp_02_01");	//
	BAALLUKOR_SAKRILEG = TRUE;
};

func void dia_baallukor_notalk_ende()
{
	AI_StopProcessInfos(self);
};


instance DIA_BAALLUKOR_HYPNOTICTEACHER(C_Info)
{
	npc = gur_5021_baallukor;
	nr = 1;
	condition = dia_baallukor_hypnoticteacher_condition;
	information = dia_baallukor_hypnoticteacher_info;
	permanent = 0;
	important = 1;
};


func int dia_baallukor_hypnoticteacher_condition()
{
	if(BAALLUKOR_ANSPRECHBAR == TRUE)
	{
		return 1;
	};
};

func void dia_baallukor_hypnoticteacher_info()
{
	AI_Output(self,other,"Sit_1_PSI_BaalLukor_HypnoticTeacher_2FuncNo_02_01");	//Du solltest deinen Weg mit Bedacht wählen und nach reiflicher Überlegung. 
	AI_Output(self,other,"Sit_1_PSI_BaalLukor_HypnoticTeacher_2FuncNo_02_02");	//Bedenke wie du entscheidest. In den anderen Lagern bekommst zwar Schutz und Nahrung, aber ist es das, was du willst?
	AI_Output(other,self,"Sit_1_PSI_BaalLukor_HypnoticTeacher_2FuncNo_15_03");	//Was erwartet mich, was es wert wäre, zu euch zu kommen?
	AI_Output(self,other,"Sit_1_PSI_BaalLukor_HypnoticTeacher_2FuncNo_02_04");	//Ich könnte dir jetzt erzählen, das die Templer einen unbezwinglichen Willen haben,das die magische Macht der Gurus, die Vorstellungskraft von Feuer- und Wassermagiern bei weitem übersteigt.
	AI_Output(self,other,"Sit_1_PSI_BaalLukor_HypnoticTeacher_2FuncNo_02_05");	//Das unsere Nahrung auch satt macht. Aber das ist es nicht, was diese Gemeinschaft ausmacht.
	AI_Output(self,other,"Sit_1_PSI_BaalLukor_HypnoticTeacher_2FuncNo_02_06");	//Was dich hier erwartet, ist die Gabe. Du wirst einen Weg beschreiten, der dir sehr viel abverlangt.
	AI_Output(self,other,"Sit_1_PSI_BaalLukor_HypnoticTeacher_2FuncNo_02_07");	//Aber das was du erreichen wirst ist eine Größe, eine Macht die dir Erleuchtung schenkt. Eine Macht, die dich zur Freiheit führt.
	AI_Output(self,other,"Sit_1_PSI_BaalLukor_HypnoticTeacher_2FuncNo_02_08");	//Ist es nicht das, was du willst?... Freiheit?
	AI_Output(self,other,"Sit_1_PSI_BaalLukor_HypnoticTeacher_2FuncNo_02_09");	//Also solltest du nicht die Frage stellen, warum du her kommen solltest, die Frage ist viel mehr, warum solltest du nicht?
	Info_ClearChoices(dia_baallukor_hypnoticteacher);
	Info_AddChoice(dia_baallukor_hypnoticteacher,"Nichts sagen",dia_baallukor_hypnoticteacher_muteende);
	Info_AddChoice(dia_baallukor_hypnoticteacher,"Ja, ich will dem Schläfer folgen.",dia_baallukor_hypnoticteacher_where);
};

func void dia_baallukor_hypnoticteacher_where()
{
	AI_Output(other,self,"DIA_BaalLukor_HypnoticTeacher_Where_15_00");	//Ja, ich will dem Schläfer folgen.
	AI_Output(self,other,"DIA_BaalLukor_HypnoticTeacher_Where_12_01");	//Dann geh' zu Cor Kalom. Er wird aus dir einen wahren Diener des Schläfers machen.
	Info_ClearChoices(DIA_BaalOrun_FirstTalk);
	AI_StopProcessInfos(self);
	if(Npc_GetTrueGuild(hero) == GIL_None)
	{
		Log_CreateTopic(CH1_JoinPsi,LOG_MISSION);
		Log_SetTopicStatus(CH1_JoinPsi,LOG_RUNNING);
	};
	B_LogEntry(CH1_JoinPsi,"Baal Lukor will das aus mir ein wahrer Diener des Schläfers gemacht wird.");
	B_GiveXP(XP_ImpressBaalCadar);
};

func void dia_baallukor_hypnoticteacher_muteende()
{
	Info_ClearChoices(DIA_BaalOrun_FirstTalk);
	AI_StopProcessInfos(self);
	BaalOrun_Ansprechbar = FALSE;
};

