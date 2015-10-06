
instance TPL_5065_GORNAVID_EXIT(C_Info)
{
	npc = tpl_5065_gornavid;
	nr = 999;
	condition = tpl_5065_gornavid_exit_condition;
	information = tpl_5065_gornavid_exit_info;
	important = 0;
	permanent = 1;
	description = "ENDE";
};


func int tpl_5065_gornavid_exit_condition()
{
	return TRUE;
};

func void tpl_5065_gornavid_exit_info()
{
	AI_StopProcessInfos(self);
};


instance TPL_5065_GORNAVID_GETLOST(C_Info)
{
	npc = tpl_5065_gornavid;
	nr = 1;
	condition = tpl_5065_gornavid_getlost_condition;
	information = tpl_5065_gornavid_getlost_info;
	permanent = 1;
	important = 0;
	description = "Was machst du denn hier?";
};


func int tpl_5065_gornavid_getlost_condition()
{
	return TRUE;
};

func void tpl_5065_gornavid_getlost_info()
{
	AI_Output(other,self,"DIA_TPL_5065_GorNaVid_15_00");	//Was machst du denn hier?
	AI_Output(self,other,"DIA_TPL_5065_GorNaVid_13_01");	//Stör mich nicht, ich muss meine Aufgabe erfüllen.
	AI_Output(self,other,"DIA_TPL_5065_GorNaVid_13_02");	//Ach du bist es! Der Mann der uns die Eier der Minecrawler-Königin gebracht hat.
	AI_Output(self,other,"DIA_TPL_5065_GorNaVid_13_03");	//Nachdem du die Eier ins Lager gebracht hast, machten wir uns auf zurück ins Sumpflager.
	AI_Output(self,other,"DIA_TPL_5065_GorNaVid_13_04");	//Wir waren ja dort um Sekret zu sammeln. Da du diese Aufgabe erledigt hast, brauchten wir nicht mehr dableiben.
	AI_Output(self,other,"DIA_TPL_5065_GorNaVid_13_05");	//Also sind wir jetzt wieder zurück im Lager und übernehmen die Aufgaben die wir schon hatten, bevor wir in die Mine geschickt wurden.
	AI_Output(self,other,"DIA_TPL_5065_GorNaVid_13_06");	//Sieh dich mal um. Gor Na Bar und Gor Na Kosh sind auch irgendwo im Lager.
	AI_StopProcessInfos(self);
};

