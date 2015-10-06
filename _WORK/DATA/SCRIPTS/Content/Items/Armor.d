
const int ARMOR_VALUE_MULTIPLIER = 30;
const int VALUE_TPL_ARMOR_L = 1350;
const int VALUE_TPL_ARMOR_M = 1650;
const int VALUE_TPL_ARMOR_H = 2100;
const int VALUE_STT_ARMOR_M = 750;
const int VALUE_STT_ARMOR_H = 1200;
const int VALUE_GRD_ARMOR_L = 1350;
const int VALUE_GRD_ARMOR_M = 1650;
const int VALUE_GRD_ARMOR_H = 2100;
const int VALUE_KDF_ARMOR_L = 1200;
const int VALUE_KDF_ARMOR_H = 1500;
const int VALUE_KDW_ARMOR_L = 1950;
const int VALUE_KDW_ARMOR_H = 2100;
const int VALUE_ORG_ARMOR_L = 750;
const int VALUE_ORG_ARMOR_M = 1050;
const int VALUE_ORG_ARMOR_H = 1200;
const int VALUE_SLD_ARMOR_L = 1350;
const int VALUE_SLD_ARMOR_M = 1650;
const int VALUE_SLD_ARMOR_H = 2100;
const int VALUE_NOV_ARMOR_L = 750;
const int VALUE_NOV_ARMOR_M = 1050;
const int VALUE_NOV_ARMOR_H = 1200;
const int VALUE_VLK_ARMOR_L = 250;
const int VALUE_VLK_ARMOR_M = 500;
const int VALUE_SFB_ARMOR_L = 250;
const int VALUE_GUR_ARMOR_M = 1950;
const int VALUE_GUR_ARMOR_H = 2100;
const int VALUE_NON_ARMOR_L = 1700;
const int VALUE_NON_ARMOR_K = 600;
const int VALUE_NON_ARMOR_N = 1250;
const int VALUE_NON_ARMOR_W = 2050;
const int VALUE_NON_ARMOR_U = 800;
const int VALUE_DMB_ARMOR_M = 2600;
const int VALUE_DMB_ARMOR_UPGRADE = 2800;
const int VALUE_GUR_ARMOR_UPGRADE = 2600;

