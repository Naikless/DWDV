
instance TPL_5067_GORNAKOSH_EXIT(C_Info)
{
	npc = tpl_5067_gornakosh;
	nr = 999;
	condition = tpl_5067_gornakosh_exit_condition;
	information = tpl_5067_gornakosh_exit_info;
	important = 0;
	permanent = 1;
	description = "ENDE";
};


func int tpl_5067_gornakosh_exit_condition()
{
	return TRUE;
};

func void tpl_5067_gornakosh_exit_info()
{
	AI_StopProcessInfos(self);
};


instance TPL_5067_GORNAKOSH_GETLOST(C_Info)
{
	npc = tpl_5067_gornakosh;
	nr = 1;
	condition = tpl_5067_gornakosh_getlost_condition;
	information = tpl_5067_gornakosh_getlost_info;
	permanent = 1;
	important = 0;
	description = "Was machst du denn hier?";
};


func int tpl_5067_gornakosh_getlost_condition()
{
	return TRUE;
};

func void tpl_5067_gornakosh_getlost_info()
{
	AI_Output(other,self,"DIA_TPL_5067_GorNaKosh_15_00");	//Was machst du denn hier?
	AI_Output(self,other,"DIA_TPL_5067_GorNaKosh_13_01");	//Kennen wir uns nicht? Aus der Alten Mine?
	AI_Output(other,self,"DIA_TPL_5067_GorNaKosh_13_02");	//Kann schon sein.
	AI_Output(self,other,"DIA_TPL_5067_GorNaKosh_13_03");	//Nachdem wir unsere Aufgabe in der alten Mine beendet hatten, kehrten Gor Na Bar, Gor Na Vid und ich zurück ins Lager.
	AI_Output(self,other,"DIA_TPL_5067_GorNaKosh_13_04");	//Seitdem sind wir hier und wachen über das Lager, wie wir es schon taten, bevor wir in die Alte Mine geschickt wurden.
	AI_Output(self,other,"DIA_TPL_5067_GorNaKosh_13_05");	//Die anderen sind hier auch irgendwo. Sieh' dich mal um.
	AI_StopProcessInfos(self);
};

