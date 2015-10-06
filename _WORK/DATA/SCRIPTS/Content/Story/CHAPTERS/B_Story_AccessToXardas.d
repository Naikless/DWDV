
func void B_Story_AccessToXardas()
{
	CreateInvItem(hero,ItArRuneTeleport3);
	B_LogEntry(CH4_FindXardas,"Ich habe alle drei Golemherzen an den Wächter-Dämon übergeben. Im Tausch erhielt ich eine Zauberrune der Teleportation. Mal sehen, wo sie mich hinbringt.");
	B_GiveXP(XP_DeliveredGolemhearts);
	FindGolemHearts = 4;
};

