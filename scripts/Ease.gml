var type = argument0;
var t =  argument1;
var b = argument2;
var c = argument3;
var d = argument4;

if (type == "cubicIn"){
   t /= d;
  return c*t*t*t + b;
}

else if (type == "expoIn"){
     return c * power( 2, 10 * (t/d - 1) ) + b;
}

else if (type == "expoOut"){
     return c * ( -power( 2, -10 * t/d ) + 1 ) + b;
}

else if (type == "expoInOut"){
     t /= d/2;
    if (t < 1) return c/2 * power( 2, 10 * (t - 1) ) + b;
     t--;
    return c/2 * ( -power( 2, -10 * t) + 2 ) + b;
}

else if (type == "quadIn"){
    t /= d;
    return c*t*t + b;
}

else if (type == "quadOut"){
    t /= d;
    return -c * t*(t-2) + b;
}
