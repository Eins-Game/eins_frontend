import 'package:flutter/material.dart';

class GameDrawCard extends StatelessWidget {
  const GameDrawCard({Key key, this.onDraw}) : super(key: key);

  final Function onDraw;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onDraw,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0)
        ),
        color: Colors.white,
        child: Center(
          child: Text(
            "Karte\nZiehen",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
