
instance DIA_BRAGO_EXIT(C_Info)
{
	npc = stt_5027_brago;
	nr = 999;
	condition = dia_brago_exit_condition;
	information = dia_brago_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_brago_exit_condition()
{
	return 1;
};

func void dia_brago_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BRAGO_FIRST(C_Info)
{
	npc = stt_5027_brago;
	nr = 1;
	condition = dia_brago_first_condition;
	information = dia_brago_first_info;
	permanent = 0;
	important = 0;
	description = "Hi! Ich bin neu hier.";
};


func int dia_brago_first_condition()
{
	return 1;
};

func void dia_brago_first_info()
{
	AI_Output(other,self,"Info_GRD_276_Tips_15_00");	//Hi! Ich bin neu hier.
	AI_Output(self,other,"DIA_Brago_First_10_01");	//So... und was willst du von mir?
};


instance DIA_BRAGO_WASGIBT(C_Info)
{
	npc = stt_5027_brago;
	nr = 2;
	condition = dia_brago_wasgibt_condition;
	information = dia_brago_wasgibt_info;
	permanent = 0;
	description = "Ich will wissen was hier läuft.";
};


func int dia_brago_wasgibt_condition()
{
	if(Npc_KnowsInfo(hero,dia_brago_first))
	{
		return 1;
	};
};

func void dia_brago_wasgibt_info()
{
	AI_Output(other,self,"DIA_Brago_WasGibt_15_00");	//Ich will wissen was hier läuft.
	AI_Output(self,other,"DIA_Brago_WasGibt_10_01");	//Für Neulinge? Gar nichts, außer jede Menge Ärger.
	AI_Output(self,other,"DIA_Brago_WasGibt_10_02");	//Wenn ich dir einen Tipp geben soll, dann pass auf wem du hier auf die Füsse trittst.
	AI_Output(self,other,"DIA_Brago_WasGibt_10_03");	//Einige die hier reingeworfen worden sind, sitzen hier wegen weit mehr als einem gestohlenen Apfel...
};


instance DIA_BRAGO_NAME(C_Info)
{
	npc = stt_5027_brago;
	nr = 1;
	condition = dia_brago_name_condition;
	information = dia_brago_name_info;
	permanent = 0;
	description = "Wer bist du?";
};


func int dia_brago_name_condition()
{
	if(Npc_KnowsInfo(hero,dia_brago_first))
	{
		return 1;
	};
};

func void dia_brago_name_info()
{
	AI_Output(other,self,"DIA_Lester_Hallo_15_00");	//Wer bist du?
	AI_Output(self,other,"DIA_Brago_Name_10_01");	//Ich bin Brago, einer von Gomez Schatten.
	AI_Output(other,self,"DIA_Brago_Name_10_02");	//Schatten?
	AI_Output(self,other,"DIA_Brago_Name_10_03");	//Ja, wir Schatten gehören genau wie die Gardisten zu Gomez Leuten.
	AI_Output(self,other,"DIA_Brago_Name_10_04");	//Sobald du hier in der Kolonie zu Gomez Leuten gehörst, wirst du ein angenehmes Leben haben.
};


instance DIA_BRAGO_HILFE(C_Info)
{
	npc = stt_5027_brago;
	nr = 1;
	condition = dia_brago_hilfe_condition;
	information = dia_brago_hilfe_info;
	permanent = 0;
	description = "Kannst du mir helfen in die Burg zu kommen?";
};


func int dia_brago_hilfe_condition()
{
	if(Npc_KnowsInfo(hero,dia_brago_name))
	{
		return 1;
	};
};

func void dia_brago_hilfe_info()
{
	AI_Output(other,self,"DIA_Brago_Hilfe__15_00");	//Du bist einer von Gomez Leuten? Kannst du mir helfen in die Burg zu kommen?
	AI_Output(self,other,"DIA_Brago_Hilfe__10_01");	//Du willst in die Burg? Was hast du denn da vor?
	Info_ClearChoices(dia_brago_hilfe);
	Info_AddChoice(dia_brago_hilfe,"Ich habe eine Botschaft für den Obersten Feuermagier.",dia_brago_hilfe_brief);
	Info_AddChoice(dia_brago_hilfe,"Ich möchte zu Gomez vorgelassen werden",dia_brago_hilfe_gomez);
};

func void dia_brago_hilfe_brief()
{
	AI_Output(other,self,"DIA_Brago_Hilfe_Brief_15_00");	//Ich habe eine Botschaft für den Obersten Feuermagier.
	AI_Output(self,other,"DIA_Brago_Hilfe_Brief_05_01");	//Ach so ist das. Die hast du bekommen bevor sie dich reingeworfen haben, ja?
	AI_Output(other,self,"DIA_Brago_Hilfe_Brief_15_01");	//Ganz genau.
	AI_Output(self,other,"DIA_Brago_Hilfe_Brief_15_02");	//Gut, ich denke ich kann dir helfen.
	AI_Output(other,self,"DIA_Brago_Hilfe_Brief_15_03");	//Und wie?
	AI_Output(self,other,"DIA_Brago_Hilfe_Brief_15_04");	//Es gibt einen geheimen Hintereingang in die Burg. Es gibt nicht viele Leute die ihn kennen und die die ihn kennen, haben keinen Schlüssel für die Tür dort.
	AI_Output(other,self,"DIA_Brago_Hilfe_Brief_15_05");	//Und den hast du?
	AI_Output(self,other,"DIA_Brago_Hilfe_Brief_15_06");	//Richtig. Aber wenn ich dir helfen soll, musst du mir versprechen das du niemanden von unserem Plan etwas erzählst, ja?
	AI_Output(other,self,"DIA_Brago_Hilfe_Brief_15_07");	//Einverstanden. Also wo ist dieses Versteck?
	AI_Output(self,other,"DIA_Brago_Hilfe_Brief_15_08");	//Wir können direkt losgehen, wenn du willst. Sag mir einfach bescheid.
	Info_ClearChoices(dia_brago_hilfe);
	Info_AddChoice(dia_brago_hilfe,"Lass uns losgehen.",dia_brago_hilfe_go);
	Info_AddChoice(dia_brago_hilfe,"Ich finde den Weg alleine.",dia_brago_hilfe_walkalone);
};

func void dia_brago_hilfe_gomez()
{
	AI_Output(other,self,"DIA_Brago_Hilfe_Gomez_15_00");	//Ich möchte zu Gomez vorgelassen werden.
	AI_Output(self,other,"DIA_Brago_Hilfe_Gomez_05_01");	//Hehe... vergiss es.
	AI_Output(self,other,"DIA_Brago_Hilfe_Gomez_05_02");	//Selbst wenn du es bis in die Burg schaffst, wirst du ganz bestimmt an den Wachen des Erzbaronhauses scheitern.
	AI_Output(self,other,"DIA_Brago_Hilfe_Gomez_05_03");	//Erst wenn du auf Befehl von Thorus vorgelassen wurdest, wirst du auch zu Gomez kommen können.
	Info_ClearChoices(dia_brago_hilfe);
};

func void dia_brago_hilfe_go()
{
	AI_Output(other,self,"DIA_Brago_Hilfe_Go_15_00");	//Lass uns losgehen.
	AI_Output(self,other,"DIA_Brago_Hilfe_Go_05_01");	//Also Gut, folge mir!
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"GUIDE");
	AI_StopProcessInfos(self);
};

