
instance Info_ORG_830_EXIT(C_Info)
{
	npc = Org_830_Organisator;
	nr = 999;
	condition = Info_ORG_830_EXIT_Condition;
	information = Info_ORG_830_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_ORG_830_EXIT_Condition()
{
	return 1;
};

func void Info_ORG_830_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_ORG_830_Hello(C_Info)
{
	npc = Org_830_Organisator;
	nr = 1;
	condition = Info_ORG_830_Hello_Condition;
	information = Info_ORG_830_Hello_Info;
	permanent = 0;
	description = "Hi! Ich bin neu hier.";
};


func int Info_ORG_830_Hello_Condition()
{
	return 1;
};

func void Info_ORG_830_Hello_Info()
{
	AI_Output(other,self,"Info_ORG_830_Hello_15_00");	//Hi! Ich bin neu hier.
	AI_Output(self,other,"Info_ORG_830_Hello_13_01");	//Und?
};


instance Info_ORG_830_What(C_Info)
{
	npc = Org_830_Organisator;
	nr = 1;
	condition = Info_ORG_830_What_Condition;
	information = Info_ORG_830_What_Info;
	permanent = 0;
	description = "Was machst du hier?";
};


func int Info_ORG_830_What_Condition()
{
	if(Npc_KnowsInfo(hero,Info_ORG_830_Hello))
	{
		return 1;
	};
};

func void Info_ORG_830_What_Info()
{
	AI_Output(other,self,"Info_ORG_830_What_15_00");	//Was machst du hier?
	AI_Output(self,other,"Info_ORG_830_What_13_01");	//Wonach sieht's denn aus? Ich rauche mir einen.
	AI_Output(self,other,"Info_ORG_830_What_13_02");	//Wenn du denkst, ich lass dich mal ziehen, vergiss es!
};


instance Info_ORG_830_Aufhalten(C_Info)
{
	npc = Org_830_Organisator;
	nr = 2;
	condition = Info_ORG_830_Aufhalten_Condition;
	information = Info_ORG_830_Aufhalten_Info;
	permanent = 0;
	description = "Willst du mich nicht aufhalten? Mich fragen, was ich hier will oder so?";
};


func int Info_ORG_830_Aufhalten_Condition()
{
	if(Npc_KnowsInfo(hero,Info_ORG_830_Hello))
	{
		return 1;
	};
};

func void Info_ORG_830_Aufhalten_Info()
{
	AI_Output(other,self,"Info_ORG_830_Aufhalten_15_00");	//Willst du mich nicht aufhalten? Mich fragen, was ich hier will oder so?
	AI_Output(self,other,"Info_ORG_830_Aufhalten_13_01");	//Nein. Ist mir zu viel Stress. Auﬂerdem kann einer wie du sowieso nicht viel Schaden da drin anrichten.
};


instance Info_ORG_830_Perm(C_Info)
{
	npc = Org_830_Organisator;
	nr = 3;
	condition = Info_ORG_830_Perm_Condition;
	information = Info_ORG_830_Perm_Info;
	permanent = 1;
	description = "Wie sieht's drinnen aus?";
};


func int Info_ORG_830_Perm_Condition()
{
	if(Npc_KnowsInfo(hero,Info_ORG_830_Hello))
	{
		return 1;
	};
};

func void Info_ORG_830_Perm_Info()
{
	AI_Output(other,self,"Info_ORG_830_Perm_15_00");	//Wie sieht's drinnen aus?
	AI_Output(self,other,"Info_ORG_830_Perm_13_01");	//Das ‹bliche - ruhig bis auf ein paar kleine Schl‰gereien.
};


instance ORG_830_TORWACHE_MUD(C_Info)
{
	npc = Org_830_Organisator;
	condition = org_830_torwache_mud_condition;
	information = org_830_torwache_mud_info;
	important = 1;
	permanent = 0;
};


func int org_830_torwache_mud_condition()
{
	var C_Npc mud;
	mud = Hlp_GetNpc(VLK_574_Mud);
	if(Npc_GetDistToNpc(self,mud) < 500)
	{
		return TRUE;
	};
};

func void org_830_torwache_mud_info()
{
	AI_Output(self,other,"ORG_830_Torwache_MUD_Info_07_01");	//Hey Jungs, schaut mal wer da ankommt. Unser alter Freund. Sieht aus als kˆnnte er ein paar Schl‰ge auf's Maul gebrauchen. 
	AI_Output(other,self,"ORG_830_Torwache_MUD_Info_15_02");	//Was?!
	AI_Output(self,other,"ORG_830_Torwache_MUD_Info_07_03");	//Wer redet denn mit dir? Wir sprechen von deinem Kumpel, Mud. Hehe.
	AI_Output(self,other,"ORG_830_Torwache_MUD_Info_07_04");	//Wir waren beim letzten mal gar nicht fertig mit dir. Wird Zeit das wir das nachholen. Hehe.
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,VLK_574_Mud);
	AI_StartState(self,ZS_Attack,1,"");
	B_GiveXP(100);
};

