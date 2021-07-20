import 'package:flutter/material.dart';
import 'package:snake/SnakeBrain.dart';
import 'package:snake/controlpanel.dart';
import 'package:snake/switchGrid.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  SnakeBrain snake = SnakeBrain();

  int? x,y;

  @override
  void initState(){
    x = snake.getX();
    y = snake.getY();
    super.initState();
  }

  void changeXY(int newX, int newY){
    setState(() {
      x = newX;
      y = newY;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Snake, Head only ;)',style: TextStyle(color: Colors.white))),elevation: 0,backgroundColor: Colors.transparent,),
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SwitchGrid(x: x, y: y),
          ControlPanel(changeXY),
        ],
      ),
    );
  }
}