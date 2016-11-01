///This script is called when the player is attacking, it checks every enemy is in range, those enemies 
///are then checked to see if they are close to the players facing direction with the weapon, attack type and timing in mind
var global.pl = id;

//Check all Spiders
with (objSpider){

    var dis = sqrt(sqr(x - global.pl.x) + sqr(y - global.pl.y));
     //Check within range
     if (dis <= global.pl.attackRange){
        
        //Variable checking angle
        dirWithPl = AngleBetween(global.pl.x, global.pl.y, x, y) - global.pl.dir;
        while (dirWithPl >= 2 * pi) dirWithPl -= 2 * pi;
        while (dirWithPl < 0) dirWithPl += 2 * pi;
        
        if ((dirWithPl - pi >= global.pl.attackAngle - pi - global.pl.attackAngleRange) and (dirWithPl - pi <= global.pl.attackAngle - pi + global.pl.attackAngleRange)){
           //if !(audio_is_playing(snSwordMeat)) audio_play_sound(snSwordMeat, 6, false);
           audio_play_sound(snSwordMeat, 6, false);
           var global.spiderTheta = AngleBetween(x, y, global.pl.x, global.pl.y);
           x -= (32 + (global.pl.velocity*4)) * cos(global.spiderTheta);
           y -= (32 + (global.pl.velocity*4)) * -sin(global.spiderTheta);
           hp--;
           /*with (instance_create(x, y, objBlood)){
                velocity = 2 + global.pl.velocity;
                dir = global.spiderTheta;
           }*/
           //BloodParticleInit(x, y, 32, 180 + (180 * (AngleBetween(x, y, global.pl.x, global.pl.y)/pi)), 90);
           BloodInit(x, y, 24, pi + AngleBetween(x, y, global.pl.x, global.pl.y), pi*0.75);
        }
     }

}
