import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flame/sprite.dart';
import 'package:flutter_feed_fuz/publicdata.dart';

class FallingComp {
  double compX;
  double compY;
  double radius;
  double widthHeight;
  Sprite comp;
  Rect compRect;
  String s;
  double compRotation;
  double compRotationDir;
  FallingComp(int a){
      radius=screenW*.04;
      compX=Random.secure().nextInt((screenW-screenW*.2).toInt())+screenW*.1;
      int tmp=Random.secure().nextInt((2).toInt());
      if(tmp==0){
        compRotationDir=1;
      }
      else{
        compRotationDir=-1;
      }
      compY=-radius*2;
      widthHeight=radius*2;

      if( a==0){
        s="modhu.png";
      }
      else if( a==1){
        s="apple.png";
      }
      else if( a==2){
        s="cake.png";
      }
      else if( a==3){
        s="cupcake.png";
      }
      else if( a==4){
        s="cheese.png";
      }
      else if( a==5){
        s="banana.png";
      }
      else if( a==6){
        s="green_apple.png";
      }
      compRotation=0.01;
      comp=Sprite(s);
      compRect=Rect.fromLTWH(compX-radius, compY-radius, widthHeight, widthHeight);
  }
  void draw(Canvas c){

    c.save();
    c.translate(compX, compY);

    c.rotate(compRotation);
    compRotation+=0.01*compRotationDir;

    c.translate(-compX, -compY);

    compRect=Rect.fromLTWH(compX-radius, compY-radius, widthHeight, widthHeight);
    comp.renderRect(c,compRect);
    c.restore();




  }
  void update(){
    if(compY<screenH*1.5){
      compY+=2;
    }

  }

}