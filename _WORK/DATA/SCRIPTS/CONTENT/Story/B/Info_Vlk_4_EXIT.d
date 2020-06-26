
instance Info_Vlk_4_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Vlk_4_EXIT_Condition;
	information = Info_Vlk_4_EXIT_Info;
	permanent = 1;
	description = "ENDE";
};


func int Info_Vlk_4_EXIT_Condition()
{
	return 1;
};

func void Info_Vlk_4_EXIT_Info()
{
	AI_Output(other,self,"Info_Vlk_4_EinerVonEuchWerden_15_00");	//Danke. Mach's gut.
	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_01");	//Halt die Ohren steif, Junge.
	AI_StopProcessInfos(self);
};


instance Info_Vlk_4_EinerVonEuchWerden(C_Info)
{
	nr = 4;
	condition = Info_Vlk_4_EinerVonEuchWerden_Condition;
	information = Info_Vlk_4_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "Was mu� ich tun, um in diesem Lager aufgenommen zu werden?";
};


func int Info_Vlk_4_EinerVonEuchWerden_Condition()
{
	if(Npc_GetTrueGuild(other) == GIL_None)
	{
		return TRUE;
	};
};

func void Info_Vlk_4_EinerVonEuchWerden_Info()
{
	var C_Npc Thorus;
	AI_Output(other,self,"Info_Vlk_4_EinerVonEuchWerden_15_01");	//Was muss ich tun, um in diesem Lager aufgenommen zu werden?
	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_04");	//Als Schatten oder Gardist meinst du? Das wird nicht leicht, Junge. Du wirst einige Pr�fungen bestehen m�ssen, bevor der alte Thorus dich Gomez vorstellt.
	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_02");	//Und du musst dich mit den Leuten hier gut stellen. Aber solange du keinem Lager angeh�rst, nimmt dich keiner ernst.
	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_03");	//Wenn ich du w�re, w�rde ich mich bei den Schatten umh�ren. Unter ihnen findest du noch am ehesten einen, der dir hilft. Nat�rlich nur f�r eine Gegenleistung.
	Thorus = Hlp_GetNpc(GRD_200_Thorus);
	Thorus.aivar[AIV_FINDABLE] = TRUE;
};


instance Info_Vlk_4_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Vlk_4_WichtigePersonen_Condition;
	information = Info_Vlk_4_WichtigePersonen_Info;
	permanent = 1;
	description = "Gibt es hier Leute, die ich kennen sollte?";
};


func int Info_Vlk_4_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Vlk_4_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Vlk_4_WichtigePersonen_15_00");	//Gibt es hier Leute, die ich kennen sollte?
	if(Npc_GetTrueGuild(hero) == GIL_EBR)
	{
		AI_Output(self,other,"Info_Vlk_4_WichtigePersonen_04_03");	//Du? Junge, du bist einer der Erzbarone. Es gibt wohl kaum noch jemanden der dir bei irgendwas behilflich sein sollte.
	}
	else
	{
		AI_Output(self,other,"Info_Vlk_4_WichtigePersonen_04_01");	//Als Neuer solltest du's dir nicht mit Gravo verscherzen. Er ist zwar nur ein Buddler, aber er hat Beziehungen bis zu den Erzbaronen.
		AI_Output(self,other,"Info_Vlk_4_WichtigePersonen_04_02");	//Wenn du mal ein Problem mit Gomez' Leuten hast, kann er dir helfen dich freizukaufen.
	};
};


instance Info_Vlk_4_DasLager(C_Info)
{
	nr = 2;
	condition = Info_Vlk_4_DasLager_Condition;
	information = Info_Vlk_4_DasLager_Info;
	permanent = 1;
	description = "Was gibt es hier f�r wichtige Orte?";
};


func int Info_Vlk_4_DasLager_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_None)
	{
		return 1;
	};
};

func void Info_Vlk_4_DasLager_Info()
{
	AI_Output(other,self,"Info_Vlk_4_DasLager_15_00");	//Was gibt es hier f�r wichtige Orte?
	AI_Output(self,other,"Info_Vlk_4_DasLager_04_01");	//Wenn du keine Lust hast, in den Minen zu schuften, solltest du dich am Eingangsplatz zwischen Nordtor und Burgtor rumtreiben.
	AI_Output(self,other,"Info_Vlk_4_DasLager_04_02");	//Wenn du Gl�ck hast, gibt Thorus oder Diego dir 'ne Aufgabe - dann kannst du dich bew�hren. Ist bestimmt nicht schlecht, zu Gomez' Leuten zu geh�ren.
	AI_Output(self,other,"Info_Vlk_4_DasLager_04_03");	//Oder du hast das Gl�ck einen Magier zu treffen. Sie wollen manchmal, dass du einen Botengang f�r sie erledigst. Sie zahlen immer gut.
	AI_Output(other,self,"Info_Vlk_4_DasLager_15_04");	//Die Magier kommen aus der Burg raus? Wann?
	AI_Output(self,other,"Info_Vlk_4_DasLager_04_05");	//Was wei� ich. Frag die Leute, die da wohnen.
};


