
instance DIA_SANCHO_EXIT(C_Info)
{
	npc = org_867_sancho;
	nr = 999;
	condition = dia_sancho_exit_condition;
	information = dia_sancho_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_sancho_exit_condition()
{
	return 1;
};

func void dia_sancho_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SANCHO_HELLO(C_Info)
{
	npc = org_867_sancho;
	nr = 1;
	condition = dia_sancho_hello_condition;
	information = dia_sancho_hello_info;
	permanent = 0;
	important = 1;
};


func int dia_sancho_hello_condition()
{
	return 1;
};

func void dia_sancho_hello_info()
{
	AI_Output(self,other,"DIA_Sancho_Hello_15_00");	//Hey du! Wo soll's denn hingehen?
	AI_Output(other,self,"DIA_Sancho_Hello_12_01");	//Wo geht's hier denn hin?
	AI_Output(self,other,"DIA_Sancho_Hello_12_02");	//Hier geht es in unser Lager. Wir Räuber haben hier das sagen und Quentin ist unser Anführer.
	AI_Output(self,other,"DIA_Sancho_Hello_12_03");	//Er kümmert sich darum, dass Ruhe im Lager herrscht.
};


instance DIA_SANCHO_IN(C_Info)
{
	npc = org_867_sancho;
	nr = 1;
	condition = dia_sancho_in_condition;
	information = dia_sancho_in_info;
	permanent = 0;
	important = 0;
	description = "Kann ich reingehen?";
};


func int dia_sancho_in_condition()
{
	if(Npc_KnowsInfo(hero,dia_sancho_hello))
	{
		return 1;
	};
};

func void dia_sancho_in_info()
{
	AI_Output(other,self,"DIA_Sancho_In_15_00");	//Kann ich reingehen?
	AI_Output(self,other,"DIA_Sancho_In_12_01");	//Klar kannst du reingehen, einer wie du kann hier sowieso nicht viel anrichten.
	AI_Output(self,other,"DIA_Sancho_In_12_02");	//Aber pass auf was du hier tust, ja? Ein paar von den Jungs sind richtige Mistkerle und werden ihre Freude daran haben einem wie dir die Fresse zu polieren.
};


instance DIA_SANCHO_HOW(C_Info)
{
	npc = org_867_sancho;
	nr = 1;
	condition = dia_sancho_how_condition;
	information = dia_sancho_how_info;
	permanent = 1;
	important = 0;
	description = "Wie steht's?";
};


func int dia_sancho_how_condition()
{
	if(Npc_KnowsInfo(hero,dia_sancho_in))
	{
		return 1;
	};
};

func void dia_sancho_how_info()
{
	AI_Output(other,self,"DIA_Sancho_How_15_00");	//Wie steht's?
	AI_Output(self,other,"DIA_Sancho_How_12_01");	//Alles ganz ruhig. Die Snapper unten bleiben schön auf Abstand und im Lager ist alles normal wie immer.
};


instance DIA_SANCHO_SKINNER(C_Info)
{
	npc = org_867_sancho;
	nr = 1;
	condition = dia_sancho_skinner_condition;
	information = dia_sancho_skinner_info;
	permanent = 0;
	important = 1;
};


func int dia_sancho_skinner_condition()
{
	if(Npc_KnowsInfo(hero,dia_sancho_hello))
	{
		return 1;
	};
};

func void dia_sancho_skinner_info()
{
	AI_Output(self,other,"DIA_Sancho_Skinner_15_00");	//Bevor ich's vergesse!
	AI_Output(self,other,"DIA_Sancho_Skinner_12_01");	//Wenn du ins Lager gehst, findest du am Eingang links eine Hütte.
	AI_Output(self,other,"DIA_Sancho_Skinner_12_02");	//Das ist die Hütte von Skinner. Ich rate dir nur, lass ihn schlafen.
	AI_Output(self,other,"DIA_Sancho_Skinner_12_03");	//Es ist besser für dich, glaub' mir.
};


var int sancho_esteban;

instance DIA_SANCHO_ABOUT(C_Info)
{
	npc = org_867_sancho;
	nr = 1;
	condition = dia_sancho_about_condition;
	information = dia_sancho_about_info;
	permanent = 0;
	important = 0;
	description = "Was denkst du über Esteban?";
};


func int dia_sancho_about_condition()
{
	if(ESTEBAN_LEADER == LOG_RUNNING)
	{
		return 1;
	};
};

func void dia_sancho_about_info()
{
	AI_Output(other,self,"DIA_Sancho_About_15_00");	//Was denkst du über Esteban?
	AI_Output(self,other,"DIA_Sancho_About_12_01");	//Hast wohl auch schon die Gerüchte gehört was?
	AI_Output(self,other,"DIA_Sancho_About_12_02");	//Nun mich interessiert's nicht wer hier Chef ist und wer nicht. Für mich ändert sich hier vorne am Tor sowieso nichts.
	AI_Output(self,other,"DIA_Sancho_About_12_03");	//Früher oder später wird Esteban Quentin aber aus dem Weg räumen das stimmt.
	B_LogEntry(CH1_ESTEBANQUENTIN,"Sancho ist es egal wer der Chef des Lagers ist. Er wird eh weiterhin seinen Posten behalten. Allerdings denkt er auch das Esteban bald das Ruder übernimmt.");
	SANCHO_ESTEBAN = TRUE;
};


instance DIA_SANCHO_RAVEN(C_Info)
{
	npc = org_867_sancho;
	nr = 1;
	condition = dia_sancho_raven_condition;
	information = dia_sancho_raven_info;
	permanent = 0;
	important = 1;
};


func int dia_sancho_raven_condition()
{
	if(Kapitel >= 4)
	{
		return 1;
	};
};

func void dia_sancho_raven_info()
{
	AI_Output(self,other,"DIA_Sancho_Raven_15_00");	//Hey du! Wenn ich du wäre, würde ich ganz schnell wieder umdrehen.
	AI_Output(other,self,"DIA_Sancho_Raven_12_01");	//Warum?
	if(Npc_IsDead(Org_858_Quentin))
	{
		AI_Output(self,other,"DIA_Sancho_Raven_12_12");	//Weil du Quentin umgelegt hast, ist Esteban jetzt der Mann, der das Lager anführt.
		AI_Output(other,self,"DIA_Sancho_Raven_12_03");	//Was??
		AI_Output(self,other,"DIA_Sancho_Raven_12_04");	//Das ist noch nicht alles.
		AI_Output(self,other,"DIA_Sancho_Raven_12_05");	//Nachdem das alte Lager die Freie Mine überfallen hat, ist einer der Erzbarone mit einigen Gardisten in unser Lager gekommen um mit Esteban zu verhandeln.
		AI_Output(self,other,"DIA_Sancho_Raven_12_08");	//Jetzt sitzen er und dieser Erzbaron unten im Talkessel und planen das weitere Vorgehen.
		AI_Output(self,other,"DIA_Sancho_Raven_12_09");	//Wenn ich du wäre, würde ich nicht in den Kessel gehen, die werden dir da das Fell über die Ohren ziehen.
	}
	else
	{
		AI_Output(self,other,"DIA_Sancho_Raven_12_02");	//Esteban hat jetzt die Führung übernommen. Er hat Quentin umgelegt.
		AI_Output(other,self,"DIA_Sancho_Raven_12_03");	//Was??
		AI_Output(self,other,"DIA_Sancho_Raven_12_04");	//Das ist noch nicht alles.
		AI_Output(self,other,"DIA_Sancho_Raven_12_05");	//Nachdem das alte Lager die Freie Mine überfallen hat, ist einer der Erzbarone mit einigen Gardisten in unser Lager gekommen um mit Esteban zu verhandeln.
		AI_Output(self,other,"DIA_Sancho_Raven_12_15");	//Er wollte das Quentin und seine Jungs beim Überfall auf die Freie Mine helfen.
		AI_Output(self,other,"DIA_Sancho_Raven_12_06");	//Quentin weigerte sich mit dem Alten Lager zu helfen, da er das Neue Lager nicht verraten wollte.
		AI_Output(self,other,"DIA_Sancho_Raven_12_07");	//Esteban war anderer Meinung und hat Quentin daraufhin aus dem Weg geschafft.
		AI_Output(self,other,"DIA_Sancho_Raven_12_08");	//Jetzt sitzen er und dieser Erzbaron unten im Talkessel und planen das weitere Vorgehen.
		AI_Output(self,other,"DIA_Sancho_Raven_12_09");	//Wenn ich du wäre, würde ich nicht in den Kessel gehen, die werden dir da das Fell über die Ohren ziehen.
	};
};

