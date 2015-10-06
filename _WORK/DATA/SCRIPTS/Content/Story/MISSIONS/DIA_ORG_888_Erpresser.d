
instance Info_Erpresser(C_Info)
{
	npc = ORG_888_Erpresser;
	nr = 1;
	condition = Info_Erpresser_Condition;
	information = Info_Erpresser_Info;
	permanent = 1;
	important = 1;
};


func int Info_Erpresser_Condition()
{
	if((Npc_GetAttitude(self,other) != ATT_FRIENDLY) && (self.aivar[AIV_HAS_ERPRESSED] == FALSE) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE) && (ORG_826_Mordrag.aivar[AIV_PARTYMEMBER] == FALSE))
	{
		return 1;
	};
};

func void Info_Erpresser_Info()
{
	var C_Npc coerpresser;
	self.name[0] = "Erpresser";
	coerpresser = Hlp_GetNpc(ORG_889_CoErpresser);
	coerpresser.name[0] = "Co-Erpresser";
	AI_Output(self,other,"Info_Erpresser_Info_13_01");	//Hey, Junge, wenn du hier vorbei willst, mußt du 10 Erz zahlen, oder du bekommst aufs Maul, kapiert?
	Info_ClearChoices(Info_Erpresser);
	Info_AddChoice(Info_Erpresser,"Dann komm doch her und hol dir dein Erz!",Info_Erpresser_Choice_AufsMaul);
	Info_AddChoice(Info_Erpresser,"Zehn Erz? Das ist nicht viel. Hier nimm...",Info_Erpresser_Choice_Zahlen);
};

func void Info_Erpresser_Choice_AufsMaul()
{
	var C_Npc coerpresser;
	AI_Output(other,self,"Info_Erpresser_Choice_AufsMaul_15_01");	//Dann komm doch her und hol dir dein Erz!
	AI_Output(self,other,"Info_Erpresser_Choice_AufsMaul_13_02");	//Danke, Mann. Du rettest mir den Tag.
	self.aivar[AIV_HAS_ERPRESSED] = 2;
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
	coerpresser = Hlp_GetNpc(ORG_889_CoErpresser);
	Npc_SetTarget(coerpresser,hero);
	AI_StartState(coerpresser,ZS_Attack,0,"");
	Npc_SetPermAttitude(coerpresser,ATT_ANGRY);
};

func void Info_Erpresser_Choice_Zahlen()
{
	var C_Npc coerpresser;
	if(Npc_HasItems(other,ItMiNugget) >= 10)
	{
		AI_Output(other,self,"Info_Erpresser_Choice_Zahlen_15_01");	//Hier, 10 Erz.
		AI_Output(self,other,"Info_Erpresser_Choice_Zahlen_13_02");	//Schade.
		B_GiveInvItems(other,self,ItMiNugget,10);
		self.aivar[AIV_HAS_ERPRESSED] = 1;
	}
	else
	{
		AI_Output(other,self,"Info_Erpresser_Choice_Zahlen_15_03");	//Ähm... hab' gerade keine 10 Erz...
		AI_Output(self,other,"Info_Erpresser_Choice_Zahlen_13_04");	//Das ist aber schade...
		self.aivar[AIV_HAS_ERPRESSED] = 2;
		AI_StopProcessInfos(self);
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_Attack,1,"");
		coerpresser = Hlp_GetNpc(ORG_889_CoErpresser);
		Npc_SetTarget(coerpresser,hero);
		AI_StartState(coerpresser,ZS_Attack,0,"");
		Npc_SetPermAttitude(coerpresser,ATT_ANGRY);
	};
	AI_StopProcessInfos(self);
};


instance Info_BereitsErpresst(C_Info)
{
	npc = ORG_888_Erpresser;
	nr = 1;
	condition = Info_BereitsErpresst_Condition;
	information = Info_BereitsErpresst_Info;
	permanent = 1;
	important = 1;
};


func int Info_BereitsErpresst_Condition()
{
	if((self.aivar[AIV_HAS_ERPRESSED] == 1) && Npc_IsInState(self,ZS_Talk))
	{
		return 1;
	};
};

func void Info_BereitsErpresst_Info()
{
	if(self.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
		AI_OutputSVM(self,other,"$LETSFORGETOURLITTLEFIGHT");
	}
	else
	{
		AI_Output(self,other,"Info_BereitsErpresst_Info_13_02");	//Du hast bezahlt, du kannst vorbei. Geh jetzt bevor ich's mir anders überlege!
	};
	AI_StopProcessInfos(self);
};


instance Info_BereitsAufsMaul(C_Info)
{
	npc = ORG_888_Erpresser;
	nr = 1;
	condition = Info_BereitsAufsMaul_Condition;
	information = Info_BereitsAufsMaul_Info;
	permanent = 1;
	important = 1;
};


func int Info_BereitsAufsMaul_Condition()
{
	if((self.aivar[AIV_HAS_ERPRESSED] == 2) && Npc_IsInState(self,ZS_Talk))
	{
		return 1;
	};
};

func void Info_BereitsAufsMaul_Info()
{
	if(self.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
		AI_OutputSVM(self,other,"$LETSFORGETOURLITTLEFIGHT");
	}
	else
	{
		AI_Output(self,other,"Info_BereitsAufsMaul_Info_13_02");	//Mach dass du wegkommst oder ich hau dir noch eins auf's Maul!
	};
	AI_StopProcessInfos(self);
};


instance Info_Exit(C_Info)
{
	npc = ORG_888_Erpresser;
	nr = 999;
	condition = Info_Exit_Condition;
	information = Info_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_Exit_Condition()
{
	return 1;
};

func void Info_Exit_Info()
{
	AI_StopProcessInfos(self);
};

