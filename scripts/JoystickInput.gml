///The Joystick input processed through rounding and dead zones

global.joyX = round(100 * joystick_xpos(1))/100;
global.joyY = round(100 * joystick_ypos(1))/100;
if ((global.joyX < 0.15) && (global.joyX > -0.5)) global.joyX = 0;
if ((global.joyY < 0.15) && (global.joyY > -0.5)) global.joyY = 0;
