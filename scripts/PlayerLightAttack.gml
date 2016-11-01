///This script will handle all light attack processing
var init = argument0;

//Init attacking
if (init){

    image_index = 0;
    state = "attack";
    attackTime = 0;

    //Light Attack From Right/Left/Down/Up
    if ((attack == "LR") || (attack == "LL")  || (attack == "LL2") || (attack == "LD") || (attack == "LU")){     
       if (velocity == 0) velocity = 2; 
           attackVel = velocity;
           attackVelTarget = velocity + 8;
           attackTimeTarget = 12;
    }
   
}else{   //Attack script every frame

      //Ease towards target position and change sprite frames accordingly
      velocity = Ease("cubicIn", attackTime, attackVel, attackVelTarget, attackTimeTarget);
      
      if (joystick_check_button(1, 2)) attackTime+=0.5;
      else attackTime += 1;
      
      image_index = image_number * (attackTime/attackTimeTarget)//( abs(x-attackTargetx[0]) / abs(attackTargetx[0]-attackTargetx[1]));
   
      
      //Set up Attack Range and Weapon Angle
      //Light Attack From Right
      if (attack == "LR"){
         attackRange = 96;
         attackAngle = pi + (5.25 * (attackTime/attackTimeTarget));//Start 7/12 * 2 * PI
      }else if ((attack == "LL") || (attack == "LL2")){ //Light Attack From Left
         attackRange = 96;
         attackAngle = 2.75 - (5.5 * (attackTime/attackTimeTarget));//Start 7/12 * 2 * PI
      }else if (attack == "LD"){ //Light Attack From Down
         attackRange = 96;
         attackAngle = pi + (3.3 * (attackTime/attackTimeTarget));//Start 7/12 * 2 * PI
      }else if (attack == "LU"){ //Light Attack From Up
         attackRange = 96;
         attackAngle = pi + 3.1 + (2.55 * (attackTime/attackTimeTarget));//Start 7/12 * 2 * PI
      }
      
      while (attackAngle >= 2 * pi) attackAngle -= 2 * pi;
      while (attackAngle < 0) attackAngle += 2 * pi;
}

//End of animation
if (attackTime >= attackTimeTarget){
        image_index = image_number-1;
        state = "attackFinish";
        attackTime = 0;
        
        //Light Attack From Right/Left/Up
        if ((attack == "LR") || (attack == "LL") || (attack == "LL2") || (attack == "LU")){
            attackTimeTarget = 15;
            velocity = 0;
        }else if (attack == "LD"){   //Light Attack From Down
            attackTimeTarget = 20;
            velocity = 0;
        }
}
