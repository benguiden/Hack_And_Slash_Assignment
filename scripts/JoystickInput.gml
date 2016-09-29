///The Joystick input processed through rounding and dead zones

global.joyX = round(100 * joystick_xpos(1))/100;
global.joyY = round(100 * joystick_ypos(1))/100;
