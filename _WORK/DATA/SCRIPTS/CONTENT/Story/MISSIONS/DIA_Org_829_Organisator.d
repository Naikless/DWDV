
instance Info_ORG_829_EXIT(C_Info)
{
	npc = Org_829_Organisator;
	nr = 999;
	condition = Info_ORG_829_EXIT_Condition;
	information = Info_ORG_829_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_ORG_829_EXIT_Condition()
{
	return 1;
};

func void Info_ORG_829_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_ORG_829_Hello(C_Info)
{
	npc = Org_829_Organisator;
	nr = 1;
	condition = Info_ORG_829_Hello_Condition;
	information = Info_ORG_829_Hello_Info;
	permanent = 0;
	description = "Wie sieht's aus?";
};


func int Info_ORG_829_Hello_Condition()
{
	return 1;
};

func void Info_ORG_829_Hello_Info()
{
	AI_Output(other,self,"Info_ORG_829_Hello_15_00");	//Wie sieht's aus?
	AI_Output(self,other,"Info_ORG_829_Hello_06_01");	//Geht. Hab' nichts mehr zu rauchen.
};


var int Org_829_GotJoint;

instance Info_ORG_829_OfferJoint(C_Info)
{
	npc = Org_829_Organisator;
	nr = 1;
	condition = Info_ORG_829_OfferJoint_Condition;
	information = Info_ORG_829_OfferJoint_Info;
	permanent = 0;
	description = "Ich hab' Sumpfkraut dabei - willst du was?";
};


func int Info_ORG_829_OfferJoint_Condition()
{
	if(Npc_KnowsInfo(hero,Info_ORG_829_Hello))
	{
		return 1;
	};
};

func void Info_ORG_829_OfferJoint_Info()
{
	AI_Output(other,self,"Info_ORG_829_OfferJoint_15_00");	//Ich hab' Sumpfkraut dabei - willst du was?
	if((Npc_HasItems(other,ItMiJoint_1) > 0) || (Npc_HasItems(other,ItMiJoint_2) > 0) || (Npc_HasItems(other,ItMiJoint_3) > 0))
	{
		if(Npc_HasItems(other,ItMiJoint_1))
		{
			B_GiveInvItems(other,self,ItMiJoint_1,1);
		}
		else if(Npc_HasItems(other,ItMiJoint_2))
		{
			B_GiveInvItems(other,self,ItMiJoint_2,1);
		}
		else if(Npc_HasItems(other,ItMiJoint_3))
		{
			B_GiveInvItems(other,self,ItMiJoint_3,1);
		};
		AI_Output(self,other,"Info_ORG_829_OfferJoint_06_01");	//Na klar, her damit! Bist du einer von den Dealern aus dem Sektenlager oder was?
		Org_829_GotJoint = TRUE;
		NC_Joints_verteilt = NC_Joints_verteilt + 1;
	}
	else
	{
		AI_Output(self,other,"Info_ORG_829_OfferJoint_No_Joint_06_00");	//Hey, Mann! Verarsch mich nicht, ja? Mit so was komm ich nicht klar!
	};
};


instance Info_ORG_829_SpecialInfo(C_Info)
{
	npc = Org_829_Organisator;
	nr = 1;
	condition = Info_ORG_829_SpecialInfo_Condition;
	information = Info_ORG_829_SpecialInfo_Info;
	permanent = 0;
	description = "Ich bin neu hier - hast du irgendwelche Tipps für mich?";
};


func int Info_ORG_829_SpecialInfo_Condition()
{
	if(Org_829_GotJoint == TRUE)
	{
		return 1;
	};
};

func void Info_ORG_829_SpecialInfo_Info()
{
	AI_Output(other,self,"Info_ORG_829_SpecialInfo_15_00");	//Ich bin neu hier - hast du irgendwelche Tipps für mich?
	AI_Output(self,other,"Info_ORG_829_SpecialInfo_06_01");	//Klar! Wenn du ins Lager kommst, geh zu Gorn. Er ist zwar einer der Söldner der Magier, aber er ist in Ordnung. War mal einer von uns.
	AI_Output(other,self,"Info_ORG_829_SpecialInfo_15_02");	//Von 'uns'?
	AI_Output(self,other,"Info_ORG_829_SpecialInfo_06_03");	//Na, ein Bandit eben. Ein Wir-treten-den-Erzbaronen-in-den-Arsch-Bandit! 
};


instance Info_ORG_829_PERM(C_Info)
{
	npc = Org_829_Organisator;
	nr = 2;
	condition = Info_ORG_829_PERM_Condition;
	information = Info_ORG_829_PERM_Info;
	permanent = 0;
	description = "Kannst du mir sagen, was mich da drin erwartet?";
};


func int Info_ORG_829_PERM_Condition()
{
	if(Org_829_GotJoint == TRUE)
	{
		return 1;
	};
};

func void Info_ORG_829_PERM_Info()
{
	AI_Output(other,self,"Info_ORG_829_PERM_15_00");	//Kannst du mir sagen, was mich da drin erwartet?
	AI_Output(self,other,"Info_ORG_829_PERM_06_01");	//Geh rein und find's raus.
};


instance DIA_ORG_829_SCGOMEZ(C_Info)
{
	npc = Org_829_Organisator;
	nr = 1;
	condition = dia_org_829_scgomez_condition;
	information = dia_org_829_scgomez_info;
	permanent = 0;
	important = 1;
};


func int dia_org_829_scgomez_condition()
{
	if((other.guild == GIL_STT) || (other.guild == GIL_GRD))
	{
		return 1;
	};
};

func void dia_org_829_scgomez_info()
{
	AI_Output(self,other,"DIA_Org_829_ScGomez_06_00");	//Viel Glück!
	AI_Output(other,self,"DIA_Org_829_ScGomez_06_01");	//Wobei?
	AI_Output(self,other,"DIA_Org_829_ScGomez_06_02");	//Das du wieder lebend hier rauskommst. Gomez' Leute werden hier nicht gerne gesehen. Aber, ich werde nicht der Letzte sein der dir das sagt. Hehe.
	ORG_876_Tuersteher.aivar[AIV_PASSGATE] = FALSE;
};

