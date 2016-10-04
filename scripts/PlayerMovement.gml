///This script will use the input velocity variables and process it through the accleration and tween the movement
//Tween Movement
if ((velocityIn > (velocity/velocityMax)) && (velocity < velocityMax)){
   velocity += acceleration * velocityIn;
}else if ((velocityIn < (velocity/velocityMax)) && (velocity > 0)){
   velocity -= acceleration * (((velocity)/velocityMax) - velocityIn);
}

if ((velocity <= acceleration * 2) && (velocityIn == 0)) velocity = 0;

//Tween Direction
var d = dir - dirIn;
if (d>pi) d -= 2* pi;
var dirVel = (abs(d)*dirAccel) * (velocity/velocityMax);
if ((d <= 2 * dirVel) && (d >= 2 * -dirVel)) dir = dirIn;
else if (d < -pi)  dir -= dirVel;
else if (d > 2 * dirVel)  dir -= dirVel;
else if (d < 2 * -dirVel)dir += dirVel;

while (dir >= 2 * pi) dir -= 2 * pi;
while (dir < 0) dir += 2 * pi;
