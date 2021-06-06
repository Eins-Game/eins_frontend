import 'package:awesome_page_transitions/awesome_page_transitions.dart';
import 'package:eins_frontend/framework/responsive/responsive_resize.dart';
import 'package:eins_frontend/pages/game_page/game_page.dart';
import 'package:eins_frontend/widgets/eins_button.dart';
import 'package:eins_frontend/widgets/user_list_entry.dart';
import 'package:flutter/material.dart';

class LobbyPage extends StatefulWidget {
  LobbyPage({Key key}) : super(key: key);

  @override
  _LobbyPageState createState() => _LobbyPageState();
}

class _LobbyPageState extends State<LobbyPage> {

  List<UserListEntry> stubEntries = [
    UserListEntry(username: "Tristan"),
    UserListEntry(username: "Sezer"),
    UserListEntry(username: "Benjamin"),
    UserListEntry(username: "Luca")
  ];

  bool firstWins = true;
  bool breakOnDraw = false;
  bool timeLimit = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Lobby"),
      ),
      body: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Padding(
              padding: const EdgeInsets.all(20.0).copyWith(left: 10, right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0).copyWith(bottom: 20),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Spielerliste",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.2,
                                    fontSize: 20
                                ),
                              ),
                              Text(
                                "${stubEntries.length}/8",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w200,
                                    letterSpacing: 1.0,
                                    fontSize: 20
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: ResponsiveResize.of(context).responsiveHeight(heightFactor: 0.2, minHeight: 300),
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: ListView(
                            scrollDirection: Axis.vertical,
                            children: stubEntries,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 14.0, bottom: 36.0),
                    child: EinsButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            AwesomePageRoute(
                              transitionDuration: Duration(milliseconds: 400),
                              exitPage: widget,
                              enterPage: GamePage(),
                              transition: ParallaxTransition(),
                            )
                        );
                      },
                      width: MediaQuery.of(context).size.width * 0.25,
                      title: "Spiel starten",
                    )
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: ResponsiveResize.of(context).responsiveHeight(heightFactor: 0.2, minHeight: 400),
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(16.0),
                        border: Border.all(color: Colors.grey[500])
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.25,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 18.0),
                                  child: Text(
                                    "Konfiguration",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.2,
                                        fontSize: 16
                                    ),
                                  ),
                                ),
                                SwitchListTile(
                                    title: Text(
                                      "Nur um Ersten Platz spielen",
                                      style: TextStyle(
                                          color: Colors.white
                                      ),
                                    ),
                                    value: firstWins,
                                    onChanged: (value) {
                                      setState(() {
                                        firstWins = value;
                                      });
                                    }
                                ),
                                SwitchListTile(
                                    title: Text(
                                      "Aussetzen bei 2+ und 4+ Karte",
                                      style: TextStyle(
                                          color: Colors.white
                                      ),
                                    ),
                                    value: breakOnDraw,
                                    onChanged: (value) {
                                      setState(() {
                                        breakOnDraw = value;
                                      });
                                    }
                                ),
                                SwitchListTile(
                                    title: Text(
                                      "Zeitlimit (5 Sekunden)",
                                      style: TextStyle(
                                          color: Colors.white
                                      ),
                                    ),
                                    value: timeLimit,
                                    onChanged: (value) {
                                      setState(() {
                                        timeLimit = value;
                                      });
                                    }
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 18.0, left: 8.0, right: 8.0),
                                  child: TextField(
                                    autofocus: false,
                                    decoration: InputDecoration(
                                      floatingLabelBehavior: FloatingLabelBehavior.always,
                                      border: OutlineInputBorder(),
                                      hintText: "Lobbyname"
                                    ),
                                    style: TextStyle(
                                      color: Colors.white
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 18.0, left: 8.0, right: 8.0),
                                  child: TextField(
                                    autofocus: false,
                                    decoration: InputDecoration(
                                        floatingLabelBehavior: FloatingLabelBehavior.always,
                                        border: OutlineInputBorder(),
                                        hintText: "Lobby-Passwort"
                                    ),
                                    style: TextStyle(
                                        color: Colors.white
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      "Lobby ID: #102422",
                      style: TextStyle(
                        color: Colors.grey
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
