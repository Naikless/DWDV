
instance Info_Mine_Vlk_2_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Mine_Vlk_2_EXIT_Condition;
	information = Info_Mine_Vlk_2_EXIT_Info;
	permanent = 1;
	description = "ENDE";
};


func int Info_Mine_Vlk_2_EXIT_Condition()
{
	return 1;
};

func void Info_Mine_Vlk_2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Mine_Vlk_2_Mine(C_Info)
{
	nr = 4;
	condition = Info_Mine_Vlk_2_Mine_Condition;
	information = Info_Mine_Vlk_2_Mine_Info;
	permanent = 1;
	description = "Erzähl mir was von der Mine";
};


func int Info_Mine_Vlk_2_Mine_Condition()
{
	if(Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Mine_Vlk_2_Mine_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_2_Mine_15_00");	//Erzähl mir was von der Mine
	AI_Output(self,other,"Info_Mine_Vlk_2_Mine_01_01");	//Es gibt einen ganzen Haufen Höhlen, in denen auch noch Erz zu holen ist. Aber die Crawler, machen die Arbeit darin unmöglich.
	AI_Output(self,other,"Info_Mine_Vlk_2_Mine_01_02");	//Zu viele Angriffe, zu viele Verluste.
};


instance Info_Mine_Vlk_2_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Mine_Vlk_2_WichtigePersonen_Condition;
	information = Info_Mine_Vlk_2_WichtigePersonen_Info;
	permanent = 1;
	description = "Wer hat hier was zu Sagen?";
};


func int Info_Mine_Vlk_2_WichtigePersonen_Condition()
{
	if(Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Mine_Vlk_2_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_2_WichtigePersonen_15_00");	//Wer hat hier was zu sagen?
	AI_Output(self,other,"Info_Mine_Vlk_2_WichtigePersonen_01_01");	//Viper ist der Schmelzer. Er kennt sich mit dem Ofen aus. Er hat einen Körper aus Stahl. Ihm macht die Hitze nichts aus. Den ganzen Tag schmilzt er das Erz ein.
};


instance Info_Mine_Vlk_2_Minecrawler(C_Info)
{
	nr = 2;
	condition = Info_Mine_Vlk_2_Minecrawler_Condition;
	information = Info_Mine_Vlk_2_Minecrawler_Info;
	permanent = 1;
	description = "Was weißt Du über Minecrawler?";
};


func int Info_Mine_Vlk_2_Minecrawler_Condition()
{
	if(Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Mine_Vlk_2_Minecrawler_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_2_Minecrawler_15_00");	//Was weißt du über Minecrawler?
	AI_Output(self,other,"Info_Mine_Vlk_2_Minecrawler_01_01");	//Wir haben den großen Schacht ganz unten zugemacht. Da gibt's zu viele Minecrawler.
	AI_Output(self,other,"Info_Mine_Vlk_2_Minecrawler_01_02");	//Hier gibt's überall Minecrawler. Hörst du sie? Ich kann sie hören!
};


instance Info_Mine_Vlk_2_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Mine_Vlk_2_DieLage_Condition;
	information = Info_Mine_Vlk_2_DieLage_Info;
	permanent = 1;
	description = "Wie sieht's aus?";
};


func int Info_Mine_Vlk_2_DieLage_Condition()
{
	if(Kapitel < 3)
	{
		return 1;
	};
};

func void Info_Mine_Vlk_2_DieLage_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_2_DieLage_15_00");	//Wie sieht's aus?
	AI_Output(self,other,"Info_Mine_Vlk_2_DieLage_01_01");	//Ich muss arbeiten. Wenn die Gardisten sehen, dass ich rede, dann kürzen sie meine Ration.
};

func void B_AssignAmbientInfos_Mine_Vlk_2(var C_Npc slf)
{
	Info_Mine_Vlk_2_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_2_Minecrawler.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_2_Mine.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_2_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_2_DieLage.npc = Hlp_GetInstanceID(slf);
};

