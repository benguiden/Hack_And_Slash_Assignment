///The Joystick input processed through rounding and dead zones

//Gamepad
if (inputSource == 2){

    //Analog Stick
    global.joyX = round(100 * gamepad_axis_value(gpin, gp_axislh))/100;
    global.joyY = round(100 * gamepad_axis_value(gpin, gp_axislv))/100;
    if ((global.joyX < 0.25) && (global.joyX > -0.25)) global.joyX = 0;
    if ((global.joyY < 0.25) && (global.joyY > -0.25)) global.joyY = 0;
    
    //Button 2
    if (gamepad_button_check(gpin, gp_face2)){
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
    
    //Button 3
    if (gamepad_button_check(gpin, gp_face3)){
       if (joy3Down){
          global.joy3Pressed = true;
          joy3Down = false;
       }else{
          global.joy3Pressed = false;
       }
    }else{
          global.joy3Pressed = false;
          joy3Down = true;
    }
    
    //Button 1
    if (gamepad_button_check(gpin, gp_face1)){
       if (joy1Down){
          global.joy1Pressed = true;
          joy1Down = false;
       }else{
          global.joy1Pressed = false;
       }
    }else{
          global.joy1Pressed = false;
          joy1Down = true;
    }
}

//Joystick
else if (inputSource == 1){
    //Analog Stick
    global.joyX = round(100 * joystick_xpos(1))/100;
    global.joyY = round(100 * joystick_ypos(1))/100;
    if ((global.joyX < 0.25) && (global.joyX > -0.25)) global.joyX = 0;
    if ((global.joyY < 0.25) && (global.joyY > -0.25)) global.joyY = 0;
    
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
    
    //Button 3
    if (joystick_check_button(1, 3)){
       if (joy1Down){
          global.joy1Pressed = true;
          joy1Down = false;
       }else{
          global.joy1Pressed = false;
       }
    }else{
          global.joy1Pressed = false;
          joy1Down = true;
    }
    
    //Button 4
    if (joystick_check_button(1, 4)){
       if (joy3Down){
          global.joy3Pressed = true;
          joy3Down = false;
       }else{
          global.joy3Pressed = false;
       }
    }else{
          global.joy3Pressed = false;
          joy3Down = true;
    }
    
//Keyboard
}else{
    if (keyboard_check(ord("D"))) global.joyX = 1;
    if (keyboard_check(ord("A"))) global.joyX = -1;
    if (keyboard_check(ord("S"))) global.joyY = 1;
    if (keyboard_check(ord("W"))) global.joyY = -1;
    
    if (!(keyboard_check(ord("D"))) && !(keyboard_check(ord("A")))) global.joyX = 0;
    if (!(keyboard_check(ord("S"))) && !(keyboard_check(ord("W")))) global.joyY = 0;
    
    if (keyboard_check(vk_shift)){
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
    
    if (keyboard_check(vk_space)){
       if (joy1Down){
          global.joy1Pressed = true;
          joy1Down = false;
       }else{
          global.joy1Pressed = false;
       }
    }else{
          global.joy1Pressed = false;
          joy1Down = true;
    }
    
    if (keyboard_check(vk_return)){
       if (joy3Down){
          global.joy3Pressed = true;
          joy3Down = false;
       }else{
          global.joy3Pressed = false;
       }
    }else{
          global.joy3Pressed = false;
          joy3Down = true;
    }
}

