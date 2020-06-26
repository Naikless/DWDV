
instance DIA_Shrat_Exit(C_Info)
{
	npc = NOV_1356_Shrat;
	nr = 999;
	condition = DIA_Shrat_Exit_Condition;
	information = DIA_Shrat_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Shrat_Exit_Condition()
{
	return 1;
};

func void DIA_Shrat_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Shrat_WhyHere(C_Info)
{
	npc = NOV_1356_Shrat;
	nr = 1;
	condition = DIA_Shrat_WhyHere_Condition;
	information = DIA_Shrat_WhyHere_Info;
	permanent = 0;
	description = "Was machst du denn hier?";
};


func int DIA_Shrat_WhyHere_Condition()
{
	return 1;
};

func void DIA_Shrat_WhyHere_Info()
{
	AI_Output(other,self,"DIA_Shrat_WhyHere_15_00");	//Was machst du denn hier?
	AI_Output(self,other,"DIA_Shrat_WhyHere_02_01");	//Habe ich dir erlaubt, mich anzusprechen?
	AI_Output(self,other,"DIA_Shrat_WhyHere_02_02");	//War nur'n Witz! Diese verdammten Spinner gehen mir gehörig auf den Sack, deswegen bin ich hier!
	AI_Output(self,other,"DIA_Shrat_WhyHere_02_03");	//'Sprich mich nicht an!' - 'Bitte den Schläfer um Vergebung!' - 'Deine Mission ist von äußerster Dringlichkeit!'
	AI_Output(self,other,"DIA_Shrat_WhyHere_02_04");	//Das hält man ja im Kopf nicht aus - kein Wunder, dass die hier alle gaga sind.
	AI_Output(self,other,"DIA_Shrat_WhyHere_02_05");	//Ich bin Shrat. Novize ersten Ranges - und das werde ich auch bleiben!
};


instance DIA_Shrat_JoinPSI(C_Info)
{
	npc = NOV_1356_Shrat;
	nr = 1;
	condition = DIA_Shrat_JoinPSI_Condition;
	information = DIA_Shrat_JoinPSI_Info;
	permanent = 0;
	description = "Ich will der Bruderschaft beitreten - kannst du mir helfen?";
};


func int DIA_Shrat_JoinPSI_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Shrat_WhyHere) && (Npc_GetTrueGuild(hero) == GIL_None))
	{
		return 1;
	};
};

func void DIA_Shrat_JoinPSI_Info()
{
	AI_Output(other,self,"DIA_Shrat_JoinPSI_15_00");	//Ich will der Bruderschaft beitreten - kannst du mir helfen?
	AI_Output(self,other,"DIA_Shrat_JoinPSI_02_01");	//Du willst bei dem Laden hier mitmachen? Ich überleg gerade, wie ich hier wegkomme.
	AI_Output(self,other,"DIA_Shrat_JoinPSI_02_02");	//Wir könnten ein bisschen durch die Kolonie ziehen. Ein paar Einfaltspinsel ausplündern, ein bisschen Erz sammeln - was denkst du?
};


instance DIA_Shrat_ComeWithMe(C_Info)
{
	npc = NOV_1356_Shrat;
	nr = 1;
	condition = DIA_Shrat_ComeWithMe_Condition;
	information = DIA_Shrat_ComeWithMe_Info;
	permanent = 1;
	description = "Lass uns zusammen losziehen! Komm mit!";
};


func int DIA_Shrat_ComeWithMe_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Shrat_WhyHere) && (self.aivar[AIV_PARTYMEMBER] == FALSE))
	{
		return 1;
	};
};

func void DIA_Shrat_ComeWithMe_Info()
{
	AI_Output(other,self,"DIA_Shrat_ComeWithMe_15_00");	//Lass uns zusammen losziehen! Komm mit!
	AI_Output(self,other,"DIA_Shrat_ComeWithMe_02_01");	//Das ist doch mal ein Wort! Auf geht's!
	Npc_ExchangeRoutine(self,"FOLLOW");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
};


instance DIA_Shrat_LeaveMe(C_Info)
{
	npc = NOV_1356_Shrat;
	nr = 700;
	condition = DIA_Shrat_LeaveMe_Condition;
	information = DIA_Shrat_LeaveMe_Info;
	permanent = 1;
	description = "Hier trennen sich unsere Wege - ich werde von hier aus alleine weiterziehen.";
};


func int DIA_Shrat_LeaveMe_Condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return 1;
	};
};

func void DIA_Shrat_LeaveMe_Info()
{
	AI_Output(other,self,"DIA_Shrat_LeaveMe_15_00");	//Hier trennen sich unsere Wege - ich werde von hier aus alleine weiterziehen.
	if(!Npc_KnowsInfo(hero,nov_1356_shrat_tavern))
	{
		AI_Output(self,other,"DIA_Shrat_LeaveMe_02_01");	//Na gut. Ich werd' zurück in mein Versteck im Sumpf gehen. Pass gut auf dich auf!
		Npc_ExchangeRoutine(self,"START");
		self.aivar[AIV_PARTYMEMBER] = FALSE;
	}
	else
	{
		AI_Output(self,other,"DIA_Shrat_LeaveMe_02_02");	//Alles klar. Ich werd' dann mal zur Kneipe des Neuen Lagers gehen. Wenn du mich suchst, findest du mich also da. Bis dahin, pass auf dich auf!
		Npc_ExchangeRoutine(self,"NEWCAMP");
		self.aivar[AIV_PARTYMEMBER] = FALSE;
	};
};


instance NOV_1356_SHRAT_WELCOME(C_Info)
{
	npc = NOV_1356_Shrat;
	condition = nov_1356_shrat_welcome_condition;
	information = nov_1356_shrat_welcome_info;
	important = 1;
	permanent = 0;
};


func int nov_1356_shrat_welcome_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_GUR)
	{
		return TRUE;
	};
};

func void nov_1356_shrat_welcome_info()
{
	AI_Output(self,other,"Nov_1356_Shrat_WELCOME_Info_08_01");	//Mann, du scheinst es ja weit gebracht zu haben bei diesen Spinnern. Oh ich vergaß, du hast mir ja gar nicht erlaubt dich anzusprechen, was? Hehe.
	AI_StopProcessInfos(self);
};


instance NOV_1356_SHRAT_TAVERN(C_Info)
{
	npc = NOV_1356_Shrat;
	condition = nov_1356_shrat_tavern_condition;
	information = nov_1356_shrat_tavern_info;
	important = 1;
	permanent = 0;
};


func int nov_1356_shrat_tavern_condition()
{
	if((Npc_GetDistToWP(self,"NC_TAVERN_ROOM01") < 1000) && (self.aivar[AIV_PARTYMEMBER] == TRUE))
	{
		return TRUE;
	};
};

func void nov_1356_shrat_tavern_info()
{
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"Nov_1356_Shrat_WELCOME_Info_08_02");	//...sieht ja gar nicht mal so schlecht aus, was?
	AI_Output(self,other,"Nov_1356_Shrat_WELCOME_Info_08_03");	//Ich denke, wenn du das nächste mal alleine weiterziehen willst, werd' ich hier bleiben statt zurück in den monsterverseuchten Sumpf zu gehen.
	AI_Output(self,other,"Nov_1356_Shrat_WELCOME_Info_08_04");	//Mir ist die gute Gesellschaft von Reisschnaps lieber, als von Sumpfhaien. Hehe.
	B_GiveXP(XP_SHRAT);
	AI_StopProcessInfos(self);
};

