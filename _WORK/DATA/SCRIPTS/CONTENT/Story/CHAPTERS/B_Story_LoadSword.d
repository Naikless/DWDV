
func void B_Story_LoadSword()
{
	var C_Npc milten;
	B_LogEntry(CH5_Uriziel,"Xardas hat die Zauberformel fertiggestellt. Ich benötige jetzt eine sehr große magische Energiequelle und einen hilfsbereiten Magier, der mich bei meinem Vorhaben unterstützt. Zufälligerweise gibt es eine Gemeinschaft in der Kolonie, die eine solche Energiequelle besitzt und sie steht tief in meiner Schuld...");
	B_GiveXP(XP_ReturnedFromSunkenTower);
	CreateInvItem(hero,Scroll4Milten);
	milten = Hlp_GetNpc(PC_Mage);
	Npc_ExchangeRoutine(milten,"LSWait");
	LoadSword = TRUE;
};

