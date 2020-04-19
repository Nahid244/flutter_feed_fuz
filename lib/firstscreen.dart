import 'package:flutter/material.dart';
import 'package:flame/sprite.dart';
import 'package:flutter_feed_fuz/publicdata.dart';
class FirstScreen {
  Sprite bg;
  Rect bgRect;

  Sprite play;
  Rect playRect;

  Sprite about;
  Rect aboutRect;

  Sprite howtoplay;
  Rect howtoplayRect;

  Sprite sound;
  Rect soundRect;


  FirstScreen(){
    bg=Sprite('firstscreenbg.jpg');
    bgRect=Rect.fromLTWH(0, 0, screenW, screenH);

    play=Sprite('fscreenplay.png');
    playRect=Rect.fromLTWH(screenW*.35, screenH*.03, screenW/3.5, screenH/6.5);
    about=Sprite('fscreenabout.png');
    aboutRect=Rect.fromLTWH(screenW*.2, screenH*.46, screenW/5.6, screenH/10);
    howtoplay=Sprite('fscreenhowtoplay.png');
    howtoplayRect=Rect.fromLTWH(screenW*.15, screenH*.34, screenW/5.6, screenH/10);
    sound=Sprite('fscreensound.png');
    soundRect=Rect.fromLTWH(screenW*.2, screenH*.22, screenW/5.6, screenH/10);
  }
  void draw(Canvas c){
    bg.renderRect(c, bgRect);
    play.renderRect(c, playRect);
    about.renderRect(c, aboutRect);
    howtoplay.renderRect(c, howtoplayRect);
    sound.renderRect(c, soundRect);

  }
  void onTapped(double x,double y){
   if(playRect.contains(Offset(x, y))){
     print("play");
     firstscreenLoad=false;
     gamescreenLoad=true;
   }
  }


}