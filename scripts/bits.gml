///Alarms
var visAmount = 0;
for (i = 0; i< size; i++){
    if ((alarm[i] <= 0) && (vis[i])){
       ///Instance Destroy
       time[i] -= 10;
       bitVelo[i] /= 2;
       if (time[i] <= 0){
           alarm[i] = time[i];
       }else{
            surface_set_target(global.bloodSurface);
            for (i = 0; i < size; i++){
                draw_sprite(bitSpr[i], img[i], bitx[i], bity[i]);
            }
            
            surface_reset_target();
            vis[i] = false;
       }
    }
    if (vis[i] == false){
          visAmount++;
    }
    alarm[i] --;
}

if (visAmount >= size){
   instance_destroy();
}
