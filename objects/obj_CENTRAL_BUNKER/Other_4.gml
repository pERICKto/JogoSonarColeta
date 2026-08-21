if (global.valid_terra != global.terra && global.valid_air != global.air)
{
	global.amostras = 3;
}
else if (global.valid_terra != global.terra && global.valid_air == global.air)
{
	global.amostras = 2;
}
else if (global.valid_terra == global.terra && global.valid_air != global.air)
{
	global.amostras = 2;
}
else if (global.valid_terra == global.terra && global.valid_air == global.air)
{
	global.amostras = 1;
}