
instance MENU_OPT_GRAPHICS(C_MENU_DEF)
{
	backpic = MENU_BACK_PIC;
	items[0] = "MENUITEM_GRA_HEADLINE";
	items[1] = "MENUITEM_GRA_TEXQUAL";
	items[2] = "MENUITEM_GRA_TEXQUAL_SLIDER";
	items[3] = "MENUITEM_GRA_MODEL_DETAIL";
	items[4] = "MENUITEM_GRA_MODEL_DETAIL_SLIDER";
	items[5] = "MENUITEM_GRA_SIGHT";
	items[6] = "MENUITEM_GRA_SIGHT_CHOICE";
	items[7] = "MENUITEM_GRA_SKY_EFFECTS";
	items[8] = "MENUITEM_GRA_SKY_EFFECTS_CHOICE";
	items[9] = "MENUITEM_GRA_BACK";
	flags = flags | MENU_SHOW_INFO;
};

instance MENUITEM_GRA_HEADLINE(C_MENU_ITEM_DEF)
{
	text[0] = "GRAFIK EINSTELLUNGEN";
	type = MENU_ITEM_TEXT;
	posx = 0;
	posy = MENU_TITLE_Y;
	dimx = 8100;
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_GRA_TEXQUAL(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Textur Details";
	text[1] = "Detailstufe der Texturen.";
	posx = 1000;
	posy = MENU_START_Y + (MENU_DY * 0);
	dimx = 3000;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GRA_TEXQUAL_SLIDER(C_MENU_ITEM_DEF)
{
	backpic = MENU_SLIDER_BACK_PIC;
	type = MENU_ITEM_SLIDER;
	posx = 5000;
	posy = MENU_START_Y + (MENU_DY * 0) + MENU_SLIDER_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_SLIDER_DY;
	onchgsetoption = "texDetailIndex";
	onchgsetoptionsection = "INTERNAL";
	userfloat[0] = 5;
	userstring[0] = MENU_SLIDER_POS_PIC;
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER | IT_PERF_OPTION | IT_NEEDS_RESTART;
};

instance MENUITEM_GRA_MODEL_DETAIL(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Modell Details";
	text[1] = "Detailstufe von Objekten.";
	posx = 1000;
	posy = MENU_START_Y + (MENU_DY * 1);
	dimx = 3000;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GRA_MODEL_DETAIL_SLIDER(C_MENU_ITEM_DEF)
{
	backpic = MENU_SLIDER_BACK_PIC;
	type = MENU_ITEM_SLIDER;
	posx = 5000;
	posy = MENU_START_Y + (MENU_DY * 1) + MENU_SLIDER_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_SLIDER_DY;
	onchgsetoption = "modelDetail";
	onchgsetoptionsection = "PERFORMANCE";
	userfloat[0] = 10;
	userstring[0] = MENU_SLIDER_POS_PIC;
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_PERF_OPTION;
};

instance MENUITEM_GRA_SIGHT(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Sichtweite";
	text[1] = "Regelung der Sichtweite in Prozent.";
	posx = 1000;
	posy = MENU_START_Y + (MENU_DY * 2);
	dimx = 3000;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GRA_SIGHT_CHOICE(C_MENU_ITEM_DEF)
{
	backpic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "20%|40%|60%|80%|100%|120%|140%|160%|180%|200%|220%|240%|260%|280%|300%";
	fontname = MENU_FONT_SMALL;
	posx = 5000;
	posy = MENU_START_Y + (MENU_DY * 2) + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "sightValue";
	onchgsetoptionsection = "PERFORMANCE";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_PERF_OPTION | IT_TXT_CENTER;
};

instance MENUITEM_GRA_SKY_EFFECTS(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Himmelseffekte";
	text[1] = "Himmelseffekte an- bzw. abschalten.";
	posx = 1000;
	posy = MENU_START_Y + (MENU_DY * 3);
	dimx = 3000;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GRA_SKY_EFFECTS_CHOICE(C_MENU_ITEM_DEF)
{
	backpic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "nein|ja";
	fontname = MENU_FONT_SMALL;
	posx = 5000;
	posy = MENU_START_Y + (MENU_DY * 3) + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "skyEffects";
	onchgsetoptionsection = "GAME";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_GRA_BACK(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Zur�ck";
	posx = 1000;
	posy = MENU_BACK_Y;
	dimx = 6192;
	dimy = MENU_DY;
	onselaction[0] = SEL_ACTION_BACK;
	flags = flags | IT_TXT_CENTER;
};

