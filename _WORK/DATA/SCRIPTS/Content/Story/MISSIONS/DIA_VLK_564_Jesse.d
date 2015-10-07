
instance DIA_Jesse_Exit(C_Info)
{
	npc = VLK_564_Jesse;
	nr = 999;
	condition = DIA_Jesse_Exit_Condition;
	information = DIA_Jesse_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Jesse_Exit_Condition()
{
	return 1;
};

func void DIA_Jesse_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Jesse_Hallo(C_Info)
{
	npc = VLK_564_Jesse;
	nr = 1;
	condition = DIA_Jesse_Hallo_Condition;
	information = DIA_Jesse_Hallo_Info;
	permanent = 0;
	description = "Wie sieht's aus?";
};


func int DIA_Jesse_Hallo_Condition()
{
	if(!Npc_KnowsInfo(hero,DIA_Herek_Bully))
	{
		return 1;
	};
};

func void DIA_Jesse_Hallo_Info()
{
	AI_Output(other,self,"DIA_Jesse_Hallo_15_00");	//Wie sieht's aus?
	AI_Output(self,other,"DIA_Jesse_Hallo_03_01");	//Neu hier, was? Du solltest wissen, dass man sich hier besser nicht mit den Gardisten anlegt.
	AI_Output(self,other,"DIA_Jesse_Hallo_03_02");	//Wenn sie Schutzgeld wollen, zahlst du besser, sonst hast du bald das halbe Lager gegen dich.
};


instance DIA_Jesse_Warn(C_Info)
{
	npc = VLK_564_Jesse;
	nr = 1;
	condition = DIA_Jesse_Warn_Condition;
	information = DIA_Jesse_Warn_Info;
	permanent = 0;
	important = 1;
};


func int DIA_Jesse_Warn_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Herek_Bully) && (Herek_ProtectionBully == TRUE))
	{
		return 1;
	};
};

func void DIA_Jesse_Warn_Info()
{
	AI_Output(self,other,"DIA_Jesse_Warn_03_00");	//Hey, du! Ich hab' gehört, du wolltest Bloodwyn kein Schutzgeld zahlen?
	AI_Output(other,self,"DIA_Jesse_Warn_15_01");	//Was willst du?
	AI_Output(self,other,"DIA_Jesse_Warn_03_02");	//Dich warnen! Bloodwyn hat einige Leute bezahlt, damit sie dir Ärger machen.
	AI_Output(self,other,"DIA_Jesse_Warn_03_03");	//Ich hab' zum Beispiel gesehen, wie er mit Herek da drüben geredet hat. Und nur die Götter wissen, mit wem noch!
	AI_Output(other,self,"DIA_Jesse_Warn_15_04");	//Was Herek betrifft, kommt deine Warnung etwas spät.
	AI_Output(self,other,"DIA_Jesse_Warn_03_05");	//Er muss noch mit jemand anderem geredet haben - so viel hab' ich mitgekriegt. Also pass auf dich auf.
};


var int Jesse_NoHelp;

instance DIA_Jesse_Mission(C_Info)
{
	npc = VLK_564_Jesse;
	nr = 1;
	condition = DIA_Jesse_Mission_Condition;
	information = DIA_Jesse_Mission_Info;
	permanent = 0;
	description = "Warum hast du mir die Sache mit Bloodwyn erzählt?";
};


func int DIA_Jesse_Mission_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Jesse_Warn))
	{
		return 1;
	};
};

func void DIA_Jesse_Mission_Info()
{
	AI_Output(other,self,"DIA_Jesse_Mission_15_00");	//Warum hast du mir die Sache mit Bloodwyn erzählt?
	AI_Output(self,other,"DIA_Jesse_Mission_03_01");	//Weil hier eine Hand die andere wäscht. Du siehst nicht so aus wie einer, der das nicht begreifen würde.
	AI_Output(self,other,"DIA_Jesse_Mission_03_02");	//Und weil ich DIR jetzt einen Gefallen getan habe, möchte ich dir Gelegenheit geben, dich zu revanchieren.
	Info_ClearChoices(DIA_Jesse_Mission);
	Info_AddChoice(DIA_Jesse_Mission,"Vergiß es! Ich schulde dir gar nichts!",DIA_Jesse_Mission_ForgetIt);
	Info_AddChoice(DIA_Jesse_Mission,"An was hattest du denn da gedacht?",DIA_Jesse_Mission_What);
};

