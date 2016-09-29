///This script will use the input velocity variables and process it through the accleration and tween the movement
if ((velocityIn > (velocity/velocityMax)) && (velocity < velocityMax)){
   velocity += acceleration * velocityIn;
}else if ((velocityIn < (velocity/velocityMax)) && (velocity > 0)){
   velocity -= acceleration * ((velocity/velocityMax) - velocityIn);
}
