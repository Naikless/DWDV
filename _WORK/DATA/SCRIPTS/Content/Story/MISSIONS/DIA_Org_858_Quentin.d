
instance DIA_QUENTIN_EXIT(C_Info)
{
	npc = Org_858_Quentin;
	nr = 999;
	condition = dia_quentin_exit_condition;
	information = dia_quentin_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_quentin_exit_condition()
{
	return 1;
};

func void dia_quentin_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_QUENTIN_FIRST(C_Info)
{
	npc = Org_858_Quentin;
	nr = 1;
	condition = dia_quentin_first_condition;
	information = dia_quentin_first_info;
	permanent = 0;
	important = 1;
};


func int dia_quentin_first_condition()
{
	if(Npc_KnowsInfo(hero,grd_5018_ramon_letsgo))
	{
		return 1;
	};
};

func void dia_quentin_first_info()
{
	AI_Output(self,other,"DIA_Quentin_First_06_00");	//Wen haben wir denn da? Ein paar von Gomez' Schergen die zur alten Mine wollen?
	AI_Output(self,other,"DIA_Quentin_First_06_01");	//Ihr hättet einen Umweg in kauf nehmen sollen, leider bezahlt ihr den Fehler jetzt mit eurem Leben.
	AI_Output(self,other,"DIA_Quentin_First_06_02");	//JUNGS! ANGRIFF!
	B_ChangeGuild(Org_865_Raeuber,GIL_ZOMBIE);
	B_ChangeGuild(Org_874_Raeuber,GIL_ZOMBIE);
	B_ChangeGuild(self,GIL_ZOMBIE);
	AI_StopProcessInfos(self);
	B_LogEntry(CH2_KONVOIOC,"Kurz vor unserem Ziel, wurden Ramon und ich von einigen Räubern aus dem neuen Lager überfallen. Der Anführer der Gruppe hieß Quentin.");
};


instance DIA_QUENTIN_SECOND(C_Info)
{
	npc = Org_858_Quentin;
	nr = 1;
	condition = dia_quentin_second_condition;
	information = dia_quentin_second_info;
	permanent = 0;
	important = 1;
};


func int dia_quentin_second_condition()
{
	if(Npc_KnowsInfo(hero,dia_gorn_ueberfall))
	{
		return 1;
	};
};

func void dia_quentin_second_info()
{
	AI_Output(self,other,"DIA_Quentin_Angriff_06_01");	//Psst. Leise!
	AI_Output(self,other,"DIA_Quentin_Angriff__06_02");	//Gut das ihr da seit. Da vorne sitzen Gomez' Leute.
	AI_Output(self,other,"DIA_Quentin_First_06_03");	//Scheinbar machen sie gerade eine kurze Pause.
	AI_Output(self,other,"DIA_Quentin_First_06_04");	//Das können wir ausnutzen.
	AI_Output(self,other,"DIA_Quentin_First_06_05");	//Wenn du loslegen willst, fang an, wir folgen dann.
	AI_StopProcessInfos(self);
	B_ChangeGuild(grd_5018_ramon,GIL_ZOMBIE);
	B_ChangeGuild(grd_5014_convoitraeger,GIL_ZOMBIE);
	B_ChangeGuild(grd_5015_convoitraeger,GIL_ZOMBIE);
	B_ChangeGuild(grd_5016_convoiwache,GIL_ZOMBIE);
	B_ChangeGuild(grd_5017_convoiwache,GIL_ZOMBIE);
};


instance DIA_QUENTIN_THIRD(C_Info)
{
	npc = Org_858_Quentin;
	nr = 1;
	condition = dia_quentin_third_condition;
	information = dia_quentin_third_info;
	permanent = 0;
	important = 1;
};


func int dia_quentin_third_condition()
{
	if((Npc_KnowsInfo(hero,dia_quentin_second) && grd_5018_ramon.aivar[AIV_WASDEFEATEDBYSC] && grd_5014_convoitraeger.aivar[AIV_WASDEFEATEDBYSC] && grd_5015_convoitraeger.aivar[AIV_WASDEFEATEDBYSC] && grd_5016_convoiwache.aivar[AIV_WASDEFEATEDBYSC] && grd_5017_convoiwache.aivar[AIV_WASDEFEATEDBYSC]) || (Npc_KnowsInfo(hero,dia_quentin_second) && Npc_IsDead(grd_5018_ramon) && Npc_IsDead(grd_5014_convoitraeger) && Npc_IsDead(grd_5015_convoitraeger) && Npc_IsDead(grd_5016_convoiwache) && Npc_IsDead(grd_5017_convoiwache)))
	{
		return 1;
	};
};

func void dia_quentin_third_info()
{
	AI_Output(self,other,"DIA_Quentin_Third_06_00");	//Okay Junge, gute Arbeit. Die haben genug, hehe.
	AI_Output(self,other,"DIA_Quentin_Third_06_02");	//Du bekommst die Hälfte der Beute ab und wir die andere Hälfte. So läuft das bei uns.
	AI_Output(self,other,"DIA_Quentin_Third_06_03");	//Hier ist dein Anteil.
	AI_Output(self,other,"DIA_Quentin_Third_06_04");	//Ach, noch was. Willkommen in der Bande!
	AI_Output(self,other,"DIA_Quentin_Third_06_05");	//Wenn du willst, kannst du uns ja mal in unserem Lager in den Bergen besuchen.
	AI_Output(self,other,"DIA_Quentin_Third_06_06");	//Wir sehn' uns.
	CreateInvItems(self,ItFoApple,21);
	B_GiveInvItems(self,other,ItFoApple,21);
	Npc_RemoveInvItems(other,ItFoApple,21);
	CreateInvItems(other,ItMw_1H_LightGuardsSword_03,1);
	CreateInvItems(other,ItFoApple,5);
	CreateInvItems(other,ItFoLoaf,5);
	CreateInvItems(other,ItFoCheese,5);
	CreateInvItems(other,ItFoBeer,5);
	B_LogEntry(CH2_KONVOINC,"Quentin, der Anführer des Überfallkommandos war zufrieden mit meiner Arbeit und erklärte mir wie Beute unter Banditen aufgeteilt wird. Anschliessend ging er zurück in die Berge. Ich soll ihn dort mal besuchen, wenn ich dazu komme.");
	AI_StopProcessInfos(self);
};


instance DIA_QUENTIN_WER(C_Info)
{
	npc = Org_858_Quentin;
	nr = 1;
	condition = dia_quentin_wer_condition;
	information = dia_quentin_wer_info;
	permanent = 0;
	important = 0;
	description = "Wer bist du?";
};


func int dia_quentin_wer_condition()
{
	return 1;
};

func void dia_quentin_wer_info()
{
	AI_Output(other,self,"DIA_Quentin_Wer_06_00");	//Wer bist du?
	AI_Output(self,other,"DIA_Quentin_Wer_06_01");	//Ich bin Quentin. Ich bin der Chef dieses Lagers und kümmere mich darum das hier alles glatt geht.
};


instance DIA_QUENTIN_LAGER(C_Info)
{
	npc = Org_858_Quentin;
	nr = 1;
	condition = dia_quentin_lager_condition;
	information = dia_quentin_lager_info;
	permanent = 0;
	important = 0;
	description = "Was ist das hier für ein Lager?";
};


func int dia_quentin_lager_condition()
{
	if(Npc_KnowsInfo(hero,dia_quentin_wer))
	{
		return 1;
	};
};

func void dia_quentin_lager_info()
{
	AI_Output(other,self,"DIA_Quentin_Lager_06_00");	//Was ist das hier für ein Lager?
	AI_Output(self,other,"DIA_Quentin_Lager_06_01");	//Das hier ist das Räuberlager. Wir leben von der Jagd und von Überfällen auf das Alte Lager.
	AI_Output(self,other,"DIA_Quentin_Lager_06_02");	//Ich hab' vor einiger Zeit ein Bündnis mit Lares, dem Chef der Banditen des Neuen Lagers ausgehandelt, dass wir sie bei Überfällen unterstützen.
	AI_Output(self,other,"DIA_Quentin_Lager_06_03");	//Eine Hälfte der Beute kriegt da Neue Lager und die Andere wir.
};


instance DIA_QUENTIN_RUESTUNGEN(C_Info)
{
	npc = Org_858_Quentin;
	nr = 1;
	condition = dia_quentin_ruestungen_condition;
	information = dia_quentin_ruestungen_info;
	permanent = 0;
	important = 0;
	description = "Sind das nicht Rüstungen des Neuen Lagers?";
};


func int dia_quentin_ruestungen_condition()
{
	if(Npc_KnowsInfo(hero,dia_quentin_wer))
	{
		return 1;
	};
};

func void dia_quentin_ruestungen_info()
{
	AI_Output(other,self,"DIA_Quentin_Ruestungen_06_00");	//Sind das nicht Rüstungen des Neuen Lagers?
	AI_Output(self,other,"DIA_Quentin_Ruestungen_06_01");	//Das hast du richtig beobachtet.
	AI_Output(self,other,"DIA_Quentin_Ruestungen_06_02");	//Vor ein paar Jahren haben wir dem Neuen Lager angehört. Allerdings ging mir der Ärger den Söldnern auf den Sack. Lee meinte immer, er hätte uns Banditen was zu sagen.
	AI_Output(self,other,"DIA_Quentin_Ruestungen_08_02");	//Weißt du, wir Banditen sind die Einzigen dort die sich gegen Gomez' Leute wehren.
	AI_Output(self,other,"DIA_Quentin_Ruestungen_08_03");	//Und die Söldner?
	AI_Output(self,other,"DIA_Quentin_Ruestungen_06_02");	//Vor ein paar Jahren haben wir dem Neuen Lager angehört. Allerdings ging mir der Ärger den Söldnern auf den Sack. Lee meinte immer, er hätte uns Banditen was zu sagen.
	AI_Output(self,other,"DIA_Quentin_Ruestungen_06_03");	//Also hab' ich die Unabhängigkeit gesucht. Ich wollte einfach für mich allein Leben. Weit weg von alle dem.
	AI_Output(self,other,"DIA_Quentin_Ruestungen_06_04");	//Hier in diesem Tal hab' ich die Unabhängigkeit gefunden.
};


instance DIA_QUENTIN_HOEHLE(C_Info)
{
	npc = Org_858_Quentin;
	nr = 1;
	condition = dia_quentin_hoehle_condition;
	information = dia_quentin_hoehle_info;
	permanent = 0;
	important = 0;
	description = "Was ist das für eine Höhle hier?";
};


func int dia_quentin_hoehle_condition()
{
	if(Npc_KnowsInfo(hero,dia_quentin_wer))
	{
		return 1;
	};
};

func void dia_quentin_hoehle_info()
{
	AI_Output(other,self,"DIA_Quentin_Hoehle_06_00");	//Was ist das für eine Höhle hier?
	AI_Output(self,other,"DIA_Quentin_Hoehle_06_01");	//Das weiß ich nicht.
	AI_Output(self,other,"DIA_Quentin_Hoehle_06_02");	//Ich denk' es handelt sich hierbei möglicherweise um einen eingestürzten Minenstollen.
	AI_Output(self,other,"DIA_Quentin_Hoehle_06_03");	//Wenn wir den frei bekommen würden, hätten wir Erz und könnten mit den Lagern handeln.
	AI_Output(other,self,"DIA_Quentin_Hoehle_06_04");	//Womit handelt ihr zur Zeit?
	AI_Output(self,other,"DIA_Quentin_Hoehle_06_05");	//Vor allem mit Tiertrophäen, die wir durch die Jagd erhalten. Krallen, Felle, Zähne, alles hat einen Wert.
	AI_Output(self,other,"DIA_Quentin_Hoehle_06_06");	//Damit kommen wir aber zurzeit noch gut über die Runden.
};