func void DIA_Jesse_Mission_ForgetIt()
{
	AI_Output(other,self,"DIA_Jesse_Mission_ForgetIt_15_00");	//Vergiß es! Ich schulde dir GAR nichts!
	AI_Output(self,other,"DIA_Jesse_Mission_NO_03_01");	//So kann man sich in jemandem irren. Mit meiner Hilfe rechnest du am besten nicht mehr.
	Jesse_NoHelp = TRUE;
	Npc_SetPermAttitude(self,ATT_ANGRY);
	Info_ClearChoices(DIA_Jesse_Mission);
	AI_StopProcessInfos(self);
};

func void DIA_Jesse_Mission_What()
{
	AI_Output(other,self,"DIA_Jesse_Mission_What_15_00");	//An was hattest du denn da gedacht?
	AI_Output(self,other,"DIA_Jesse_Mission_What_03_01");	//Ich hab' kein Erz mehr, und Bloodwyn hat schon versucht, das letzte Bröckchen aus mir rauszupressen.
	AI_Output(self,other,"DIA_Jesse_Mission_What_03_02");	//Jetzt, wo ich dir geholfen habe, könntest du ihm doch meine 10 Erz geben, oder? Sag ihm, sie kommen von mir.
	Npc_SetTrueGuild(self,GIL_None);
	Info_ClearChoices(DIA_Jesse_Mission);
	Info_AddChoice(DIA_Jesse_Mission,"Ich werd sehen, was ich machen kann...",DIA_Jesse_Mission_YES);
	Info_AddChoice(DIA_Jesse_Mission,"Ich für dich zahlen? Vergiß es!",DIA_Jesse_Mission_NO);
};

func void DIA_Jesse_Mission_YES()
{
	AI_Output(other,self,"DIA_Jesse_Mission_YES_15_00");	//Ich werd sehen, was ich machen kann ...
	AI_Output(self,other,"DIA_Jesse_Mission_YES_03_01");	//Danke, Mann! Du bist meine Rettung! Sag mir Bescheid, wenn die Sache gelaufen ist, ja?
	Jesse_NoHelp = FALSE;
	Jesse_PayForMe = LOG_RUNNING;
	Log_CreateTopic(CH1_JESSE,LOG_MISSION);
	B_LogEntry(CH1_JESSE,"Der Buddler Jesse hat mich gebeten, die Schutzgeldsumme von 10 Erz an Bloodwyn zu zahlen.");
	Log_SetTopicStatus(CH1_JESSE,LOG_RUNNING);
	Info_ClearChoices(DIA_Jesse_Mission);
};

func void DIA_Jesse_Mission_NO()
{
	AI_Output(other,self,"DIA_Jesse_Mission_NO_15_00");	//Ich für dich zahlen? Vergiss es!
	AI_Output(self,other,"DIA_Jesse_Mission_NO_03_01");	//So kann man sich in jemandem irren. Mit meiner Hilfe rechnest du am besten nicht mehr.
	Jesse_NoHelp = TRUE;
	Npc_SetPermAttitude(self,ATT_ANGRY);
	Info_ClearChoices(DIA_Jesse_Mission);
};


instance DIA_Jesse_MisSuccess(C_Info)
{
	npc = VLK_564_Jesse;
	nr = 1;
	condition = DIA_Jesse_MisSuccess_Condition;
	information = DIA_Jesse_MisSuccess_Info;
	permanent = 0;
	description = "Ich habe Bloodwyn bezahlt!";
};


func int DIA_Jesse_MisSuccess_Condition()
{
	if(Jesse_PayForMe == LOG_SUCCESS)
	{
		return 1;
	};
};

