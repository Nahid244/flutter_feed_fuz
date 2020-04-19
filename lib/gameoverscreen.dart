import 'package:flutter/material.dart';
import 'package:flame/sprite.dart';
import 'package:flutter_feed_fuz/publicdata.dart';

class GameOverScreen{
 Rect bg;
 Paint bgPaint;

 Sprite scorecard;
 double scorecardY;
 Rect scoreCardRect;
 bool scorecardBounce;


  GameOverScreen(){
    bg=Rect.fromLTWH(0, 0, screenW, screenH);
    bgPaint=Paint();
    bgPaint.color=Color.fromRGBO(0, 0, 0, 0.5);

    scorecard=Sprite('scorecard.png');
    scorecardY=screenH;
    scoreCardRect=Rect.fromLTWH(screenW*.05, scorecardY, screenW*.9, screenH/3);
    scorecardBounce=false;
  }
  void draw(Canvas c) {
  c.drawRect(bg, bgPaint);
  scoreCardRect=Rect.fromLTWH(screenW*.05, scorecardY, screenW*.9, screenH/3);
  scorecard.renderRect(c, scoreCardRect);


  }
  void update(){
    if(scorecardY-20>=screenH*.2 && scorecardBounce==false){
      scorecardY-=20;

    }
    else{
      scorecardBounce=true;
    }


    if(scorecardBounce){
      if(scorecardY+10<=screenH*.3 ){
        scorecardY+=10;

      }
    }


  }
}