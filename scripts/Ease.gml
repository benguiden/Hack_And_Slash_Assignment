var type = argument0;
var t =  argument1;
var b = argument2;
var c = argument3;
var d = argument4;

if (type == "cubicIn"){
   t /= d;
  return c*t*t*t + b;
}
