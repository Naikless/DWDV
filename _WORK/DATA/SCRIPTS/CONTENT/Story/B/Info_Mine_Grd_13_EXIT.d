
instance Info_Mine_Grd_13_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Mine_Grd_13_EXIT_Condition;
	information = Info_Mine_Grd_13_EXIT_Info;
	permanent = 1;
	description = "ENDE";
};


func int Info_Mine_Grd_13_EXIT_Condition()
{
	return 1;
};

func void Info_Mine_Grd_13_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Mine_Grd_13_Mine(C_Info)
{
	nr = 1;
	condition = Info_Mine_Grd_13_Mine_Condition;
	information = Info_Mine_Grd_13_Mine_Info;
	permanent = 1;
	description = "Was l�uft in der Mine?";
};


func int Info_Mine_Grd_13_Mine_Condition()
{
	if(Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Mine_Grd_13_Mine_Info()
{
	AI_Output(other,self,"Info_Mine_Grd_13_Mine_15_00");	//Was l�uft in der Mine?
	AI_Output(self,other,"Info_Mine_Grd_13_Mine_13_01");	//Die Mine ist das Herz des Alten Lagers. Ohne Mine kein Erz, ohne Erz keine Waren. Alles klar?
};


instance Info_Mine_Grd_13_WichtigePersonen(C_Info)
{
	nr = 1;
	condition = Info_Mine_Grd_13_WichtigePersonen_Condition;
	information = Info_Mine_Grd_13_WichtigePersonen_Info;
	permanent = 1;
	description = "Wer hat hier das Sagen?";
};


func int Info_Mine_Grd_13_WichtigePersonen_Condition()
{
	if(Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Mine_Grd_13_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Mine_Grd_13_WichtigePersonen_15_00");	//Wer hat hier das Sagen?
	AI_Output(self,other,"Info_Mine_Grd_13_WichtigePersonen_13_01");	//Asghan ist unser Chef. Aber lass ihn blo� in Ruhe. F�r Typen wie dich ist Ian zust�ndig.
};


instance Info_Mine_Grd_13_DasLager(C_Info)
{
	nr = 1;
	condition = Info_Mine_Grd_13_DasLager_Condition;
	information = Info_Mine_Grd_13_DasLager_Info;
	permanent = 1;
	description = "Erz�hl mir was �ber die Crawler";
};


func int Info_Mine_Grd_13_DasLager_Condition()
{
	if(Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Mine_Grd_13_DasLager_Info()
{
	AI_Output(other,self,"Info_Mine_Grd_13_DasLager_15_00");	//Erz�hl mir was �ber die Crawler.
	AI_Output(self,other,"Info_Mine_Grd_13_DasLager_13_01");	//Die Bruderschaft bezahlt das Alte Lager mit Sumpfkraut, damit sie hier in der Mine die Crawler jagen d�rfen.
};


instance Info_Mine_Grd_13_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Mine_Grd_13_DieLage_Condition;
	information = Info_Mine_Grd_13_DieLage_Info;
	permanent = 1;
	description = "Wie l�uft's?";
};


func int Info_Mine_Grd_13_DieLage_Condition()
{
	if(Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Mine_Grd_13_DieLage_Info()
{
	AI_Output(other,self,"Info_Mine_Grd_13_DieLage_15_00");	//Wie l�uft's?
	AI_Output(self,other,"Info_Mine_Grd_13_DieLage_13_01");	//Hab schon lange keinen Kampf mehr gehabt!
};

func void B_AssignAmbientInfos_Mine_grd_13(var C_Npc slf)
{
	Info_Mine_Grd_13_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Grd_13_Mine.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Grd_13_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Grd_13_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Grd_13_DieLage.npc = Hlp_GetInstanceID(slf);
};

