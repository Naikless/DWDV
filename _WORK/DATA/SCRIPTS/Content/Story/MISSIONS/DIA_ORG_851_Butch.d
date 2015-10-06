
instance DIA_Butch_Exit(C_Info)
{
	npc = ORG_851_Butch;
	nr = 999;
	condition = DIA_Butch_Exit_Condition;
	information = DIA_Butch_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Butch_Exit_Condition()
{
	return TRUE;
};

func void DIA_Butch_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Butch_Hello(C_Info)
{
	npc = ORG_851_Butch;
	nr = 1;
	condition = DIA_Butch_Hello_Condition;
	information = DIA_Butch_Hello_Info;
	important = 0;
	description = "Hi. Wer bist du?";
};


func int DIA_Butch_Hello_Condition()
{
	return 1;
};

func void DIA_Butch_Hello_Info()
{
	AI_Output(other,self,"DIA_Butch_Hello_15_00");	//Hi. Wer bist du?
	AI_Output(self,other,"DIA_Butch_Hello_13_01");	//Das geht dich einen Dreck an! Deine Fresse gef�llt mir nicht!
	AI_StopProcessInfos(self);
};


instance DIA_BUTCH_HEY(C_Info)
{
	npc = ORG_851_Butch;
	nr = 1;
	condition = dia_butch_hey_condition;
	information = dia_butch_hey_info;
	important = 0;
	description = "Hey Butch!";
};


func int dia_butch_hey_condition()
{
	if((FINGERS_THIEF == LOG_RUNNING) && (Npc_HasItems(ORG_850_Wedge,butchs_amulett) >= 1))
	{
		return 1;
	};
};

func void dia_butch_hey_info()
{
	AI_Output(other,self,"DIA_Butch_Hey_15_00");	//Hey Butch! Mir ist aufgefallen das Wedge ein Amulett besitzt das deinen Namen eingraviert hat...
	AI_Output(self,other,"DIA_Butch_Hey_13_01");	//Dieser miese Dreckskerl! Mein Amulett ist mir vor kurzem gestohlen worden. Geh' mir aus dem Weg, sonst bist du gleich auch noch dran!
	AI_StopProcessInfos(self);
	B_LogEntry(CH1_THIEFS,"Es hat funktioniert. Nun hat es so ausgesehen, als h�tte Wedge das Amulett von Butch gestohlen und der ist danach direkt auf ihn losgegangen.");
	Npc_SetTarget(self,ORG_850_Wedge);
	AI_StartState(self,ZS_Attack,1,"");
};


instance DIA_ORG_851_SCGOMEZ(C_Info)
{
	npc = ORG_851_Butch;
	nr = 1;
	condition = dia_org_851_scgomez_condition;
	information = dia_org_851_scgomez_info;
	permanent = 0;
	important = 1;
};


func int dia_org_851_scgomez_condition()
{
	if((other.guild == GIL_STT) || (other.guild == GIL_GRD))
	{
		return 1;
	};
};

func void dia_org_851_scgomez_info()
{
	AI_Output(self,other,"DIA_Org_851_ScGomez_06_00");	//Leute, schaut euch das mal an...
	AI_Output(self,other,"DIA_Org_851_ScGomez_06_01");	//Einer von Gomez' Leuten traut sich in unser Lager.
	AI_Output(self,other,"DIA_Org_851_ScGomez_06_02");	//Zeigen wir ihm, was wir hier im Neuen Lager von denen halten.
	AI_StopProcessInfos(self);
	Npc_SetTarget(ORG_851_Butch,other);
	AI_StartState(ORG_851_Butch,ZS_Attack,1,"");
	Npc_SetTarget(ORG_807_Organisator,other);
	AI_StartState(ORG_807_Organisator,ZS_Attack,1,"");
	Npc_SetTarget(ORG_822_Organisator,other);
	AI_StartState(ORG_822_Organisator,ZS_Attack,1,"");
};

