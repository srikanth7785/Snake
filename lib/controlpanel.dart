import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:snake/SnakeBrain.dart';
class ControlPanel extends StatefulWidget {
  final Function updateXY;
  ControlPanel(this.updateXY);
  @override
  _ControlPanelState createState() => _ControlPanelState();
}

class _ControlPanelState extends State<ControlPanel> {

  SnakeBrain snake = SnakeBrain();
  late bool moving;

  @override
  void initState(){
    moving = snake.ismoving();
    super.initState();
  }

  move(Direction direction){
    snake.setCurrentDirection(direction);
    switch (direction) {
      case Direction.UP:
        snake.up();
        break;
      case Direction.DOWN:
        snake.down();
        break;
      case Direction.LEFT:
        snake.left();
        break;
      case Direction.RIGHT:
        snake.right();
        break;
      default:
    }

    widget.updateXY(snake.getX(),snake.getY());
  }

  controlButton(IconData iconData, Direction direction){
    return Padding(
      padding: EdgeInsets.all(1),
      child: FloatingActionButton(
        mini: true,
        backgroundColor: moving ? Colors.green : Colors.grey,
        onPressed: moving ? () => move(direction) : null,
        child: Icon(iconData),
      ),
    );
  }

  _startStop(){
    setState(() {
      moving ? snake.stop() : snake.start();
      moving = snake.ismoving();
      if(moving){
        Timer.periodic(
          Duration(milliseconds: 150), (timer) {
            move(snake.getCurrentDirection());
            if(!moving) timer.cancel();
            setState(() {});
            },
        );
      }
    });
  }

  pausePlayButton(){
    return Padding(
      padding: EdgeInsets.all(1),
      child: FloatingActionButton(
        backgroundColor: moving ? Colors.red : Colors.green,
        mini: true,
        onPressed: _startStop,
        child: Icon(moving ? Icons.stop : Icons.play_arrow),
        ),
    );
  }

  _handleKey(RawKeyEvent event) async {
    if(event.runtimeType.toString() == 'RawKeyDownEvent'){
      if(event.isKeyPressed(LogicalKeyboardKey.arrowDown)){
        move(Direction.DOWN);
      }else if(event.isKeyPressed(LogicalKeyboardKey.arrowUp)){
        move(Direction.UP);
      }else if(event.isKeyPressed(LogicalKeyboardKey.arrowRight)){
        move(Direction.RIGHT);
      }else if(event.isKeyPressed(LogicalKeyboardKey.arrowLeft)){
        move(Direction.LEFT);
      }else if(event.isKeyPressed(LogicalKeyboardKey.space)){
        _startStop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: FocusNode(),
      autofocus: true,
      onKey: _handleKey,
      child: Column(
        children: [
          controlButton(Icons.keyboard_arrow_up, Direction.UP),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              controlButton(Icons.keyboard_arrow_left, Direction.LEFT),
              pausePlayButton(),
              controlButton(Icons.keyboard_arrow_right, Direction.RIGHT),
            ],
          ),
          controlButton(Icons.keyboard_arrow_down, Direction.DOWN),
        ],
      ),
    );
  }
}