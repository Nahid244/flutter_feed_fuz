import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flame/util.dart';
import 'package:flame/game.dart';
import 'package:flutter/services.dart';
import 'package:flutter_feed_fuz/firstscreen.dart';
import 'package:flutter_feed_fuz/gameoverscreen.dart';
import 'package:flutter_feed_fuz/gamescreen.dart';
import 'package:flutter_feed_fuz/publicdata.dart';
import 'package:flame/flame.dart';
import 'package:sensors/sensors.dart';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyApp_State();
  }

}
class MyApp_State extends State<MyApp>{

 GG game;
  Future loadGame()  {
    Future.delayed(Duration(milliseconds: 500),() async {
      WidgetsFlutterBinding.ensureInitialized();
      Util flameUtil = Util();
      await flameUtil.fullScreen();
      await flameUtil.setOrientation(DeviceOrientation.portraitUp);
      game=GG();
    //  PanGestureRecognizer pan = PanGestureRecognizer();
      TapGestureRecognizer tapper = TapGestureRecognizer();
    tapper.onTapDown = game.onTapDown;

    //tapper.onTapUp=game.;
//    pan.onStart = game.onPanStart;
//    pan.onUpdate = game.onPanUpdate;
//    pan.onEnd = game.onPanEnd;
//    flameUtil.addGestureRecognizer(pan);
    flameUtil.addGestureRecognizer(tapper);


      setState(() {
      loadedgamedata=true;
      });
    });




    // /*Navigator.push(context, MaterialPageRoute(builder: (context) => Game(context).widget));*/
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if(loadedgamedata==false){
      loadGame();
      return MaterialApp(
        home: Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }
    else{
      return MaterialApp(
        home:  Scaffold(
          body:Container(
            child: game.widget,
          )
        ),
      );
    }
  }

}

class GG extends Game{
  int k;
  FirstScreen firstScreen;
  GameScreen gameScreen;
  GameOverScreen gameOverScreen;
  GG(){
  initialize();
  }
  void initialize() async {

    resize(await Flame.util.initialDimensions());
    init();
  }
  void init(){
    k=0;
    firstscreenLoad=true;
    gamescreenLoad=false;
    gamePause=false;
    bool gameoverscreen=false;

  firstScreen=FirstScreen();
  gameScreen=GameScreen();
  gameOverScreen=GameOverScreen();
  }

  @override
  void render(Canvas canvas) {

   // canvas.drawColor(Color(0), BlendMode.clear);


    if(firstscreenLoad){
      firstScreen.draw(canvas);
    }
    else if(gamescreenLoad){
      gameScreen.draw(canvas);

    }
    else if(gameoverscreenLoad){
    gameScreen.draw(canvas);
    gameOverScreen.draw(canvas);
    }
    }






  @override
  void resize(Size size) {
   screenW=size.width;
   screenH=size.height;


  }
  @override
  void update(double t) {
    if(firstscreenLoad){
      //firstScreen.draw(canvas);
    }
    else if(gamescreenLoad){
      if(gamePause==false){
        gameScreen.update();
      }

    }
    else if(gameoverscreenLoad){
      gameScreen.update();
      gameOverScreen.update();

    }
  }
  void onTapDown(TapDownDetails d){
    if(firstscreenLoad){
      firstScreen.onTapped(d.globalPosition.dx, d.globalPosition.dy);
    }
    else if(gamescreenLoad){
      gameScreen.topBar.onTapped(d.globalPosition.dx, d.globalPosition.dy);
    }


  }
}


