///The Joystick input processed through rounding and dead zones

//Joystick
if (joystick_exists(1)){
    //Analog Stick
    global.joyX = round(100 * joystick_xpos(1))/100;
    global.joyY = round(100 * joystick_ypos(1))/100;
    if ((global.joyX < 0.15) && (global.joyX > -0.5)) global.joyX = 0;
    if ((global.joyY < 0.15) && (global.joyY > -0.5)) global.joyY = 0;
    
    //Button 2
    if (joystick_check_button(1, 2)){
       if (joy2Down){
          global.joy2Pressed = true;
          joy2Down = false;
       }else{
          global.joy2Pressed = false;
       }
    }else{
          global.joy2Pressed = false;
          joy2Down = true;
    }
    
//Keyboard
}else{
    if (keyboard_check(ord("D"))) global.joyX = 1;
    if (keyboard_check(ord("A"))) global.joyX = -1;
    if (keyboard_check(ord("S"))) global.joyY = 1;
    if (keyboard_check(ord("W"))) global.joyY = -1;
    
    if (!(keyboard_check(ord("D"))) && !(keyboard_check(ord("A")))) global.joyX = 0;
    if (!(keyboard_check(ord("S"))) && !(keyboard_check(ord("W")))) global.joyY = 0;
    
    if (keyboard_check(vk_space)){
       if (joy2Down){
          global.joy2Pressed = true;
          joy2Down = false;
       }else{
          global.joy2Pressed = false;
       }
    }else{
          global.joy2Pressed = false;
          joy2Down = true;
    }
}

