
instance DIA_SCAR_EXIT(C_Info)
{
	npc = EBR_101_Scar;
	nr = 999;
	condition = DIA_SCAR_EXIT_Condition;
	information = DIA_SCAR_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_SCAR_EXIT_Condition()
{
	return 1;
};

func void DIA_SCAR_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SCAR_Hello(C_Info)
{
	npc = EBR_101_Scar;
	nr = 3;
	condition = DIA_SCAR_Hello_Condition;
	information = DIA_SCAR_Hello_Info;
	permanent = 0;
	description = "Wer bist du?";
};


func int DIA_SCAR_Hello_Condition()
{
	return 1;
};

func void DIA_SCAR_Hello_Info()
{
	AI_Output(other,self,"DIA_SCAR_Hello_15_00");	//Wer bist du?
	AI_Output(self,other,"DIA_SCAR_Hello_08_01");	//Sie nennen mich Scar.
};


instance DIA_SCAR_What(C_Info)
{
	npc = EBR_101_Scar;
	nr = 3;
	condition = DIA_SCAR_What_Condition;
	information = DIA_SCAR_What_Info;
	permanent = 0;
	description = "Was ist deine Aufgabe hier?";
};


func int DIA_SCAR_What_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_SCAR_Hello))
	{
		return 1;
	};
};

func void DIA_SCAR_What_Info()
{
	AI_Output(other,self,"DIA_SCAR_What_15_00");	//Was ist deine Aufgabe hier?
	AI_Output(self,other,"DIA_SCAR_What_08_01");	//Ich und Arto passen auf, dass Gomez niemand zu nahe kommt, der hier nicht eingeladen wurde,
	AI_Output(self,other,"DIA_SCAR_What_08_02");	//Außerdem kümmere ich mich darum, dass die Frauen hier nicht zu kurz kommen .
};


instance DIA_SCAR_Frau(C_Info)
{
	npc = EBR_101_Scar;
	nr = 3;
	condition = DIA_SCAR_Frau_Condition;
	information = DIA_SCAR_Frau_Info;
	permanent = 0;
	description = "Als sie mich reingeworfen haben, habe ich eine Frau gesehen.";
};


func int DIA_SCAR_Frau_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_SCAR_What))
	{
		return 1;
	};
};

func void DIA_SCAR_Frau_Info()
{
	AI_Output(other,self,"DIA_SCAR_Frau_15_00");	//Als sie mich reingeworfen haben, habe ich gesehen, wie eine Frau zusammen mit den Waren heruntergefahren wurde.
	AI_Output(self,other,"DIA_SCAR_Frau_08_01");	//Und?
	AI_Output(other,self,"DIA_SCAR_Frau_15_02");	//Ist sie hier?
	AI_Output(self,other,"DIA_SCAR_Frau_08_03");	//Wenn du dich für sie interessierst, geb' ich dir einen guten Rat: Vergiss sie.
	AI_Output(self,other,"DIA_SCAR_Frau_08_04");	//Sie ist gerade angekommen und Gomez hat sie bei sich auf dem Zimmer eingesperrt.
	AI_Output(self,other,"DIA_SCAR_Frau_08_05");	//Wenn er sie 'ne Zeit lang gehabt hat, schickt er sie vielleicht runter. Aber jetzt gehört sie IHM - also verschwende besser keinen Gedanken an sie.
};


instance DIA_SCAR_PERM(C_Info)
{
	npc = EBR_101_Scar;
	nr = 3;
	condition = DIA_SCAR_PERM_Condition;
	information = DIA_SCAR_PERM_Info;
	permanent = 1;
	description = "Kannst du mir etwas über Gomez erzählen?";
};


func int DIA_SCAR_PERM_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_SCAR_Frau))
	{
		return 1;
	};
};

func void DIA_SCAR_PERM_Info()
{
	AI_Output(other,self,"DIA_SCAR_PERM_15_00");	//Kannst du mir etwas über Gomez erzählen?
	AI_Output(self,other,"DIA_SCAR_PERM_08_01");	//Über ihn musst du nur wissen, dass er der mächtigste Mann der Kolonie ist.
	AI_Output(self,other,"DIA_SCAR_PERM_08_02");	//Er kann alles haben, was er will, aber das einzige, was ihn WIRKLICH interessiert, ist Einfluss.
};