instance Info_Vlk_4_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Vlk_4_DieLage_Condition;
	information = Info_Vlk_4_DieLage_Info;
	permanent = 1;
	description = "Alles klar?";
};


func int Info_Vlk_4_DieLage_Condition()
{
	return 1;
};

func void Info_Vlk_4_DieLage_Info()
{
	AI_Output(other,self,"Info_Vlk_4_DieLage_15_00");	//Alles klar?
	if(Npc_GetTrueGuild(hero) == GIL_EBR)
	{
		AI_Output(self,other,"Info_Vlk_4_DieLage_04_02");	//Du hast dich ganz sch�n gemacht. Erzbaron, ein Titel den nicht jeder tragen darf, Jungchen.
		AI_Output(self,other,"Info_Vlk_4_DieLage_04_03");	//Du hast es bis nach ganz oben geschafft.
	}
	else
	{
		AI_Output(self,other,"Info_Vlk_4_DieLage_04_01");	//So klar wie vor 20 Jahren. Und seitdem hat sich hier nicht viel ver�ndert.
	};
};


instance INFO_VLK_4_GESCHICHTE(C_Info)
{
	nr = 12;
	condition = info_vlk_4_geschichte_condition;
	information = info_vlk_4_geschichte_info;
	permanent = 1;
	description = "Kannst du mir was interessantes erz�hlen?";
};


func int info_vlk_4_geschichte_condition()
{
	return 1;
};

