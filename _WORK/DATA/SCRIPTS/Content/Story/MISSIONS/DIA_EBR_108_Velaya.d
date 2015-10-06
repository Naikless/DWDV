
instance DIA_VELAYA_EXIT(C_Info)
{
	npc = EBR_108_Velaya;
	nr = 999;
	condition = dia_velaya_exit_condition;
	information = dia_velaya_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_velaya_exit_condition()
{
	return 1;
};

func void dia_velaya_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_VELAYA_GOMEZFINISHED(C_Info)
{
	npc = EBR_108_Velaya;
	nr = 1;
	condition = dia_velaya_gomezfinished_condition;
	information = dia_velaya_gomezfinished_info;
	permanent = 0;
	important = 1;
};


func int dia_velaya_gomezfinished_condition()
{
	var C_Npc Gomez;
	Gomez = Hlp_GetNpc(EBR_100_Gomez);
	if(Npc_IsDead(Gomez))
	{
		return TRUE;
	};
};

func void dia_velaya_gomezfinished_info()
{
	AI_Output(self,other,"DIA_Velaya_IsHeDead_16_00");	//Was? Wie kommst du hier herein? Was ist mit Gomez?
	AI_Output(other,self,"DIA_Velaya_IsHeDead_16_01");	//Der ist Futter für die Ratten.
	AI_Output(self,other,"DIA_Velaya_IsHeDead_16_02");	//DU hast ihn erledigt?
	AI_Output(other,self,"DIA_Velaya_IsHeDead_16_03");	//Sieht so aus.
	AI_Output(self,other,"DIA_Velaya_IsHeDead_16_04");	//Endlich! Ich bin dir sehr dankbar dafür. Ich hätte es nicht länger mit diesem Schwein ausgehalten.
	AI_Output(self,other,"DIA_Velaya_IsHeDead_16_05");	//Er hat mich wie seine Sklavin behandelt und in seinem Zimmer eingesperrt. Dank' dir, ist das jetzt vorbei.
	AI_Output(self,other,"DIA_Velaya_IsHeDead_16_06");	//Ich kann dir zwar nicht viel geben, aber nimm das.
	AI_Output(self,other,"DIA_Velaya_IsHeDead_16_07");	//Es ist ein magisches Artefakt, dass ich Gomez gestohlen habe. Es wird dich stärker und ausdauernder machen.
	AI_Output(self,other,"DIA_Velaya_IsHeDead_16_08");	//Hoffentlich schützt es dich auf deinen Reisen.
	AI_Output(other,self,"DIA_Velaya_IsHeDead_16_09");	//Ich danke dir.
	B_GiveXP(XP_VELAYAHELP);
	B_GiveInvItems(self,other,Lebensamulett,1);
};

