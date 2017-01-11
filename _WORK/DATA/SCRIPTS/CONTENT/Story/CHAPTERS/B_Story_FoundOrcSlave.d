
func void B_Story_FoundOrcSlave()
{
	B_LogEntry(CH4_UluMulu,"Ich habe den Freund von Ur-Shak in einem unteren Stollen der Freien Mine gefunden. Er heißt Tarrok, ist allerdings vergiftet und benötigt dringend eine spezielle Flasche Ork-Medizin, die er bei seiner Flucht hierher verloren hat. Sie liegt irgendwo hier in den unteren Stollen der Mine. Ich muß sie wiederfinden, sonst stirbt er.");
	B_GiveXP(XP_FoundOrcSlave);
	FreemineOrc_SuchePotion = LOG_RUNNING;
};

