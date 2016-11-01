var _x = argument2 - argument0;
var _y = argument3 - argument1;

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
}
