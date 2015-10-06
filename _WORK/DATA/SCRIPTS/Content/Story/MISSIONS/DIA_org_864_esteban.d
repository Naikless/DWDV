
instance DIA_ESTEBAN_EXIT(C_Info)
{
	npc = org_864_esteban;
	nr = 999;
	condition = dia_esteban_exit_condition;
	information = dia_esteban_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_esteban_exit_condition()
{
	return 1;
};

func void dia_esteban_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ESTEBAN_HELLO(C_Info)
{
	npc = org_864_esteban;
	nr = 1;
	condition = dia_esteban_hello_condition;
	information = dia_esteban_hello_info;
	permanent = 0;
	important = 0;
	description = "Hi! Wer bist du?";
};


func int dia_esteban_hello_condition()
{
	return 1;
};

func void dia_esteban_hello_info()
{
	AI_Output(other,self,"DIA_Esteban_Hello_15_00");	//Hi! Wer bist du?
	AI_Output(self,other,"DIA_Esteban_Hello_12_01");	//Ich bin Esteban.
	AI_Output(self,other,"DIA_Esteban_Hello_12_02");	//Und ich sag' dir was, wenn sich hier nicht bald was ändert, steht der zukünftige Anführer dieses Lagers vor dir.
};


instance DIA_ESTEBAN_IN(C_Info)
{
	npc = org_864_esteban;
	nr = 1;
	condition = dia_esteban_in_condition;
	information = dia_esteban_in_info;
	permanent = 0;
	important = 0;
	description = "Was stimmt nicht mit dem Lager?";
};


func int dia_esteban_in_condition()
{
	if(Npc_KnowsInfo(hero,dia_esteban_hello))
	{
		return 1;
	};
};

func void dia_esteban_in_info()
{
	if(!Npc_IsDead(Org_858_Quentin))
	{
		AI_Output(other,self,"DIA_Esteban_In_15_00");	//Was stimmt nicht mit dem Lager?
		AI_Output(self,other,"DIA_Esteban_In_12_01");	//Quentin und sein Führungsstil stimmen hier nicht.
		AI_Output(self,other,"DIA_Esteban_In_12_02");	//Quentin ist der Meinung, dass es das beste wäre, wenn wir weiterhin das Neue Lager unterstützen und uns an den Überfällen beteiligen.
		AI_Output(self,other,"DIA_Esteban_In_12_03");	//Ich seh' das anders.
		AI_Output(other,self,"DIA_Esteban_In_12_04");	//Und zwar?
		AI_Output(self,other,"DIA_Esteban_In_12_05");	//Wenn wir uns auf Dauer mit dem Alten Lager verbünden würden, wäre das mehr von Vorteil.
		AI_Output(self,other,"DIA_Esteban_In_12_06");	//Die Erzbarone bekommen alle ihre Waren aus der Außenwelt und wenn wir unseren Teil davon mitbekommen würden, könnten wir besser davon leben, als wir es zuzeit tun.
		AI_Output(self,other,"DIA_Esteban_In_12_07");	//Durch die Überfälle kommen wir zwar auch an die Waren, allerdings müssen wir die Hälfte davon an das Neue Lager abgeben.
	}
	else
	{
		AI_Output(other,self,"DIA_Esteban_In_12_00");	//Gar nichts. Jetzt wo Quentin tot ist, ist hier alles in Ordnung. (Schmunzelnd)
	};
};


instance DIA_ESTEBAN_WHY(C_Info)
{
	npc = org_864_esteban;
	nr = 1;
	condition = dia_esteban_why_condition;
	information = dia_esteban_why_info;
	permanent = 0;
	important = 0;
	description = "Kann ich dir helfen?";
};


func int dia_esteban_why_condition()
{
	if(Npc_KnowsInfo(hero,dia_esteban_in) && !Npc_IsDead(Org_858_Quentin))
	{
		return 1;
	};
};

func void dia_esteban_why_info()
{
	AI_Output(other,self,"DIA_Esteban_Why_15_00");	//Kann ich dir helfen?
	AI_Output(self,other,"DIA_Esteban_How_12_01");	//Hmm... Ich denke schon.
	AI_Output(self,other,"DIA_Esteban_How_12_02");	//Du müsstest dich mal ein wenig im Lager umhören.
	AI_Output(self,other,"DIA_Esteban_How_12_03");	//Ich muss wissen, wer hier im Lager auf wessen Seite steht.
	AI_Output(self,other,"DIA_Esteban_How_12_04");	//Sprich mit den Leuten und finde heraus wer hinter mir und wer hinter Quentin steht.
	AI_Output(self,other,"DIA_Esteban_How_12_05");	//Sobald du jeden befragt hast, komm' zu mir zurück und erzähl mir alles.
	AI_Output(self,other,"DIA_Esteban_How_12_06");	//Allerdings gibt's jetzt ein Problem.
	AI_Output(self,other,"DIA_Esteban_How_12_07");	//Die Leute wissen, dass wir uns unterhalten habe.
	AI_Output(self,other,"DIA_Esteban_How_12_08");	//Und die Leute wissen, dass ich gern' die Führung des Lagers übernehmen würde.
	AI_Output(self,other,"DIA_Esteban_How_12_09");	//Um jeden Verdacht zu zerstreuen, wirst du dir nach unserem Gespräch eine von mir auf's Maul hauen lassen müssen.
	AI_Output(self,other,"DIA_Esteban_How_12_10");	//Niemand wird anschliessend verdacht schöpfen.
	AI_Output(self,other,"DIA_Esteban_How_12_11");	//Also mach' dich auf was gefasst.
	ESTEBAN_LEADER = LOG_RUNNING;
	Log_CreateTopic(CH1_ESTEBANQUENTIN,LOG_MISSION);
	Log_SetTopicStatus(CH1_ESTEBANQUENTIN,LOG_RUNNING);
	B_LogEntry(CH1_ESTEBANQUENTIN,"Esteban, einer der Räuber des Räuberlagers, ist der Meinung, dass Quentin nicht länger an der Führung des Lagers bleiben soll. Quentin hat sich mit dem Neuen Lager verbündet und Esteban würde sich lieber mit dem Alten Lager verbünden. Ich soll mich jetzt für ihn im Lager umhören, wer auf seiner und wer auf Quentins Seite steht. Sobald ich alle Informationen habe, soll ich zu ihm zurückkehren und ihm alles berichten.");
};


instance DIA_ESTEBAN_MAUL(C_Info)
{
	npc = org_864_esteban;
	nr = 1;
	condition = dia_esteban_maul_condition;
	information = dia_esteban_maul_info;
	permanent = 0;
	important = 1;
};


func int dia_esteban_maul_condition()
{
	if((ESTEBAN_LEADER == LOG_RUNNING) && Npc_KnowsInfo(hero,dia_esteban_why))
	{
		return 1;
	};
};

func void dia_esteban_maul_info()
{
	AI_Output(self,other,"DIA_Esteban_Skinner_15_00");	//HAB ICH NICHT GESAGT DAS DU DICH VERPISSEN SOLLST?
	AI_Output(self,other,"DIA_Esteban_Skinner_12_01");	//JETZT GIBT'S WAS AUF'S MAUL!
	AI_StopProcessInfos(self);
	Npc_SetTarget(org_864_esteban,other);
	AI_StartState(org_864_esteban,ZS_Attack,1,"");
};


instance DIA_ESTEBAN_SUCCESS(C_Info)
{
	npc = org_864_esteban;
	nr = 1;
	condition = dia_esteban_success_condition;
	information = dia_esteban_success_info;
	permanent = 0;
	important = 0;
	description = "Ich hab' mal mit ein paar Leuten geredet.";
};


func int dia_esteban_success_condition()
{
	if((ESTEBAN_LEADER == LOG_RUNNING) && (FRANCO_ESTEBAN == TRUE) && (SENYAN_ESTEBAN == TRUE) && (LOGAN_ESTEBAN == TRUE) && (SANCHO_ESTEBAN == TRUE))
	{
		return 1;
	};
};

func void dia_esteban_success_info()
{
	AI_Output(other,self,"DIA_Esteban_SUCCESS_15_00");	//Ich hab' mal mit ein paar Leuten geredet.
	AI_Output(self,other,"DIA_Esteban_SUCCESS_12_01");	//Und?
	AI_Output(other,self,"DIA_Esteban_SUCCESS_12_02");	//Franco steht hinter dir. Er ist der Meinung du hättest das Zeug zum Anführer.
	AI_Output(other,self,"DIA_Esteban_SUCCESS_12_03");	//Logan ist der Meinung, dass die Zeit von Quentin um ist.
	AI_Output(other,self,"DIA_Esteban_SUCCESS_12_04");	//Sancho ist es eigentlich egal wer Anführer ist. Er steht sowieso nur den ganzen Tag auf seinem Posten und kriegt nicht viel mit.
	AI_Output(other,self,"DIA_Esteban_SUCCESS_12_05");	//Senyan ist auf deiner Seite. Er hält dich für den richtigen Anführer.
	AI_Output(other,self,"DIA_Esteban_SUCCESS_12_06");	//Das wären alle.
	AI_Output(self,other,"DIA_Esteban_SUCCESS_12_08");	//Das klingt gut. Sieht so aus, als ob meine Zeit gekommen wäre.
	AI_Output(self,other,"DIA_Esteban_SUCCESS_12_09");	//Damit hast du mir den Weg zu meiner Führung frei gemacht. Hehe.
	AI_Output(self,other,"DIA_Esteban_SUCCESS_12_10");	//Hier, dass ist für deine Arbeit.
	AI_Output(self,other,"DIA_Esteban_SUCCESS_12_11");	//Und jetzt geh'. Ich kann dich jetzt nicht mehr gebrauchen.
	B_GiveInvItems(self,other,estebans_bogen,1);
	ESTEBAN_LEADER = LOG_SUCCESS;
	B_GiveXP(XP_ESTEBAN);
	Log_SetTopicStatus(CH1_ESTEBANQUENTIN,LOG_SUCCESS);
	B_LogEntry(CH1_ESTEBANQUENTIN,"Esteban war zufrieden mit meiner Arbeit und ist sich sicher, dass er der bessere Anführer wäre. Danach erzählte er mir, dass er meine Hilfe jetzt nicht mehr gebrauchen kann und einige Vorbereitungen treffen muss. Dank mir, steht ihm jetzt nichts mehr im Weg die Führung des Lagers zu übernehmen.");
};

