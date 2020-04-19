import 'package:flutter/material.dart';
import 'package:flame/sprite.dart';
import 'package:flutter_feed_fuz/publicdata.dart';
import 'dart:math';

class Fuzzy{
  Sprite fuzzy;
  Rect fuzzyRect;
  Rect fuzzyRect1;
  double fuzzyX;
  double fuzzyXVelocity;
  double fuzzyRoatation;

  String ageLeftOrRight;
  String UpOrDown;
  bool firstTimeSet;
  double screenHFuzzYDist;
  bool fuzzyout;

  double fuzzyY;
  double radius;
  double fuzzyWidthHeight;
  bool fuzzybalanceStart;
  Fuzzy(){
    fuzzyX=screenW/2;
    fuzzyXVelocity=-1;
    fuzzyY=screenH/2;
    radius=screenW*.06;
    fuzzyWidthHeight=radius*2;
    fuzzy=Sprite('fuzzydummy.png');
    fuzzyRect=Rect.fromLTWH(fuzzyX-radius, fuzzyY-radius, fuzzyWidthHeight, fuzzyWidthHeight);
    fuzzyRect1=Rect.fromLTWH(fuzzyX-radius/2, fuzzyY-radius/2, radius, radius);
    fuzzybalanceStart=false;
    fuzzyRoatation=0;
    firstTimeSet=false;
    screenHFuzzYDist=screenH-fuzzyY;
    fuzzyout=false;
  }
  void draw(Canvas c,double angle) {

    if(fuzzybalanceStart &&  fuzzyY <= screenH + radius * 2){
      c.save();
      c.translate(fuzzyX, fuzzyY);

      c.rotate(fuzzyRoatation);
      if(ageLeftOrRight=="left"){
        fuzzyRoatation+=(fuzzyXVelocity/16);
      }
      else  if(ageLeftOrRight=="right"){
        fuzzyRoatation-=(fuzzyXVelocity/16);
      }

      c.translate(-fuzzyX, -fuzzyY);
      fuzzyRect=Rect.fromLTWH(fuzzyX-radius, fuzzyY-radius, fuzzyWidthHeight, fuzzyWidthHeight);
      fuzzyRect1=Rect.fromLTWH(fuzzyX-radius/2, fuzzyY-radius/2, radius, radius);
      fuzzy.renderRect(c, fuzzyRect);


//    Paint p=Paint();
//    p.color=Colors.blue;
//    c.drawCircle(Offset(barcenterX, barcenterY), 5, p);
      c.restore();
    }
    else{
      fuzzyRect=Rect.fromLTWH(fuzzyX-radius, fuzzyY-radius, fuzzyWidthHeight, fuzzyWidthHeight);
      fuzzyRect1=Rect.fromLTWH(fuzzyX-radius/2, fuzzyY-radius/2, radius, radius);
      fuzzy.renderRect(c, fuzzyRect);
    }


  }
  void update(double angle,double barcenterX,double barcenterY,double barX,double barwidthX) {
    if (fuzzyY <= screenH + 100) {


    if (fuzzyY >= (barcenterY - radius)) {
      fuzzybalanceStart = true;
    }
     if (fuzzybalanceStart && fuzzyX <= barX+barX*angle.abs() || fuzzyX >= barX-barX*angle.abs()+barwidthX ){
      fuzzyout=true;
      print("fuzzyOut");
      fuzzyY+=3;

    }

   else if (fuzzybalanceStart && fuzzyX > barX+barX*angle.abs() && fuzzyX < barX-barX*angle.abs()+barwidthX && fuzzyout==false) {



       if((angle>0 || angle<0 )&& firstTimeSet==false){

         firstTimeSet=true;
         fuzzyXVelocity=0;
         if(angle<0){
           ageLeftOrRight="left";
         }
         else if(angle>0){
           ageLeftOrRight="right";
         }
       }
       else if( firstTimeSet){
         if(screenHFuzzYDist>screenH-fuzzyY){
           UpOrDown="down";
           screenHFuzzYDist=screenH-fuzzyY;
         }
         else if(screenHFuzzYDist<screenH-fuzzyY){
           UpOrDown="up";
           screenHFuzzYDist=screenH-fuzzyY;
         }
         else{
           UpOrDown="";
           screenHFuzzYDist=screenH-fuzzyY;
         }

         if(fuzzyXVelocity<=0){
           UpOrDown="down";

           if(ageLeftOrRight=="left"){

             ageLeftOrRight="right";
           }
           else if(ageLeftOrRight=="right"){
             ageLeftOrRight="left";

           }

         }




         if(UpOrDown=="up"){
           fuzzyXVelocity-=angle.abs()*0.18;
         }
         else if(UpOrDown=="down"){
           if(fuzzyXVelocity+angle.abs()*0.1<=fuzzyXVelocity+angle.abs()*.3){

             fuzzyXVelocity+=angle.abs()*0.1;
           }

         }




         if(ageLeftOrRight=="left"){

          fuzzyX+=fuzzyXVelocity;
         }
         else if(ageLeftOrRight=="right"){

           fuzzyX-=fuzzyXVelocity;
         }
       }






      if (fuzzyX > barcenterX) {
        fuzzyY =
            (barcenterY - radius) + (barcenterX - fuzzyX).abs() * tan(angle);

      }
      else {
        fuzzyY =
            (barcenterY - radius) + (barcenterX - fuzzyX).abs() * tan(-angle);
      }
     // print(9.8*1/ (screenH-fuzzyY));
    }

    else {
      // if(fuzzyY<=screenH+radius*2){
      fuzzyY += 3;
      // }

    }
    // print(fuzzyY);

//    if(fuzzyX>barX){
//      fuzzyY=(barY-radius)+(barX-fuzzyX).abs()*tan(angle);
//    }
//    else{
//      fuzzyY=(barY-radius)+(barX-fuzzyX).abs()*tan(-angle);
//    }

  }
  else{
      gameoverscreenLoad=true;
      gamescreenLoad=false;
    }
  }

}