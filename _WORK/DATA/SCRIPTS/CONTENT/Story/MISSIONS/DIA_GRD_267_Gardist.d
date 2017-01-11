
instance DIA_GRD_267_EXIT(C_Info)
{
	npc = GRD_267_Gardist;
	nr = 999;
	condition = dia_grd_267_exit_condition;
	information = dia_grd_267_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_grd_267_exit_condition()
{
	return 1;
};

func void dia_grd_267_exit_info()
{
	AI_StopProcessInfos(self);
};


instance GRD_267_GARDIST_SITTINGORK(C_Info)
{
	npc = GRD_267_Gardist;
	condition = grd_267_gardist_sittingork_condition;
	information = grd_267_gardist_sittingork_info;
	important = 1;
	permanent = 0;
};


func int grd_267_gardist_sittingork_condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_None) && (Kapitel == 1))
	{
		return TRUE;
	};
};

func void grd_267_gardist_sittingork_info()
{
	AI_Output(self,other,"GRD_267_Gardist_SITTINGORK_Info_15_01");	//Ah, schau an. Wir haben Besuch.
	AI_Output(self,other,"GRD_267_Gardist_SITTINGORK_Info_06_02");	//Ein neues Gesicht. Das seh' ich dir direkt an, kleiner.
	AI_Output(self,other,"GRD_267_Gardist_SITTINGORK_Info_06_03");	//Nun, es ist hier brauch, dass wir Gardisten euch Buddler darüber aufklären wie hier der Hase läuft.
	AI_Output(self,other,"GRD_267_Gardist_SITTINGORK_Info_06_04");	//Wir Gardisten sorgen dafür das Buddler wie du und deine Kollegen hier Gomez' Erz abbauen.
	AI_Output(self,other,"GRD_267_Gardist_SITTINGORK_Info_06_05");	//Das macht ihr, damit wir alle hier drin ein angenehmes Leben haben.
	AI_Output(self,other,"GRD_267_Gardist_SITTINGORK_Info_06_06");	//Ihr Buddler, entrichtet eine Art Steuer an uns. Eine Erz-Steuer.
	AI_Output(self,other,"GRD_267_Gardist_SITTINGORK_Info_06_07");	//Wir sorgen dafür, dass euer Erz in gute Hände kommt und dafür hast du ein ruhiges Leben im Alten Lager.
	AI_Output(self,other,"GRD_267_Gardist_SITTINGORK_Info_06_08");	//Immerhin passen wir Gardisten auf euch Buddler auf und das ist eine... eine ziemlich kostspielige Aufgabe, wie du bestimmt verstehst. Hehe.
	AI_Output(self,other,"GRD_267_Gardist_SITTINGORK_Info_06_09");	//Ich denke, dass ist so das Wichtigste das du momentan wissen musst. 
	AI_Output(self,other,"GRD_267_Gardist_SITTINGORK_Info_06_10");	//Hier hast du 'ne Spitzhacke. Sie wird zukünftig dein ständiger Begleiter sein.
	AI_Output(self,other,"GRD_267_Gardist_SITTINGORK_Info_06_11");	//Du hast deine Erz-Steuern noch nicht an mich entrichtet, also mach dich an die Arbeit und sorg dafür, dass du deine Schulden abarbeitest.
	AI_Output(self,other,"GRD_267_Gardist_SITTINGORK_Info_06_12");	//Mach dir keine Sorgen, wir Gardisten passen auf euch Buddler auf. Du wirst also ganz in Ruhe arbeiten können.
	AI_Output(self,other,"GRD_267_Gardist_SITTINGORK_Info_06_13");	//Viel spaß bei deiner neuen Aufgabe. Ich hab' ab jetzt ein Auge auf dich, kleiner.
	CreateInvItems(self,ItMwPickaxe,1);
	B_GiveInvItems(self,other,ItMwPickaxe,1);
	ORE_VLK = LOG_RUNNING;
	Log_CreateTopic(CH1_HEROVLK,LOG_MISSION);
	Log_SetTopicStatus(CH1_HEROVLK,LOG_RUNNING);
	B_LogEntry(CH1_HEROVLK,"Einer der Gardisten der Alten Mine hat mich darauf aufmerksam gemacht, dass ich auch wie alle anderen in der Mine arbeiten müsste. Er gab mir eine Spitzhacke und schickte mich zur Schürfstelle. Wenn ich ihm bis morgen keine 150 Erz gebracht habe, will er mir eine Lektion erteilten.");
};


instance GRD_267_GARDIST_WORKINGORK(C_Info)
{
	npc = GRD_267_Gardist;
	condition = grd_267_gardist_workingork_condition;
	information = grd_267_gardist_workingork_info;
	important = 1;
	permanent = 0;
};


func int grd_267_gardist_workingork_condition()
{
	if(Npc_KnowsInfo(hero,grd_267_gardist_sittingork) && (ORE_VLK == LOG_RUNNING) && (Npc_HasItems(other,ItMiNugget) >= 150))
	{
		return 1;
	};
};

