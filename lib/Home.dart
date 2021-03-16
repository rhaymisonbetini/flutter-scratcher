import 'dart:math';

import 'package:flutter/material.dart';
import 'package:scratcher/scratcher.dart';

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  double _opacity = 0.0;
  String sort = '0';
  List<String> primeium = [
    "Ops, não foi desta vez!",
    "Tente novamente Campeão",
    "Quem sabe na próxima",
    "R\$: 15,00",
    "R\$: 10,00",
    "R\$:  5,00"
  ];

  Future scratchCardDialog(context) async {
    this.sort = this.primeium[Random().nextInt(this.primeium.length)];

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          title: Align(
            alignment: Alignment.center,
            child: Text(
              'Raspadinha premiada!',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          content: StatefulBuilder(
            builder: (context, StateSetter setState) {
              return Scratcher(
                accuracy: ScratchAccuracy.low,
                brushSize: 40,
                threshold: 50,
                onChange: (value) => print("Scratch progress: $value%"),
                onThreshold: () => {
                  setState(() => {_opacity = 1})
                },
                // image: Image.asset(
                //   'assets/ticket.png',
                //   fit: BoxFit.fill,
                //   width: 300,
                //   height: 300,
                //   filterQuality: FilterQuality.low,
                // ),
                color: Colors.blue,
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 250),
                  opacity: _opacity,
                  child: Container(
                    height: 300,
                    width: 300,
                    alignment: Alignment.center,
                    child: Text(
                      sort,
                      style: TextStyle(
                          fontSize: 50,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      // ignore: deprecated_member_use
      child: FlatButton(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35),
            borderSide: BorderSide(color: Colors.blueAccent, width: 2)),
        color: Colors.blue,
        child: Text(
          "Você possui uma nova raspadinha!",
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () => scratchCardDialog(context),
      ),
    );
  }
}
