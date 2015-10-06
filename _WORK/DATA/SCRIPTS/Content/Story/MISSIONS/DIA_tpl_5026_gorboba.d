
instance DIA_GORBOBA_EXIT(C_Info)
{
	npc = tpl_5026_gorboba;
	nr = 999;
	condition = dia_gorboba_exit_condition;
	information = dia_gorboba_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_gorboba_exit_condition()
{
	return 1;
};

func void dia_gorboba_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GORBOBA_HELLO(C_Info)
{
	npc = tpl_5026_gorboba;
	nr = 1;
	condition = dia_gorboba_hello_condition;
	information = dia_gorboba_hello_info;
	permanent = 1;
	description = "Was machst du hier?";
};


func int dia_gorboba_hello_condition()
{
	return 1;
};

func void dia_gorboba_hello_info()
{
	AI_Output(other,self,"DIA_GorBoba_Hello_15_00");	//Was machst du hier?
	AI_Output(self,other,"DIA_GorBoba_Hello_05_01");	//Ich wurde dazu auserwählt, dieses Tor zu bewachen. Das ist eine wichtige Aufgabe.
	AI_Output(self,other,"DIA_GorBoba_Hello_05_02");	//Ich passe auf, dass sich keins der Monster aus den Wäldern oder aus dem Sumpf dem Lager nähert.
	AI_Output(self,other,"DIA_GorBoba_Hello_05_03");	//Der Schläfer persönlich hat mich für diese ehrenvolle Aufgabe erwählt. Er gibt mir die Kraft, Tag und Nacht hier zu stehen.
	if(Npc_GetTrueGuild(hero) != GIL_GUR)
	{
		AI_Output(self,other,"DIA_GorBoba_Hello_05_04");	//Jetzt stör mich nicht weiter, ich muss die Augen offen halten.
	};
	AI_StopProcessInfos(self);
};

