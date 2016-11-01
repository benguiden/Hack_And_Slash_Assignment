///Initalize the blood particle

with instance_create(argument0, argument1, objBlood){
     size = argument2;
     dir = argument3;
     spread = argument4;
     
     for (i = 0; i < size; i++){
         bloodx[i] = x;
         bloody[i] = y;
         bloodDir[i] = argument3 - (argument4/2) + random(argument4);
         bloodSpr[i] = irandom(4);
         bloodVelo[i] = random(7);
     }
}