instance DIA_SCAR_RING(C_Info)
{
	npc = EBR_101_Scar;
	nr = 3;
	condition = dia_scar_ring_condition;
	information = dia_scar_ring_info;
	permanent = 0;
	important = 1;
};


func int dia_scar_ring_condition()
{
	if(Npc_HasItems(other,scarsring) >= 1)
	{
		return 1;
	};
};

func void dia_scar_ring_info()
{
	AI_Output(self,other,"DIA_SCAR_Ring_15_00");	//Hey du!
	AI_Output(self,other,"DIA_SCAR_Ring_08_01");	//Wo hast du denn diesen Ring her?
	AI_Output(other,self,"DIA_SCAR_Ring_08_02");	//Ich ähm...
	AI_Output(self,other,"DIA_SCAR_Ring_08_03");	//Du hast ihn mir gestohlen, was?
	AI_Output(self,other,"DIA_SCAR_Ring_08_04");	//Wart's ab du Mistkerl, jetzt bist du dran!
	AI_StopProcessInfos(self);
	Npc_SetPermAttitude(self,ATT_HOSTILE);
	Npc_SetTarget(self,other);
};


instance DIA_SCAR_SCBARON(C_Info)
{
	npc = EBR_101_Scar;
	nr = 3;
	condition = dia_scar_scbaron_condition;
	information = dia_scar_scbaron_info;
	permanent = 0;
	important = 1;
};


func int dia_scar_scbaron_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_EBR)
	{
		return 1;
	};
};

func void dia_scar_scbaron_info()
{
	AI_Output(self,other,"DIA_SCAR_SCBARON_15_00");	//Du hast die richtige Wahl getroffen. Hehe.
	AI_Output(self,other,"DIA_SCAR_SCBARON_08_01");	//Dein Leben als Erzbaron wird dir gefallen, glaub mir.
	AI_Output(self,other,"DIA_SCAR_SCBARON_08_02");	//Wir Erzbarone sind die Herrscher der Kolonie und du darfst dich von nun an auch dazu zählen.
	AI_StopProcessInfos(self);
};


instance DIA_SCAR_RAEUBER(C_Info)
{
	npc = EBR_101_Scar;
	nr = 3;
	condition = dia_scar_raeuber_condition;
	information = dia_scar_raeuber_info;
	permanent = 0;
	important = 1;
};


func int dia_scar_raeuber_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_GRD)
	{
		return 1;
	};
};

func void dia_scar_raeuber_info()
{
	AI_Output(self,other,"DIA_SCAR_RAEUBER_15_01");	//Gut das du vorbeikommst. Ich hätte eine Aufgabe für einen wie dich.
	AI_Output(self,other,"DIA_SCAR_RAEUBER_08_02");	//Vor einiger Zeit sind einige Buddler aus dem Lager geflohen und haben eine ganze Ladung Erz mitgehen lassen.
	AI_Output(self,other,"DIA_SCAR_RAEUBER_08_03");	//Gomez hat das gar nicht gefallen. Ihm geht es weniger um das Erz, als um sein Ansehen das dadurch geschädigt wurde.
	AI_Output(self,other,"DIA_SCAR_RAEUBER_08_04");	//Stell dir vor die anderen Buddler würden auch anfangen so zu denken und aus dem Lager fliehen. Das können wir nicht zulassen.
	AI_Output(self,other,"DIA_SCAR_RAEUBER_08_05");	//Deswegen wird es Zeit das jemand den abtrünnigen Buddlern eine Lektion erteilt.
	AI_Output(self,other,"DIA_SCAR_RAEUBER_08_06");	//DU wirst das tun.
	AI_Output(self,other,"DIA_SCAR_RAEUBER_08_07");	//Du kommst viel in der Kolonie rum, also wirst du früher oder später auch den abtrünnigen Buddlern begegnen. Wenn du das tust, erteile ihnen eine Lektion, die sie nicht vergessen werden.
	AI_Output(self,other,"DIA_SCAR_RAEUBER_08_08");	//Ich kann dir nicht sagen wo genau sie stecken, wahrscheinlich haben sie sich über die gesamte Kolonie verteilt und sind jetzt bloß noch gewöhnliche Wegelagerer.
	AI_Output(self,other,"DIA_SCAR_RAEUBER_08_09");	//Wenn du sie findest, erledige sie. Solltest du das Erz finden das sie gestohlen haben, behalte es. Gomez geht es ausschließlich um die Buddler.
	AI_Output(self,other,"DIA_SCAR_RAEUBER_08_10");	//Besorg' dir einen Beweis ihres Todes und kehre zu mir zurück. Aber beeil dich, Gomez ist ein ungeduldiger Mann.
	SCAR_QUEST = LOG_RUNNING;
	Log_CreateTopic(CH2_SCARQUEST,LOG_MISSION);
	Log_SetTopicStatus(CH2_SCARQUEST,LOG_RUNNING);
	B_LogEntry(CH2_SCARQUEST,"Scar, einer der Erzbarone aus dem Alten Lager, gab mir eine Aufgabe. Ich solle für ihn eine Gruppe von Buddlern ausfindig machen, die aus dem Alten Lager geflohen sind und Gomez bestohlen haben. Allerdings wusste er nicht, wo sich die Buddler aufhalten. Ich solle selbst herausfinden wo sie sind.");
	AI_StopProcessInfos(self);
};


