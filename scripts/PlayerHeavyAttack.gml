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
    }else if (attack == "HS"){
          velocity = 0;
          attackVel = 0;
          attackVelTarget = 18;
          attackTimeTarget = 40;
    }else if (attack == "HT"){
          
           attackVel = velocity/2;
           attackVelTarget = (velocity/2)+2;
           attackTimeTarget = 40;
    }else if (attack == "HD"){
           velocity = 0;
           attackVel = 0;
           attackVelTarget = 16;
           attackTimeTarget = 40;
    }
   
}else{   //Attack script every frame
   var timing = 0.5;
      //Ease towards target position and change sprite frames accordingly
      
      //Heavy Stab
      if (attack == "HS"){
      timing = 0.5;
         if ((attackTime/attackTimeTarget) <= timing){
            velocity = Ease("expoIn", attackTime, 0, attackVelTarget, attackTimeTarget*timing);
            image_index = (image_number-4) * (attackTime/attackTimeTarget) / timing;
            if (image_index >= image_number-4) image_index = image_number-5;
         }else if ((attackTime/attackTimeTarget) < 1){
               velocity = Ease("expoOut", attackTime-(attackTimeTarget*timing), attackVelTarget, attackVel-attackVelTarget, attackTimeTarget-(attackTimeTarget*timing));
               image_index = (image_number-4) + (4 * ((attackVelTarget-velocity)/attackVelTarget));
         }
          
          if (joystick_check_button(1, 3))attackTime+=0.5;
          else attackTime += 1;
      }
      
      //Heavy Spin
      else if (attack == "HT"){ 
      timing = 0.5;
         if ((attackTime/attackTimeTarget) <= timing){
            velocity = Ease("expoIn", attackTime, velocity, attackVelTarget, attackTimeTarget*timing);
            image_index = image_number * (attackTime/attackTimeTarget) / timing;
            if (image_index >= image_number) image_index = image_number-1;
            if (joystick_check_button(1, 3))attackTime+=0.5;
            else attackTime += 0.5;
         }else if ((attackTime/attackTimeTarget) < 1){
               velocity = Ease("expoOut", attackTime-(attackTimeTarget*timing), attackVelTarget, -attackVelTarget, attackTimeTarget-(attackTimeTarget*timing));
               image_index = image_number-1;
               attackTime++;
         }
      }
      
      //Heavy Drop
      else if (attack == "HD"){ 
      timing = 0.5;
         if ((attackTime/attackTimeTarget) <= timing){
            velocity = 0;
            image_index = (image_number-14) * (attackTime/attackTimeTarget) / timing;
            if (image_index >= image_number-14) image_index = image_number-15;
         }else if ((attackTime/attackTimeTarget) < 1){
               velocity = Ease("expoOut", attackTime-(attackTimeTarget*timing), attackVelTarget, attackVel-attackVelTarget, attackTimeTarget-(attackTimeTarget*timing));
               image_index = (image_number-14) + (14 * ((attackVelTarget-velocity)/attackVelTarget));
         }
         if (joystick_check_button(1, 3))attackTime+=0.5;
          else attackTime += 1;
      }
   
      
      //Set up Attack Range and Weapon Angle
      if (attack == "HS"){ //Heavy Stab
            if ((attackTime/attackTimeTarget) <= timing){
               attackRange = 104 * (attackTime/(attackTimeTarget*timing));
               attackAngle = 1.75 - (1.75 * (attackTime/(attackTimeTarget*timing)));
            }else{
                  attackRange = 104;
                  attackAngle = 0;
            }
      }else if (attack == "HT"){ //Heavy Spin
            if ((attackTime/attackTimeTarget) <= timing){
               attackRange = 32 + (64 * (attackTime/(attackTimeTarget*timing)));
               attackAngle = -0.3 - (2 * pi * (attackTime/(attackTimeTarget*timing)));
            }else{
                  attackRange = 96;
                  attackAngle = -0.3;
            }
      }else if (attack == "HD"){ //Heavy Drop
            if ((attackTime/attackTimeTarget) <= timing){
               attackRange = 0;
               attackAngle = 0;
            }else{
                  attackRange = 96 * (image_index/image_number);
                  attackAngle = 0;
            }
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
        if (attack == "HS"){   //Heavy Stab
            attackTimeTarget = 15;
            velocity = 0;
        }else if (attack == "HT"){   //Heavy Twirl
            attackTimeTarget = 20;
            velocity = 0;
        }else if (attack == "HD"){   //Heavy Drop
            attackTimeTarget = 25;
            velocity = 0;
        }
        
}