func void DIA_Jesse_MisSuccess_Info()
{
	AI_Output(other,self,"DIA_Jesse_MisSuccess_15_00");	//Ich habe Bloodwyn bezahlt!
	AI_Output(self,other,"DIA_Jesse_MisSuccess_03_01");	//Ja? Gut! Dann sind wir ja jetzt quitt.
	Npc_SetTrueGuild(self,GIL_VLK);
	Jesse_PayForMe = LOG_SUCCESS;
	B_LogEntry(CH1_JESSE,"Ich habe Jesse erzählt, dass ich Bloodwyn das Schutzgeld gezahlt habe. Er war froh darüber.");
	Log_SetTopicStatus(CH1_JESSE,LOG_SUCCESS);
	B_GiveXP(XP_JESSEPAYFORME);
	Info_ClearChoices(DIA_Jesse_MisSuccess);
	Info_AddChoice(DIA_Jesse_MisSuccess,"WAAAS?!",DIA_Jesse_MisSuccess_Waaas);
	Info_AddChoice(DIA_Jesse_MisSuccess,"Genau. Eine Hand wäscht die andere...",DIA_Jesse_MisSuccess_Ok);
};

func void DIA_Jesse_MisSuccess_Waaas()
{
	AI_Output(other,self,"DIA_Jesse_MisSuccess_Waaas_15_00");	//WAAAS?! Ich hab' 10 Erz ausgegeben für einen Tipp, den ich sowieso schon kannte!?
	AI_Output(self,other,"DIA_Jesse_MisSuccess_Waaas_03_01");	//Sieht so aus.
	AI_StopProcessInfos(self);
};

func void DIA_Jesse_MisSuccess_Ok()
{
	AI_Output(other,self,"DIA_Jesse_MisSuccess_Ok_15_00");	//Genau. Eine Hand wäscht die andere ...
	AI_StopProcessInfos(self);
};


instance DIA_JESSE_SWORD(C_Info)
{
	npc = VLK_564_Jesse;
	nr = 1;
	condition = dia_jesse_sword_condition;
	information = dia_jesse_sword_info;
	permanent = 0;
	description = "Wo ist Hunos Schwert?";
};


func int dia_jesse_sword_condition()
{
	if(Npc_KnowsInfo(hero,dia_fingers_hunosschwert))
	{
		return 1;
	};
};

func void dia_jesse_sword_info()
{
	AI_Output(other,self,"DIA_Jesse_Sword_15_00");	//Wo ist Hunos Schwert?
	if(Jesse_NoHelp == TRUE)
	{
		AI_Output(self,other,"DIA_Jesse_Sword_03_01");	//Ich sagte doch, dass du mit meiner Hilfe nicht mehr rechnen brauchst!
		AI_Output(other,self,"DIA_Jesse_Sword_15_01");	//Nun spuck's schon aus, oder ich hau dir auf's Maul.
	}
	else
	{
		AI_Output(self,other,"DIA_Jesse_Sword_03_02");	//Was?! Ich weiß nichts davon.
		AI_Output(other,self,"DIA_Jesse_Sword_15_02");	//Nun spucks schon aus, ich weiß das DU etwas mit der Sache zu tun hast.
	};
	AI_Output(self,other,"DIA_Jesse_Sword_03_03");	//Schon gut, ich geb's ja zu ich hab' das Schwert gestohlen.
	AI_Output(self,other,"DIA_Jesse_Sword_03_04");	//Ich bin auf das Erz angewiesen, sonst kann ich den Gardisten kein Schutzgeld mehr bezahlen.
	AI_Output(self,other,"DIA_Jesse_Sword_03_05");	//Ich hab' das Schwert an einen Hehler aus dem Neuen Lager verkauft.
	AI_Output(self,other,"DIA_Jesse_Sword_03_06");	//Mordrag hieß der Kerl, ich glaub' er hält sich immer in der Nähe des Südtores auf.
	AI_Output(self,other,"DIA_Jesse_Sword_03_07");	//Wenn du das Schwert willst, red' mit ihm darüber.
	B_LogEntry(CH1_HUNOLOSTSWORD,"Jesse, ein Buddler, war derjenige, der das Schwert gestohlen hat. Er hat es an Mordrag verkauft, einem Hehler aus dem neuen Lager.");
};

