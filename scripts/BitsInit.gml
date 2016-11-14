///Initalize the Bits

with instance_create(argument0, argument1, argument5){
     size = argument2;
     dir = argument3;
     spread = argument4;
     
     for (i = 0; i < size; i++){
         bitx[i] = x - 16 + random(32);
         bity[i] = y - 16 + random(32);;
         bitDir[i] = argument3 - (argument4/2) + random(argument4);
         bitSpr[i] = choose(sprSpiderBitsHead);
         img[i] = sprite_get_number(bitSpr[i]);
         bitVelo[i] = 2 + random(5);
         time[i] = 20 + bitVelo[i]*2;
         alarm[i] = time[i];
         vis[i] = true;
     }
}
