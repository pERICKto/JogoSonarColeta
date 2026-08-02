if (room == terra1 )
{
instance_destroy();
global.certo += 1;
room_goto(bunker2);
}

if (room == air3)
{
instance_destroy();
global.certo += 2;
room_goto(bunker2);
}