instance VLK_ARMOR_L(C_Item)
{
	name = "Leichte Buddlerhose";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 10;
	protection[PROT_BLUNT] = 10;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 0;
	value = value_vlk_armor_l;
	wear = WEAR_TORSO;
	visual = "vlkl.3ds";
	visual_change = "Hum_VLKL_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance VLK_ARMOR_M(C_Item)
{
	name = "Buddlerhose";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 15;
	protection[PROT_BLUNT] = 15;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 0;
	value = value_vlk_armor_m;
	wear = WEAR_TORSO;
	visual = "vlkm.3ds";
	visual_change = "Hum_VLKM_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance STT_ARMOR_M(C_Item)
{
	name = "Schattenkluft";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 30;
	protection[PROT_BLUNT] = 30;
	protection[PROT_POINT] = 30;
	protection[PROT_FIRE] = 15;
	protection[PROT_MAGIC] = 0;
	value = value_stt_armor_m;
	wear = WEAR_TORSO;
	visual = "sttm.3ds";
	visual_change = "Hum_STTM_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance STT_ARMOR_H(C_Item)
{
	name = "Schattenrüstung";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 40;
	protection[PROT_BLUNT] = 40;
	protection[PROT_POINT] = 40;
	protection[PROT_FIRE] = 20;
	protection[PROT_MAGIC] = 0;
	value = value_stt_armor_h;
	wear = WEAR_TORSO;
	visual = "stth.3ds";
	visual_change = "Hum_STTS_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance GRD_ARMOR_L(C_Item)
{
	name = "Leichte Garderüstung";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 45;
	protection[PROT_BLUNT] = 45;
	protection[PROT_POINT] = 45;
	protection[PROT_FIRE] = 20;
	protection[PROT_MAGIC] = 0;
	value = value_grd_armor_l;
	wear = WEAR_TORSO;
	visual = "grdl.3ds";
	visual_change = "Hum_GRDL_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance GRD_ARMOR_M(C_Item)
{
	name = "Garderüstung";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 55;
	protection[PROT_BLUNT] = 55;
	protection[PROT_POINT] = 55;
	protection[PROT_FIRE] = 25;
	protection[PROT_MAGIC] = 0;
	value = value_grd_armor_m;
	wear = WEAR_TORSO;
	visual = "grdm.3ds";
	visual_change = "Hum_GRDM_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance GRD_ARMOR_H(C_Item)
{
	name = "Schwere Garderüstung";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 70;
	protection[PROT_BLUNT] = 70;
	protection[PROT_POINT] = 70;
	protection[PROT_FIRE] = 35;
	protection[PROT_MAGIC] = 0;
	value = value_grd_armor_h;
	wear = WEAR_TORSO;
	visual = "grdh.3ds";
	visual_change = "Hum_GRDS_ARMOR.asc";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance EBR_ARMOR_M(C_Item)
{
	name = "Prunkgewand";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 70;
	protection[PROT_BLUNT] = 70;
	protection[PROT_POINT] = 70;
	protection[PROT_FIRE] = 25;
	protection[PROT_MAGIC] = 15;
	value = protection[PROT_EDGE] * ARMOR_VALUE_MULTIPLIER;
	wear = WEAR_TORSO;
	ownerGuild = GIL_EBR;
	visual = "ebrm.3ds";
	visual_change = "Hum_EBRM_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance EBR_ARMOR_H(C_Item)
{
	name = "Gomez' Rüstung";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 85;
	protection[PROT_BLUNT] = 85;
	protection[PROT_POINT] = 85;
	protection[PROT_FIRE] = 42;
	protection[PROT_MAGIC] = 3;
	value = protection[PROT_EDGE] * ARMOR_VALUE_MULTIPLIER;
	wear = WEAR_TORSO;
	ownerGuild = GIL_EBR;
	owner = EBR_100_Gomez;
	visual = "ebrh.3ds";
	visual_change = "Hum_EBRS_ARMOR.asc";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance EBR_ARMOR_H2(C_Item)
{
	name = "Schwere Erzbaronrüstung";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 80;
	protection[PROT_BLUNT] = 80;
	protection[PROT_POINT] = 80;
	protection[PROT_FIRE] = 35;
	protection[PROT_MAGIC] = 15;
	value = protection[PROT_EDGE] * ARMOR_VALUE_MULTIPLIER;
	wear = WEAR_TORSO;
	ownerGuild = GIL_EBR;
	visual = "ebrh2.3ds";
	visual_change = "Hum_EBRS_ARMOR2.asc";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance SFB_ARMOR_L(C_Item)
{
	name = "Schürferklamotten";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 10;
	protection[PROT_BLUNT] = 10;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 0;
	value = value_sfb_armor_l;
	wear = WEAR_TORSO;
	visual = "sfbl.3ds";
	visual_change = "Hum_SFBL_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ORG_ARMOR_L(C_Item)
{
	name = "Leichte Banditenkleidung";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 30;
	protection[PROT_BLUNT] = 30;
	protection[PROT_POINT] = 30;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 5;
	value = value_org_armor_l;
	wear = WEAR_TORSO;
	visual = "orgl.3ds";
	visual_change = "Hum_ORGL_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ORG_ARMOR_M(C_Item)
{
	name = "Mittlere Banditenkleidung";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 35;
	protection[PROT_BLUNT] = 35;
	protection[PROT_POINT] = 35;
	protection[PROT_FIRE] = 15;
	protection[PROT_MAGIC] = 0;
	value = value_org_armor_m;
	wear = WEAR_TORSO;
	visual = "orgm.3ds";
	visual_change = "Hum_ORGM_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ORG_ARMOR_H(C_Item)
{
	name = "Schwere Banditenkleidung";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 40;
	protection[PROT_BLUNT] = 40;
	protection[PROT_POINT] = 40;
	protection[PROT_FIRE] = 15;
	protection[PROT_MAGIC] = 5;
	value = value_org_armor_h;
	wear = WEAR_TORSO;
	visual = "orgh.3ds";
	visual_change = "Hum_ORGS_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance SLD_ARMOR_L(C_Item)
{
	name = "Leichte Söldnerrüstung";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 45;
	protection[PROT_BLUNT] = 45;
	protection[PROT_POINT] = 45;
	protection[PROT_FIRE] = 15;
	protection[PROT_MAGIC] = 5;
	value = value_sld_armor_l;
	wear = WEAR_TORSO;
	visual = "sldl.3ds";
	visual_change = "Hum_SLDL_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance SLD_ARMOR_M(C_Item)
{
	name = "Söldnerrüstung";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 55;
	protection[PROT_BLUNT] = 55;
	protection[PROT_POINT] = 55;
	protection[PROT_FIRE] = 20;
	protection[PROT_MAGIC] = 5;
	value = value_sld_armor_m;
	wear = WEAR_TORSO;
	visual = "sldm.3ds";
	visual_change = "Hum_SLDM_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance SLD_ARMOR_H(C_Item)
{
	name = "Schwere Söldnerrüstung";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 70;
	protection[PROT_BLUNT] = 70;
	protection[PROT_POINT] = 70;
	protection[PROT_FIRE] = 25;
	protection[PROT_MAGIC] = 10;
	value = value_sld_armor_h;
	wear = WEAR_TORSO;
	visual = "sldh.3ds";
	visual_change = "Hum_SLDS_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance NOV_ARMOR_L(C_Item)
{
	name = "Novizen Rock";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 20;
	protection[PROT_BLUNT] = 20;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 5;
	value = value_nov_armor_l;
	wear = WEAR_TORSO;
	visual = "novl.3ds";
	visual_change = "Hum_NOVL_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance NOV_ARMOR_M(C_Item)
{
	name = "Leichte Novizenrüstung";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 30;
	protection[PROT_BLUNT] = 30;
	protection[PROT_POINT] = 30;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 10;
	wear = WEAR_TORSO;
	value = value_nov_armor_m;
	visual = "novm.3ds";
	visual_change = "Hum_NOVM_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance NOV_ARMOR_H(C_Item)
{
	name = "Novizenrüstung";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 40;
	protection[PROT_BLUNT] = 40;
	protection[PROT_POINT] = 40;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 10;
	value = value_nov_armor_h;
	wear = WEAR_TORSO;
	visual = "novh.3ds";
	visual_change = "Hum_NOVS_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance TPL_ARMOR_L(C_Item)
{
	name = "Leichte Templerrüstung";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 45;
	protection[PROT_BLUNT] = 45;
	protection[PROT_POINT] = 45;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 10;
	value = value_tpl_armor_l;
	wear = WEAR_TORSO;
	visual = "tpll.3ds";
	visual_change = "Hum_TPLL_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance TPL_ARMOR_M(C_Item)
{
	name = "Templerrüstung";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 55;
	protection[PROT_BLUNT] = 55;
	protection[PROT_POINT] = 55;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 15;
	value = value_tpl_armor_m;
	wear = WEAR_TORSO;
	visual = "tplm.3ds";
	visual_change = "Hum_TPLM_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance TPL_ARMOR_H(C_Item)
{
	name = "Schwere Templerrüstung";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 70;
	protection[PROT_BLUNT] = 70;
	protection[PROT_POINT] = 70;
	protection[PROT_FIRE] = 20;
	protection[PROT_MAGIC] = 15;
	value = value_tpl_armor_h;
	wear = WEAR_TORSO;
	visual = "tplh.3ds";
	visual_change = "Hum_TPLS_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance GUR_ARMOR_M(C_Item)
{
	name = "Gururobe";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 60;
	protection[PROT_BLUNT] = 60;
	protection[PROT_POINT] = 60;
	protection[PROT_FIRE] = 35;
	protection[PROT_MAGIC] = 20;
	value = value_gur_armor_m;
	wear = WEAR_TORSO;
	visual = "gurm.3ds";
	visual_change = "Hum_GURM_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance GUR_ARMOR_H(C_Item)
{
	name = "Hohe Gururobe";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 70;
	protection[PROT_BLUNT] = 70;
	protection[PROT_POINT] = 70;
	protection[PROT_FIRE] = 40;
	protection[PROT_MAGIC] = 25;
	wear = WEAR_TORSO;
	value = value_gur_armor_h;
	visual = "gurh.3ds";
	visual_change = "Hum_GURS_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance KDF_ARMOR_L(C_Item)
{
	name = "Feuermagierrobe";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 40;
	protection[PROT_BLUNT] = 40;
	protection[PROT_POINT] = 40;
	protection[PROT_FIRE] = 25;
	protection[PROT_MAGIC] = 5;
	wear = WEAR_TORSO;
	value = value_kdf_armor_l;
	visual = "kdfl.3ds";
	visual_change = "Hum_KDFL_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance KDF_ARMOR_H(C_Item)
{
	name = "Hohe Feuerrobe";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 70;
	protection[PROT_BLUNT] = 70;
	protection[PROT_POINT] = 70;
	protection[PROT_FIRE] = 45;
	protection[PROT_MAGIC] = 20;
	wear = WEAR_TORSO;
	value = VALUE_KDW_ARMOR_H;
	visual = "kdfh.3ds";
	visual_change = "Hum_KDFS_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance KDW_ARMOR_L(C_Item)
{
	name = "Wasserrobe";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 60;
	protection[PROT_BLUNT] = 60;
	protection[PROT_POINT] = 60;
	protection[PROT_FIRE] = 40;
	protection[PROT_MAGIC] = 15;
	value = value_kdw_armor_l;
	wear = WEAR_TORSO;
	visual = "kdwl.3ds";
	visual_change = "Hum_KDWL_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance KDW_ARMOR_H(C_Item)
{
	name = "Hohe Wasserrobe";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 70;
	protection[PROT_BLUNT] = 70;
	protection[PROT_POINT] = 70;
	protection[PROT_FIRE] = 45;
	protection[PROT_MAGIC] = 20;
	wear = WEAR_TORSO;
	value = value_kdw_armor_h;
	visual = "kdwh.3ds";
	visual_change = "Hum_KDWS_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance DMB_ARMOR_M(C_Item)
{
	name = "Robe der Dunklen Künste";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 90;
	protection[PROT_BLUNT] = 90;
	protection[PROT_POINT] = 90;
	protection[PROT_FIRE] = 60;
	protection[PROT_MAGIC] = 30;
	wear = WEAR_TORSO;
	value = value_dmb_armor_m;
	ownerGuild = GIL_DMB;
	visual = "dmbm.3ds";
	visual_change = "Hum_DMBM_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance CRW_ARMOR_H(C_Item)
{
	name = "Crawler-Plattenrüstung";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 80;
	protection[PROT_BLUNT] = 80;
	protection[PROT_POINT] = 80;
	protection[PROT_FIRE] = 35;
	protection[PROT_MAGIC] = 10;
	value = protection[PROT_EDGE] * ARMOR_VALUE_MULTIPLIER;
	wear = WEAR_TORSO;
	visual = "crws.3ds";
	visual_change = "Hum_CRAWLER_ARMOR.asc";
	visual_skin = 0;
	material = MAT_WOOD;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ORE_ARMOR_M(C_Item)
{
	name = "Antike Erzrüstung";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 95;
	protection[PROT_BLUNT] = 95;
	protection[PROT_POINT] = 95;
	protection[PROT_FIRE] = 40;
	protection[PROT_MAGIC] = 10;
	value = protection[PROT_EDGE] * ARMOR_VALUE_MULTIPLIER * 2;
	wear = WEAR_TORSO;
	visual = "magie.3ds";
	visual_change = "Hum_MAGIE_ARMOR.asc";
	visual_skin = 0;
	material = MAT_WOOD;
	description = name;
	text[0] = "vollständig aus magischem Erz geschmiedet.";
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ORE_ARMOR_H(C_Item)
{
	name = "Verbesserte Erzrüstung";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 105;
	protection[PROT_BLUNT] = 105;
	protection[PROT_POINT] = 105;
	protection[PROT_FIRE] = 45;
	protection[PROT_MAGIC] = 15;
	value = protection[PROT_EDGE] * ARMOR_VALUE_MULTIPLIER * 2;
	wear = WEAR_TORSO;
	visual = "magie.3ds";
	visual_change = "Hum_MAGIE_UPGRADE_ARMOR.asc";
	visual_skin = 0;
	material = MAT_WOOD;
	description = name;
	text[0] = "von Stone dem Schmied noch weiter verbessert.";
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance LAW_ARMOR(C_Item)
{
	name = "Richterrobe";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 20;
	protection[PROT_BLUNT] = 20;
	protection[PROT_POINT] = 2;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 0;
	value = protection[PROT_EDGE] * ARMOR_VALUE_MULTIPLIER;
	wear = WEAR_TORSO;
	ownerGuild = GIL_DMB;
	visual = "dmbm.3ds";
	visual_change = "Hum_LAW_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance GRD_ARMOR_I(C_Item)
{
	name = "Königliche Garderüstung";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 50;
	protection[PROT_BLUNT] = 50;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 25;
	protection[PROT_MAGIC] = 1;
	value = protection[PROT_EDGE] * ARMOR_VALUE_MULTIPLIER;
	wear = WEAR_TORSO;
	ownerGuild = GIL_GRD;
	visual = "grdi.3ds";
	visual_change = "Hum_GRDI_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance BAB_ARMOR_NUDE(C_Item)
{
	name = "Nacktes Babe";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	value = 1;
	protection[PROT_EDGE] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	wear = WEAR_TORSO;
	visual = "vobbox.3ds";
	visual_change = "Bab_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
};

instance BAB_ARMOR_BIKINI(C_Item)
{
	name = "bikini babe";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	value = 1;
	protection[PROT_EDGE] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	wear = WEAR_TORSO;
	visual = "vobbox.3ds";
	visual_change = "Bab_ARMOR.asc";
	visual_skin = 1;
	material = MAT_LEATHER;
};

instance NON_ARMOR_H(C_Item)
{
	name = "Antike Tempelrüstung";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 65;
	protection[PROT_BLUNT] = 65;
	protection[PROT_POINT] = 65;
	protection[PROT_FIRE] = 35;
	protection[PROT_MAGIC] = 30;
	value = protection[PROT_EDGE] * ARMOR_VALUE_MULTIPLIER;
	wear = WEAR_TORSO;
	visual = "tplh.3ds";
	visual_change = "Armor_MayaZombie_Addon.asc";
	visual_skin = 0;
	material = MAT_WOOD;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance NON_ARMOR_I(C_Item)
{
	name = "Rüstung des Wächters";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 70;
	protection[PROT_BLUNT] = 70;
	protection[PROT_POINT] = 70;
	protection[PROT_FIRE] = 30;
	protection[PROT_MAGIC] = 15;
	value = protection[PROT_EDGE] * ARMOR_VALUE_MULTIPLIER;
	wear = WEAR_TORSO;
	visual = "ebrh2.3ds";
	visual_change = "Hum_Old_Ebr_Armor.asc";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance NON_ARMOR_K(C_Item)
{
	name = "Sumpfhaihautrüstung";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 55;
	protection[PROT_BLUNT] = 55;
	protection[PROT_POINT] = 20;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 0;
	value = VALUE_NON_ARMOR_L;
	wear = WEAR_TORSO;
	visual = "stth.3ds";
	visual_change = "Hum_Swampshark_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[0] = "Wurde aus Sumpfhaihaut angefertigt.";
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance NON_ARMOR_L(C_Item)
{
	name = "Wolfsfellrüstung";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 20;
	protection[PROT_BLUNT] = 20;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 0;
	value = VALUE_NON_ARMOR_K;
	wear = WEAR_TORSO;
	visual = "orgl.3ds";
	visual_change = "Hum_WOLF_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[0] = "Wurde aus Wolfsfell angefertigt.";
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance NON_ARMOR_N(C_Item)
{
	name = "Orkhundfellrüstung";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 40;
	protection[PROT_BLUNT] = 40;
	protection[PROT_POINT] = 40;
	protection[PROT_FIRE] = 20;
	protection[PROT_MAGIC] = 0;
	value = value_non_armor_n;
	wear = WEAR_TORSO;
	visual = "orgl.3ds";
	visual_change = "Hum_ORCDOG_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[0] = "Wurde aus Orkhundfell angefertigt.";
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance NON_ARMOR_U(C_Item)
{
	name = "Lurkerhautrüstung";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 30;
	protection[PROT_BLUNT] = 30;
	protection[PROT_POINT] = 25;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 0;
	value = value_non_armor_u;
	wear = WEAR_TORSO;
	visual = "sttm.3ds";
	visual_change = "Hum_LURKER_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance NON_ARMOR_P(C_Item)
{
	name = "Trollfellrüstung";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 70;
	protection[PROT_BLUNT] = 70;
	protection[PROT_POINT] = 75;
	protection[PROT_FIRE] = 20;
	protection[PROT_MAGIC] = 5;
	value = VALUE_NON_ARMOR_W;
	wear = WEAR_TORSO;
	visual = "orgh.3ds";
	visual_change = "Hum_TROLL_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance NOV_ARMOR_L_UPGRADE(C_Item)
{
	name = "Verbesserter Novizen Rock";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 25;
	protection[PROT_BLUNT] = 25;
	protection[PROT_POINT] = 15;
	protection[PROT_FIRE] = 15;
	protection[PROT_MAGIC] = 10;
	value = VALUE_NOV_ARMOR_L;
	wear = WEAR_TORSO;
	visual = "novl.3ds";
	visual_change = "Hum_NOVL_UPGRADE_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance NOV_ARMOR_M_UPGRADE(C_Item)
{
	name = "Verbesserte Leichte Novizenrüstung";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 35;
	protection[PROT_BLUNT] = 35;
	protection[PROT_POINT] = 35;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 15;
	wear = WEAR_TORSO;
	value = VALUE_NOV_ARMOR_M;
	visual = "novm.3ds";
	visual_change = "Hum_NOVM_UPGRADE_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance NOV_ARMOR_H_UPGRADE(C_Item)
{
	name = "Verbesserte Novizenrüstung";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 45;
	protection[PROT_BLUNT] = 45;
	protection[PROT_POINT] = 45;
	protection[PROT_FIRE] = 15;
	protection[PROT_MAGIC] = 15;
	value = VALUE_NOV_ARMOR_H;
	wear = WEAR_TORSO;
	visual = "novh.3ds";
	visual_change = "Hum_NOVS_UPGRADE_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance TPL_ARMOR_L_UPGRADE(C_Item)
{
	name = "Verbesserte leichte Templerrüstung";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 50;
	protection[PROT_BLUNT] = 50;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 15;
	protection[PROT_MAGIC] = 15;
	value = VALUE_TPL_ARMOR_L;
	wear = WEAR_TORSO;
	visual = "tpll.3ds";
	visual_change = "Hum_TPLL_UPGRADE_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance TPL_ARMOR_M_UPGRADE(C_Item)
{
	name = "Verbesserte Templerrüstung";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 60;
	protection[PROT_BLUNT] = 60;
	protection[PROT_POINT] = 60;
	protection[PROT_FIRE] = 15;
	protection[PROT_MAGIC] = 20;
	value = VALUE_TPL_ARMOR_M;
	wear = WEAR_TORSO;
	visual = "tplm.3ds";
	visual_change = "Hum_TPLM_UPGRADE_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance TPL_ARMOR_H_UPGRADE(C_Item)
{
	name = "Verbesserte schwere Templerrüstung";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 75;
	protection[PROT_BLUNT] = 75;
	protection[PROT_POINT] = 75;
	protection[PROT_FIRE] = 25;
	protection[PROT_MAGIC] = 20;
	value = VALUE_TPL_ARMOR_H;
	wear = WEAR_TORSO;
	visual = "tplh.3ds";
	visual_change = "Hum_TPLS_UPGRADE_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance STT_ARMOR_M_UPGRADE(C_Item)
{
	name = "Verbesserte Schattenkluft";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 35;
	protection[PROT_BLUNT] = 35;
	protection[PROT_POINT] = 35;
	protection[PROT_FIRE] = 20;
	protection[PROT_MAGIC] = 0;
	value = VALUE_STT_ARMOR_M;
	wear = WEAR_TORSO;
	visual = "sttm.3ds";
	visual_change = "Hum_STTM_UPGRADE_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance STT_ARMOR_H_UPGRADE(C_Item)
{
	name = "Verbesserte Schattenrüstung";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 45;
	protection[PROT_BLUNT] = 45;
	protection[PROT_POINT] = 45;
	protection[PROT_FIRE] = 25;
	protection[PROT_MAGIC] = 0;
	value = VALUE_STT_ARMOR_H;
	wear = WEAR_TORSO;
	visual = "stth.3ds";
	visual_change = "Hum_STTS_UPGRADE_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance GRD_ARMOR_L_UPGRADE(C_Item)
{
	name = "Verbesserte leichte Garderüstung";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 50;
	protection[PROT_BLUNT] = 50;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 25;
	protection[PROT_MAGIC] = 0;
	value = VALUE_GRD_ARMOR_L;
	wear = WEAR_TORSO;
	visual = "grdl.3ds";
	visual_change = "Hum_GRDL_UPGRADE_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance GRD_ARMOR_M_UPGRADE(C_Item)
{
	name = "Verbesserte Garderüstung";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 60;
	protection[PROT_BLUNT] = 60;
	protection[PROT_POINT] = 60;
	protection[PROT_FIRE] = 30;
	protection[PROT_MAGIC] = 0;
	value = VALUE_GRD_ARMOR_M;
	wear = WEAR_TORSO;
	visual = "grdm.3ds";
	visual_change = "Hum_GRDM_UPGRADE_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance GRD_ARMOR_H_UPGRADE(C_Item)
{
	name = "Verbesserte schwere Garderüstung";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 75;
	protection[PROT_BLUNT] = 75;
	protection[PROT_POINT] = 75;
	protection[PROT_FIRE] = 40;
	protection[PROT_MAGIC] = 0;
	value = VALUE_GRD_ARMOR_H;
	wear = WEAR_TORSO;
	visual = "grdh.3ds";
	visual_change = "Hum_GRDS_UPGRADE_ARMOR.asc";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance SFB_ARMOR_L_UPGRADE(C_Item)
{
	name = "Verbesserte Schürferklamotten";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 15;
	protection[PROT_BLUNT] = 15;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 0;
	value = VALUE_SFB_ARMOR_L;
	wear = WEAR_TORSO;
	visual = "sfbl.3ds";
	visual_change = "Hum_SFBL_UPGRADE_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ORG_ARMOR_L_UPGRADE(C_Item)
{
	name = "Verbesserte leichte Banditenkleidung";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 35;
	protection[PROT_BLUNT] = 35;
	protection[PROT_POINT] = 35;
	protection[PROT_FIRE] = 15;
	protection[PROT_MAGIC] = 10;
	value = VALUE_ORG_ARMOR_L;
	wear = WEAR_TORSO;
	visual = "orgl.3ds";
	visual_change = "Hum_ORGL_UPGRADE_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ORG_ARMOR_M_UPGRADE(C_Item)
{
	name = "Verbesserte mittlere Banditenkleidung";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 40;
	protection[PROT_BLUNT] = 40;
	protection[PROT_POINT] = 40;
	protection[PROT_FIRE] = 20;
	protection[PROT_MAGIC] = 0;
	value = VALUE_ORG_ARMOR_M;
	wear = WEAR_TORSO;
	visual = "orgm.3ds";
	visual_change = "Hum_ORGM_UPGRADE_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ORG_ARMOR_H_UPGRADE(C_Item)
{
	name = "Verbesserte schwere Banditenkleidung";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 45;
	protection[PROT_BLUNT] = 45;
	protection[PROT_POINT] = 45;
	protection[PROT_FIRE] = 20;
	protection[PROT_MAGIC] = 10;
	value = VALUE_ORG_ARMOR_H;
	wear = WEAR_TORSO;
	visual = "orgh.3ds";
	visual_change = "Hum_ORGS_UPGRADE_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance SLD_ARMOR_L_UPGRADE(C_Item)
{
	name = "Verbesserte leichte Söldnerrüstung";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 50;
	protection[PROT_BLUNT] = 50;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 20;
	protection[PROT_MAGIC] = 10;
	value = VALUE_SLD_ARMOR_L;
	wear = WEAR_TORSO;
	visual = "sldl.3ds";
	visual_change = "Hum_SLDL_UPGRADE_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance SLD_ARMOR_M_UPGRADE(C_Item)
{
	name = "Verbesserte Söldnerrüstung";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 60;
	protection[PROT_BLUNT] = 60;
	protection[PROT_POINT] = 60;
	protection[PROT_FIRE] = 25;
	protection[PROT_MAGIC] = 10;
	value = VALUE_SLD_ARMOR_M;
	wear = WEAR_TORSO;
	visual = "sldm.3ds";
	visual_change = "Hum_SLDM_UPGRADE_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance SLD_ARMOR_H_UPGRADE(C_Item)
{
	name = "Verbesserte schwere Söldnerrüstung";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 75;
	protection[PROT_BLUNT] = 75;
	protection[PROT_POINT] = 75;
	protection[PROT_FIRE] = 30;
	protection[PROT_MAGIC] = 15;
	value = VALUE_SLD_ARMOR_H;
	wear = WEAR_TORSO;
	visual = "sldh.3ds";
	visual_change = "Hum_SLDS_UPGRADE_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance KDF_ARMOR_L_UPGRADE(C_Item)
{
	name = "Verbesserte Feuermagierrobe";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 50;
	protection[PROT_BLUNT] = 50;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 30;
	protection[PROT_MAGIC] = 10;
	wear = WEAR_TORSO;
	value = VALUE_KDW_ARMOR_L;
	visual = "kdfl.3ds";
	visual_change = "Hum_KDFL_UPGRADE_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance KDF_ARMOR_H_UPGRADE(C_Item)
{
	name = "Verbesserte hohe Feuerrobe";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 75;
	protection[PROT_BLUNT] = 75;
	protection[PROT_POINT] = 75;
	protection[PROT_FIRE] = 50;
	protection[PROT_MAGIC] = 25;
	wear = WEAR_TORSO;
	value = VALUE_KDW_ARMOR_H;
	visual = "kdfh.3ds";
	visual_change = "Hum_KDFS_UPGRADE_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance KDW_ARMOR_L_UPGRADE(C_Item)
{
	name = "Verbesserte Wasserrobe";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 65;
	protection[PROT_BLUNT] = 65;
	protection[PROT_POINT] = 65;
	protection[PROT_FIRE] = 45;
	protection[PROT_MAGIC] = 20;
	value = VALUE_KDW_ARMOR_L;
	wear = WEAR_TORSO;
	visual = "kdwl.3ds";
	visual_change = "Hum_KDWL_UPGRADE_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance KDW_ARMOR_H_UPGRADE(C_Item)
{
	name = "Verbesserte hohe Wasserrobe";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 75;
	protection[PROT_BLUNT] = 75;
	protection[PROT_POINT] = 75;
	protection[PROT_FIRE] = 50;
	protection[PROT_MAGIC] = 25;
	wear = WEAR_TORSO;
	value = VALUE_KDW_ARMOR_H;
	visual = "kdwh.3ds";
	visual_change = "Hum_KDWS_UPGRADE_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance DMB_ARMOR_M_UPGRADE(C_Item)
{
	name = "Verbesserte Robe der Dunklen Künste";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 95;
	protection[PROT_BLUNT] = 95;
	protection[PROT_POINT] = 95;
	protection[PROT_FIRE] = 65;
	protection[PROT_MAGIC] = 35;
	wear = WEAR_TORSO;
	value = VALUE_DMB_ARMOR_M;
	visual = "dmbm.3ds";
	visual_change = "Hum_DMBM_UPGRADE_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance VLK_ARMOR_L_UPGRADE(C_Item)
{
	name = "Verbesserte leichte Buddlerhose";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 15;
	protection[PROT_BLUNT] = 15;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 0;
	value = VALUE_VLK_ARMOR_L;
	wear = WEAR_TORSO;
	visual = "vlkl.3ds";
	visual_change = "Hum_VLKL_UPGRADE_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance GUR_ARMOR_M_UPGRADE(C_Item)
{
	name = "Verbesserte Gururobe";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 90;
	protection[PROT_BLUNT] = 90;
	protection[PROT_POINT] = 90;
	protection[PROT_FIRE] = 55;
	protection[PROT_MAGIC] = 35;
	wear = WEAR_TORSO;
	value = VALUE_GUR_ARMOR_UPGRADE;
	visual = "gurm.3ds";
	visual_change = "Hum_GURM_UPGRADE_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance TPL_ARMOR_M_WHITEBODY(C_Item)
{
	name = "Templerrüstung (Nur für weißhäutige!)";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 55;
	protection[PROT_BLUNT] = 55;
	protection[PROT_POINT] = 55;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 15;
	value = VALUE_TPL_ARMOR_M;
	wear = WEAR_TORSO;
	visual = "tplm.3ds";
	visual_change = "Hum_TplM_WhiteBody_Armor.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance TPL_ARMOR_M_LATINOBODY(C_Item)
{
	name = "Templerrüstung (Nur für Latinos!)";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 55;
	protection[PROT_BLUNT] = 55;
	protection[PROT_POINT] = 55;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 15;
	value = VALUE_TPL_ARMOR_M;
	wear = WEAR_TORSO;
	visual = "tplm.3ds";
	visual_change = "Hum_TplM_LatinoBody_Armor.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance TPL_ARMOR_M_BLACKBODY(C_Item)
{
	name = "Templerrüstung (Nur für dunkelhäutige!)";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 55;
	protection[PROT_BLUNT] = 55;
	protection[PROT_POINT] = 55;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 15;
	value = VALUE_TPL_ARMOR_M;
	wear = WEAR_TORSO;
	visual = "tplm.3ds";
	visual_change = "Hum_TplM_BlackBody_Armor.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