instance DIA_SCAR_FIN(C_Info)
{
	npc = EBR_101_Scar;
	nr = 1;
	condition = dia_scar_fin_condition;
	information = dia_scar_fin_info;
	permanent = 0;
	important = 0;
	description = "Die Wegelagerer sind erledigt.";
};


func int dia_scar_fin_condition()
{
	if((SCAR_QUEST == LOG_RUNNING) && (Npc_HasItems(other,ore_bandits_message) >= 1) && (Npc_HasItems(other,ore_bandits_message2) >= 1) && (Npc_HasItems(other,ore_bandits_message3) >= 1) && (Npc_HasItems(other,ore_bandits_message4) >= 1))
	{
		return 1;
	};
};

func void dia_scar_fin_info()
{
	AI_Output(other,self,"DIA_SCAR_FIN_15_01");	//Die Wegelagerer sind erledigt.
	AI_Output(self,other,"DIA_SCAR_FIN_08_02");	//Gut, hehe. Ich wusste du bist der Richtige für diese Aufgabe. Hast du irgendwelche Beweise dafür?
	AI_Output(other,self,"DIA_SCAR_FIN_08_03");	//Ich hab' diese Tagebucheinträge bei ihnen gefunden. In ihnen wird öfter erwähnt wie sie aus dem Alten Lager geflohen sind und was sie mit dem Erz vor hatten.
	AI_Output(self,other,"DIA_SCAR_FIN_08_04");	//Lass mal sehen.
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_SCAR_FIN_08_05");	//Das hast du gut gemacht. Gomez wird sehr erfreut darüber sein.
	AI_Output(self,other,"DIA_SCAR_FIN_08_06");	//Ich werde Stone anweisen, dass er dir die schwere Gardistenrüstung verkaufen soll. Ich denke du kannst dich von nun an zu unserer Elite zählen.
	AI_Output(self,other,"DIA_SCAR_FIN_08_07");	//Geh' nun. Ich habe vorerst nichts mehr zu tun für dich.
	SCAR_QUEST = LOG_SUCCESS;
	Log_SetTopicStatus(CH2_SCARQUEST,LOG_SUCCESS);
	B_LogEntry(CH2_SCARQUEST,"Nachdem ich Scar als Beweis meines Erfolges die Tagebucheinträge der Wegelagerer brachte, war Scar erfreut darüber und wies mich darauf hin, dass es Gomez bestimmt genauso gehen würde, sobald er davon hören würde. Eine handfeste Belohnung gab es nicht. Allerdings versprach er mir, dass er mit Stone wegen der schweren Gardistenrüstung reden wird. Vielleicht sollte ich mal bei ihm vorbeischauen.");
	B_GiveXP(XP_SCARRAEUBER);
	AI_StopProcessInfos(self);
};

