
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'heartShape.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}



class HomeScreen extends StatefulWidget {
@override
  State createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  static const double kMinRadius = 32.0;
  static const double kMaxRadius = 128.0;
  static const double durationSlowMode = 2.0;

  AnimationController animControlStar, animControlPlanet;
  Animation fadeAnimStar1, fadeAnimStar2, fadeAnimStar3, fadeAnimStar4, sizeAnimStar, rotateAnimStar;
  //Size screenSize;
  List<Heart> listHeart;
  int numStars;

  RectTween createRectTween(Rect begin, Rect end) {
    return new MaterialRectArcTween(begin: begin, end: end);
  }

  Widget buildHeart(double left, double top, double extraSize, double angle, int typeFade)
  {
    return new Positioned(
      child: new Container(
        child: new Transform.rotate(
          child: new Opacity(
            child: new Icon(
              FontAwesomeIcons.solidHeart,
              color: Color(0xFF8D0101),
              size: sizeAnimStar.value + extraSize+10,
            ),
            opacity: (typeFade == 1)
                ? fadeAnimStar1.value
                : (typeFade == 2) ? fadeAnimStar2.value : (typeFade == 3) ? fadeAnimStar3.value : fadeAnimStar4.value,
          ),
          angle: angle,
        ),
        alignment: FractionalOffset.center,
        width: 10.0,
        height: 10.0,
      ),
      left: left,
      top: top,
    );
  }

  Widget buildGroupHeart() {
    List<Widget> list = new List();
    for (int i = 0; i < numStars; i++) {
      list.add(
          buildHeart(listHeart[i].left, listHeart[i].top, listHeart[i].extraSize, listHeart[i].angle, listHeart[i].typeFade));
    }

    return new Stack(
      children: <Widget>[
        list[0],
        list[1],
        list[2],
        list[3],
        list[4],
        list[5],
        list[6],
        list[7],
        list[8],
        list[9],
        list[10],
        list[11],
        list[12],
        list[13],
        list[14],
        list[15],
        list[16],
        list[17],
        list[18],
        list[19],
        list[20],
        list[21],
        list[22],
        list[23],
        list[24],
        list[25],
        list[26],
        list[27],
        list[28],
        list[29],
      ],
    );
  }
  Animation  _heartAnimation;
  AnimationController  _heartAnimationController;

  AudioPlayer audioPlayer;
  AudioCache audioCache = AudioCache();

  playMusic() async {
    audioPlayer = await audioCache.loop("love.mp3");
  }

  @override
  void initState() {
    super.initState();
    playMusic();
    _heartAnimationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1200));
    _heartAnimation = Tween(begin: 210.0, end: 220.0).animate(CurvedAnimation(
        curve: Curves.easeInOut, parent: _heartAnimationController));

    _heartAnimationController.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        //_heartAnimationController.repeat();
      }
    });
    _heartAnimation.addListener((){
      setState(() {

      });
    });
    _heartAnimationController.forward();

    //screenSize = widget.screenSize;
    listHeart = new List();
    numStars = 30;
    // Star
    animControlStar = new AnimationController(vsync: this, duration: new Duration(milliseconds: 2000));
    fadeAnimStar1 = new Tween(begin: 0.0, end: 1.0)
        .animate(new CurvedAnimation(parent: animControlStar, curve: new Interval(0.0, 0.5)));
    fadeAnimStar1.addListener(() {
      setState(() {});
    });
    fadeAnimStar2 = new Tween(begin: 0.0, end: 1.0)
        .animate(new CurvedAnimation(parent: animControlStar, curve: new Interval(0.5, 1.0)));
    fadeAnimStar2.addListener(() {
      setState(() {});
    });
    fadeAnimStar3 = new Tween(begin: 1.0, end: 0.0)
        .animate(new CurvedAnimation(parent: animControlStar, curve: new Interval(0.0, 0.5)));
    fadeAnimStar3.addListener(() {
      setState(() {});
    });
    fadeAnimStar4 = new Tween(begin: 1.0, end: 0.0)
        .animate(new CurvedAnimation(parent: animControlStar, curve: new Interval(0.5, 1.0)));
    fadeAnimStar4.addListener(() {
      setState(() {});
    });
    sizeAnimStar = new Tween(begin: 0.0, end: 5.0)
        .animate(new CurvedAnimation(parent: animControlStar, curve: new Interval(0.0, 0.5)));
    sizeAnimStar.addListener(() {
      setState(() {});
    });
    rotateAnimStar = new Tween(begin: 0.0, end: 1.0)
        .animate(new CurvedAnimation(parent: animControlStar, curve: new Interval(0.0, 0.5)));
    rotateAnimStar.addListener(() {
      setState(() {});
    });

    animControlStar.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animControlStar.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animControlStar.forward();
      }
    });

    for (int i = 0; i < numStars; i++) {
      listHeart.add(new Heart(
          left: new Random().nextDouble() * 350.0,
          top: Random().nextDouble() * 700.0,
          extraSize: Random().nextDouble() * 2,
          angle: Random().nextDouble(),
          typeFade: Random().nextInt(4)));
    }
    animControlStar.forward();
  }

  @override
  void dispose() {
    animControlStar.dispose();
    audioPlayer.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    timeDilation = durationSlowMode;

    return new Stack(
      children: <Widget>[
        new Container(
            width: double.infinity,
            height: double.infinity,
            color: Color(0xFF680101),
            child: buildGroupHeart()),
        Center(
          child: AnimatedOpacity(
          opacity: _heartAnimationController.value,
            duration: Duration(milliseconds: 1200),
            child: Stack(
              children: <Widget>[
                Center(child: ForumNameWidget()),
                Center(child: Icon(Icons.favorite_border,color: Colors.red,size: 220,)),
              ],
            ),
          ),
        ),
        Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 220,
            ),
            Material(
              color: Colors.transparent,
                child: Text('Happy Valentine Day',style: TextStyle(color: Colors.red),)),
          ],
        )),

      ],
    );
  }

}
class Heart {
  double left;
  double top;
  double extraSize;
  double angle;
  int typeFade;

  Heart(
      {@required this.left,
        @required this.top,
        @required this.extraSize,
        @required this.angle,
        @required this.typeFade});
}