func void info_vlk_4_geschichte_info()
{
	var int geschichten;
	AI_Output(other,self,"Info_Vlk_4_Geschichte_15_00");	//Kannst du mir was interessantes erz�hlen?
	geschichten = Hlp_Random(100);
	if(geschichten < 25)
	{
		AI_Output(self,other,"Info_Vlk_4_Geschichte_14_00");	//Hat dir jemand schonmal vom gro�en Aufstand erz�hlt?
		AI_Output(self,other,"Info_Vlk_4_Geschichte_14_01");	//Der Tag an dem die Barriere errichtet wurde, begann wie jeder andere auch.
		AI_Output(self,other,"Info_Vlk_4_Geschichte_14_02");	//Wir Gefangenen sa�en im Innenhof der Burg und sollten gerade zur Verlassenen Mine aufbrechen, um unserer Arbeit nachzugehen.
		AI_Output(self,other,"Info_Vlk_4_Geschichte_14_03");	//Pl�tzlich gab es einen lauten Knall und der Himmel w�rde mit Blitzen �berzogen.
		AI_Output(self,other,"Info_Vlk_4_Geschichte_14_04");	//Dann spannte sich eine blaue Kuppel �ber das gesamte Tal. Heute als "Die Barriere" bekannt.
		AI_Output(self,other,"Info_Vlk_4_Geschichte_14_05");	//Die Aufseher waren wahrscheinlich nicht in die Pl�ne eingeweiht, da sie genau so �berrascht wie wir in den Himmel starrten.
		AI_Output(self,other,"Info_Vlk_4_Geschichte_14_06");	//Aber es gab unter den Gefangenen auch Leute, die die fehlende Aufmerksamkeit ausnutzten.
		AI_Output(self,other,"Info_Vlk_4_Geschichte_14_07");	//Gomez und seine Jungs sahen ihre Chance und griffen die Aufseher an.
		AI_Output(self,other,"Info_Vlk_4_Geschichte_14_08");	//Die Spitzhacken, mit denen wir eigentlich unsere Arbeit verrichten sollten, dienten als Waffen um die Aufseher umzubringen.
		AI_Output(self,other,"Info_Vlk_4_Geschichte_14_09");	//Als die Aufseher alle tot waren, gab Gomez' die Anweisung das sich seine Leute die Waffen und R�stungen der Aufseher nehmen sollten.
		AI_Output(self,other,"Info_Vlk_4_Geschichte_14_10");	//Die Leichen warfen sie anschliessend in den Fluss, als Futter f�r die Snapper.
		AI_Output(self,other,"Info_Vlk_4_Geschichte_14_11");	//Danach begann die Herrschaft von Gomez'.
		AI_Output(self,other,"Info_Vlk_4_Geschichte_14_12");	//Glaub' mir Junge. Wenn du sowas einmal miterlebt hast, vergisst du es nie wieder.
	}
	else if(geschichten < 50)
	{
		AI_Output(self,other,"Info_Vlk_4_Geschichte_13_00");	//Kennst du die Geschichte der Entstehung des Sektenlagers?
		AI_Output(self,other,"Info_Vlk_4_Geschichte_13_01");	//Damals, es ist schon einige Jahre her, war Y'Berion ein Buddler wie jeder andere hier.
		AI_Output(self,other,"Info_Vlk_4_Geschichte_13_02");	//Eines Tages, stand er morgens am Marktplatz und erz�hlte den anderen, dass er eine Vision gehabt h�tte.
		AI_Output(self,other,"Info_Vlk_4_Geschichte_13_03");	//Er faselte was von "Schl�fer", "Ruinen im Sumpf" und "Freiheit".
		AI_Output(self,other,"Info_Vlk_4_Geschichte_13_04");	//Die meisten hier hatten f�r den Schwachsinn nicht viel �brig. Aber es gab auch einige der Buddler, die ihn derart �berzeugend fanden, dass sie sich ihm anschlossen.
		AI_Output(self,other,"Info_Vlk_4_Geschichte_13_05");	//Zusammen zogen sie einige Zeit sp�ter in den Sumpf. Dort errichteten sie ihr Lager.
		AI_Output(self,other,"Info_Vlk_4_Geschichte_13_06");	//Sp�ter fanden sie dann im Sumpf das Sumpfkraut. Die meisten der Sektenangeh�rigen meinten, dass sie der Schl�fer darauf aufmerksam gemacht hat. Aber wenn du mich fragst, hat einer von denen nur irgendwas zu rauchen gesucht.
		AI_Output(self,other,"Info_Vlk_4_Geschichte_13_07");	//Wie auch immer. Als die anderen Lager davon Wind bekamen, ging dann der Handel mit dem Zeug los. Y'Berion und seine Leute bekamen daf�r alles was sie zum Leben brauchten.
		AI_Output(self,other,"Info_Vlk_4_Geschichte_13_08");	//Das Kraut ist aber auch ein Grund, weshalb sich viele Leute Y'Berion anschlossen.
		AI_Output(self,other,"Info_Vlk_4_Geschichte_13_09");	//Trotzdem, bis heute hat sich der Schl�fer nicht mehr bei Y'Berion gemeldet.
		AI_Output(self,other,"Info_Vlk_4_Geschichte_13_10");	//Ich halte das alles eh f�r Schwachsinn. Wenn du aber was zu rauchen suchst, ist das Sektenlager der richtige Ort.
	}
	else if(geschichten < 75)
	{
		AI_Output(self,other,"Info_Vlk_4_Geschichte_12_00");	//Wir hatten mal einen Erzbaron im Lager, der war nicht so wie Gomez und die anderen Erzbarone.
		AI_Output(self,other,"Info_Vlk_4_Geschichte_12_01");	//Er war mehr auf Abenteuer aus und erforschte die Ruinen der Kolonie.
		AI_Output(self,other,"Info_Vlk_4_Geschichte_12_02");	//Man sagt, er ginge irgendwann ins Orkgebiet um irgendein Artefakt dort zu finden.
		AI_Output(self,other,"Info_Vlk_4_Geschichte_12_03");	//Naja, die Suche war nicht gerade erfolgreich. Er kehrte nie wieder zur�ck.
		AI_Output(self,other,"Info_Vlk_4_Geschichte_12_04");	//Es gibt allerdings Ger�chte, er sei noch am Leben und wache �ber diese Artefakt.
		AI_Output(self,other,"Info_Vlk_4_Geschichte_12_05");	//Wie gesagt, es sind nur Ger�chte. Ich kann mir nicht vorstellen, dass da was dran ist.
	};
};

func void B_AssignAmbientInfos_Vlk_4(var C_Npc slf)
{
	B_AssignFindNpc_OC(slf);
	Info_Vlk_4_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_4_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_4_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_4_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_4_DieLage.npc = Hlp_GetInstanceID(slf);
	info_vlk_4_geschichte.npc = Hlp_GetInstanceID(slf);
};

