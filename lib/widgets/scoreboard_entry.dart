import 'package:flutter/material.dart';

enum ScoreboardEntryState {
  SAVING,
  RANKING_UP,
  RANKING_DOWN
}

class ScoreboardEntry extends StatelessWidget {
  const ScoreboardEntry({Key key, this.username, this.won, this.lose, this.entryState}) : super(key: key);

  final String username;
  final int won;
  final int lose;
  final ScoreboardEntryState entryState;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Icon(
            Icons.perm_identity_outlined
        ),
      ),
      title: Text(
        username,
        style: TextStyle(
            color: Colors.white
        ),
      ),
      trailing: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "$won Spiele gewonnen",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18
                ),
              ),
              Text(
                "${won + lose} Spiele gespielt",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12
                ),
              )
            ],
          ),
          SizedBox(
            width: 10,
          ),
          if (entryState == ScoreboardEntryState.RANKING_UP)
            Icon(
              Icons.trending_up,
              color: Colors.green,
            ),
          if (entryState == ScoreboardEntryState.RANKING_DOWN)
            Icon(
              Icons.trending_down,
              color: Colors.red,
            ),
          if (entryState == ScoreboardEntryState.SAVING)
            Icon(
              Icons.trending_neutral,
              color: Colors.grey,
            ),
        ],
      ),
    );
  }
}
