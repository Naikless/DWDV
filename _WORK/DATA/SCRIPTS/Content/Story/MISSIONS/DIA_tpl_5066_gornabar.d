
instance TPL_5066_GORNABAR_EXIT(C_Info)
{
	npc = tpl_5066_gornabar;
	nr = 999;
	condition = tpl_5066_gornabar_exit_condition;
	information = tpl_5066_gornabar_exit_info;
	important = 0;
	permanent = 1;
	description = "ENDE";
};


func int tpl_5066_gornabar_exit_condition()
{
	return TRUE;
};

func void tpl_5066_gornabar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance TPL_5066_GORNABAR_GETLOST(C_Info)
{
	npc = tpl_5066_gornabar;
	nr = 1;
	condition = tpl_5066_gornabar_getlost_condition;
	information = tpl_5066_gornabar_getlost_info;
	permanent = 1;
	important = 0;
	description = "Du bist zurück im Lager?";
};


func int tpl_5066_gornabar_getlost_condition()
{
	return TRUE;
};

func void tpl_5066_gornabar_getlost_info()
{
	AI_Output(other,self,"DIA_TPL_5066_GorNaBar_15_00");	//Du bist zurück im Lager?
	AI_Output(self,other,"DIA_TPL_5066_GorNaBar_13_01");	//Ach, der Mann aus der Mine. Ja wir sind wieder ins Lager zurückgekehrt.
	AI_Output(self,other,"DIA_TPL_5066_GorNaBar_13_02");	//Nachdem du die Eier ins Lager gebracht hast, bin ich zusammen mit Gor Na Kosh und Gor Na Vid zurückgekehrt.
	AI_Output(self,other,"DIA_TPL_5066_GorNaBar_13_03");	//Ich habe wieder meinen alten Posten übernommen, den ich hatte bevor ich in die Mine geschickt wurde.
	AI_Output(self,other,"DIA_TPL_5066_GorNaBar_13_04");	//Trotz allem was passiert ist, hält die Bruderschaft weiterhin zusammen.
	AI_StopProcessInfos(self);
};

