import 'package:flutter/material.dart';

class UserListBadge extends StatelessWidget {
  const UserListBadge({Key key, this.username, this.height, this.width, this.color, this.cardsLeft}) : super(key: key);

  final String username;
  final Color color;
  final double height;
  final double width;
  final int cardsLeft;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              CircleAvatar(
                backgroundColor: color,
                child: Container(
                  height: height * 0.7,
                  width: width * 0.7,
                  child: Icon(
                      Icons.perm_identity_outlined,
                      color: Colors.black,
                  ),
                ),
              ),
              Container(
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                  color: cardsLeft > 1 ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(6.0)
                ),
                child: Center(
                  child: Text(
                    "$cardsLeft",
                    style: TextStyle(
                      color: cardsLeft > 1 ? Colors.white : Colors.black,
                      fontSize: 10
                    ),
                  ),
                ),
              )
            ],
          ),
          Text(
            username,
            style: TextStyle(
                color: Colors.white
            ),
          ),
        ],
      ),
    );
  }
}
