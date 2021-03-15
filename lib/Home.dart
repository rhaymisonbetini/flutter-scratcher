import 'package:flutter/material.dart';
import 'package:scratcher/scratcher.dart';

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  Future<void> scratchCardDialog(context) {
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
              'Parabéns, Você possui um card premiado',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          content: Scratcher(
            brushSize: 30,
            threshold: 50,
            color: Colors.red,
            onChange: (value) => print("Scratch progress: $value%"),
            onThreshold: () => print("Threshold reached, you won!"),
            child: Container(
              height: 300,
              width: 300,
              color: Colors.blue,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      // ignore: deprecated_member_use
      child: FlatButton(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35),
            borderSide: BorderSide(color: Colors.white, width: 2)),
        color: Colors.blue,
        child: Text(
          "Você possui uma nova raspadinha!",
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {},
      ),
      color: Colors.blue,
    );
  }
}
