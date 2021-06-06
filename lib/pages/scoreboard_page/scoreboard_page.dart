import 'package:eins_frontend/widgets/scoreboard_entry.dart';
import 'package:flutter/material.dart';

class ScoreboardPage extends StatefulWidget {
  const ScoreboardPage({Key key}) : super(key: key);

  @override
  _ScoreboardPageState createState() => _ScoreboardPageState();
}

class _ScoreboardPageState extends State<ScoreboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Scoreboard"),
      ),
      body: Padding(
        padding: EdgeInsets.all(64.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 14.0),
              child: Text(
                  "Das Ranking besteht aus sowohl gewonnenen Spielen, als auch dessen Anzahl.\n"
                    "Spieler, die mehr Spiele durchgespielt haben, werden im Gleichstand grundsätlich höher priorisiert.\n"
                        "Je mehr Spiele man für sich entscheidet, desto höher steigt man im Scoreboard auf.",
                style: TextStyle(
                  color: Colors.white
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                ScoreboardEntry(
                  username: "Doge",
                  won: 150,
                  lose: 100,
                  entryState: ScoreboardEntryState.RANKING_UP,
                ),
                ScoreboardEntry(
                  username: "Sezer",
                  won: 20,
                  lose: 10,
                  entryState: ScoreboardEntryState.RANKING_UP,
                ),
                ScoreboardEntry(
                  username: "Tristan",
                  won: 30,
                  lose: 50,
                  entryState: ScoreboardEntryState.RANKING_DOWN,
                ),
                ScoreboardEntry(
                  username: "Benjamin",
                  won: 10,
                  lose: 50,
                  entryState: ScoreboardEntryState.SAVING,
                ),
                ScoreboardEntry(
                  username: "Luca",
                  won: 2,
                  lose: 50,
                  entryState: ScoreboardEntryState.RANKING_UP,
                ),
                ScoreboardEntry(
                  username: "Linus (lttstore.com)",
                  won: 0,
                  lose: 200,
                  entryState: ScoreboardEntryState.RANKING_DOWN,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
