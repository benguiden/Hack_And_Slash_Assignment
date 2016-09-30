#define JoystickMovement
///This script will get the input from the joystick's left analog stick's input and change the players variables
dirIn = JoystickDirection();
if (dirIn >= 2 * pi) dirIn = 0;
velocityIn = JoystickMagnitude(dirIn);

#define JoystickMagnitude
theta = argument0;
var _x = global.joyX * cos(theta);
var _y = global.joyY * -sin(theta);

return sqrt( sqr(_x) + sqr(_y) );

#define JoystickDirection
//Returns the direction of the analog stick in radians, using polar co-ordinates
var _x = global.joyX;
var _y = global.joyY;


if (_x != 0){
    if ((_x > 0) && (_y < 0)){
        return arctan( ( -_y ) / ( _x ) );
    }else if ((_x < 0) && (_y < 0)){
        return pi + arctan( ( -_y ) / ( _x ) );
    }else if ((_x < 0) && (_y >= 0)){
        return pi + arctan( ( -_y ) / ( _x ) );
    }else{
        return (2 * pi) + arctan( ( -_y ) / ( _x ) );
    }

}else if (_y == 1){
    return (3 * pi) / 2;
}else if (_y == -1){
    return pi / 2;
}else{
      return dirIn;
}