func void grd_267_gardist_workingork_info()
{
	AI_Output(self,other,"GRD_267_Gardist_WORKINGORK_Info_15_01");	//Schau an wer hier wieder vorbeikommt. Gut das du da bist. Ich bin gerade dabei die Erz-Steuern der Buddler einzusammeln.
	AI_Output(self,other,"GRD_267_Gardist_WORKINGORK_Info_15_02");	//Zeig' mir mal was du so gesammelt hast.
	AI_Output(self,other,"GRD_267_Gardist_WORKINGORK_Info_06_03");	//Ahh. Ein wunderbarer Anblick dieses Erz, nicht? Mach dir keine Sorgen, bei mir ist dein Erz gut angelegt.
	if(Npc_HasItems(other,ItMiNugget) <= 150)
	{
		AI_Output(self,other,"GRD_267_Gardist_WORKINGORK_Info_01_02");	//150 Erz? Schön das du dich an unsere Abmachung hälst und deine Erz-Steuern an mich entrichtest.
		AI_Output(self,other,"GRD_267_Gardist_WORKINGORK_Info_01_04");	//Hier hast du noch etwas Erz. Du musst ja auch irgendwo von leben, nicht?
		AI_Output(self,other,"GRD_267_Gardist_WORKINGORK_Info_01_05");	//Pass gut auf dich auf, kleiner. Wir sehen uns bestimmt wieder.
		B_GiveInvItems(other,self,ItMiNugget,150);
		B_GiveInvItems(self,other,ItMiNugget,10);
		ORE_VLK = LOG_SUCCESS;
		Log_SetTopicStatus(CH1_HEROVLK,LOG_SUCCESS);
		B_LogEntry(CH1_HEROVLK,"Ich habe dem Gardisten seine 150 Erz gebracht. Er gab mir 10 Erz als meinen Anteil und erzählte mir, dass ich doch bald wieder da bin, sobald ich mein Schutzgeld nicht mehr zahlen kann. Das werden wir ja noch sehen.");
		B_GiveXP(XP_VLKHERO);
	}
	else if(Npc_HasItems(other,ItMiNugget) <= 200)
	{
		AI_Output(self,other,"GRD_267_Gardist_WORKINGORK_Info_02_02");	//200 Erz? Du hast sicher nichts dagegen, wenn ich die Summe schon einmal als kleinen Vorschuss betrachte.
		AI_Output(self,other,"GRD_267_Gardist_WORKINGORK_Info_02_03");	//Es ist ja für einen guten Zweck. Hehe.
		AI_Output(self,other,"GRD_267_Gardist_WORKINGORK_Info_02_04");	//Hier hast du noch etwas Erz. Du musst ja auch irgendwo von leben, nicht?
		AI_Output(self,other,"GRD_267_Gardist_WORKINGORK_Info_02_05");	//Pass gut auf dich auf, kleiner. Wir sehen uns bestimmt wieder.
		B_GiveInvItems(other,self,ItMiNugget,200);
		B_GiveInvItems(self,other,ItMiNugget,15);
		ORE_VLK = LOG_SUCCESS;
		Log_SetTopicStatus(CH1_HEROVLK,LOG_SUCCESS);
		B_LogEntry(CH1_HEROVLK,"Als der Gardist bemerkte, dass ich 200 Erz dabei hatte, nahm er mir einfach alles weg und meinte es wäre ein Vorschuss für ihn. 15 Erz war mein Lohn für die ganze Arbeit.");
		B_GiveXP(XP_VLKHERO);
	}
	else if(Npc_HasItems(other,ItMiNugget) >= 250)
	{
		AI_Output(self,other,"GRD_267_Gardist_WORKINGORK_Info_04_02");	//Wie es scheint, scheinst du ja ganz schön gearbeitet zu haben. Eine Menge Erz die du da gesammelt hast.
		AI_Output(self,other,"GRD_267_Gardist_WORKINGORK_Info_04_03");	//Ich werde das gesamte Erz für dich verwahren. Mach dir keine Sorgen, bei mir ist es in guten Händen.
		AI_Output(self,other,"GRD_267_Gardist_WORKINGORK_Info_04_04");	//Betrachte es als Investition in die Zukunft. Ich werde dein Erz gut anlegen, da kannst du dir sicher sein.
		AI_Output(self,other,"GRD_267_Gardist_WORKINGORK_Info_04_05");	//Pass gut auf dich auf, kleiner. Wir sehen uns bestimmt wieder.
		B_GiveInvItems(other,self,ItMiNugget,Npc_HasItems(other,ItMiNugget));
		ORE_VLK = LOG_SUCCESS;
		Log_SetTopicStatus(CH1_HEROVLK,LOG_SUCCESS);
		B_LogEntry(CH1_HEROVLK,"Ich hatte sehr viel Erz bei mir, als ich dem Gardisten begegnete. Er nahm mir alles weg, was ich dabei hatte und beschrieb es als zukünftige Investitionen. Zur Belohnung für meine ganze Arbeit bekam ich gar nichts. ");
		B_GiveXP(XP_VLKHERO_TIRED);
	};
};

