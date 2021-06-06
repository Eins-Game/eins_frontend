import 'package:eins_frontend/widgets/eins_button.dart';
import 'package:eins_frontend/widgets/game_card.dart';
import 'package:eins_frontend/widgets/game_draw_card.dart';
import 'package:eins_frontend/widgets/user_list_badge.dart';
import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.06,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 10.0),
                  child: Text(
                    "Game #102422",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.14,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                UserListBadge(
                  username: "Sezer",
                  color: Colors.red,
                  height: 70,
                  width: 70,
                  cardsLeft: 2,
                ),
                UserListBadge(
                  username: "Benjamin",
                  color: Colors.green,
                  height: 70,
                  width: 70,
                  cardsLeft: 7,
                ),
                UserListBadge(
                  username: "Luca",
                  color: Colors.blue,
                  height: 70,
                  width: 70,
                  cardsLeft: 1,
                )
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.55,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 180,
                  width: 120,
                  child: GameCard(
                    color: Colors.yellow,
                    number: 3,
                    type: GameCardType.NORMAL,
                  ),
                ),
                // Padding hack
                SizedBox(
                  width: 30,
                ),
                Container(
                  height: 180,
                  width: 120,
                  child: GameDrawCard(
                    onDraw: () {

                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.001,
            width: MediaQuery.of(context).size.width,
            child: Divider(
              height: 2,
              thickness: 1,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.249,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0, left: 10.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.yellow,
                          child: Icon(
                            Icons.perm_identity_outlined,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0, left: 10.0),
                        child: Text(
                          "Tristan",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 30,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0, left: 10.0),
                        child: Text(
                          "Vorhandene Karten: 5",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.normal
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0, left: 10.0),
                        child: Text(
                          "Am Zug: Sezer",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.normal
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 180,
                        width: 120,
                        child: GameCard(
                          color: Colors.yellow,
                          number: 3,
                          type: GameCardType.EXCHANGE,
                        ),
                      ),
                      Container(
                        height: 180,
                        width: 120,
                        child: GameCard(
                          color: Colors.red,
                          number: 3,
                          type: GameCardType.DRAW2,
                        ),
                      ),
                      Container(
                        height: 180,
                        width: 120,
                        child: GameCard(
                          color: Colors.green,
                          number: 9,
                          type: GameCardType.NORMAL,
                        ),
                      ),
                      Container(
                        height: 180,
                        width: 120,
                        child: GameCard(
                          color: Colors.red,
                          number: 3,
                          type: GameCardType.DRAW4,
                        ),
                      ),
                      Container(
                        height: 180,
                        width: 120,
                        child: GameCard(
                          color: Colors.blue,
                          number: 0,
                          type: GameCardType.NORMAL,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      EinsButton(
                        onPressed: () {
                          Navigator.popUntil(context, ModalRoute.withName(Navigator.defaultRouteName));
                        },
                        width: MediaQuery.of(context).size.width * 0.15,
                        title: "Aufgeben",
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
