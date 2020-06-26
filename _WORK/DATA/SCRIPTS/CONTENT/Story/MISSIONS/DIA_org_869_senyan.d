
instance DIA_SENYAN1_EXIT(C_Info)
{
	npc = org_869_senyan;
	nr = 999;
	condition = dia_senyan1_exit_condition;
	information = dia_senyan1_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_senyan1_exit_condition()
{
	return 1;
};

func void dia_senyan1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SENYAN1_HELLO(C_Info)
{
	npc = org_869_senyan;
	nr = 1;
	condition = dia_senyan1_hello_condition;
	information = dia_senyan1_hello_info;
	permanent = 0;
	important = 1;
};


func int dia_senyan1_hello_condition()
{
	return 1;
};

func void dia_senyan1_hello_info()
{
	AI_Output(self,other,"DIA_Senyan1_Hello_15_00");	//Hey du! Wer bist du und weshalb hab' ich dich noch nie gesehen?
	AI_Output(other,self,"DIA_Senyan1_Hello_15_01");	//Das ist kein Wunder, ich bin neu hier.
	AI_Output(self,other,"DIA_Senyan1_Hello_15_02");	//Ach so ist das. Dann solltest du aufpassen, wo du dich hier rumtreibst.
	AI_Output(self,other,"DIA_Senyan1_Hello_15_03");	//Es gibt Leute die haben etwas gegen neugierige Neue, die ihre Nasen überall reinstecken.
	AI_Output(self,other,"DIA_Senyan1_Hello_15_04");	//Also pass auf was du hier tust!
	AI_StopProcessInfos(self);
};


instance DIA_SENYAN_ORT(C_Info)
{
	npc = org_869_senyan;
	nr = 1;
	condition = dia_senyan_ort_condition;
	information = dia_senyan_ort_info;
	permanent = 1;
	important = 0;
	description = "Was ist das für ein Ort?";
};


func int dia_senyan_ort_condition()
{
	return 1;
};

func void dia_senyan_ort_info()
{
	AI_Output(other,self,"DIA_Senyan_Ort_15_00");	//Was ist das für ein Ort?
	AI_Output(self,other,"DIA_Senyan_Ort_15_01");	//Das hier ist der einzige Ort, an dem du in dieser gottverdammten Kolonie wirklich frei bist.
	AI_Output(self,other,"DIA_Senyan_Ort_15_02");	//Wir der unabhängigste Ort den du hier finden kannst. Es hier gibt es keine Templer, keine Söldner und keine Gardisten.
	AI_Output(self,other,"DIA_Senyan_Ort_15_03");	//Was wir zum leben brauchen, rauben wir uns entweder von den Konvoi's von Gomez Leuten oder holen wir uns auf der Jagd.
	AI_Output(self,other,"DIA_Senyan_Ort_15_04");	//Du siehst, wir leben fernab von sämtlichen Lagern und kommen trotzdem sehr gut selbst zurecht.
};


var int senyan_esteban;

instance DIA_SENYAN_ESTEBAN(C_Info)
{
	npc = org_869_senyan;
	nr = 1;
	condition = dia_senyan_esteban_condition;
	information = dia_senyan_esteban_info;
	permanent = 0;
	important = 0;
	description = "Was hälst du von Esteban?";
};


func int dia_senyan_esteban_condition()
{
	if(ESTEBAN_LEADER == LOG_RUNNING)
	{
		return 1;
	};
};

func void dia_senyan_esteban_info()
{
	AI_Output(other,self,"DIA_Senyan_Esteban_15_00");	//Was hälst du von Esteban?
	AI_Output(self,other,"DIA_Senyan_Esteban_15_01");	//Das kann ich dir sagen.
	AI_Output(self,other,"DIA_Senyan_Esteban_15_02");	//Esteban ist der Einzige der den Laden schmeissen könnte.
	AI_Output(self,other,"DIA_Senyan_Esteban_15_03");	//Klar, noch ist Quentin der Anführer, aber nicht mehr lange, dass kann ich dir sagen.
	B_LogEntry(CH1_ESTEBANQUENTIN,"Senyan glaubt das Esteban der Einzige ist, der das Lager führen kann. Er glaubt das Quentin nicht mehr lange an der Spitze bleibt.");
	SENYAN_ESTEBAN = TRUE;
};

