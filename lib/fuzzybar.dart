
import 'package:flutter/material.dart';
import 'package:flame/sprite.dart';
import 'package:flutter_feed_fuz/publicdata.dart';
import 'package:sensors/sensors.dart';

class FuzzyBar{

  Sprite bar;
  Rect barRect;
  double angle;
  double tmpAngle;

  double barcenterX;
  double barcenterY;




  FuzzyBar(){
    bar=Sprite('fuzzybar.png');
    barRect=Rect.fromLTWH(screenW*.1,screenH*.78 , screenW*.8, screenH*.03);

    barcenterX=screenW*.1+(screenW*.8)/2;
    barcenterY=screenH*.78+(screenH*.03)/2;
    angle=0;
    tmpAngle=0;
  }
  void draw(Canvas c) {

    c.save();
    c.translate(barcenterX, barcenterY);

    c.rotate(angle);
    c.translate(-barcenterX, -barcenterY);
    bar.renderRect(c, barRect);
    //c.translate(0, 0);


//    Paint p=Paint();
//    p.color=Colors.blue;
//    c.drawCircle(Offset(barcenterX, barcenterY), 5, p);
   c.restore();


  }
  void update(){
//    gyroscopeEvents.listen((GyroscopeEvent event) {
//    //  print(event.z);
//      tTmp=event.toString();
//      if(event.z!=0){
//
//        tmpAngle=-event.z/100;
//       // print(tmpAngle);
//      }
//
//    });

    accelerometerEvents.listen((AccelerometerEvent event) {
      tTmp=event.toString();
      if(event.x>=-6 && event.x<=6 && event.y>=0){
        //angle=-event.x/10;
       // if(event.x<0){
          tmpAngle=-event.x/100;
       // }
//            // else{
//      tmpAngle=event.x/10;
//    }


      }


    });

   // print(tmpAngle);

      if(tmpAngle>0){
        if(angle<=0.6){
          angle+=tmpAngle.abs();
        }



      }
      else if(tmpAngle<0){
        if(angle>=-0.6){
          angle-=tmpAngle.abs();
        }
      }
   // print(tmpAngle);
   // }
//    else if(tmpAngle<angle-0.025  ){
//    //  if(angle-0.05>-6/10 ){
//        angle-=0.025;
//     // }
//    }

//   if(tmpAngle>0 && angle+0.01<=tmpAngle ){
//      angle+=0.01;
//    }
//    else if(tmpAngle<0 && angle-0.01>=tmpAngle ){
//      angle-=0.01;
//    }

   // print(angle);
  }

}