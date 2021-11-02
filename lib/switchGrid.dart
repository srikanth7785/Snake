import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snake/SnakeBrain.dart';

class SwitchGrid extends StatefulWidget {
  final List<Cell> body;
  SwitchGrid({required this.body});
  @override
  _SwitchGridState createState() => _SwitchGridState();
}

class _SwitchGridState extends State<SwitchGrid> {
  final len = 11;

  SnakeBrain snake = SnakeBrain();

  bool isOn(int i){
    return widget.body.contains(Cell(i%len,i~/len));
  }

  _activeColor(int i){
      return Cell(i%len,i~/len) == widget.body.last ? Colors.blue : Colors.green;
  }


  @override
  Widget build(BuildContext context) {
  Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Center(
          child: Container(
          padding: EdgeInsets.all(3),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.white70,
                spreadRadius: 0.1,
              ),
            ],
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey.shade800,
          ),
          width: 450,
          height: size.height * 0.59,
          child: GridView.builder(
            itemCount: len*len,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: len,
              childAspectRatio: 1/1,
              mainAxisSpacing: 0.0,
              crossAxisSpacing: 0.0,
            ),
            itemBuilder: (BuildContext context, int i) {
              return Transform.scale(
                scale: 0.8,
                child: CupertinoSwitch(
                value: isOn(i),
                onChanged: (b){},
                activeColor: _activeColor(i),
                trackColor: Colors.grey.shade700,
                  ),
              );
              },
            ),
          ),
        ),
      ],
    );
  }
}