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

  List<Cell> body = <Cell>[];
  Cell fruit = Cell(2,2);

  @override
  void initState() {
    body = snake.getBody();
    fruit = snake.getFruit();
    super.initState();
  }

  void changeXY(List<Cell> newBody, Cell newFruit) {
    setState(() {
      body = newBody;
      fruit = newFruit;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Center(
          child: Text(
            'Cupertino Snake 🐍',
            style: TextStyle(color: Colors.white),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SwitchGrid(body: body, fruit: fruit,),
          SizedBox(height: 10),
          ControlPanel(changeXY),
          Text(
            "\nAlternatively, you can use `Space` to start/stop, arrow keys to control",
            style: TextStyle(color: Colors.black),
            ),
        ],
      ),
    );
  }
}
