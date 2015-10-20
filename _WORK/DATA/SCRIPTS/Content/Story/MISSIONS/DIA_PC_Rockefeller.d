instance DIA_Rockefeller_KAPITEL(C_Info)
{
	npc = PC_Rockefeller;
	nr = 1;
	condition = DIA_Rockefeller_KAPITEL_condition;
	information = DIA_Rockefeller_KAPITEL_info;
	permanent = 0;
	important = 0;
	description = "Ich möchte ein anderes Kapitel spielen.";
};


func int DIA_Rockefeller_KAPITEL_condition()
{
	if (Kapitel == 1)
	{
		return 1;
	};
};

func void DIA_Rockefeller_KAPITEL_info()
{
	AI_Output(self,other,"DIA_Rockefeller_KAPITEL_04_00");	//Welches?
	Info_ClearChoices(DIA_Rockefeller_KAPITEL);
	Info_AddChoice(DIA_Rockefeller_KAPITEL,"Das sechste Kapitel.",DIA_Rockefeller_KAPITEL_6);
	Info_AddChoice(DIA_Rockefeller_KAPITEL,"Das fünfte Kapitel.",DIA_Rockefeller_KAPITEL_5);
	Info_AddChoice(DIA_Rockefeller_KAPITEL,"Das vierte Kapitel.",DIA_Rockefeller_KAPITEL_4);
	Info_AddChoice(DIA_Rockefeller_KAPITEL,"Das dritte Kapitel.",DIA_Rockefeller_KAPITEL_3);
	Info_AddChoice(DIA_Rockefeller_KAPITEL,"Das zweite Kapitel.",DIA_Rockefeller_KAPITEL_2);
};

func void DIA_Rockefeller_KAPITEL_2()
{
	B_Kapitelwechsel(2);
	Info_ClearChoices(DIA_Rockefeller_KAPITEL);
};

func void DIA_Rockefeller_KAPITEL_3()
{
	B_Kapitelwechsel(2);
	B_Kapitelwechsel(3);
	Info_ClearChoices(DIA_Rockefeller_KAPITEL);
};

func void DIA_Rockefeller_KAPITEL_4()
{
	B_Kapitelwechsel(2);
	B_Kapitelwechsel(3);
	B_Kapitelwechsel(4);
	Info_ClearChoices(DIA_Rockefeller_KAPITEL);
};


func void DIA_Rockefeller_KAPITEL_5()
{
	B_Kapitelwechsel(2);
	B_Kapitelwechsel(3);
	B_Kapitelwechsel(4);
	B_Kapitelwechsel(5);
	Info_ClearChoices(DIA_Rockefeller_KAPITEL);
};

func void DIA_Rockefeller_KAPITEL_6()
{
	B_Kapitelwechsel(2);
	B_Kapitelwechsel(3);
	B_Kapitelwechsel(4);
	B_Kapitelwechsel(5);
	B_Kapitelwechsel(6);
	Info_ClearChoices(DIA_Rockefeller_KAPITEL);
};
