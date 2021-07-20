import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snake/SnakeBrain.dart';

class SwitchGrid extends StatefulWidget {
  final int? x,y;
  SwitchGrid({this.x, this.y});
  @override
  _SwitchGridState createState() => _SwitchGridState();
}

class _SwitchGridState extends State<SwitchGrid> {
  final len = 11;

  SnakeBrain snake = SnakeBrain();

  bool isOn(int i){
    return widget.x == i%len && widget.y == i~/len;
  }


  @override
  Widget build(BuildContext context) {
  Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Center(
          child: Container(
          color: Colors.grey.shade800,
          width: 575,
          height: size.height * 0.76,
          child: GridView.builder(
            itemCount: len*len,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: len,
              childAspectRatio: 1/1,
              mainAxisSpacing: 0.0,
              crossAxisSpacing: 0.0,
            ),
            itemBuilder: (BuildContext context, int i) {
              return CupertinoSwitch(
              value: isOn(i),
              onChanged: (b){
                snake.toggleState(i);
                  } 
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}