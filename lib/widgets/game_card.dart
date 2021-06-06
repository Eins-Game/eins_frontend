import 'package:flutter/material.dart';

enum GameCardType {
  NORMAL,
  EXCHANGE,
  CANCELLATION,
  WISH,
  DRAW2,
  DRAW4
}

class GameCard extends StatelessWidget {
  const GameCard({Key key, this.color, this.number, this.type}) : super(key: key);

  final Color color;
  final int number;
  final GameCardType type;

  @override
  Widget build(BuildContext context) {
    switch(type) {
      case GameCardType.NORMAL:
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0)
          ),
          color: color,
          child: Center(
            child: Text(
              "$number",
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
        );
      case GameCardType.EXCHANGE:
        return Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0)
          ),
          color: color,
          child: Center(
            child: Icon(
              Icons.rotate_left,
              color: Colors.black,
              size: 40,
            ),
          ),
        );
      case GameCardType.CANCELLATION:
        return Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0)
          ),
          color: Colors.white,
          child: Center(
            child: Icon(
              Icons.cancel,
              color: Colors.black,
              size: 40,
            ),
          ),
        );
      case GameCardType.DRAW2:
        return Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0)
          ),
          color: color,
          child: Center(
            child: Text(
              "+2",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        );
      case GameCardType.DRAW4:
        return Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0)
          ),
          color: Colors.black,
          child: Center(
            child: Text(
              "+4",
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        );
      case GameCardType.WISH:
        return Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0)
          ),
          color: Colors.black,
          child: Center(
            child: Text(
              "Wunsch",
              style: TextStyle(
                  color: Colors.white
              ),
            ),
          ),
        );
    }
  }
}