func void dia_brago_hilfe_walkalone()
{
	AI_Output(other,self,"DIA_Brago_Hilfe_WalkAlone_15_00");	//Ich finde den Weg alleine.
	AI_Output(self,other,"DIA_Brago_Hilfe_WalkAlone_05_01");	//In Ordnung. Wenn du meinst, dass du's allein schaffst...
	Info_ClearChoices(dia_brago_hilfe);
};


instance DIA_BRAGO_TRAP(C_Info)
{
	npc = stt_5027_brago;
	nr = 1;
	condition = dia_brago_trap_condition;
	information = dia_brago_trap_info;
	permanent = 0;
	important = 1;
	description = "So, hier sind wir.";
};


func int dia_brago_trap_condition()
{
	if(Npc_KnowsInfo(hero,dia_brago_hilfe) && Hlp_StrCmp(Npc_GetNearestWP(self),"OW_PATH_297"))
	{
		return 1;
	};
};

func void dia_brago_trap_info()
{
	AI_Output(self,other,"DIA_Brago_Trap_15_00");	//So, hier sind wir.
	AI_Output(other,self,"DIA_Brago_Trap_10_01");	//Und wo ist der geheime Eingang?
	AI_Output(self,other,"DIA_Brago_Trap_10_02");	//Hehe... es gibt keinen geheimen Gang.
	AI_Output(other,self,"DIA_Brago_Trap_10_03");	//Was?!
	AI_Output(self,other,"DIA_Brago_Trap_10_04");	//Es war ziemlich dumm von dir, mir von dem Brief an die Feuermagier zu erzählen.
	AI_Output(self,other,"DIA_Brago_Trap_10_05");	//Keine Sorge, du wirst diesen Fehler nicht nochmal begehen.
	AI_Output(self,other,"DIA_Brago_Trap_10_06");	//Dafür sorge ich schon.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	AI_StopProcessInfos(self);
	Npc_SetPermAttitude(self,ATT_HOSTILE);
	Npc_SetTarget(self,other);
	Npc_ExchangeRoutine(self,"START");
};

