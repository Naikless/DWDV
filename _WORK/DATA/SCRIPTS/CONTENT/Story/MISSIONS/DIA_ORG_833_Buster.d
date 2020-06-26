
instance DIA_ORG_833_Buster(C_Info)
{
	npc = ORG_833_Buster;
	condition = DIA_ORG_833_Buster_Condition;
	information = DIA_ORG_833_Buster_Info;
	important = 1;
	permanent = 0;
};


func int DIA_ORG_833_Buster_Condition()
{
	if(Npc_GetTalentSkill(hero,NPC_TALENT_ACROBAT) == 0)
	{
		return TRUE;
	};
};

func void DIA_ORG_833_Buster_Info()
{
	AI_Output(self,other,"DIA_ORG_833_Buster_02_01");	//Du siehst ganz schön ungelenkig aus, ich könnte dir helfen.
};


instance DIA_ORG_833_Buster_Exit(C_Info)
{
	npc = ORG_833_Buster;
	nr = 999;
	condition = DIA_ORG_833_Buster_Exit_Condition;
	information = DIA_ORG_833_Buster_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_ORG_833_Buster_Exit_Condition()
{
	return 1;
};

func void DIA_ORG_833_Buster_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ORG_833_Buster3(C_Info)
{
	npc = ORG_833_Buster;
	condition = DIA_ORG_833_Buster3_Condition;
	information = DIA_ORG_833_Buster3_Info;
	important = 0;
	permanent = 0;
	description = "Und wie?";
};


func int DIA_ORG_833_Buster3_Condition()
{
	return 1;
};

func void DIA_ORG_833_Buster3_Info()
{
	AI_Output(other,self,"DIA_Grim_Falle_15_03");	//Und wie?
	AI_Output(self,other,"DIA_ORG_833_Buster3_02_01");	//Ich kann dir die hohe Kunst der Körperbeherrschung zeigen. AKROBATIK.
	Log_CreateTopic(GE_TeacherNC,LOG_NOTE);
	B_LogEntry(GE_TeacherNC,"Buster der Bandit unterrichtet das Talent AKROBATIK.");
};


var int buster_learned;

instance DIA_ORG_833_BUSTER_FIX(C_Info)
{
	npc = ORG_833_Buster;
	condition = dia_org_833_buster_fix_condition;
	information = dia_org_833_buster_fix_info;
	important = 0;
	permanent = 1;
	description = "Akrobatik Lernen (10 Lernpunkte)";
};


func int dia_org_833_buster_fix_condition()
{
	if(Npc_KnowsInfo(hero,DIA_ORG_833_Buster3) && (BUSTER_LEARNED == FALSE))
	{
		return 1;
	};
};

func void dia_org_833_buster_fix_info()
{
	if(B_GiveSkill(other,NPC_TALENT_ACROBAT,1,LPCOST_TALENT_ACROBAT))
	{
		AI_Output(other,self,"ORG_801_Lares_Teach_15_00");	//Ich will mich verbessern.
		AI_Output(self,other,"DIA_ORG_833_Buster3_02_02");	//Wenn du deinen Körper beherrscht, bist du in der Lage viel weiter zu springen. 
		AI_Output(self,other,"DIA_ORG_833_Buster3_02_03");	//Du lernst dich richtig abzurollen und aus dem Fall heraus richtig zu landen. Aber denk daran, du bist nicht unsterblich!
		AI_Output(self,other,"DIA_ORG_833_Buster3_02_04");	//Auch im Kampf ist Akrobatik sehr hilfreich. Du kannst deinen Abstand zum Gegner sehr schnell verändern. Viel Glück!
		BUSTER_LEARNED = TRUE;
	};
};

