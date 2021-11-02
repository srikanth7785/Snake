import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

List<Alignment> _aligns = List.generate(
  50,
  (index) {
    Random _random = Random();
    return Alignment(
      _random.nextDouble() * 2 - 1,
      _random.nextDouble() * 2 - 1,
    );}
);

class DiscData {
  static final _rng = Random();

  late double size;
  late Color color;

  DiscData() {
    color = Color.fromARGB(
      _rng.nextInt(200),
      _rng.nextInt(255),
      _rng.nextInt(255),
      _rng.nextInt(255),
    );
    size = _rng.nextDouble() * 100 + 10;
  }
}

class VariousDiscs extends StatefulWidget {
  final int numberOfDiscs;

  VariousDiscs(this.numberOfDiscs);
  
  @override
  _VariousDiscsState createState() => _VariousDiscsState();
}

class _VariousDiscsState extends State<VariousDiscs> {
  final _discs = <DiscData>[];

  @override
  void initState() {
    super.initState();
    print("Started");
//     _makeDiscs();
    Timer.periodic(
      Duration(seconds:1),
      (t) {
        setState(() {
          _makeDiscs();
        });
      },
    );
  }

  void _makeDiscs() {
    _discs.clear();
    for (int i = 0; i < widget.numberOfDiscs; i++) {
      _discs.add(DiscData());
    }
  }

  @override
  Widget build(BuildContext context) {
      return Stack(
        children: [
          for (int i = 0; i < _discs.length; i++)
            Positioned.fill(
              child: Align(
                alignment: _aligns[i],
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  height: _discs[i].size,
                  width: _discs[i].size,
                ),
              ),
            ),
        ],
      );
  }
}
