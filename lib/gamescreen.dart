import 'dart:math';

import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feed_fuz/fallingcomp.dart';
import 'package:flutter_feed_fuz/fuzzy.dart';
import 'package:flutter_feed_fuz/fuzzybar.dart';
import 'package:flutter_feed_fuz/publicdata.dart';
import 'package:flutter_feed_fuz/topbar.dart';
class GameScreen {
  Sprite bg;
  Rect bgRect;
  FuzzyBar fuzzyBar;
  Fuzzy fuzzy;
  double timer;
  List<FallingComp> fallingComp;
  TopBar topBar;

  TextSpan tmp1;
  TextPainter tptmp1;

  GameScreen(){
    bg=Sprite('gscreenback.jpg');
    bgRect=Rect.fromLTWH(0, 0, screenW, screenH);
    fuzzyBar=FuzzyBar();
    fuzzy=Fuzzy();
    timer=0;
    fallingComp=[];
    topBar=TopBar();
  }
  void draw(Canvas c){

    bg.renderRect(c, bgRect);

        tmp1  = new TextSpan(style: TextStyle(
      fontStyle: FontStyle.normal,
      fontSize: screenW/35,
      foreground: Paint()
        ..style = PaintingStyle.fill
        ..strokeWidth = 6
        ..color = Color.fromRGBO(255, 255, 255, 1),
    ), text: tTmp);
    tptmp1 = new TextPainter(text: tmp1,
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr);
    tptmp1.layout();

    tptmp1.paint(c, new Offset(screenW *.5-tptmp1.width/2, screenH *.92));

    for(int i=0;i<fallingComp.length;i++){
      fallingComp[i].draw(c);

    }
    fuzzyBar.draw(c);
    fuzzy.draw(c,fuzzyBar.angle);
   // fallingComp.draw(c);
    topBar.draw(c);

  }
  void update(){
    timer++;
// print(timer);
  // print(fallingComp.length);
    if(timer>=100){
    int a=Random.secure().nextInt((7).toInt());

    fallingComp.add(FallingComp(a));

    timer=0;
    }
    fuzzyBar.update();
    fuzzy.update(fuzzyBar.angle,fuzzyBar.barcenterX,fuzzyBar.barcenterY,fuzzyBar.barRect.left,fuzzyBar.barRect.width);
   // fallingComp.update();
    for(int i=0;i<fallingComp.length;i++){
      fallingComp[i].update();

    }
    for(int i=0;i<fallingComp.length;i++){

      if(fallingComp[i].compY>screenH+fallingComp[i].radius*2 || fuzzy.fuzzyRect1.overlaps(fallingComp[i].compRect)){
        fallingComp.removeAt(i);

       // i--;
      }
    }
  }

}