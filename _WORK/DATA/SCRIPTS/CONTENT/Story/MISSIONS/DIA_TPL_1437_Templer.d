
instance Tpl_1437_Templer_Exit(C_Info)
{
	npc = TPL_1437_Templer;
	nr = 999;
	condition = Tpl_1437_Templer_Exit_Condition;
	information = Tpl_1437_Templer_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Tpl_1437_Templer_Exit_Condition()
{
	return TRUE;
};

func void Tpl_1437_Templer_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance Tpl_1437_Templer_NERV(C_Info)
{
	npc = TPL_1437_Templer;
	condition = Tpl_1437_Templer_NERV_Condition;
	information = Tpl_1437_Templer_NERV_Info;
	important = 0;
	permanent = 0;
	description = "Was liegt an?";
};


func int Tpl_1437_Templer_NERV_Condition()
{
	return TRUE;
};

func void Tpl_1437_Templer_NERV_Info()
{
	AI_Output(other,self,"Tpl_1437_Templer_NERV_Info_15_01");	//Was liegt an?
	AI_Output(self,other,"Tpl_1437_Templer_NERV_Info_13_02");	//Hör mal, musst du eigentlich jeden anquatschen, der hier rumläuft?
	AI_StopProcessInfos(self);
};


instance Tpl_1437_Templer_LEAVE(C_Info)
{
	npc = TPL_1437_Templer;
	condition = Tpl_1437_Templer_LEAVE_Condition;
	information = Tpl_1437_Templer_LEAVE_Info;
	important = 0;
	permanent = 0;
	description = "Alles klar bei dir?";
};


func int Tpl_1437_Templer_LEAVE_Condition()
{
	if(Npc_KnowsInfo(other,Tpl_1437_Templer_NERV))
	{
		return TRUE;
	};
};

func void Tpl_1437_Templer_LEAVE_Info()
{
	AI_Output(other,self,"Tpl_1437_Templer_LEAVE_Info_15_01");	//Alles klar bei dir?
	AI_Output(self,other,"Tpl_1437_Templer_LEAVE_Info_13_02");	//Ich will meine Ruhe haben, verstanden? Also geh einfach weg und mach irgendwas, irgendwas anderes!
	AI_StopProcessInfos(self);
};


instance Tpl_1437_Templer_LEAVENOW(C_Info)
{
	npc = TPL_1437_Templer;
	condition = Tpl_1437_Templer_LEAVENOW_Condition;
	information = Tpl_1437_Templer_LEAVENOW_Info;
	important = 0;
	permanent = 0;
	description = "Nein, ich verstehe dich einfach nicht!";
};


func int Tpl_1437_Templer_LEAVENOW_Condition()
{
	if(Npc_KnowsInfo(hero,Tpl_1437_Templer_LEAVE))
	{
		return TRUE;
	};
};

func void Tpl_1437_Templer_LEAVENOW_Info()
{
	AI_Output(other,self,"Tpl_1437_Templer_LEAVENOW_Info_15_01");	//Nein, ich verstehe dich einfach nicht!
	AI_Output(self,other,"Tpl_1437_Templer_LEAVENOW_Info_13_02");	//Na gut dann will ich es dir mal deutlich machen.
	AI_Output(self,other,"Tpl_1437_Templer_LEAVENOW_Info_13_03");	//Verschwinde!
	AI_Output(self,other,"Tpl_1437_Templer_LEAVENOW_Info_13_04");	//Verlass diese Mine!
	AI_Output(self,other,"Tpl_1437_Templer_LEAVENOW_Info_13_05");	//Sprich mich NIE wieder an!
	AI_Output(self,other,"Tpl_1437_Templer_LEAVENOW_Info_13_06");	//Hau ab! lass mich in Ruhe!
	AI_Output(self,other,"Tpl_1437_Templer_LEAVENOW_Info_13_07");	//VERPISS DICH !!!
	AI_StopProcessInfos(self);
};


instance TPL_1437_TEMPLER_HI(C_Info)
{
	npc = TPL_1437_Templer;
	condition = tpl_1437_templer_hi_condition;
	information = tpl_1437_templer_hi_info;
	important = 0;
	permanent = 0;
	description = "Hey, du!";
};


func int tpl_1437_templer_hi_condition()
{
	if(Npc_KnowsInfo(hero,Tpl_1437_Templer_LEAVENOW))
	{
		return TRUE;
	};
};

func void tpl_1437_templer_hi_info()
{
	AI_Output(other,self,"DIA_Fletcher_Hello_15_00");	//Hey, du!
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};

