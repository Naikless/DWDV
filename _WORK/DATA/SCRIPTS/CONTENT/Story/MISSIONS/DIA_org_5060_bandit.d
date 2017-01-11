
instance ORG_5060_BANDIT_EXIT(C_Info)
{
	npc = org_5060_bandit;
	nr = 999;
	condition = org_5060_bandit_exit_condition;
	information = org_5060_bandit_exit_info;
	important = 0;
	permanent = 1;
	description = "ENDE";
};


func int org_5060_bandit_exit_condition()
{
	return TRUE;
};

func void org_5060_bandit_exit_info()
{
	AI_StopProcessInfos(self);
};


instance ORG_5060_BANDIT_FAKEHELP(C_Info)
{
	npc = org_5060_bandit;
	nr = 1;
	condition = org_5060_bandit_fakehelp_condition;
	information = org_5060_bandit_fakehelp_info;
	permanent = 0;
	important = 1;
	description = "Kannst du mir helfen?";
};


func int org_5060_bandit_fakehelp_condition()
{
	return TRUE;
};

func void org_5060_bandit_fakehelp_info()
{
	AI_Output(self,other,"DIA_ORG_5060_Help_15_00");	//Hey du! Warte mal!
	AI_Output(other,self,"DIA_ORG_5060_Help_15_01");	//Was willst du von mir?
	AI_Output(self,other,"DIA_ORG_5060_Help_15_02");	//Mein Kumpel und ich bräuchten ein wenig Hilfe. Wir jagen Scavenger in der Gegend und bräuchten jemanden, der uns dabei hilft die Viecher zu erledigen.
	AI_Output(self,other,"DIA_ORG_5060_Help_15_03");	//Du kommst mir da gerade recht. Wenn du mir und meinem Kumpel hilfst, kriegst du auch deinen Teil der Beute ab.
	AI_Output(self,other,"DIA_ORG_5060_Help_15_04");	//Also, was denkst du? Kann ich auf dich zählen?
	Info_ClearChoices(org_5060_bandit_fakehelp);
	Info_AddChoice(org_5060_bandit_fakehelp,"Kein Interesse - such dir einen anderen.",org_5060_bandit_fakehelp_deny);
	Info_AddChoice(org_5060_bandit_fakehelp,"Ich bin dabei!",org_5060_bandit_fakehelp_accepr);
};

func void org_5060_bandit_fakehelp_deny()
{
	AI_Output(other,self,"DIA_ORG_5060_Help_Deny_15_00");	//Kein Interesse - such dir einen anderen.
	AI_Output(self,other,"DIA_ORG_5060_Help_Deny_06_01");	//Du willst mir also nicht helfen? Dann verpiss dich. Ich hab' dir nichts mehr zu sagen, Penner.
	AI_StopProcessInfos(self);
	Npc_SetPermAttitude(self,ATT_ANGRY);
	Info_ClearChoices(org_5060_bandit_fakehelp);
};

func void org_5060_bandit_fakehelp_accepr()
{
	AI_Output(other,self,"DIA_ORG_5060_Help_Accepr_15_00");	//Ich bin dabei!
	AI_Output(self,other,"DIA_ORG_5060_Help_Accepr_06_01");	//Gut, dann lass uns mal losgehen, mein Kumpel wartet unten im Tal auf uns.
	AI_Output(self,other,"DIA_ORG_5060_Help_Accepr_06_02");	//Ich geh' vorraus, folge mir.
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"GUIDE");
	AI_StopProcessInfos(self);
	Info_ClearChoices(org_5060_bandit_fakehelp);
};


instance ORG_5060_BANDIT_TRAPPED(C_Info)
{
	npc = org_5060_bandit;
	nr = 1;
	condition = org_5060_bandit_trapped_condition;
	information = org_5060_bandit_trapped_info;
	permanent = 0;
	important = 1;
};


func int org_5060_bandit_trapped_condition()
{
	if(Npc_KnowsInfo(hero,org_5060_bandit_fakehelp) && (Npc_GetDistToWP(self,"HELPPOINT10") < 500))
	{
		return TRUE;
	};
};

func void org_5060_bandit_trapped_info()
{
	AI_Output(self,other,"DIA_ORG_5060_Trapped_15_00");	//So, hier sind wir. Da sitzt mein Kumpel.
	AI_Output(self,other,"DIA_ORG_5060_Trapped_15_01");	//Jetzt können wir uns der Arbeit widmen.
	AI_Output(other,self,"DIA_ORG_5060_Trapped_15_02");	//Wo sind die Scavenger?
	AI_Output(self,other,"DIA_ORG_5060_Trapped_15_03");	//Wir haben uns die Sache gerade überlegt. Wir werden jetzt keine Scavenger mehr jagen müssen.
	AI_Output(other,self,"DIA_ORG_5060_Trapped_15_04");	//Was?
	AI_Output(self,other,"DIA_ORG_5060_Trapped_15_05");	//Nun, jetzt wo du da bist, haben wir einen anderen Weg gefunden an Beute zu kommen.
	AI_Output(self,other,"DIA_ORG_5060_Trapped_15_06");	//Mal sehen was du so wertvolles dabei hast.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,hero);
	AI_StartState(self,ZS_Attack,0,"");
	Npc_SetTarget(org_5061_bandit,hero);
	AI_StartState(org_5061_bandit,ZS_Attack,0,"");
};


instance ORG_5060_BANDIT_BEATED(C_Info)
{
	npc = org_5060_bandit;
	nr = 1;
	condition = org_5060_bandit_beated_condition;
	information = org_5060_bandit_beated_info;
	permanent = 0;
	important = 1;
};


func int org_5060_bandit_beated_condition()
{
	if((Npc_KnowsInfo(hero,org_5060_bandit_trapped) && Npc_HasItems(hero,ItWr_Fire_Letter_01)) || (Npc_HasItems(hero,ItWr_Fire_Letter_02) && (self.aivar[AIV_HASDEFEATEDSC] == TRUE)))
	{
		return TRUE;
	};
};

func void org_5060_bandit_beated_info()
{
	AI_Output(self,other,"DIA_ORG_5060_Beated_15_00");	//Was hast du denn da für einen Brief dabei gehabt?
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_ORG_5060_Beated_15_01");	//Interessant, dass klingt wertvoll. Da springt bestimmt eine schöne Belohnung für mich bei raus. Hehe.
	AI_Output(self,other,"DIA_ORG_5060_Beated_15_02");	//Jetzt mach' das du wegkommst.
	CreateInvItem(self,ItWr_Fire_Letter_02);
	Npc_RemoveInvItem(hero,ItWr_Fire_Letter_01);
	Npc_RemoveInvItem(hero,ItWr_Fire_Letter_02);
	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
};


instance ORG_5060_BANDIT_DEFEATED(C_Info)
{
	npc = org_5060_bandit;
	nr = 1;
	condition = org_5060_bandit_defeated_condition;
	information = org_5060_bandit_defeated_info;
	permanent = 0;
	important = 1;
};


func int org_5060_bandit_defeated_condition()
{
	if(Npc_KnowsInfo(hero,org_5060_bandit_trapped) && (self.aivar[AIV_WASDEFEATEDBYSC] == TRUE))
	{
		return TRUE;
	};
};

func void org_5060_bandit_defeated_info()
{
	AI_OutputSVM(self,other,"$LETSFORGETOURLITTLEFIGHT");
	Npc_ExchangeRoutine(self,"START");
};

