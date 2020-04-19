import 'package:flutter/material.dart';
import 'package:flame/sprite.dart';
import 'package:flutter_feed_fuz/publicdata.dart';

class TopBar{
   Sprite life;
   List<Rect> lifeRect=[];
   double lifeX;
   double lifeY;
   double lifeH;
   double lifeW;
   double distanceLife=0;

   Sprite pause;
   Rect pauseRect;
   double pauseX;
   double pauseY;
   double pauseH;
   double pauseW;


   TextSpan pointTs;
   TextPainter pointTp;
   Offset pointOffset;

   TopBar(){
    this.lifeX=screenW/20;
    this.lifeY=screenH/35;
    this.lifeW=screenW/16;
    this.lifeH=screenH/32;

    life=Sprite('heart.png');

    lifeRect.add(Rect.fromLTWH(lifeX+distanceLife, lifeY, lifeW, lifeH));
    distanceLife+=lifeW;
    lifeRect.add(Rect.fromLTWH(lifeX+distanceLife, lifeY, lifeW, lifeH));
    distanceLife+=lifeW;
    lifeRect.add(Rect.fromLTWH(lifeX+distanceLife, lifeY, lifeW, lifeH));
    distanceLife+=lifeW;
    lifeRect.add(Rect.fromLTWH(lifeX+distanceLife, lifeY, lifeW, lifeH));
    distanceLife+=lifeW;
    lifeRect.add(Rect.fromLTWH(lifeX+distanceLife, lifeY, lifeW, lifeH));
    distanceLife+=lifeW;


   pause=Sprite('pauseBut.png');
   pauseW=screenW/8;
   pauseH=screenH/16;
   pauseX=screenW/2-pauseW/2;
   pauseY=screenH/45;
   pauseRect=Rect.fromLTWH(pauseX, pauseY, pauseW, pauseH);




    pointOffset=Offset(screenW*.70, screenH/35);
   }
   void draw(Canvas c){

     for(int i=0;i<live;i++){
       life.renderRect(c,lifeRect[i] );

     }
     pause.renderRect(c, pauseRect);


     pointTs  = new TextSpan(style: TextStyle(
       fontStyle: FontStyle.normal,
       fontSize: screenW/20,
       foreground: Paint()
         ..style = PaintingStyle.fill
         ..strokeWidth = 6
         ..color = Color.fromRGBO(255, 255, 255, 1),
     ), text: "Points "+point.toString());
     pointTp = new TextPainter(text: pointTs,
         textAlign: TextAlign.left,
         textDirection: TextDirection.ltr);
     pointTp.layout();
     pointTp.paint(c, pointOffset);

   }
   void onTapped(double x,double y){
     if(pauseRect.contains(Offset(x, y))){
       print("pause cliked");
       gamePause=true;
     }
   }
}