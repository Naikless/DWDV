
instance DIA_WEGELAGERER_EXIT(C_Info)
{
	npc = non_5053_wegelagerer;
	nr = 999;
	condition = dia_wegelagerer_exit_condition;
	information = dia_wegelagerer_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_wegelagerer_exit_condition()
{
	return 1;
};

func void dia_wegelagerer_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_WEGELAGERER_HELLO(C_Info)
{
	npc = non_5053_wegelagerer;
	nr = 1;
	condition = dia_wegelagerer_hello_condition;
	information = dia_wegelagerer_hello_info;
	permanent = 0;
	important = 1;
};


func int dia_wegelagerer_hello_condition()
{
	return 1;
};

func void dia_wegelagerer_hello_info()
{
	AI_Output(self,other,"DIA_Wegelagerer_Hello_15_00");	//Hey Kleiner, wo soll's denn hingehen?
	AI_Output(other,self,"DIA_Wegelagerer_Hello_12_01");	//Geht dich nicht's an.
	AI_Output(self,other,"DIA_Wegelagerer_Hello_12_02");	//Das hat der letzte Typ auch schon gesagt.
	AI_Output(self,other,"DIA_Wegelagerer_Hello_12_03");	//Aber wie du siehst, hab' ich das anders gesehen und deswegen ist er jetzt Futter für die Ratten.
	AI_Output(self,other,"DIA_Wegelagerer_Hello_12_04");	//Wird dir nicht anders ergehen, aber die Kolonie schreibt nunmal ihre eigenen Gesetze.
	AI_Output(self,other,"DIA_Wegelagerer_Hello_12_05");	//Werd' von deinem Erz einen auf dich mittrinken. Hehe.
	AI_StopProcessInfos(self);
	Npc_SetAttitude(self,ATT_HOSTILE);
	Npc_SetTempAttitude(self,ATT_HOSTILE);
};

