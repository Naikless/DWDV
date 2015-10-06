
instance DIA_SKINNER_EXIT(C_Info)
{
	npc = org_863_skinner;
	nr = 999;
	condition = dia_skinner_exit_condition;
	information = dia_skinner_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_skinner_exit_condition()
{
	return 1;
};

func void dia_skinner_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SKINNER_HELLO(C_Info)
{
	npc = org_863_skinner;
	nr = 1;
	condition = dia_skinner_hello_condition;
	information = dia_skinner_hello_info;
	permanent = 0;
	important = 1;
};


func int dia_skinner_hello_condition()
{
	return 1;
};

func void dia_skinner_hello_info()
{
	AI_Output(self,other,"DIA_Skinner_Hello_15_00");	//Warum weckst du mich?
	AI_Output(self,other,"DIA_Skinner_Hello_15_01");	//Du h�ttest mich schlafen lassen sollen.
	AI_Output(self,other,"DIA_Skinner_Hello_15_02");	//Ich f�rchte aber, zum bereuen ist es jetzt zusp�t, da ich dich jetzt umbringen werde.
	AI_StopProcessInfos(self);
	Npc_SetAttitude(self,ATT_HOSTILE);
	Npc_SetTempAttitude(self,ATT_HOSTILE);
};

