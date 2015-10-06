
instance ORG_889_COERPRESSER_EXIT(C_Info)
{
	npc = ORG_889_CoErpresser;
	nr = 999;
	condition = org_889_coerpresser_exit_condition;
	information = org_889_coerpresser_exit_info;
	important = 0;
	permanent = 1;
	description = "ENDE";
};


func int org_889_coerpresser_exit_condition()
{
	return TRUE;
};

func void org_889_coerpresser_exit_info()
{
	AI_StopProcessInfos(self);
};


instance ORG_889_COERPRESSER_GETLOST(C_Info)
{
	npc = ORG_889_CoErpresser;
	nr = 1;
	condition = org_889_coerpresser_getlost_condition;
	information = org_889_coerpresser_getlost_info;
	permanent = 1;
	important = 0;
	description = "Wie sieht's aus?";
};


func int org_889_coerpresser_getlost_condition()
{
	return TRUE;
};

func void org_889_coerpresser_getlost_info()
{
	AI_Output(other,self,"DIA_Shrike_Hello_15_00");	//Wie sieht's aus?
	AI_Output(self,other,"Org_861_Killian_GetLost_Info_13_00");	//Verpi� dich!
	AI_StopProcessInfos(self);
};

