
func void B_Story_LoadSword()
{
	var C_Npc milten;
	B_LogEntry(CH5_Uriziel,"Xardas hat die Zauberformel fertiggestellt. Ich ben�tige jetzt eine sehr gro�e magische Energiequelle und einen hilfsbereiten Magier, der mich bei meinem Vorhaben unterst�tzt. Zuf�lligerweise gibt es eine Gemeinschaft in der Kolonie, die eine solche Energiequelle besitzt und sie steht tief in meiner Schuld...");
	B_GiveXP(XP_ReturnedFromSunkenTower);
	CreateInvItem(hero,Scroll4Milten);
	milten = Hlp_GetNpc(PC_Mage);
	Npc_ExchangeRoutine(milten,"LSWait");
	LoadSword = TRUE;
};

