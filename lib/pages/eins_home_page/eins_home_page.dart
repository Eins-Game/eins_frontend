import 'package:awesome_page_transitions/awesome_page_transitions.dart';
import 'package:eins_frontend/framework/responsive/responsive_resize.dart';
import 'package:eins_frontend/pages/lobby_page/lobby_page.dart';
import 'package:eins_frontend/pages/scoreboard_page/scoreboard_page.dart';
import 'package:eins_frontend/widgets/eins_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:universal_io/io.dart';
import 'package:universal_html/html.dart' as html;

class EinsHomePage extends StatefulWidget {
  EinsHomePage({Key key}) : super(key: key);

  @override
  _EinsHomePageState createState() => _EinsHomePageState();
}

class _EinsHomePageState extends State<EinsHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Container(
            width: ResponsiveResize.of(context).responsiveWidth(widthFactor: 0.8, maxWidth: 500, minWidth: 150),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 180,
                  child: Image.asset("images/logo.png"),
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 20)),
                EinsButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        AwesomePageRoute(
                          transitionDuration: Duration(milliseconds: 400),
                          exitPage: widget,
                          enterPage: LobbyPage(),
                          transition: ParallaxTransition(),
                        )
                    );
                  },
                  width: MediaQuery.of(context).size.width * 0.30,
                  title: "Spielen",
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 15)),
                EinsButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        AwesomePageRoute(
                          transitionDuration: Duration(milliseconds: 400),
                          exitPage: widget,
                          enterPage: ScoreboardPage(),
                          transition: ParallaxTransition(),
                        )
                    );
                  },
                  width: MediaQuery.of(context).size.width * 0.30,
                  title: "Scoreboard",
                ),
                if (Platform.isWindows || Platform.isLinux || Platform.isMacOS)
                  Padding(padding: EdgeInsets.symmetric(vertical: 15)),
                if (Platform.isWindows || Platform.isLinux || Platform.isMacOS)
                  EinsButton(
                    onPressed: () {
                      if (kIsWeb) {
                        html.window.close();
                      } else {
                        // Works only fine on Desktop applications
                        exit(0);
                      }
                    },
                    width: MediaQuery.of(context).size.width * 0.30,
                    title: "Schließen",
                  ),
              ],
            ),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}